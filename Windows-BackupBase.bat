@ echo on
SET ISC_USER=YOUR-USERNAME
SET ISC_PASSWORD=YOUR-PASSWORD
SET dbpath=YOUR-HOST:C:\YOUR-DIR3\ВНЕШНЯЯБАЗА1.GDB
SET fbpath=C:\YOUR-DIR2\Firebird_1_5\bin\
SET bbpath=C:\YOUR-DIR1\
"%fbpath%gfix" -shut -force 5 "%dbpath%"
"%fbpath%gbak" -b -v -g -y "%bbpath%%date%.log" "%dbpath%" "%bbpath%ВНЕШНЯЯБАЗА1_%date%.gbk"
@ pause
