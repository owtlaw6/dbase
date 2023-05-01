SET TALK OFF

DO WHILE.t.
clear

TEXT
   Functii:
   0.Iesire
   1.Adaugare masini
   2.Listare primele n masini
   3.Afisare numar masini care au mai mult de 5 locuri
   4.Crestere pret cu x% pentru masinile cu 2 locuri
   5.Reducere pret cu 10% pentru masinile mai vechi de 24 de luni
ENDTEXT

WAIT TO optiune
IF.NOT.optiune $'012345'
?'Optiunea introdusa nu exista!'
WAIT
LOOP
endif

DO CASE
CASE optiune='0'
	use 
	RETURN

CASE optiune='1'
	use masini
   APPEND
	WAIT

CASE optiune='2'
	use masini
   n=accept('n = ')
   if n=0
   	LIST
   else
   	DISP FOR RECNO() <=n
   endif
   WAIT

CASE optiune='3'
	use masini
   COUNT FOR NrLocuri>5 TO contor
   ?contor + ' masini au mai mult de 5 locuri.'
   WAIT

CASE optiune='4'
	use masini
   x=accept('x = ')
	x=val(x)
   REPLACE Pret WITH Pret+Pret*(x/100) FOR NrLocuri=2
    
CASE optiune='5'
	use masini
	?'Tabelul inainte de modificare:'
	list
	use
	use masini
	DO WHILE NOT EOF()
     if year(Date())-year(Data)>2
      	REPLACE Pret WITH Pret-Pret*0.1 
		endif
      if year(Date())-year(Data)=2 
			if month(Date())-month(Data)>0
				REPLACE Pret WITH Pret-Pret*0.1
			endif
				if month(Date())-month(Data)=0 and day(Date())-day(Data)>=0
					REPLACE Pret WITH Pret-Pret*0.1
				endif
      endif
	SKIP
	ENDDO
	?'Tabelul dupa modificare:'
	list
	WAIT
ENDCASE
ENDDO
