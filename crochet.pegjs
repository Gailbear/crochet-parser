Pattern
  = DefinitionSection Row+ EndOfFile

DefinitionSection
  = DEFINITION_HEADER Definition+ Spacing
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
  / SKIP? NUMBER? Stitch (IN StitchTarget TO_FORM_RING?)?
  / LEFTCURLY StitchSequence RIGHTCURLY IN StitchTarget
  / NUMBER? Stitch IN EachUntil
EachUntil
  = EVERY Stitch (UP_TO StitchTarget)?

Stitch = Ordinal? NoOrdinalStitch
NoOrdinalStitch = (CH / SL / DC)
StitchTarget
  = Stitch PREV_ROW? / CH_RING / CH_SP / LastOnSide / NEXT Stitch
LastOnSide
  = "the last " NoOrdinalStitch " on the side"

Ordinal = ("1st" / "2nd" / "3rd" / [04-9] "th" / "first" / "last") Spacing

DEFINITION_HEADER = Spacing "Custom Stitches" Spacing
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
CH_SP = ("ch" [1-9][0-9]* " space" / [1-9][0-9]* "-ch-space") Spacing

IN = "in" Spacing
TO_FORM_RING = "to form a ring" Spacing
EVERY = "every" Spacing
UP_TO = "up "? "to" Spacing
PREV_ROW = "in the beginning of previous row" Spacing
SKIP = "skip" Spacing
NEXT = "next"

Spacing = (Space / Comment)*
Comment = '#' (!EndOfLine .)* EndOfLine
Space = ' ' / '\t' / EndOfLine
EndOfLine = '\r\n' / '\r' / '\n'
EndOfFile = !.
