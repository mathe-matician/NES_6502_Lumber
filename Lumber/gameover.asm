Load_Gameover:	

gameover_text:	
	BIT $2002
	BPL gameover_text
	
	LDA #%00000000
	STA $2001

	LDA $2002
	LDA #$21
	STA $2006
	LDA #$60
	STA $2006

	LDX #$60
	LDY #$00
gameover_text_2_2:
	LDA game_over, Y
	STA $2007
	INY
	DEX
	BNE gameover_text_2_2

	LDA #%00011110
	STA $2001
	LDA #$00
	STA $2005
	STA $2005

gameover_done:	
	RTS
