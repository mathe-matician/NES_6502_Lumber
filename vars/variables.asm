;----------------------------------------------------------------
; constants
;----------------------------------------------------------------

PRG_COUNT = 1 ;1 = 16KB, 2 = 32KB
MIRRORING = %0001 ;%0000 = horizontal, %0001 = vertical, %1000 = four-screen

STATE		= $13
	;; 00000000
	;; ||||||||-Title Screen
	;; |||||||+-Playing Game
	;; ||||||+--Gameover
	;; |||||+---Pause
	;; ||||+----	
	
RIGHTWALL	= $F0  
TOPWALL     	= $20
BOTTOMWALL  	= $D8
LEFTWALL    	= $08	

;----------------------------------------------------------------
; variables
;----------------------------------------------------------------
	;; oam 	  	= $0200 ;shadow oam
draw_flags 	= #%00000000
	;;draw_flag bits:
	;;00000000
	;;|||||||+-needma
	;;||||||+--needdraw
	;;|||||+---needppureg
	;;||||+----2000
	;;|||+-----2001
lvl1_npc_flags	= $14
	;;0000 0000
	;;|  | |__|-NPC1z
	;;|  | ||||-False - zero
	;;|  | |||+-True
	;;|  | ||+--Text box active
	;;|  |
	;;|__|------NPC2
	;;|||+------False - use zero as well (take this out as false)
	;;||+-------True
playerfacing	= $16	
	;;00000000
	;;|||||||+--Right
	;;||||||+---Left
	;;|||||+----Down
	;;||||+-----Up
sevenblock	= $17
	;;00000000
	;;|||||||+-41 Left
	;;||||||+--41 Up
z_Regs 			= $20
H			= z_Regs
L			= z_Regs+1

zm_Regs			= $25
Z			= zm_Regs
M			= zm_Regs+1
;----------------------------------
; Enemy OAM Variables
;----------------------------------
En1_LocY		= $0214
En2_LocY		= $0218
En3_LocY		= $021C
En4_LocY		= $0220
En5_LocY		= $0224
En6_LocY		= $0228
En7_LocY		= $022C
En8_LocY		= $0230
En9_LocY		= $0234
En10_LocY		= $0238
En11_LocY		= $023C	
En12_LocY		= $0240	
	
En1_LocX		= En1_LocY+3
En2_LocX		= En2_LocY+3
En3_LocX		= En3_LocY+3
En4_LocX		= En4_LocY+3
En5_LocX		= En5_LocY+3
En6_LocX		= En6_LocY+3
En7_LocX		= En7_LocY+3	
En8_LocX		= En8_LocY+3
En9_LocX		= En9_LocY+3
En10_LocX		= En10_LocY+3
En11_LocX		= En11_LocY+3	
En12_LocX		= En12_LocY+3
;----------------------------------
; Player OAM Variables
;----------------------------------
shadow_oam		= $0200
playerax_r		= $0204
playerax_l		= $0208
playerax_u		= $020C
playerax_d		= $0210
;---------------------------------
FrameCounter1		= $0A
FrameCounter2		= $03
FrameCounter3		= $05
FrameCounter4		= $06	
Level_1_Enemies 	= $60
fake_player		= $10
temp_player_x_move	= $11
temp_player_y_move	= $12
fake_en_1		= $21	
temp_en_x_move		= $22
temp_en_y_move		= $23
en1_bitflag		= $27	
	;;00000000
	;;|||||||+-Up
	;;||||||+--Down
	;;|||||+---Right
	;;||||+----Left
enn1_check		= $28
en1_direction		= $29	
enemy_position		= $30
en2_direction		= $31
seed			= $32
	;; 		= $33
sound_disable_flag	= $34
S			= $35
Q			= $36
lo			= $37
hi			= $38
resultlo		= $39
resulthi		= $3A
BG256			= $3B
Pointer			= $3C
	;; 		= $3D
bg_ptr			= $0600
Point			= $45
	;; 		= $46
PRGROM			= $6000	;where tile map is stored
PRGROM1			= $6100
PRGROM2			= $6200
PRGROM3			= $6300	
VRAMADDR		= $47
tilenum			= $49
ptr1			= $4A
	;; 		= $4B
VRAM			= $2000
offset			= $4C
prev_button		= $4D
new_button		= $4E
seed2			= $4F
	;; 		= $50
enemy_num		= $51
BG_256			= $52
BGCount			= $53
PRGtest			= $54
EnPoint1Y		= $55
	;; 		= $56
EnPoint1X		= $57
	;; 		= $58
EnPoint2Y		= $59
	;; 		= $5A
EnPoint2X		= $5B
	;; 		= $5C
seed3			= $5D
	;; 		= $5E
enemy_num_tablecheck	= $5F
	;; 		= $60
EnCounter		= $61
Temp_enemy_num		= $62	
En1_Tree_Count		= $63
EnPtr1			= $64
EnPtr2	 		= $65
EnCounter2		= $66
EnCounter3		= $67
EnCounter_Dec		= $68
EnBit			= $69
EnCounter_Dec2		= $6A
EnCounter_Dec3		= $6B
EnDec			= $6C
EnDownCounter		= $6D
EnUpCounter		= $6E
EnRightCounter		= $6F
EnLeftCounter		= $70
EnCounter_Dec4		= $71
EnCounter4		= $72
EnemyPointY		= $73
	;;		= $74
EnemyPointX		= $75
	;; 		= $76
OAM_Num			= $77
EnemyTrueFalse		= $78
PlayerTreeCount		= $79
EnemyTreeCount		= $7A
MapTreeCount		= $7B
P_Tree_Point		= $7C
	;; 		= $7D
A_Tree_Point		= $7E
	;; 		= $7F
Timer_Point		= $80	
	;; 		= $81
Timer			= $82
Timer_Dec		= $83
Timer_Ones_Top_Point	= $84
	;;		= $85
Timer_Ones_Bottom_Point	= $86
	;; 		= $87
Timer_Tens_Top_Point	= $88
	;; 		= $89
Timer_Tens_Bottom_Point	= $8A
	;; 		= $8B
UpdateTimer_Flag	= $8C
UpdateTimerTens_Flag	= $8D
UpdateTimerOnes_Flag	= $8E
Timer_Ones_Dec		= $8F	
Timer_Temp_Ones_Y	= $90
Timer_Temp_Tens_Y	= $91
PlayerTreeDraw_Flag	= $92
EnemyTreeDraw_Flag	= $93
Score_Ones_En_Point	= $94
	;; 		= $95
Score_Tens_En_Point	= $96
	;; 		= $97
Score_Hund_En_Point	= $98
	;; 		= $99
Score_Ones_Player_Point	= $9A
	;; 		= $9B
Score_Tens_Player_Point	= $9C
	;; 		= $9D
Score_Hund_Player_Point	= $9E
	;; 		= $9F
Score_Temp_Ones_Player	= $A0
Score_Temp_Tens_Player	= $A1
Score_Temp_Hund_Player	= $A2
Score_Temp_Ones_En	= $A3
Score_Temp_Tens_En	= $A4
Score_Temp_Hund_En	= $A5
Score_Ones_P_Dec	= $A6
Score_Tens_P_Dec	= $A7
Score_Hund_P_Dec	= $A8
Score_Ones_E_Dec	= $A9
Score_Tens_E_Dec	= $AA
Score_Hund_E_Dec	= $AB
whattile_player		= $AC
whattile_enemy		= $AD
Score_P_Ones_Flag	= $AE	
Score_P_Tens_Flag	= $AF
Score_P_Hund_Flag	= $B0
Score_E_Ones_Flag	= $B1	
Score_E_Tens_Flag	= $B2
Score_E_Hund_Flag	= $B3
Score_P_Tens_First_Flag = $B4
Score_P_Hund_First_Flag = $B5	;don't need?
Score_E_Tens_First_Flag = $B6
Score_E_Hund_First_Flag = $B7 ;don't need?
Timer_Out_Flag		= $B8	
Pre_Inc_Value_Tens	= $B9
Pre_Inc_Value_Ones	= $BA
Down_Flag		= $BB
Up_Flag			= $BC
TopWall_Flag		= $BD
sleeping		= $BE
dbuffer_index		= $BF
;----------------------------------------
; Zero page SE variables
;----------------------------------------
se_ptr1			= $C0
	;; 		= $C1
sound_ptr		= $C2
	;; 		= $C3
current_song		= $C4
SQUARE_1		= $C5
SQUARE_2		= $C6
TRIANGLE		= $C7
NOISE			= $C8

MUSIC_SQ1		= $C9
MUSIC_SQ2		= $CA
MUSIC_TRI		= $CB
MUSIC_NOI		= $CC
SFX_1			= $CD
SFX_2			= $CE
	
;-----------------------------------------
; Audio - Note Variables
;-----------------------------------------
	.enum $0300
;; A1			= $0300
;; As1			= $0301
;; Bb1			= $0301
;; B1			= $0302

;; C2			= $0303
;; Db2			= $0304
;; D2			= $0305
;; Eb2			= $0306
;; E2			= $0307
;; F2			= $0308
;; Gb2			= $0309
;; G2			= $030A
;; A2			= $030B
;; Ab2			= $030C
;; A2			= $030D
;; Bb2			= $030E
	
;; B2			= $030F
;; C3			= $0310
;; Db3			= $0311
;; D3			= $0312
;; Eb3			= $0313
;; E3			= $0314
;; F3			= $0315
;; Gb3			= $0316
;; G3			= $0317
;; A3			= $0318
;; Ab3			= $0319
;; A3			= $031A
	
;; Bb3			= $031B
;; B3			= $031C
;; C4			= $031D	;middle C
;; Db4			= $031E
;; D4			= $031F
;; Eb4			= $0320
;; E4			= $0321
;; F4			= $0322
;; Gb4			= $0323
;; G4			= $0324
;; A4			= $0325
;; Ab4			= $0326
	
;; A4			= $0327
;; Bb4			= $0328
;; B4			= $0329
;; Ds5 			= $032a
;; Eb5 			= $032a
;; E5 			= $032b
;; F5 			= $032c
;; Fs5 			= $032d
;; Gb5 			= $032d
;; G5 			= $032e
;; Gs5 			= $032f
;; Ab5 			= $032f
;; A5 			= $0330
;; As5 			= $0331
;; Bb5 			= $0331
;; B5 			= $0332

;; C6 			= $0333
;; Cs6 			= $0334
;; Db6 			= $0334
;; D6 			= $0335
;; Ds6 			= $0336
;; Eb6 			= $0336
;; E6 			= $0337
;; F6 			= $0338
;; Fs6 			= $0339
;; Gb6 			= $0339
;; G6 			= $033a
;; Gs6 			= $033b
;; Ab6 			= $033b
;; A6 			= $033c
;; As6 			= $033d
;; Bb6 			= $033d
;; B6 			= $033e

;; C7 			= $033f
;; Cs7 			= $0340
;; Db7 			= $0340
;; D7 			= $0341
;; Ds7 			= $0342
;; Eb7 			= $0342
;; E7 			= $0343
;; F7 			= $0344
;; Fs7 			= $0345
;; Gb7 			= $0345
;; G7 			= $0346
;; Gs7 			= $0347
;; Ab7 			= $0347
;; A7 			= $0348
;; As7 			= $0349
;; Bb7 			= $0349
;; B7 			= $034a

;; C8 			= $034b
;; Cs8 			= $034c
;; Db8 			= $034c
;; D8 			= $034d
;; Ds8 			= $034e
;; Eb8 			= $034e
;; E8 			= $034f
;; F8 			= $0350
;; Fs8 			= $0351
;; Gb8 			= $0351
;; G8 			= $0352
;; Gs8 			= $0353
;; Ab8 			= $0353
;; A8 			= $0354
;; As8 			= $0355
;; Bb8 			= $0355
;; B8 			= $0356

;; C9 			= $0357
;; Cs9 			= $0358
;; Db9 			= $0358
;; D9 			= $0359
;; Ds9 			= $035a
;; Eb9 			= $035a
;; E9 			= $035b
;; F9 			= $035c
;; Fs9 			= $035d
;; Gb9 			= $035d
;; rest			= $035e	
;; sound_disable_flag	.dsb 1
;; sound_temp1		.dsb 1
;; sound_temp2		.dsb 1
;; sound_sq1_old		.dsb 1
;; sound_sq2_old		.dsb 1
;; soft_apu_ports		.dsb 16
	
;; stream_curr_sound	.dsb 6
;; stream_status		.dsb 6
;; stream_channel		.dsb 6
;; stream_ptr_LO		.dsb 6
;; stream_ptr_HI		.dsb 6
;; stream_vol_duty		.dsb 6
;; stream_note_LO		.dsb 6
;; stream_note_HI		.dsb 6
;; stream_tempo		.dsb 6
;; stream_ticker_total	.dsb 6
;; stream_note_length_counter .dsb 6
;; stream_note_length	.dsb 6
	.ende
	
;-------------------------------------
; Scoring Variable
;-------------------------------------
;; 	.enum $0400
;; zero_tile		= $0400
;; one_tile		= $0401	
;; two_tile		= $0402
;; three_tile		= $0403
;; four_tile		= $0404
;; five_tile		= $0405
;; six_tile		= $0406
;; seven_tile		= $0407
;; eight_tile		= $0408
;; nine_tile		= $0409
;; 	.ende
	
   .enum $0000

gamestate  		.dsb 1
;; BG256			.dsb 1	
buttons1  		.dsb 1
	;;00000000
	;;|||||||+--Right
	;;||||||+---Left
	;;|||||+----Down
	;;||||+-----Up
	;;|||+------Start
	;;||+-------Select
	;;|+--------B
	;;+---------A
buttons2  		.dsb 1
levels			.dsb 1
	;;draw_flag bits:
	;;00000000
	;;||||||||-start screen
	;;|||||||+-level 1
	;;||||||+--level 2
	;;|||||+---level 3
	;;||||+----level 4
	;;|||+-----level 5
	;;||+------dead reset

	;; to save space, could put collidebits into levels bit, but could be confusing.
collidebits			.dsb 1
	;;draw_flag bits:
	;;00000000
	;;||||||||-zero - open tile
	;;|||||||+-tree
	;;||||||+--fire/gold
	;;|||||+---enemy
	;;||||+----
	;;|||+-----
   .ende

