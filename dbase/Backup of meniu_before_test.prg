set talk off
DO WHILE.T. && repeta la infinit ciclul
CLEAR
TEXT
FUNCTII OFERITE:

1 - adaugare
2 - listare
3 - listare primele X inregistrari
4 - marcare pt stergere dupa nume
5 - revalidare
6 - confirma stergerea
7 - acordare bursa studenti cu media peste 9
8 - marire bursa pt sudentii care au media 10 cu X%
0 - inchidere
ENDTEXT
WAIT TO R
IF.NOT. R $ '123456780' && verificare functie admisa
? 'FUNCTIA ' + R + ' inexistenta'
WAIT && asteptare pentru citire mesaj
LOOP && reluare ciclu
ENDIF

DO CASE
CASE R='1'
SET TALK OFF
USE Student.dbf && deschide fisierul
R1 ='D' && forteaza executia primului ciclu
DO WHILE UPPER (R1)='D' && reia ciclu daca s-a raspus D
CLEAR && sterge ecranul
? 'Procedura de adaugare inregistrari '
VCODS =TRIM(ACCEPT('COD student (fac,sectie,an,gr.,nr.) '))
VNUME= TRIM(ACCEPT('Nume student: ')) && asteptare nume student
VMEDIE=VAL( ACCEPT('Medie: '))
VBURSA=VAL(ACCEPT('BURSA: '))
APPEND BLANK && adauga inregistrare alba
* Valorile din variabile vor modifica cimpurile inregistrarii
REPL Cods WITH VCODS, Nume WITH VNUME, Media WITH VMEDIE, Bursa WITH VBURSA
? 'CONTINUATI (D/N)'
WAIT TO R1 && asteapta confirmarea continuarii ciclului
ENDDO && reluare ciclu daca s-a raspuns `D`

CASE R='2'
USE Student
set delete on
&&do while .not.eof()
&&if BURSA>=0
&&CLEAR
&&? 'Cods: ' + Cods
&&? 'Nume student :' + Nume
&&? 'Media :' +STR(Media,9)
&&? 'Bursa :'+STR(BURSA,9,2) && conversie numeric in sir
&&endif
&&wait
&&skip
&&enddo
list
wait

CASE R='3'
USE Student.dbf
x= val(ACCEPT('Numar studenti pt afisare: ')) 
if x > 0 
disp next x
endif
if x == 0 list
wait

CASE R='4'
USE Student.dbf
VNUME= TRIM(ACCEPT('Nume student pt stergere: ')) 
LOCATE FOR Nume = VNume
delete next 1

CASE R='5'
USE Student.dbf
set delete off
RECALL all
set delete on
&&CASE R $ 'Tt'

CASE R='6'
set exclusive on
USE Student.dbf
set delete off
? ' Se elimina inregistrarile marcate pentru stergere'
PACK
WAIT
? ' Noul fisier este:'
LIST && listare noul fisier

CASE R='7'
USE Student.dbf
set delete on
do while .not.eof()
if Media>=9 and Bursa <= 0
CLEAR
VBURSA=VAL(ACCEPT('BURSA Noua: '))
repl BURSA with vbursa
endif
skip
enddo
wait

CASE R='8'
USE Student.dbf
set delete on
x=VAL(ACCEPT('Procent: '))
do while .not.eof()
if Media>=10
CLEAR
VBURSA=BURSA * (X+100)/100
repl BURSA with vbursa
endif
skip
enddo
wait

CASE R = '0'
USE
RETURN && terminare program
ENDCASE
ENDDO && reluare ciclu
