SET TALK OFF
DO WHILE.T. 
CLEAR
TEXT
FUNCTII OFERITE:
1 - Adaugare student
2 - Listare studenti
3 - Listare primele X inregistrari 
4 - Stergere dupa nume
5 - Marcare pt stergere dupa nume 
6 - Revalidare 
7 - Confirma stergerea
8 - Acordare bursa studenti cu media peste 9 
9 - Marire bursa pt sudentii care au media 10 cu X% 
0 - Inchidere
ENDTEXT


WAIT TO R
IF.NOT.R$'1234567890' 
?'FUNCTIA ' + R + 'inexistenta'
WAIT 
LOOP 
ENDIF


DO CASE

	CASE R='1'
   	USE STUDENTI
      APPEND
      WAIT

   CASE R='2'                                                                      
		USE STUDENTI                                                                 
		LIST

   CASE R='3'
      USE STUDENTI
      x = accept('x = ')
      ?x
      x = val(x)
      go 1
      disp next x


   CASE R='4'
     USE STUDENTI
      USE STUD
		VNUME=TRIM( ACCEPT('Numele studentului: '))
		LOCATE FOR NUME = VNUME  
      IF EOF()
			? 'Studentul cu numele ' + VNUME + ' nu exista'
			WAIT
			LOOP
		ENDIF
		DELETE
      PACK

   CASE R='5'
      USE STUDENTI
      USE STUD
		VNUME=TRIM( ACCEPT('Numele studentului: '))
		LOCATE FOR NUME = VNUME  
      IF EOF()
			? 'Studentul cu numele ' + VNUME + ' nu exista'
			WAIT
			LOOP
		ENDIF
		DELETE FOR NUME = VNUME

   CASE R='6'
     	USE STUDENTI
      USE STUD
		VNUME=TRIM( ACCEPT('Numele studentului: '))
		LOCATE FOR NUME = VNUME  
      IF EOF()
			? 'Studentul cu numele ' + VNUME + ' nu exista'
			WAIT
			LOOP
		ENDIF
		RECALL

   CASE R='7'
      USE STUDENTI
		?'Se elimina inregistrarile marcate pentru stergere'
		PACK

   CASE R='8'
       USE STUDENTI
       x = accept ('Valoare bursa: ')
       ?x
       x = val(x)
       GO 1
       DO WHILE.NOT.EOF()
       IF MEDIE > 9
       	REPL BURSA WITH x
       ENDIF
       SKIP
       ENDDO



   CASE R='9'
      USE STUDENTI
       x = accept ('Valoare procent: ')
       ?x
       x = val(x)
       GO 1
       DO WHILE.NOT.EOF()
       IF MEDIE = 10
       	REPL BURSA WITH bursa * x / 100
       ENDIF
       SKIP
       ENDDO


   CASE R='0'
       USE
       RETURN
ENDCASE
ENDDO

