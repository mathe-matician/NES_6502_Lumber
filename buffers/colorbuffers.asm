

	
test_data:
	.db $04
test:
	.dw test_data
bg_point:
	.dw $6000

ppu_base:
	.dw $2000

palette:	
	;; .DB $20,$29,$1A,$0F,  $20,$36,$17,$0F,  $20,$30,$21,$0F,  $20,$27,$17,$0F   ;;BACKGROUND PALETTE
	.DB $29,$16,$27,$18,  $29,$2D,$3D,$0F,  $29,$17,$27,$05,  $29,$02,$38,$3C ;BACKGROUND PALETTE
	.DB $29,$16,$27,$18,  $29,$2D,$3D,$0F,  $29,$17,$27,$05,  $29,$02,$38,$3C   ;;SPRITE PALETTE
	
sprites:	
	.db $01,$02,$03,$04 
	
attribute:
	.db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.db %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	
	
	.db $01,$01,$01,$01, $01,$01,$01,$01 ,$01,$01,$47,$47, $47,$47,$24,$24 ,$24,$24,$24,$24 ,$24,$24,$24,$24, $24,$24,$24,$24, $55,$56,$24,$24
	.db $01,$01,$01,$01, $24,$24,$24,$24 ,$24,$24,$24,$24, $24,$24,$24,$24 ,$24,$24,$24,$24 ,$24,$24,$24,$24, $24,$24,$24,$24, $24,$24,$24,$24


	
	
	
	
	
	