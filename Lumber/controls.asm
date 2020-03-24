Control_State:	
	LDA STATE
	CMP #$00
	BEQ Start_Controls
	LDA STATE
	AND #%00000001
	BNE Game_Controls
	LDA STATE
	AND #%00000010
	BNE Gameover_Controls
	;; LDA STATE
	;; AND #%00000100
	;; BNE Text_Controls

	;; RTS
	JMP ControlsDone

	;; Set up Jump table instead of branches

;; Text_Controls:
;; 	LDA buttons1
;; 	AND #%10000000
;; 	BEQ TextControlsDone	;could change to RTS

;; 	LDA lvl1_npc_flags
;; 	AND #%00000010
;; 	BEQ TextControlsDone	;could change to RTS

;; 	LDA #%00000100
;; 	STA lvl1_npc_flags
	
;; 	LDA #%00011110
;; 	STA $2001

;; 	LDA #$00
;; 	STA FrameCounter1
;; 	STA STATE
;; 	LDA #%00000001
;; 	STA STATE
	
TextControlsDone:
	;; RTS 			;should go back to UpdateController
	JMP ControlsDone

Gameover_Controls:
	LDA buttons1
	AND #%00010000
	BEQ Start_ControlsDone

	LDA #%00010000
	STA $2000
	LDA #$00
	STA $2001
	
	JMP RESET		; goes to blank screen

Start_Controls:
	LDA seed2
	CLC
	ADC #$01
	STA seed2
	STA seed2+1
	LDA buttons1
	AND #%00010000
	BEQ Start_ControlsDone
	
	LDA #%00000001
	STA levels
	STA STATE

Start_ControlsDone:	
	JMP ControlsDone

Game_Controls:

	LDA FrameCounter1
	CMP #$06
	BEQ Start_Game_Controls
	JMP ControlsDone
	
Start_Game_Controls:
	LDA #$00
	STA FrameCounter1
	
	LDA shadow_oam
	STA temp_player_y_move

	LDA shadow_oam+3
	STA temp_player_x_move

MovePlayerUp:
	LDA buttons1
	AND #%00001000
	BNE Upgoing
	JMP MovePlayerUpDone
Upgoing:	
	LDA #%00001000
	STA playerfacing

MovingPlayerUp:
	LDA $0201
	CMP #$12
	BEQ WalkUp

	LDA #$12
	STA $0201
	JMP WalkUpDone

WalkUp:
	LDA #$23
	STA $0201

WalkUpDone:	
	
	;; check if player has reached left wall
	LDA $0200
	CMP #TOPWALL
	BEQ MovePlayerUpDone

	LDA temp_player_y_move
	SEC
	SBC #$08
	STA temp_player_y_move

	TileTranslate H, L, temp_player_y_move, temp_player_x_move, PRGROM


	STA fake_player
	CMP #$00
	BNE MovePlayerUpDone	
	LDA fake_player
	CMP #$07
	BEQ SevenBlockUp

	;; move player up if open space
	LDA shadow_oam
	SEC
	SBC #$08
	STA shadow_oam

	LDA playerax_r
	SEC
	SBC #$08
	STA playerax_r

	LDA playerax_l
	SEC
	SBC #$08
	STA playerax_l

	LDA playerax_u
	SEC
	SBC #$08
	STA playerax_u

	LDA playerax_d
	SEC
	SBC #$08
	STA playerax_d
	
	JMP MovePlayerUpDone

SevenBlockUp:
	LDA #%00000001
	STA sevenblock
	
MovePlayerUpDone:
	LDA playerfacing
	CMP #%00001000
	BNE MovePlayerDown
	LDA #$02
	STA shadow_oam+1
	LDA #$16
	STA playerax_u+1

MovePlayerDown:
	LDA buttons1
	AND #%00000100
	BNE Downgoing
	JMP MovePlayerDownDone
Downgoing:	
	LDA #%00000100
	STA playerfacing

MovingPlayerDown:
	
	LDA $0201
	CMP #$01
	BEQ WalkDown

	LDA #$11
	STA $0201
	JMP WalkDownDone
WalkDown:
	LDA #$11
	STA $0201

WalkDownDone:	

	;; check if player has reached bottom wall
	LDA $0200
	CMP #BOTTOMWALL
	BEQ MovePlayerDownDone

	LDA temp_player_y_move
	CLC
	ADC #$08
	STA temp_player_y_move

	TileTranslate H, L, temp_player_y_move, temp_player_x_move, PRGROM
	STA fake_player
	CMP #$00
	BNE MovePlayerDownDone

	;; move player down if no collision
	LDA shadow_oam
	CLC
	ADC #$08
	STA shadow_oam

	LDA playerax_r
	CLC
	ADC #$08
	STA playerax_r

	LDA playerax_l
	CLC
	ADC #$08
	STA playerax_l

	LDA playerax_u
	CLC
	ADC #$08
	STA playerax_u

	LDA playerax_d
	CLC
	ADC #$08
	STA playerax_d
	
	JMP MovePlayerDownDone

MovePlayerDownDone:
	LDA playerfacing
	CMP #%00000100
	BNE MovePlayerRight
	LDA #$01
	STA shadow_oam+1
	LDA #$16
	STA playerax_d+1

MovePlayerRight:
	LDA buttons1
	AND #%00000001
	BNE Rightgoing
	JMP MovePlayerRightDone
Rightgoing:	
	LDA #%00000001
	STA playerfacing

MovingPlayerRight:
	LDA $0201		;player sprite
	CMP #$03
	BEQ WalkRight
	
	LDA #$03
	STA $0201
	JMP WalkRightDone
	
WalkRight:	
	LDA #$13
	STA $0201

WalkRightDone:	

	;; check if player has reached right wall
	LDA $0203
	CMP #RIGHTWALL
	BEQ MovePlayerRightDone
	
	LDA temp_player_x_move
	CLC
	ADC #$08
	STA temp_player_x_move

	
	TileTranslate H, L, temp_player_y_move, temp_player_x_move, PRGROM
	STA fake_player
	CMP #$00
	BNE MovePlayerRightDone

	;; move player right if no collision
	LDA $0203
	CLC
	ADC #$08
	STA $0203

	LDA playerax_r+3
	CLC
	ADC #$08
	STA playerax_r+3

	LDA playerax_l+3
	CLC
	ADC #$08
	STA playerax_l+3

	LDA playerax_u+3
	CLC
	ADC #$08
	STA playerax_u+3

	LDA playerax_d+3
	CLC
	ADC #$08
	STA playerax_d+3
	
	JMP MovePlayerRightDone

MovePlayerRightDone:
	LDA playerfacing
	CMP #%00000001
	BNE MovePlayerLeft
	LDA #$26
	STA shadow_oam+1
	LDA #$16
	STA playerax_r+1

MovePlayerLeft:
	LDA buttons1
	AND #%00000010
	BNE Leftgoing
	JMP MovePlayerLeftDone

Leftgoing:	

	LDA #%00000010
	STA playerfacing

MovingPlayerLeft:

	LDA $0201
	CMP #$04
	BEQ WalkLeft
	
	LDA #$04
	STA $0201
	JMP WalkLeftDone

WalkLeft:
	LDA #$14
	STA $0201

WalkLeftDone:	

	;; check if player has reached left wall
	LDA $0203
	CMP #LEFTWALL
	BEQ MovePlayerLeftDone
	
	LDA temp_player_x_move
	SEC
	SBC #$08
	STA temp_player_x_move

	TileTranslate H, L, temp_player_y_move, temp_player_x_move, PRGROM
	STA fake_player
	CMP #$00
	BNE MovePlayerLeftDone
	CMP #$07
	BEQ SevenBlockLeft

	;; move player left if no collision
	LDA $0203
	SEC
	SBC #$08
	STA $0203

	LDA playerax_r+3
	SEC
	SBC #$08
	STA playerax_r+3

	LDA playerax_l+3
	SEC
	SBC #$08
	STA playerax_l+3

	LDA playerax_u+3
	SEC
	SBC #$08
	STA playerax_u+3

	LDA playerax_d+3
	SEC
	SBC #$08
	STA playerax_d+3
	
	JMP ControlsDone
SevenBlockLeft:
	LDA #%00000010
	STA sevenblock
	
MovePlayerLeftDone:
	LDA playerfacing
	CMP #%00000010
	BNE PlayerPunch
	LDA #$27
	STA shadow_oam+1
	LDA #$16
	STA playerax_l+1
	
ControlsDone:	
