Pattern
  = DefinitionSection Row+ EndOfFile

DefinitionSection
  = DEFINITION_HEADER Definition+ // how do i tell the end
Definition  // second custom stitch type name is for notation slot
  = CustomStitchTypeName (OPEN CustomStitchTypeName CLOSE)? (COLON (!EndOfLine .)*)? EndOfLine
CustomStitchTypeName = [a-zA-Z0-9_ ]+

Row
  = RowStart StitchSequence+ RowCount?
RowStart
  = (START / ROW NUMBER) COLON
RowCount
  = LEFTSQUARE (!RIGHTSQUARE .)* RIGHTSQUARE

StitchSequence
  = StitchGroup (COMMA StitchGroup)* PERIOD
StitchGroup
  = CH NUMBER
  / (Stitch / LEFTCURLY StitchSequence RIGHTCURLY) IN StitchTarget TO_FORM_RING?

Stitch = Ordinal? (CH / SL / DC)
StitchTarget
  = Stitch / CH_RING

Ordinal = [1-9]?[0-9]* ("1st" / "2nd" / "3rd" / [04-9] "th" / "first") Spacing

DEFINITION_HEADER = Spacing "Custom Stitches" Spacing EndOfLine
OPEN = '(' Spacing
CLOSE = ')' Spacing
COLON = ':' Spacing
START = [Ss] "tart" Spacing
ROW = [Rr] "ow" Spacing
NUMBER = [0-9]+ Spacing
LEFTSQUARE = '[' Spacing
RIGHTSQUARE = ']' Spacing
COMMA = ',' Spacing
PERIOD = '.' Spacing
LEFTCURLY = '{' Spacing
RIGHTCURLY = '}' Spacing

CH = [Cc] "h" Spacing
SL = [Ss] "l st" Spacing
DC = [Dd] "c" Spacing
CH_RING = "ch-ring" Spacing

IN = "in" Spacing
TO_FORM_RING = "to form a ring" Spacing

Spacing = (Space / Comment)*
Comment = '#' (!EndOfLine .)* EndOfLine
Space = ' ' / '\t' / EndOfLine
EndOfLine = '\r\n' / '\r' / '\n'
EndOfFile = !.
