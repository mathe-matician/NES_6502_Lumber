song6_header:
	.byte $01           ;1 stream
	
	.byte SFX_1         ;which stream
	.byte $01           ;status byte (stream enabled)
	.byte SQUARE_2      ;which channel
	.byte $7F           ;initial volume (F) and duty (01)
	.word song6_square2 ;pointer to stream
	.byte $80           ;tempo
    
    ;player clicks start on start screen
song6_square2:
	.byte thirtysecond, D6, G7, D7
	.byte $FF
