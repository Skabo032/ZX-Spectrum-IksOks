org 32768
;================================================
;------by Bosko---RAC2 Zimski----17.2.2019.------
;------updated----22.2.2019.---------------------
;================================================
	call	nacrtaj_tablu
	ld	a,0
	ld	(brojac),a	;setuje brojac poteza na 0
	ld	(pobeda),a	;setuje indikator pobede na 0
ocisti:	
;---------vraca proveru polja na 0
	ld	(otkucano1),a
	ld	(otkucano2),a
	ld	(otkucano3),a
	ld	(otkucano4),a
	ld	(otkucano5),a
	ld	(otkucano6),a
	ld	(otkucano7),a
	ld	(otkucano8),a
	ld	(otkucano9),a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
main:
	
;----ispituje prvi uslov pobede, prvo za x, pa za 0 (1,2,3)
main.provera1x:
	ld	a,(otkucano1)
	cp	%11		;gleda da li se na polju 1 nalazi x
	jp 	nz,main.provera1o	;ako nije nastavi dalje
	ld	a,(otkucano2)
	cp	%11		;gleda da li se na polju 2 nalazi x
	jp	nz,main.provera1o	;ako nije nastavi dalje
	ld	a,(otkucano3)
	cp	%11		;gleda da li se na polju 3 nalazi x
	jp	nz,main.provera1o	;ako nije nastavi dalje
	jp	winx	;ako ispuni sve uslove, prikazi pobednika
main.provera1o:
	ld	a,(otkucano1)
	cp	%10
	jp 	nz,main.provera2x
	ld	a,(otkucano2)
	cp	%10
	jp	nz,main.provera2x
	ld	a,(otkucano3)
	cp	%10
	jp	nz,main.provera2x
	jp	wino
;----ispituje drugi uslov pobede (4,5,6)
main.provera2x:
	ld	a,(otkucano4)
	cp	%11
	jp 	nz,main.provera2o
	ld	a,(otkucano5)
	cp	%11
	jp	nz,main.provera2o
	ld	a,(otkucano6)
	cp	%11
	jp	nz,main.provera2o
	jp	winx
main.provera2o:
	ld	a,(otkucano4)
	cp	%10
	jp 	nz,main.provera3x
	ld	a,(otkucano5)
	cp	%10
	jp	nz,main.provera3x
	ld	a,(otkucano6)
	cp	%10
	jp	nz,main.provera3x
	jp	wino
;----(7,8,9)
main.provera3x:
	ld	a,(otkucano7)
	cp	%11
	jp 	nz,main.provera3o
	ld	a,(otkucano8)
	cp	%11
	jp	nz,main.provera3o
	ld	a,(otkucano9)
	cp	%11
	jp	nz,main.provera3o
	jp	winx
main.provera3o:
	ld	a,(otkucano7)
	cp	%10
	jp 	nz,main.provera4x
	ld	a,(otkucano8)
	cp	%10
	jp	nz,main.provera4x
	ld	a,(otkucano9)
	cp	%10
	jp	nz,main.provera4x
	jp	wino
;----(1,4,7)
main.provera4x:
	ld	a,(otkucano1)
	cp	%11
	jp 	nz,main.provera4o
	ld	a,(otkucano4)
	cp	%11
	jp	nz,main.provera4o
	ld	a,(otkucano7)
	cp	%11
	jp	nz,main.provera4o
	jp	winx
main.provera4o:
	ld	a,(otkucano1)
	cp	%10
	jp 	nz,main.provera5x
	ld	a,(otkucano4)
	cp	%10
	jp	nz,main.provera5x
	ld	a,(otkucano7)
	cp	%10
	jp	nz,main.provera5x
	jp	wino
;----(2,5,8)
main.provera5x:
	ld	a,(otkucano2)
	cp	%11
	jp 	nz,main.provera5o
	ld	a,(otkucano5)
	cp	%11
	jp	nz,main.provera5o
	ld	a,(otkucano8)
	cp	%11
	jp	nz,main.provera5o
	jp	winx
main.provera5o:
	ld	a,(otkucano2)
	cp	%10
	jp 	nz,main.provera6x
	ld	a,(otkucano5)
	cp	%10
	jp	nz,main.provera6x
	ld	a,(otkucano8)
	cp	%10
	jp	nz,main.provera6x
	jp	wino
;----(3,6,9)
main.provera6x:
	ld	a,(otkucano3)
	cp	%11
	jp 	nz,main.provera6o
	ld	a,(otkucano6)
	cp	%11
	jp	nz,main.provera6o
	ld	a,(otkucano9)
	cp	%11
	jp	nz,main.provera6o
	jp	winx
main.provera6o:
	ld	a,(otkucano3)
	cp	%10
	jp 	nz,main.provera7x
	ld	a,(otkucano6)
	cp	%10
	jp	nz,main.provera7x
	ld	a,(otkucano9)
	cp	%10
	jp	nz,main.provera7x
	jp	wino
;----(1,5,9)
main.provera7x:
	ld	a,(otkucano1)
	cp	%11
	jp 	nz,main.provera7o
	ld	a,(otkucano5)
	cp	%11
	jp	nz,main.provera7o
	ld	a,(otkucano9)
	cp	%11
	jp	nz,main.provera7o
	jp	winx
main.provera7o:
	ld	a,(otkucano1)
	cp	%10
	jp 	nz,main.provera8x
	ld	a,(otkucano5)
	cp	%10
	jp	nz,main.provera8x
	ld	a,(otkucano9)
	cp	%10
	jp	nz,main.provera8x
	jp	wino
;----(3,5,7)
main.provera8x:
	ld	a,(otkucano3)
	cp	%11
	jp 	nz,main.provera8o
	ld	a,(otkucano5)
	cp	%11
	jp	nz,main.provera8o
	ld	a,(otkucano7)
	cp	%11
	jp	nz,main.provera8o
	jp	winx
main.provera8o:
	ld	a,(otkucano3)
	cp	%10
	jp 	nz,main.unos
	ld	a,(otkucano5)
	cp	%10
	jp	nz,main.unos
	ld	a,(otkucano7)
	cp	%10
	jp	nz,main.unos
	jp	wino

;-------proverava da li je neko pobedio
	ld	a,(pobeda)
	cp	1		;gleda da li je postignuta pobeda
	jp	z,main.unos		;ako jeste, dozvoljava unos, da bi se izaslo sa 0	

main.unos:
;--------proverava prvu grupu tastera
	ld	bc,$f7fe
	in	d,(c)
	
	bit	0,d
	call	z,polje1
		
	bit	1,d
	call	z,polje2
	
	bit	2,d
	call	z,polje3
	
	bit	3,d
	call	z,polje4
	
	bit	4,d
	call	z,polje5

;---------proverava drugu grupu tastera
	ld	bc,$effe
	in	d,(c)
	
	bit	4,d
	call	z,polje6
	
	bit	3,d
	call	z,polje7
	
	bit	2,d
	call	z,polje8
	
	bit	1,d
	call	z,polje9
	
	bit	0,d
	ret	z
	
	jp main		;kraj main-a

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



nacrtaj_tablu:
;----------horizontalne linije
	LD	HL,22656	
	LD	A,%00000000	
	LD	B,15		
LOOP1:
	LD	(HL),A		
	INC	HL		
	DEC	B		
	JP	NZ,LOOP1	
				
	LD	HL,22848	
	LD	A,%00000000	
	LD	B,15		
LOOP2:
	LD	(HL),A		
	INC	HL		
	DEC	B		
	JP	NZ,LOOP2		
	
;----------vertikalne linije

	LD	HL,22532	
	LD	A,%01000000	
	LD	B,15		
	LD	DE,32		
LOOP3:
	LD	(HL),A		
	ADD	HL,DE		
	DEC	B		
	JP	NZ,LOOP3		
				
LD	HL,22538	
	LD	A,%01000000	
	LD	B,15		
	LD	DE,32		
LOOP4:
	LD	(HL),A		
	ADD	HL,DE		
	DEC	B		
	JP	NZ,LOOP4		
	ret
;--------------------
;--------------------

		

;Show sprite
winx:	;ako se postigne uslov za pobedu x
	ld	bc,30
	ld	hl,22544
	ld	de,sprx
	ld	a,(pobeda)	;u a ucitava vrednost pobede
	cp	1			;proverava da li je ona 1
	jp	z,main.unos	;ako jeste, idi na main.unos, to dozvoljava izlazak iz programa
	ld	a,1		
	ld	(pobeda),a	;setuje promenljivu pobeda na 1(true)
	jp 	iscrtaj

wino:	;ako se postigne uslov za pobedu o
	ld	bc,30
	ld	hl,22544
	ld	de,spro
	ld	a,(pobeda)
	cp	1
	jp	z,main.unos
	ld	a,1
	ld	(pobeda),a
	jp	iscrtaj
	

polje1:
	ld	bc,30		;offset
	ld	hl,22528
	;v-v-v-v ovo proverava da li je polje popunjeno
	ld	a,(otkucano1)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano1),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano1),a	;upisuje o
	jp	draw
	
polje2:
	ld	bc,30		;offset
	ld	hl,22534
	
	ld	a,(otkucano2)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano2),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano2),a	;upisuje o
	jp	draw
polje3:
	ld	bc,30		;offset
	ld	hl,22540
	
	ld	a,(otkucano3)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano3),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano3),a	;upisuje o
	jp	draw

	jp	draw
polje4:
	ld	bc,30		;offset
	ld	hl,22720
	
	ld	a,(otkucano4)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano4),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano4),a	;upisuje o
	jp	draw

	jp	draw
polje5:
	ld	bc,30		;offset
	ld	hl,22726
	
	ld	a,(otkucano5)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano5),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano5),a	;upisuje o
	jp	draw

polje6:
	ld	bc,30
	ld	hl,22732
	
	ld	a,(otkucano6)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano6),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano6),a	;upisuje o
	jp	draw
polje7:
	ld	bc,30		;offset
	ld	hl,22912
	
	ld	a,(otkucano7)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano7),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano7),a	;upisuje o
	jp	draw
polje8:
	ld	bc,30		;offset
	ld	hl,22918
	
	ld	a,(otkucano8)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano8),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano8),a	;upisuje o
	jp	draw
polje9:
	ld	bc,30		;offset
	ld	hl,22924
	
	ld	a,(otkucano9)
	bit	1,a
	ret	nz		;ako jeste ret, znaci vraca se u main
	
	ld	a,(pobeda)	;ovo sluzi da ako je postignuta pobeda
	cp	1			;ne dozvoli popunjavanje drugih polja
	ret	z			;dakle, igracu ostavlja samo da klikne 0 i izadje

	ld	a,%10		;u a ucitava vrednost za x
	ld	(otkucano9),a
	ld	a,(brojac)	;proverava da li je na redu x ili o
	bit	0,a		;ovo zapravo proverava
	jp	nz,draw		;ako jeste na redu x, ide na draw
	ld	a,%11		;u a ucitiva vrednost za o
	ld	(otkucano9),a	;upisuje o
	jp	draw


draw:
;promeni x u o
	ld	a,(brojac)
	inc	a
	ld	(brojac),a
	ld	de,sprx
	bit	0,a
	jp	nz,iscrtaj
	ld	de,spro
iscrtaj:
;---iscrtavanje
	ld	a,(de)		;a uzima vrednost (de)
	ld	(hl),a		;na adresu (hl), stavljamo boju a
	inc	hl
	inc	de
	ld	a,(de)
	ld	(hl),a
	inc	hl
	inc	de
	ld	a,(de)
	ld	(hl),a
	;--- 
	inc	de
	add	hl,bc
	ld	a,(de)
	ld	(hl),a
	inc	hl
	inc	de
	ld	a,(de)
	ld	(hl),a
	inc	hl
	inc	de
	ld	a,(de)
	ld	(hl),a
	;---
	inc	de
	add	hl,bc
	ld	a,(de)
	ld	(hl),a
	inc	hl
	inc	de
	ld	a,(de)
	ld	(hl),a
	inc	hl
	inc	de
	ld	a,(de)
	ld	(hl),a
	
	
	jp	main
	;ret
	
;brojac za promenu sprajtova svaki potez
brojac:
	db	0
	
;da li je polje popunjeno? 11-x|10-o|00-prazno
otkucano1:
	db	%00
otkucano2:
	db	%00
otkucano3:
	db	%00
otkucano4:
	db	%00
otkucano5:
	db	%00
otkucano6:
	db	%00
otkucano7:
	db	%00
otkucano8:
	db	%00
otkucano9:
	db	%00

;da li je postignuta pobeda, 1 ako jeste
pobeda:
	db	0


;definicija sprajtova
sprx:
	db	%00010000,%00111000,%00010000
	db	%00111000,%00010000,%00111000
	db 	%00010000,%00111000,%00010000
spro:
	db	%00001000,%00001000,%00001000
	db	%00001000,%00111000,%00001000
	db 	%00001000,%00001000,%00001000
	



