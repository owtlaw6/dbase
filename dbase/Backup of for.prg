Set Talk off
K1=VAL(accept('Introduceti K1')) && conversie valoare introdusa
K2=VAL(accept('Introduceti K2'))
T=VAL(accept('Introduceti pasul')) && pasul
S=0
FOR k=k1 TO k2 STEP t
S=S+K
NEXT k && se mareste variabila k cu pasul t
? 'Suma numerelor de la ', k1, 'la ', k2, 'cu pasul ', t, ' este: ', S
Return