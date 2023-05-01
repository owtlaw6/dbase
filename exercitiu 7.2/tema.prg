SET TALK OFF
DO WHILE.T. && repeta la infinit ciclul
CLEAR
TEXT
FUNCTII OFERITE:
1- Adaugare inregistrari
2- Listare fisier
3- Listare primele X inregistrari
4- Marcare pentru stergere inreg. data prin NUME Studentent.
5- Revalidare (revalidare la marcat pentru stergere)
6- Confirma stergerea
7- Acordare bursa Studententi cu media peste 9 (bursa data de la tastatura)
8- Marire bursa pt sudentii care au media 10 cu X% (x dat de la tastatura)
0- Terminare program
ENDTEXT
WAIT TO R
IF.NOT.R$'123456780' && verificare functie admisa
? 'FUNCTIA ' + R + ' inexistenta'
WAIT && asteptare pentru citire mesaj
LOOP && reluare ciclu
ENDIF

DO CASE
CASE R='1'
USE Student
APPEND && adaugare inregistrari de la tastatura
CASE R='2'
USE Student
LIST 
CASE R='3'
USE Student && deschidere fisier
N=VAL(ACCEPT('X: ')   )
FOR K=1 TO N STEP 1
DISP 
NEXT K
CASE R = '4'
USE Student
VNUME=TRIM( ACCEPT('Numele Studententului: ')                )
LOCATE FOR Nume = VNUME && cauta inregistrarea IF EOF()
EDIT && editare inregistrare gasita
CASE R='5'
USE Student
N=VAL(ACCEPT( 'Nr. articol ce se revalideaza: '))
RECALL RECORD N
CASE R='6'
CONF= TRIM( ACCEPT('Confirmati? (D/N): '))
VNUME=TRIM( ACCEPT('Numele Studententului: ')    )     
IF CONF='D' 
LOCATE FOR Nume = VNUME
DELETE
ENDIF
CASE R='7'

USE Student
EDIT Bursa FOR Media>9 && cauta inregistrarea IF EOF()

CASE R='8'
x=VAL(accept('Introduceti X%'))
REPL ALL BURSA WITH BURSA * ((100+x)/100)
CASE R = '0'
USE
RETURN && terminare program
ENDCASE
ENDDO && reluare ciclu
