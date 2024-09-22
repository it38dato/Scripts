@Echo Off
:: ~Параметры соединения
Set server=tipftp
Set user=tuser
Set pass=tpassword
:: ~Что и куда копируем
:: SET $SRC=/Backups/tdir/*.xml
SET src=/Backups/tdir
SET dst=\\tdomain.ru\tdir\
:: Формат текущей даты
SET dd=%date:~0,2%
SET mm=%date:~3,2%
SET yyyy=%date:~6,4%
SET curdate=%dd%_%mm%_%yyyy%
:: ~Временные файлы
::Set $FFtp=%~dpn0.cfg
:: Готовим CFG-файл
Echo open %server%>tempfile.txt
Echo %user%>>tempfile.txt
Echo %pass%>>tempfile.txt
Echo lcd %dst%>>tempfile.txt
Echo cd %src%>>tempfile.txt
:: Echo mget *.* | Y>>tempfile.txt
Echo bye>>tempfile.txt
:: Выполняем команду
FTP -s:tempfile.txt
:: Добавим в архив скопированные файлы
"C:\Program Files\7-Zip\7z.exe" a -tzip \\tdomain.ru\tdir\Test_%curdate%.zip \\tdomain.ru\tdir\*.xml
:: Удалим лишние файлы
del \\tdomain.ru\tdir\*.txt
rem exit
pause