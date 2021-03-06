;------------------------------------
;level 1 init
;------------------------------------
	LDA $2030
	ASL
	TAY
	LDA timer_ones_top+0, y
	STA Timer_Ones_Top_Point+0
	LDA timer_ones_top+1, y
	STA Timer_Ones_Top_Point+1

	LDA $2050
	;; lda $0050
	ASL
	TAY
	LDA timer_ones_bottom+0, y
	STA Timer_Ones_Bottom_Point+0
	LDA timer_ones_bottom+1, y
	STA Timer_Ones_Bottom_Point+1

	LDA $202F
	;; lda $002F
	ASL
	TAY
	LDA timer_tens_top+0, y
	STA Timer_Tens_Top_Point+0
	LDA timer_tens_top+1, y
	STA Timer_Tens_Top_Point+1

	LDA $204F
	;; lda $004F
	ASL
	TAY
	LDA timer_tens_bottom+0, y
	STA Timer_Tens_Bottom_Point+0
	LDA timer_tens_bottom+1, y
	STA Timer_Tens_Bottom_Point+1

	LDA $204D
	ASL
	TAY
	LDA score_en_ones+0, y
	STA Score_Ones_En_Point+0
	LDA score_en_ones+1, y
	STA Score_Ones_En_Point+1

	LDA $204C
	ASL
	TAY
	LDA score_en_tens+0, y
	STA Score_Tens_En_Point+0
	LDA score_en_tens+1, y
	STA Score_Tens_En_Point+1

	LDA $204B
	ASL
	TAY
	LDA score_en_hund+0, y
	STA Score_Hund_En_Point+0
	LDA score_en_hund+1, y
	STA Score_Hund_En_Point+1

	LDA $2056
	ASL
	TAY
	LDA score_player_ones+0, y
	STA Score_Ones_Player_Point+0
	LDA score_player_ones+1, y
	STA Score_Ones_Player_Point+1

	LDA $2055
	ASL
	TAY
	LDA score_player_tens+0, y
	STA Score_Tens_Player_Point+0
	LDA score_player_tens+1, y
	STA Score_Tens_Player_Point+1

	LDA $2054
	ASL
	TAY
	LDA score_player_hund+0, y
	STA Score_Hund_Player_Point+0
	LDA score_player_hund+1, y
	STA Score_Hund_Player_Point+1
	
	LDA #$00
	STA fake_player
	STA lvl1_npc_flags
	STA enemy_num_tablecheck+0
	STA enemy_num_tablecheck+1
	;; could change to bit flags
	STA UpdateTimerOnes_Flag
	STA Timer_Temp_Tens_Y
	STA Timer_Temp_Ones_Y
	STA Score_P_Ones_Flag
	STA Score_P_Tens_Flag
	STA Score_P_Hund_Flag
	STA Score_P_Tens_First_Flag
	STA Score_P_Hund_First_Flag
	STA Score_E_Ones_Flag
	STA Score_E_Tens_Flag
	STA Score_E_Hund_Flag
	STA Score_E_Tens_First_Flag
	STA Score_E_Hund_First_Flag
	STA Timer_Out_Flag
	STA Pre_Inc_Value_Tens
	STA Pre_Inc_Value_Ones
	STA sound_disable_flag
	STA startup_flag
	STA song_flag
	sta ax_x_temp
	sta ax_y_temp
	sta p_chopped_tree_flag
	sta Timer_Out_Draw_Flag
	sta Draw_AliensWin_Flag
	sta Draw_HumansWin_Flag
	sta Draw_Tie_Flag	
	sta Draw_TimerUp_Flag
	sta Draw_PlayerDeath_Flag
	sta Timer_Set_Flag
	sta Human_Set_Flag
	sta Alien_Set_Flag
	sta Tie_Set_Flag
	STA SQUARE_1
	STA MUSIC_SQ1

	LDA #$01
	STA SQUARE_2
	STA MUSIC_SQ2
	
	
	LDA #$02
	STA Down_Flag
	STA Up_Flag
	STA TRIANGLE
	STA MUSIC_TRI
	
	LDA #$03
	STA TopWall_Flag
	STA NOISE
	STA MUSIC_NOI

	LDA #$04
	STA SFX_1
	LDA #$05
	STA SFX_2

	LDA #$01
	STA UpdateTimerTens_Flag
	STA PlayerTreeDraw_Flag
	STA EnemyTreeDraw_Flag
	STA UpdateTimer_Flag

	LDA #$0A
	STA Timer_Ones_Dec
	STA Score_Ones_P_Dec
	STA Score_Tens_P_Dec
	STA Score_Hund_P_Dec
	STA Score_Ones_E_Dec
	STA Score_Tens_E_Dec
	STA Score_Hund_E_Dec

	LDA #$00
	STA EnPoint1Y+0
	STA EnPoint1Y+1
	STA EnPoint1X+0
	STA EnPoint1X+1
	STA EnCounter2
	STA EnCounter3
	STA EnCounter4
	STA EnBit
	STA EnemyTrueFalse

	LDA #$D0
	STA Timer

	LDA #$02
	STA EnCounter
	
	LDA #$0D
	STA Timer_Dec

	LDA #$03
	STA EnDec
	LDA #$04
	STA EnDownCounter
	STA EnUpCounter
	STA EnRightCounter
	STA EnLeftCounter

	LDA #$03
	STA seed3+0
	LDA #$05
	STA seed3+1

	LDA #$CC
	STA hi
	LDA #$33
	STA lo

	LDA #$00
	STA enn1_check

	LDA #$FF
	STA FrameCounter4
	STA FrameCounter3
	STA FrameCounter2

	LDA %00000001
	STA en1_direction
	LDY #$00
	STY enemy_position

	LDA #$11
	STA seed+0
	LDA #$05
	LDA seed+1
	
	LDA #%00001000
	
	LDX #$04
	LDY #$00
LoadPlayer:
	LDA player_init, y	;starting at $0200
	STA shadow_oam, y
	INY
	DEX
	BNE LoadPlayer
	
	LDX #$10
	LDY #$00
LoadAx:
	LDA player_ax, y	;starting at $0204 - $0210
	STA playerax_r, y
	INY
	DEX
	BNE LoadAx

	;; init variables
	LDA #$FF
	STA FrameCounter1

	LDA #$01
	STA Level_1_Enemies

	LDA seed2
	CMP #$20
	BCC Load5En
	CMP #$80
	BCC Load6En
	;; maybe7?
Load4Ens:
	LDA #$04
	STA enemy_num
	LDA #$24
	STA OAM_Num
	LDX #$10
	JMP LoadEns
Load5En:
	LDA #$05
	STA enemy_num
	LDA #$28
	STA OAM_Num
	LDX #$14
	JMP LoadEns
Load6En:
	LDA #$06
	STA enemy_num
	LDA #$2C
	STA OAM_Num
	LDX #$18
	;; maybe seven?
LoadEns
	LDA #$00
	TAY
LoadENS_lvl_1:
	LDA level_1_enemy1, y	;starting at $0214
	STA En1_LocY, y
	INY
	DEX
	BNE LoadENS_lvl_1
	
	LDA #%00000110 ;draw sprites
	STA draw_flags
