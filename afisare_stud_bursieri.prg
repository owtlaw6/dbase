SET TALK OFF
 USE STUD
SET DATE TO DMY && data sub forma zz/ll/aa
SCAN FOR BURSA>0 && secventa se executa numai pentru bursieri.
CLEAR
? 'Nume student :' + NUME
? 'Adresa:' + ADRESA
? 'Data nasterii :' + DTOC(DATA_N) && conversie data în sir
?? '(', DAY(DATA_N), CMONTH(DATA_N), YEAR(DATA_N),'-', CDOW(DATA_N),')'
? 'Bursa :'+STR(BURSA,9,2) && conversie numeric în sir
? 'casatorit :', CAS && tip logic
WAIT && asteptare
ENDSCAN && trece la inregistrarea urmatoare si reia ciclu
USE && inchide fisier
RETURN && sfirsit program