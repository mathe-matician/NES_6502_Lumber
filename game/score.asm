Update_Player_Score:

Update_Player_Ones:	
	LDA Score_P_Ones_Flag
	BNE @Continue
	LDY #$00
	INC Score_P_Ones_Flag
	JMP @FirstTime
@Continue:
	LDA Score_Temp_Ones_Player
	TAY
@FirstTime:
	lda $2002
	LDA Score_Ones_Player_Point+1
	STA $2006
	LDA Score_Ones_Player_Point+0
	STA $2006
	LDA score_ones_buffer_player, y
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005
	INY
	TYA
	STA Score_Temp_Ones_Player

	DEC Score_Ones_P_Dec
	BEQ @Update_Ones_Reset
	LDA Score_P_Tens_Flag
	BNE Update_Player_Tens
@Update_Ones_Done:
	RTS
@Update_Ones_Reset:
	LDA #$0A
	STA Score_Ones_P_Dec
	DEC Score_P_Ones_Flag
Update_Player_Tens:
	LDA Score_P_Tens_First_Flag
	BNE @Continue
	LDY #$00
	INC Score_P_Tens_First_Flag
	JMP @FirstTime
@Continue:
	LDA Score_Temp_Tens_Player
	TAY
@FirstTime:
	lda $2002
	LDA Score_Tens_Player_Point+1
	STA $2006
	LDA Score_Tens_Player_Point+0
	STA $2006
	LDA score_tens_buffer_player, y
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005
	INY
	TYA
	STA Score_Temp_Tens_Player

	DEC Score_Tens_P_Dec
	BEQ @Update_Tens_Reset
@Update_Tens_Done:	
	RTS
@Update_Tens_Reset:
	LDA #$0A
	STA Score_Tens_P_Dec
	LDA Score_P_Hund_Flag
	BEQ Update_Player_Hund
	RTS
Update_Player_Hund:
	INC Score_P_Hund_Flag
	DEC Score_P_Tens_First_Flag
	lda $2002
	LDA Score_Hund_Player_Point+1
	STA $2006
	LDA Score_Hund_Player_Point+0
	STA $2006
	LDA #$91
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005
	
	RTS

Update_Enemy_Score:

Update_Enemy_Ones:
	LDA Score_E_Ones_Flag
	BNE @Continue
	LDY #$00
	INC Score_E_Ones_Flag
	JMP @FirstTime
@Continue:
	LDA Score_Temp_Ones_En
	TAY
@FirstTime:
	LDA $2002
	LDA Score_Ones_En_Point+1
	STA $2006
	LDA Score_Ones_En_Point+0
	STA $2006
	LDA score_ones_buffer_en, y
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005
	INY
	TYA
	STA Score_Temp_Ones_En

	DEC Score_Ones_E_Dec
	BEQ @Update_Ones_Reset
	LDA Score_E_Tens_Flag
	BNE Update_Enemy_Tens
@Update_Ones_Done:
	RTS
@Update_Ones_Reset:
	LDA #$0A
	STA Score_Ones_E_Dec
	DEC Score_E_Ones_Flag
Update_Enemy_Tens:
	LDA Score_E_Tens_First_Flag
	BNE @Continue
	LDY #$00
	INC Score_E_Tens_First_Flag
	JMP @FirstTime
@Continue:
	LDA Score_Temp_Tens_En
	TAY
@FirstTime:
	LDA $2002
	LDA Score_Tens_En_Point+1
	STA $2006
	LDA Score_Tens_En_Point+0
	STA $2006
	LDA score_tens_buffer_en, y
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005
	INY
	TYA
	STA Score_Temp_Tens_En

	DEC Score_Tens_E_Dec
	BEQ @Update_Tens_Reset
@Update_Tens_Done:	
	RTS
@Update_Tens_Reset:
	LDA #$0A
	STA Score_Tens_E_Dec
	LDA Score_E_Hund_Flag
	BEQ Update_Enemy_Hund
	RTS
Update_Enemy_Hund:
	INC Score_E_Hund_Flag
	LDA $2002
	LDA Score_Hund_En_Point+1
	STA $2006
	LDA Score_Hund_En_Point+0
	STA $2006
	LDA #$91
	STA $2007
	LDA #$00
	STA $2002
	STA $2005
	STA $2005
	RTS
