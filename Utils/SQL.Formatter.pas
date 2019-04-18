unit SQL.Formatter;

interface

uses
  System.SysUtils, System.Classes, Vcl.ComCtrls;

type
  TSQLFormatter = class
  private
    FStringListClauses: TStringList;
    FStringListJoins: TStringList;
    FStringListOperators: TStringList;
    FStringListCommands: TStringList;
    FStringListParameters: TStringList;
    FStringListValues: TStringList;

    FMarginLevel: smallint;
    FMarginHeap: smallint;
    FSameLinePosition: smallint;
    FSingleCommand: boolean;
    FUseToDateFunction: boolean;
    FDateFormat: string;

    // private functions
    function BreakLineNeeded(const aValue: string): boolean;
    function ExtractCommand(const aSQL: string): string;
    function ExtractSubSelect(const aSQL: string): string;
    function FormatDateTimeWithToDateFunction(const aDateTime: TDateTime): string;
    function GetFormattedDate(const aValue: string): string;
    function GetQuotedValue(const aValue: string): string;
    function IdentSQL(const aPreparedSQL: string): string;
    function IsCommand(const aValue: string): boolean;
    function PrepareSQL(const aSQL: string): string;
    function ProcessParameters(const aSQL: string): string;
    function ReplaceAllStrings(const aText, aOldPattern, aNewPattern: string): string;
    function ReplaceParametersWithValues: string;

    // private procedures
    procedure CreateInternalObjects;
    procedure DestroyInternalObjects;
    procedure DecMargin(const aQtde: byte);
    procedure ExtractParamsList(const aSQL: string; const aParamsPosition: integer);
    procedure InitializeStringLists;

    // SQL processing
    procedure ProcessClause(const aValue: string; aBuilder: TStringBuilder);
    procedure ProcessJoin(const aValue: string; aBuilder: TStringBuilder);
    procedure ProcessOperator(const aValue: string; aBuilder: TStringBuilder);
    procedure ProcessSubSelect(const aSQL: string;
      var aTokenPosition: smallint; aBuilder: TStringBuilder);
    procedure ProcessCommand(const aSQL, aValue: string; var aTokenPosition: smallint;
      aBuilder: TStringBuilder);
  public
    constructor Create;
    destructor Destroy; override;

    // main function
    function FormatSQL(const aSQL: string): string;

    property UseToDateFunction: boolean write FUseToDateFunction;
    property DateFormat: string write FDateFormat;
  end;

implementation

uses
  Utils.Constants, Utils.Helpers;

{ TFormatadorSQL }

function TSQLFormatter.ExtractSubSelect(const aSQL: string): string;
var
  lParenthesesCount: smallint;
  lCharacter: string;
begin
  result := EmptyStr;
  lParenthesesCount := 0;

  for lCharacter in aSQL do
  begin
    if lCharacter = '(' then
      Inc(lParenthesesCount);

    if lCharacter = ')' then
      Dec(lParenthesesCount);

    result := result + lCharacter;

    if lParenthesesCount = 0 then
      Break;
  end;

  // Remove '(' and ')'
  result := Copy(result, 2, result.Length - 2);
end;

procedure TSQLFormatter.InitializeStringLists;
begin
  FStringListClauses.Add('SELECT');
  FStringListClauses.Add('FROM');
  FStringListClauses.Add('WHERE');
  FStringListClauses.Add('ORDER_BY');
  FStringListClauses.Add('GROUP_BY');
  FStringListClauses.Add('UNION');

  FStringListJoins.Add('JOIN');
  FStringListJoins.Add('INNER_JOIN');
  FStringListJoins.Add('LEFT_JOIN');
  FStringListJoins.Add('LEFT_OUTER_JOIN');
  FStringListJoins.Add('RIGHT_JOIN');
  FStringListJoins.Add('RIGHT_OUTER_JOIN');

  FStringListOperators.Add('ON');
  FStringListOperators.Add('AND');
  FStringListOperators.Add('OR');

  FStringListCommands.Add('CAST');
  FStringListCommands.Add('(CAST');
  FStringListCommands.Add('CAST(');
  FStringListCommands.Add('CONVERT');
  FStringListCommands.Add('CONVERT(');
  FStringListCommands.Add('(CONVERT');
end;

function TSQLFormatter.ProcessParameters(const aSQL: string): string;
var
  lParamsPosition: integer;
begin
  result := aSQL;
  lParamsPosition := Pos('PARAMS=', aSQL.ToUpper);

  if lParamsPosition = 0 then
    Exit;

  result := Copy(aSQL, 1, Pred(lParamsPosition));
  FStringListValues.Clear;

  ExtractParamsList(aSQL, lParamsPosition);
  result := ReplaceParametersWithValues;
end;

function TSQLFormatter.PrepareSQL(const aSQL: string): string;
begin
  result := ReplaceAllStrings(aSQL, '  ', sSPACE);
  result := ReplaceAllStrings(result, ' )', ')');
  result := ReplaceAllStrings(result, '( ', '(');
  result := ReplaceAllStrings(result, 'LEFT JOIN', 'LEFT_JOIN');
  result := ReplaceAllStrings(result, 'LEFT OUTER JOIN', 'LEFT_OUTER_JOIN');
  result := ReplaceAllStrings(result, 'INNER JOIN', 'INNER_JOIN');
  result := ReplaceAllStrings(result, 'RIGHT JOIN', 'RIGHT_JOIN');
  result := ReplaceAllStrings(result, 'RIGHT OUTER JOIN', 'RIGHT_OUTER_JOIN');
  result := ReplaceAllStrings(result, 'ORDER BY', 'ORDER_BY');
  result := ReplaceAllStrings(result, 'GROUP BY', 'GROUP_BY');
  result := result.Trim;
end;

procedure TSQLFormatter.ProcessClause(const aValue: string; aBuilder: TStringBuilder);
begin
  DecMargin(FMarginHeap);

  if aBuilder.Length > 0 then
    aBuilder.AppendSpaces(FMarginLevel);

  aBuilder.Append(aValue.Replace('_', sSPACE, [rfReplaceAll]));

  Inc(FMarginLevel, nMARGIN);
  Inc(FMarginHeap, nMARGIN);

  FSameLinePosition := 0;

  aBuilder.AppendSpaces(FMarginLevel);

  FSingleCommand := False;
  if aValue.Equals('WHERE') then
  begin
    Inc(FMarginLevel);
    Inc(FMarginHeap);
    FSingleCommand := True;
  end;
end;

procedure TSQLFormatter.ProcessCommand(const aSQL, aValue: string; var aTokenPosition: smallint;
      aBuilder: TStringBuilder);
var
  lCommand: string;
begin
  lCommand := ExtractCommand(aSQL);
  Inc(aTokenPosition, lCommand.Length - aValue.Length);
  aBuilder.Append(lCommand).Append(sSPACE);
  FSingleCommand := False;
end;

procedure TSQLFormatter.ProcessJoin(const aValue: string; aBuilder: TStringBuilder);
begin
  DecMargin(FMarginHeap - nMARGIN);

  aBuilder
    .AppendSpaces(FMarginLevel)
    .Append(aValue.Replace('_', sSPACE, [rfReplaceAll]))
    .Append(sSPACE);

  FSameLinePosition := aValue.Length;
end;

procedure TSQLFormatter.ProcessOperator(const aValue: string; aBuilder: TStringBuilder);
var
  lOperatorMarginLevel: smallint;
begin
  if (not aValue.Equals('AND')) and (not aValue.Equals('OR')) then
  begin
    Inc(FMarginLevel, nMARGIN);
    Inc(FMarginHeap, nMARGIN);
  end;

  lOperatorMarginLevel := FMarginLevel;

  if aValue.Equals('AND') then
    Dec(lOperatorMarginLevel);

  aBuilder
    .AppendSpaces(lOperatorMarginLevel)
    .Append(aValue.ToUpper)
    .Append(sSPACE);

  FSameLinePosition := aValue.Length;
end;

procedure TSQLFormatter.ProcessSubSelect(const aSQL: string;
      var aTokenPosition: smallint; aBuilder: TStringBuilder);
var
  lSubSelect: string;
  lActualMargin: smallint;
  lActualHeap: smallint;
  lActualSingleCommand: boolean;
begin
  lSubSelect := ExtractSubSelect(aSQL);
  lActualMargin := FMarginLevel;
  lActualHeap := FMarginHeap;
  lActualSingleCommand := FSingleCommand;

  // Set the margin of the SubSelect columns
  Inc(FMarginLevel, Succ(FSameLinePosition));

  // "-5" is the offset of the keyword "SELECT"
  Inc(aTokenPosition, lSubSelect.Length - 5);

  aBuilder
    .Append('(')
    .Append(IdentSQL(lSubSelect))
    .Append(')');

  FMarginLevel := lActualMargin;
  FMarginHeap := lActualHeap;
  FSingleCommand := lActualSingleCommand;
end;

function TSQLFormatter.ReplaceAllStrings(const aText, aOldPattern, aNewPattern: string): string;
begin
  result := StringReplace(aText, aOldPattern, aNewPattern, [rfReplaceAll, rfIgnoreCase]);
end;

function TSQLFormatter.ReplaceParametersWithValues: string;
var
  lName: string;
  lType: string;
  lValue: string;
  lCounter: smallint;

  function IsDateTimeParameter: boolean;
  var
    lIsNull: boolean;
    lIsDate: boolean;
  begin
    lIsNull := lValue.ToLower.Equals('null');
    lIsDate := (lType = 'FTDATETIME') or (lType = 'FTDATE');
    result := (not lIsNull) and (lIsDate);
  end;

  function IsStringParameter: boolean;
  begin
      result := (lType.ToUpper.Equals('FTSTRING')) or (lType.ToUpper.Equals('FTWIDESTRING'));
  end;

begin
  FStringListValues.StrictDelimiter := True;
  FStringListValues.Delimiter := ',';

  for lCounter := Pred(FStringListParameters.Count) downto 0 do
  begin
    FStringListValues.DelimitedText := FStringListParameters[lCounter];
    lName := ':' + FStringListValues[0];
    lType := FStringListValues[1].ToUpper;
    lValue := FStringListValues[2];

    if FStringListValues.Count < 3 then
    begin
      lValue := 'null';
      result := ReplaceAllStrings(result, lName, lValue);
      Continue;
    end;

    if IsDateTimeParameter then
      lValue := GetFormattedDate(lValue);

    if IsStringParameter then
      lValue := GetQuotedValue(lValue);

    result := ReplaceAllStrings(result, lName, lValue);
  end;
end;

function TSQLFormatter.BreakLineNeeded(const aValue: string): boolean;
var
  lLastCharacterIsComma: boolean;
begin
  if aValue.Length = 0 then
    Exit(False);

  lLastCharacterIsComma := (aValue[aValue.Length] = ',');
  result := lLastCharacterIsComma and (not FSingleCommand);
end;

function TSQLFormatter.IsCommand(const aValue: string): boolean;
var
  lCommand: string;
begin
  result := False;
  for lCommand in FStringListCommands do
  begin
    if aValue.StartsWith(lCommand) then
    begin
      result := True;
      Break;
    end;
  end;
end;

constructor TSQLFormatter.Create;
begin
  CreateInternalObjects;
  InitializeStringLists;
end;

procedure TSQLFormatter.CreateInternalObjects;
begin
  FStringListClauses := TStringList.Create;
  FStringListJoins := TStringList.Create;
  FStringListOperators := TStringList.Create;
  FStringListCommands := TStringList.Create;
  FStringListParameters := TStringList.Create;
  FStringListValues := TStringList.Create;
end;

procedure TSQLFormatter.DecMargin(const aQtde: byte);
begin
  if FMarginLevel > 0 then
  begin
    Dec(FMarginLevel, aQtde);
    Dec(FMarginHeap, aQtde);
  end;
end;

destructor TSQLFormatter.Destroy;
begin
  DestroyInternalObjects;
  inherited;
end;

procedure TSQLFormatter.DestroyInternalObjects;
begin
  FStringListClauses.Free;
  FStringListJoins.Free;
  FStringListOperators.Free;
  FStringListCommands.Free;
  FStringListParameters.Free;
  FStringListValues.Free;
end;

function TSQLFormatter.FormatDateTimeWithToDateFunction(
  const aDateTime: TDateTime): string;
var
  lToDateFunction: string;
begin
  lToDateFunction := 'to_date(%s, ''dd-mm-yyyy hh24:mi:ss'')';
  result := Format(lToDateFunction,
    [FormatDateTime('dd/mm/yyyy hh:nn:ss', aDateTime).QuotedString]);
end;

function TSQLFormatter.FormatSQL(const aSQL: string): string;
var
  lPreparedSQL: string;
begin
  FMarginLevel := 0;
  lPreparedSQL := ProcessParameters(aSQL);
  lPreparedSQL := PrepareSQL(lPreparedSQL);
  result := IdentSQL(lPreparedSQL);
end;

function TSQLFormatter.GetFormattedDate(const aValue: string): string;
var
  lDate: TDateTime;
begin
  lDate := StrToDateTime(aValue);

  if FUseToDateFunction then
    result := FormatDateTimeWithToDateFunction(lDate)
  else
    result := QuotedStr(FormatDateTime(FDateFormat + ' hh:nn:ss', lDate));
end;

function TSQLFormatter.GetQuotedValue(const aValue: string): string;
begin
  result := aValue.DeQuotedString.QuotedString;
end;

function TSQLFormatter.IdentSQL(const aPreparedSQL: string): string;
var
  lValue: string;
  lSQL: string;
  lBuilder: TStringBuilder;
  lTokenPosition: smallint;

  procedure ClipSQL;
  begin
    lSQL := Copy(lSQL, lTokenPosition, lSQL.Length).Trim;
  end;

begin
  lSQL := aPreparedSQL;
  lBuilder := TStringBuilder.Create;
  try
    FMarginHeap := 0;
    FSameLinePosition := 0;

    while lSQL.Length > 0 do
    begin
      lTokenPosition := Pos(sSPACE, lSQL);

      if lTokenPosition = 0 then
        lTokenPosition := Succ(lSQL.Length);

      lValue := Copy(lSQL, 1, Pred(lTokenPosition)).Trim;

      if lValue.ToUpper.Equals(sSUBSELECT) then
      begin
        ProcessSubSelect(lSQL, lTokenPosition, lBuilder);
        ClipSQL;
        Continue;
      end;

      if FStringListClauses.Exists(lValue) then
      begin
        ProcessClause(lValue.ToUpper, lBuilder);
        ClipSQL;
        Continue;
      end;

      if FStringListJoins.Exists(lValue) then
      begin
        ProcessJoin(lValue.ToUpper, lBuilder);
        ClipSQL;
        Continue;
      end;

      if FStringListOperators.Exists(lValue) then
      begin
        ProcessOperator(lValue.ToUpper, lBuilder);
        ClipSQL;
        Continue;
      end;

      if IsCommand(lValue.ToUpper) then
      begin
        ProcessCommand(lSQL, lValue, lTokenPosition, lBuilder);
        ClipSQL;
        Continue;
      end;

      Inc(FSameLinePosition, Succ(lValue.Length));

      // to deal with ROW_NUMBER command
      if lValue.Contains('ORDER_BY') then
        lValue := lValue.Replace('_', sSPACE, [rfReplaceAll]);

      lBuilder.Append(lValue).Append(sSPACE);

      if BreakLineNeeded(lValue) then
      begin
        lBuilder.AppendSpaces(FMarginLevel);
        FSameLinePosition := 0;
      end;

      ClipSQL;
    end;

    result := lBuilder.ToString;
  finally
    lBuilder.Free;
  end;
end;

function TSQLFormatter.ExtractCommand(const aSQL: string): string;
var
  lParenthesesCount: smallint;
  lCharacter: string;
begin
  result := EmptyStr;
  lParenthesesCount := -1;

  for lCharacter in aSQL do
  begin
    if lCharacter = '(' then
    begin
      if lParenthesesCount >= 0 then
        Inc(lParenthesesCount)
      else
        lParenthesesCount := Abs(lParenthesesCount);
    end;

    if lCharacter = ')' then
      Dec(lParenthesesCount);

    result := result + lCharacter;

    if lParenthesesCount = 0 then
      Break;
  end;
  result := result.Replace('_', sSPACE, [rfReplaceAll]);
end;

procedure TSQLFormatter.ExtractParamsList(const aSQL: string; const aParamsPosition: integer);
var
  lParamsSection: string;
  lParam: string;
  lOffSet: integer;
  lStartPosition: integer;
  lEndPosition: integer;
begin
  lParamsSection := Copy(aSQL, aParamsPosition, Length(aSQL) - aParamsPosition + 1);

  lOffSet := Pos('[', lParamsSection);
  FStringListParameters.Clear;
  while Pos('[', lParamsSection, lOffSet) > 0 do
  begin
    lStartPosition := Pos('[', lParamsSection, lOffSet);
    lEndPosition := Pos('][', lParamsSection, lOffSet);

    if lEndPosition = 0 then
      lEndPosition := Pos('])', lParamsSection, lOffSet);

    lParam := Copy(lParamsSection, Succ(lStartPosition), Pred(lEndPosition - lStartPosition));
    FStringListParameters.Add(lParam);

    lOffSet := Succ(lEndPosition);
  end;

  FStringListParameters.Sort;
end;

end.
