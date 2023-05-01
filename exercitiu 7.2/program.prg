set talk off
do while.t.
clear
text
1 - adaugare
2 - listare
3 - listare primele X inregistrari
4 - stergere dupa nume
5 - marcare pt stergere dupa nume
6 - revalidare
7- confirma stergerea
8- acordare bursa studenti cu media peste 9
9 - marire bursa pt sudentii care au media 10 cu X%
0 - inchidere
endtext
wait to r
if.not.r$'1234567890'
?'functia '+r+'inexistenta'
wait
loop
endif
do case
case r='1'
use tabelstudent
append
wait

case r='2'
use tabelstudent
list

case r='3'
use tabelstudent
x=accept('valoarea lui x=')
?x
x=val(x)
go 1
disp next x

case r='4'
use tabelstudent
vnume=accept('introduceti un nume')
vnume=trim(vnume)
locate for nume=vnume
if eof()
?'studentul cu numele'+vnume+'nu exista'
wait
loop
endif
delete  

case r='5'
use tabelstudent
vnume=accept('introduceti un nume')
vnume=trim(vnume)
delete for nume=vnume


case r='6'
use tabelstudent
n=val(accept('nr revalidare='))
recall record n


case r='7'


case r='8'
use tabelstudent
go 1
do while.not.eof()
if media>9
 repl bursa with 1
endif
skip
enddo
use
return

case r='9'
use tabelstudent
x=val(accept('cu cat la suta'))
go 1
do while.not.eof()
if media=10
 repl bursa with bursa*x/100
endif
skip
enddo
use
return


case r='0'
use 
return 
endcase
enddo
