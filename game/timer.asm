Update_Timer:
	;; this is called in NMI
Update_Timer_Ones:
	LDA UpdateTimerOnes_Flag
	BNE @Continue
	;; set initial Y value for our buffer index
	LDY #$00
	INC UpdateTimerOnes_Flag
	JMP FirstTime
@Continue:
	LDA Timer_Temp_Ones_Y
	TAY
FirstTime:
	BIT $2002
	LDA Timer_Ones_Top_Point+1
	STA $2006
	LDA Timer_Ones_Top_Point+0
	STA $2006
	LDA timer_ones_buffer_top, y
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005

	BIT $2002
	LDA Timer_Ones_Bottom_Point+1
	STA $2006
	LDA Timer_Ones_Bottom_Point+0
	STA $2006
	LDA timer_ones_buffer_bottom, y
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005
	TYA
	STA Pre_Inc_Value_Ones
	INY
	TYA
	STA Timer_Temp_Ones_Y
	LDA Timer_Ones_Dec
	CMP #$0A
	BNE @Continue1
	DEC UpdateTimerTens_Flag
@Continue1:
	DEC Timer_Ones_Dec
	BEQ Update_Ones_Reset
Update_Ones_Done:
	RTS

Update_Ones_Reset:	
	;; reset flag after we count down 10 times
	LDA #$0A
	STA Timer_Ones_Dec
	DEC UpdateTimerOnes_Flag
	DEC UpdateTimerTens_Flag
	RTS 
	
Update_Timer_Tens:
	LDA Timer_Temp_Tens_Y
	TAY

	BIT $2002
	LDA Timer_Tens_Top_Point+1
	STA $2006
	LDA Timer_Tens_Top_Point+0 
	STA $2006
	LDA timer_tens_buffer_top, y
	STA $2007

	LDA #$00
	STA $2002
	STA $2005
	STA $2005

	BIT $2002
	LDA Timer_Tens_Bottom_Point+1
	STA $2006
	LDA Timer_Tens_Bottom_Point+0
	STA $2006
	LDA timer_tens_buffer_bottom, y
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005
	TYA
	STA Pre_Inc_Value_Tens
	INY
	TYA
	STA Timer_Temp_Tens_Y
	;; LDA timer_tens_buffer_bottom,
	LDA Pre_Inc_Value_Tens
	TAY
	LDA timer_tens_buffer_bottom, y
	CMP #$BA	;second zero in buffer
	BNE @Continue
	LDA Pre_Inc_Value_Ones
	TAY
	LDA timer_ones_buffer_bottom, y
	CMP #$B0	;zero in buffer
	BNE @Continue
	INC Timer_Out_Flag
	lda #$00
	jsr sound_load
	LDA #$04
	jsr sound_load
@Continue:
	RTS

