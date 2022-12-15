.org $8000
LDX #00

start:

right:
LDA $4000
CMP #$08
BNE left
LDA #$00
STA $200,x
INX
JMP display

left:
LDA $4000
CMP #$04
BNE up
LDA #$00
STA $200,x
DEX
JMP display

up:
LDA $4000
CMP #$01
BNE down
STX $00
LDA $01
STA $200,x
LDA $00
SBC #16
TAX
JMP display

down:
LDA $4000
CMP #$02
BNE display
STX $00
LDA $01
STA $200,X
LDA $00
CLC
ADC #16
TAX
JMP display

display:
LDA #$15
STA $200,X


JMP start


.goto $FFFA
.dw start ; non maskable
.dw start ; reset
.dw start ; interrupt