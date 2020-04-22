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
	ASL
	TAY
	LDA timer_ones_bottom+0, y
	STA Timer_Ones_Bottom_Point+0
	LDA timer_ones_bottom+1, y
	STA Timer_Ones_Bottom_Point+1

	LDA $202F
	ASL
	TAY
	LDA timer_tens_top+0, y
	STA Timer_Tens_Top_Point+0
	LDA timer_tens_top+1, y
	STA Timer_Tens_Top_Point+1

	LDA $204F
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

	;; LDX #$00
	;; STX A1
	;; INX			;1
	;; STX As1
	;; STX Bb1
	;; INX			;2
	;; STX B1

	;; INX			;3
	;; STX C2
	;; INX			;4
	;; STX Cs2
	;; STX Db2
	;; INX			;5
	;; STX D2
	;; INX			;6
	;; STX Ds2
	;; STX Eb2
	;; INX			;7
	;; STX E2
	;; INX			;8
	;; STX F2
	;; INX			;9
	;; STX Fs2
	;; STX Gb2
	;; INX			;0A
	;; STX G2
	;; INX			;0B
	;; STX Gs2
	;; STX Ab2
	;; INX			;0C
	;; STX A2
	;; INX			;0D
	;; STX As2
	;; STX Bb2
	;; INX			;0E
	;; STX B2

	;; INX			;0F
	;; STX C3
	;; INX			;10
	;; STX Cs3
	;; STX Db3
	;; INX			;11
	;; STX D3
	;; INX			;12
	;; STX Ds3
	;; STX Eb3
	;; INX			;13
	;; STX E3
	;; INX			;14
	;; STX F3
	;; INX			;15
	;; STX Fs3
	;; STX Gb3
	;; INX			;16
	;; STX G3
	;; INX			;17
	;; STX Gs3
	;; STX Ab3
	;; INX			;18
	;; STX A3
	;; INX			;19
	;; STX As3
	;; STX Bb3
	;; INX			;1A
	;; STX B3

	;; INX			;1B
	;; STX C4
	;; INX			;1c
	;; STX Cs4
	;; STX Db4
	;; INX			;1d
	;; STX D4
	;; INX			;1e
	;; STX Ds4
	;; STX Eb4
	;; INX			;1f
	;; STX E4
	;; INX			;20
	;; STX F4
	;; INX			;21
	;; STX Fs4
	;; STX Gb4
	;; INX			;22
	;; STX G4
	;; INX			;23
	;; STX Gs4
	;; STX Ab4
	;; INX			;24
	;; STX A4
	;; INX			;25
	;; STX As4
	;; STX Bb4
	;; INX			;26
	;; STX B4

	;; INX			;27
	;; STX C5
	;; INX			;28
	;; STX Cs5
	;; STX Db5
	;; INX			;29
	;; STX D5
	;; INX			;2a
	;; STX Ds5
	;; STX Eb5
	;; INX			;2b
	;; STX E5
	;; INX			;2c
	;; STX F5
	;; INX			;2d
	;; STX Fs5
	;; STX Gb5
	;; INX			;2e
	;; STX G5
	;; INX			;2f
	;; STX Gs5
	;; STX Ab5
	;; INX			;30
	;; STX A5
	;; INX			;31
	;; STX As5
	;; STX Bb5
	;; INX			;32
	;; STX B5

	;; INX			;33
	;; STX C6
	;; INX			;34
	;; STX Cs6
	;; STX Db6
	;; INX			;35
	;; STX D6
	;; INX			;36
	;; STX Ds6
	;; STX Eb6
	;; INX			;37
	;; STX E6
	;; INX			;38
	;; STX F6
	;; INX			;39
	;; STX Fs6
	;; STX Gb6
	;; INX			;3a
	;; STX G6
	;; INX			;3b
	;; STX Gs6
	;; STX Ab6
	;; INX			;3c
	;; STX A6
	;; INX			;3d
	;; STX As6
	;; STX Bb6
	;; INX			;3e
	;; STX B6

	;; INX			;3f
	;; STX C7
	;; INX			;40
	;; STX Cs7
	;; STX Db7
	;; INX			;41
	;; STX D7
	;; INX			;42
	;; STX Ds7
	;; STX Eb7
	;; INX			;43
	;; STX E7
	;; INX			;44
	;; STX F7
	;; INX			;45
	;; STX Fs7
	;; STX Gb7
	;; INX			;46
	;; STX G7
	;; INX			;47
	;; STX Gs7
	;; STX Ab7
	;; INX			;48
	;; STX A7
	;; INX			;49
	;; STX As7
	;; STX Bb7
	;; INX			;4a
	;; STX B7

	;; INX			;4b
	;; STX C8
	;; INX			;4c
	;; STX Cs8
	;; STX Db8
	;; INX			;4d
	;; STX D8
	;; INX			;4e
	;; STX Ds8
	;; STX Eb8
	;; INX			;4f
	;; STX E8
	;; INX			;50
	;; STX F8
	;; INX			;51
	;; STX Fs8
	;; STX Gb8
	;; INX			;52
	;; STX G8
	;; INX			;53
	;; STX Gs8
	;; STX Ab8
	;; INX			;54
	;; STX A8
	;; INX			;55
	;; STX As8
	;; STX Bb8
	;; INX			;56
	;; STX B8

	;; INX			;57
	;; STX C9
	;; INX			;58
	;; STX Cs9
	;; STX Db9
	;; INX			;59
	;; STX D9
	;; INX			;5a
	;; STX Ds9
	;; STX Eb9
	;; INX			;5b
	;; STX E9
	;; INX			;5c
	;; STX F9
	;; INX			;5d
	;; STX Fs9
	;; STX Gb9
	;; INX			;5e
	;; STX rest

	;; lda #$80
	;; STA thirtysecond
	;; lda #$81
	;; sta sixteenth
	;; lda #$82
	;; sta eighth
	;; lda #$83
	;; sta quarter
	;; lda #$84
	;; sta half
	;; lda #$85
	;; sta whole
	;; lda #$86
	;; sta d_sixteenth
	;; lda #$87
	;; sta d_eighth
	;; lda #$88
	;; sta d_quarter
	;; lda #$89
	;; sta d_half
	;; lda #$8A
	;; sta d_whole
	;; lda #$8B
	;; sta d_quarter
	
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
	LDA #$01
	STA UpdateTimer_Flag

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
