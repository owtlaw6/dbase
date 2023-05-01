set talk off
DO WHILE.T. && repeta la infinit ciclul
CLEAR
TEXT
FUNCTII OFERITE:
1. adaugare
2. afisare n produse (n = 0 afisare totala)
3. crestere pret produs cu X%
4. stergere produsele expirate
5. afisare nr produse pt pret > X
6. reducere de pret pt produsele ce expira in 30 zile
0. Inchidere
ENDTEXT
WAIT TO R
IF.NOT. R $ '1234560' && verificare functie admisa
? 'FUNCTIA ' + R + ' inexistenta'
WAIT && asteptare pentru citire mesaj
LOOP && reluare ciclu
ENDIF

DO CASE
CASE R='1'
SET TALK OFF
USE Produs.dbf && deschide fisierul
R1 ='D' && forteaza executia primului ciclu
DO WHILE UPPER (R1)='D' && reia ciclu daca s-a raspus D
&&CLEAR && sterge ecranul
? 'Procedura de adaugare inregistrari '
VCODP = TRIM(ACCEPT('COD produs: '))
VNUME = TRIM(ACCEPT('Nume produs: ')) && asteptare nume student
VDATA = CTOD(ACCEPT('Data de expirare: '))
VPRET = VAL(ACCEPT('Pret: '))
APPEND BLANK && adauga inregistrare alba
* Valorile din variabile vor modifica cimpurile inregistrarii
REPL CodP WITH VCODP, Denumire WITH VNUME, dataExpirare WITH VDATA, Pret WITH VPRET
? 'CONTINUATI (D/N)'
WAIT TO R1 && asteapta confirmarea continuarii ciclului
ENDDO && reluare ciclu daca s-a raspuns `D`

CASE R='2'
USE Produs.dbf
n = val(ACCEPT('Numar produse pt afisare: ')) 
if n > 0 
disp next n
endif
if n == 0 
list
endif
wait

CASE R='3'
USE Produs.dbf
? 'Tabel inainte de modificare: '
list
use
use Produs.dbf
VNUME = TRIM(ACCEPT('Denumire produs pt modificare pret: ')) 
LOCATE FOR Denumire = VNUME
x = VAL(ACCEPT('Procent: '))
VPRET=Pret*(x+100)/100
repl Pret with VPRET
? 'Tabel dupa modificare: '
list
wait

CASE R='4'
use produs.dbf
? 'Tabelul inainte de modificare: '
list
use
set exclusive on
USE Produs.dbf
set delete off

DO WHILE NOT EOF()
if year(Date())-year(DataExpirare) > 0
   delete next 1
endif
if year(Date())-year(DataExpirare) == 0
  if month(Date())-month(DataExpirare) > 0
    delete next 1
  endif
  if month(Date())-month(DataExpirare) == 0
    if day(Date())-day(DataExpirare) >= 0
	   delete next 1
	 endif
  endif
endif
skip
enddo
PACK
? 'Tabelul dupa modificare: '
LIST && listare noul fisier
wait

CASE R='5'
USE Produs.dbf
VPRET = VAL(ACCEPT('Pret: '))
COUNT FOR Pret > VPRET TO counter
?counter + ' produse au pretul mai mare decat ' + VPRET
wait

CASE R='6'
USE Produs.dbf
? 'Tabel inainte de modificare: '
list
use
use Produs.dbf
x = VAL(ACCEPT('Procent: '))
DO WHILE NOT EOF()
if DataExpirare-Date() <= 30
	 VPRET=Pret*(100-x)/100
    REPL Pret WITH VPRET
endif
skip
enddo
? 'Tabel dupa modificare: '
list
wait

CASE R = '0'
USE
RETURN && terminare program
ENDCASE
ENDDO && reluare ciclu


