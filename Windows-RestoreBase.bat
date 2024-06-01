@ echo on
SET ISC_USER=ИМЯПОЛЬЗОВАТЕЛЯБАЗЫ
SET ISC_PASSWORD=ПАРОЛЬКБАЗЕ
SET fbpath=C:\ПУТЬFIREBIRD\Firebird_1_5\bin\
SET bbpath=localhost:C:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\
"%fbpath%gbak.exe" -c -v -r -y "c:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\%date%_fix.log" "c:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\ВНЕШНЯЯБАЗА1_backup.gbk" "%bbpath%ВНЕШНЯЯБАЗА1_fix.GDB"
@ pause