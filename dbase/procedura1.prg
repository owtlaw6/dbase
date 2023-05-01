Procedure Form_OnOpen
Set Talk off
Set Date to DMY
Clear
Use Stud in 1 Index Inume
Use Masini in 2 Index INrm alias MS
Set Relation to NRM Into MS
Defi Form F2 Prop width 40, Text " Masini",left 50
F2.OnClose ={;f2.release()}
Defi TEXT Tip of F2 Prop Text 'Tip masina ',left 3, top 3,width 15
Defi TEXT AnFabr of F2 Prop Text 'An fabricatie ',left 3, top 5,width 15
Defi TEXT Putere of F2 Prop Text 'Putere ',left 3, top 7,width 15
101
Defi TEXT Numar of F2 Prop Text 'Numar masina ',left 3, top 9,width 15
Defi EntryField Etip of F2 Prop left 20, top 3, width 15, DataLink 'MS->TIP'
Defi EntryField EAnf of F2 Prop left 20, top 5, width 15, DataLink 'MS->An_F'
Defi EntryField Etip1 of F2 Prop left 20, top 7, width 15, DataLink 'MS->Putere'
Defi EntryField Enrm of F2 Prop left 20, top 9, width 15, DataLink 'MS->Nrm'
F2.Open()
Return