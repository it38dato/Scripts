# Написание скриптов
<p>
    # Администрирование локальных, виртуальных и облачных серверов.<br>
    # Администрирование базы данных.<br>
    # Написание скриптов для бэкап файлов.<br>
    <strong>Task:</strong><br>
    Администрирование локальных, виртуальных и облачных серверов. Ошибка после ввода пароля в программе у всех пользователей - "Не отвечает программа"<br>
    ВНЕШНЯЯБАЗА2.exe не работает<br>
    На одном из объектов автоматизации второй раз за месяц происходит процесс переполнения внешней базы документооборота C:\ПУТЬКБАЗЕ\ВНЕШНЯЯБАЗА1.GDB. База данных увеличивается в размерах с 1.8 Гб до 115Гб за три дня. После проведения инженером филиала процедуры Бэкап/Рестор внешняя база возвращается к прежнему размеру. Данная проблема наблюдается второй раз за месяц с периодичностью в две недели.<br>
    <strong>Decision:</strong><br>
    Отключить службы Firebird, Сделать backup/restore базы ВНЕШНЯЯБАЗА1.GDB, запустив скрипты&nbsp;<br>
    1. backup.bat<br>
    2. restore.bat<br>
    после чего сохранится файл ВНЕШНЯЯБАЗА1.GDB в КУДАСОХРАНЯТЬИЗМЕНЕНИЯ. Файл заменить на файл в сервере, который занимал 120 гб. Посмотреть лог файлы:<br>
    1. retranslator.log<br>
    2. retranslator_2022-01-11_15-23-40-694.log<br>
    3. retranslator_2022-01-24_16-36-09-627.log<br>
    4. retranslator_2022-01-24_16-36-16-806.log<br>
    <strong>Decision:</strong><br>
    $ cat backup.bat<br>
    @ echo on<br>
    SET ISC_USER=ИМЯПОЛЬЗОВАТЕЛЯБАЗЫ<br>
    SET ISC_PASSWORD=ПАРОЛЬКБАЗЕ<br>
    SET dbpath=localhost:C:\ПУТЬКБАЗЕ\ВНЕШНЯЯБАЗА1.GDB<br>
    SET fbpath=C:\ПУТЬFIREBIRD\Firebird_1_5\bin\<br>
    SET bbpath=C:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\<br>
    "%fbpath%gfix" -shut -force 5 "%dbpath%"<br>
    "%fbpath%gbak" -b -v -g -y "%bbpath%%date%.log" "%dbpath%" "%bbpath%ВНЕШНЯЯБАЗА1_%date%.gbk"<br>
    @ pause<br>
    $ cat restore.bat<br>
    @ echo on<br>
    SET ISC_USER=ИМЯПОЛЬЗОВАТЕЛЯБАЗЫ<br>
    SET ISC_PASSWORD=ПАРОЛЬКБАЗЕ<br>
    SET fbpath=C:\ПУТЬFIREBIRD\Firebird_1_5\bin\<br>
    SET bbpath=localhost:C:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\<br>
    "%fbpath%gbak.exe" -c -v -r -y "c:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\%date%_fix.log" "c:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\ВНЕШНЯЯБАЗА1_backup.gbk" "%bbpath%ВНЕШНЯЯБАЗА1_fix.GDB"&nbsp;<br>
    @ pause<br>
    $ cat retranslator.log<br>
    ...<br>
    INF|09.12.2022 16:27:36 Сообщения в очереди "viv.client.КОДОА.1" отсутствуют<br>
    INF|09.12.2022 16:32:39 Отправка запроса id="ИДЕНТИФИКАТОРПРОЦЕССА1", type_id=ИДЕНТИФИКАТОРТИП ...<br>
    ERR|09.12.2022 16:33:37 Out of memory.<br>
    &nbsp;&nbsp;&nbsp; E.ClassName=EOutOfMemory<br>
    &nbsp;&nbsp;&nbsp; Sender.ClassName=TWorkThread<br>
    ...<br>
    INF|11.12.2022 22:28:27 Отправка запроса id="ИДЕНТИФИКАТОРПРОЦЕССА2", type_id=ИДЕНТИФИКАТОРТИП ...<br>
    ERR|11.12.2022 22:28:53 При отправке запроса id="ИДЕНТИФИКАТОРПРОЦЕССА2" произошла неустранимая ошибка чтения из БД, запрос отклонён. Текст ошибки:<br>
    &nbsp;&nbsp;&nbsp; Unsuccessful execution caused by a system error that precludes<br>
    &nbsp;&nbsp;&nbsp; successful execution of subsequent statements.<br>
    &nbsp;&nbsp;&nbsp; I/O error for file "C:\ПУТЬКБАЗЕ\ВНЕШНЯЯБАЗА1.GDB".<br>
    &nbsp;&nbsp;&nbsp; Error while trying to write to file.<br>
    &nbsp;&nbsp;&nbsp; Недостаточно места на диске.<br>
    ...<br>
    <strong>Decision:</strong><br>
    при обработке одного запроса id="ИДЕНТИФИКАТОРПРОЦЕССА1", type_id=ИДЕНТИФИКАТОРТИП происходит нехватка памяти, что далее приводит к сбою функционирования. Вероятно в запросе большое вложение. Для дальнейшего анализа смотрим БД ВНЕШНЯЯБАЗА2.gdb, в которой покажет технические ошибки состояния базы ВНЕШНЯЯБАЗА2.gdb.<br>
    Для их устранения также сделать бэкап/ресторе БД ВНЕШНЯЯБАЗА2.gdb. Далее понаблюдать за ситуацией с размером БД ВНЕШНЯЯБАЗА2.GDB, чтобы он весил не больше 19 Гб.<br>
    <strong>Task:</strong><br>Администрирование базы данных. После отключения света в здании служба OracleServiceНАЗВАНИЕСИСТЕМЫ не запускается. При подключении к БСР клиента на сервере выходит следующая ошибка:<br>ОШИБКА ORA-01033. ORACLE INITIALIZATION OR SHUTDOWN IN PROGRESS<br>Не помогает перезапуск службы ORACLE и перезагрузка сервера.<br>Также пробовали подключиться и настроить базу в командной строке через sql plus. После ввода команды выдает ошибку:<br>C:\&gt;sqlplus<br>Enter user-name: СОКРАЩЕННОЕОЕИМЯПОЛЬЗОВАТЕЛЯ as ПОЛНОЕИМЯПОЛЬЗОВАТЕЛЯ<br>SQL&gt; alter pluggable database all open;<br>alter pluggable database all open<br>*<br>ERROR at line 1:<br>ORA-00940: invalid ALTER command<br>Нужно сделать рестарт базы<br><strong>Decision:</strong><br>C:\&gt;sqlplus /nolog<br>SQL&gt; connect СОКРАЩЕННОЕОЕИМЯПОЛЬЗОВАТЕЛЯ/pass@НАЗВАНИЕСИСТЕМЫ as ПОЛНОЕИМЯПОЛЬЗОВАТЕЛЯ<br>ERROR:<br>ORA-01017: invalid username/password; logon denied<br>SQL&gt; conn СОКРАЩЕННОЕОЕИМЯПОЛЬЗОВАТЕЛЯ/oracle@НАЗВАНИЕСИСТЕМЫ as ПОЛНОЕИМЯПОЛЬЗОВАТЕЛЯ<br>SQL&gt; startup mount<br>ORA-01081: cannot start already-running ORACLE - shut it down first<br>SQL&gt; shutdown immediate<br>ORA-01109: database not open<br>Database dismounted.<br>ORACLE instance shut down.<br>SQL&gt; startup mount<br>SQL&gt; col file format a5;<br>SQL&gt; col name format a20;<br>SQL&gt; col status format a10;<br>SQL&gt; select file#,name,status from v$datafile;<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>   1 C:\ORACLE\ORADATA\GA SYSTEM<br> S\SYSTEM01.DBF<br>   2 C:\ORACLE\ORADATA\GA ONLINE<br> S\UNDOTBS01.DBF<br>   3 C:\ORACLE\ORADATA\GA ONLINE<br> S\CWMLITE01.DBF<br>   4 C:\ORACLE\ORADATA\GA ONLINE<br> S\DRSYS01.DBF<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>   5 C:\ORACLE\ORADATA\GA ONLINE<br> S\EXAMPLE01.DBF<br>   6 C:\ORACLE\ORADATA\GA ONLINE<br> S\INDX01.DBF<br>   7 C:\ORACLE\ORADATA\GA ONLINE<br> S\ODM01.DBF<br>   8 C:\ORACLE\ORADATA\GA ONLINE<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br> S\TOOLS01.DBF<br>   9 C:\ORACLE\ORADATA\GA ONLINE<br> S\USERS01.DBF<br>  10 C:\ORACLE\ORADATA\GA ONLINE<br> S\XDB01.DBF<br>  11 C:\ORACLE\ORADATA\GA ONLINE<br> S\TBLS_BSR.ORA<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>  12 C:\ORACLE\ORADATA\GA ONLINE<br> S\DELO_D.DAT<br>  13 C:\ORACLE\ORADATA\GA ONLINE<br> S\DELO_I.DAT<br>  14 C:\ORACLE\ORADATA\GA ONLINE<br> S\DELO_O.DAT<br>  15 C:\ORACLE\ORADATA\GA ONLINE<br> S\KADR_D.DAT<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>  16 C:\ORACLE\ORADATA\GA ONLINE<br> S\KADR_I.DAT<br>  17 C:\ORACLE\ORADATA\GA ONLINE<br> S\KADR_O.DAT<br>  18 C:\ORACLE\ORADATA\GA ONLINE<br> S\ARCH_D.DAT<br>  19 C:\ORACLE\ORADATA\GA ONLINE<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br> S\ARCH_I.DAT<br>  20 C:\ORACLE\ORADATA\GA ONLINE<br> S\EDS_D.DAT<br>  21 C:\ORACLE\ORADATA\GA ONLINE<br> S\EDS_I.DAT<br>  22 C:\ORACLE\ORADATA\GA ONLINE<br> S\EDS_O.DAT<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>  23 C:\ORACLE\ORADATA\GA ONLINE<br> S\.ORA<br>  24 C:\ORACLE\ORADATA\GA SYSTEM<br> S\SYSTEM02.ORA<br>  25 C:\ORACLE\ORADATA\GA SYSTEM<br> S\SYSTEM03.ORA<br>25 rows selected.<br>SQL&gt; recover datafile 1;<br>SQL&gt; select file#,name,status from v$datafile;<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>   1 C:\ORACLE\ORADATA\GA SYSTEM<br> S\SYSTEM01.DBF<br>   2 C:\ORACLE\ORADATA\GA ONLINE<br> S\UNDOTBS01.DBF<br>   3 C:\ORACLE\ORADATA\GA ONLINE<br> S\CWMLITE01.DBF<br>   4 C:\ORACLE\ORADATA\GA ONLINE<br> S\DRSYS01.DBF<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>   5 C:\ORACLE\ORADATA\GA ONLINE<br> S\EXAMPLE01.DBF<br>   6 C:\ORACLE\ORADATA\GA ONLINE<br> S\INDX01.DBF<br>   7 C:\ORACLE\ORADATA\GA ONLINE<br> S\ODM01.DBF<br>   8 C:\ORACLE\ORADATA\GA ONLINE<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br> S\TOOLS01.DBF<br>   9 C:\ORACLE\ORADATA\GA ONLINE<br> S\USERS01.DBF<br>  10 C:\ORACLE\ORADATA\GA ONLINE<br> S\XDB01.DBF<br>  11 C:\ORACLE\ORADATA\GA ONLINE<br> S\TBLS_BSR.ORA<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>  12 C:\ORACLE\ORADATA\GA ONLINE<br> S\DELO_D.DAT<br>  13 C:\ORACLE\ORADATA\GA ONLINE<br> S\DELO_I.DAT<br>  14 C:\ORACLE\ORADATA\GA ONLINE<br> S\DELO_O.DAT<br>  15 C:\ORACLE\ORADATA\GA ONLINE<br> S\KADR_D.DAT<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>  16 C:\ORACLE\ORADATA\GA ONLINE<br> S\KADR_I.DAT<br>  17 C:\ORACLE\ORADATA\GA ONLINE<br> S\KADR_O.DAT<br>  18 C:\ORACLE\ORADATA\GA ONLINE<br> S\ARCH_D.DAT<br>  19 C:\ORACLE\ORADATA\GA ONLINE<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br> S\ARCH_I.DAT<br>  20 C:\ORACLE\ORADATA\GA ONLINE<br> S\EDS_D.DAT<br>  21 C:\ORACLE\ORADATA\GA ONLINE<br> S\EDS_I.DAT<br>  22 C:\ORACLE\ORADATA\GA ONLINE<br> S\EDS_O.DAT<br> FILE# NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS<br>---------- -------------------- ----------<br>  23 C:\ORACLE\ORADATA\GA ONLINE<br> S\.ORA<br>  24 C:\ORACLE\ORADATA\GA SYSTEM<br> S\SYSTEM02.ORA<br>  25 C:\ORACLE\ORADATA\GA SYSTEM<br> S\SYSTEM03.ORA<br>25 rows selected.<br>SQL&gt; alter database open;<br><strong>Task:</strong><br>Администрирование базы данных. В ПОДСИСТЕМА не грузятся на сайт 200 дел. Смотрим лог файл:<br>$ cat importer.log.xml<br>...<br>&lt;Error ReadableDateTime="23.01.2023 12:51:31" FileTimeUtc="133189230912753002"&gt;<br>&lt;Message&gt;Îøèáêà ïðè âûïîëíåíèè çàïðîñà:<br>BEGIN BSR.PK_BSR.CTX_Sinxronize; END;<br>Òåêñò îøèáêè:<br>ORA-20000: Oracle Text error:<br>DRG-50857: oracle error in dreii0fsh<br>ORA-01653: unable to extend table BSR.DR$CTX_SRH$I by 8192 in tablespace SYSTEM<br>ORA-06512: at "CTXSYS.DRUE", line 157<br>ORA-06512: at "CTXSYS.CTX_DDL", line 1328<br>ORA-06512: at "BSR.PK_BSR", line 313<br>ORA-06512: at line 1<br>&lt;/Message&gt;<br>&lt;Details&gt;System.Exception: Îøèáêà ïðè âûïîëíåíèè çàïðîñà:<br>BEGIN BSR.PK_BSR.CTX_Sinxronize; END;<br>Òåêñò îøèáêè:<br>ORA-20000: Oracle Text error:<br>DRG-50857: oracle error in dreii0fsh<br>ORA-01653: unable to extend table BSR.DR$CTX_SRH$I by 8192 in tablespace SYSTEM<br>ORA-06512: at "CTXSYS.DRUE", line 157<br>ORA-06512: at "CTXSYS.CTX_DDL", line 1328<br>ORA-06512: at "BSR.PK_BSR", line 313<br>ORA-06512: at line 1<br>&#xD;<br> â ImpFunktions.Database.DbaseIns(String cmdString)&#xD;<br> â ImpFunktions.Importer.synchronize()&lt;/Details&gt;<br>&lt;/Error&gt;<br>пуск - все программы - oracle orahome92 - enterprize manager console - ок - databases - gas -  system - oracle - storage - tablespaces<br>Проблема из за того, что у Вас закончилось свободное оракловое ТП SYSTEM и Tbls_bsr, которые надо увеличить вручную путем добавления DATA файла. "Флаг" в чек боксе Авторасширение не поможет.<br><strong>Decision:</strong><br>Обязательно делайте бэкап перед любыми действиями с базой. Дважды щелкните ЛКМ табличное пространство SYSTEM и добавьте в него второй файл. Oracle автоматически подставит расширение ORA. Исправьте его на DBF перед сохранением. <br>system - add datafile - name - SYSTEM04.ORA - file size - 4096MB - storage - automatically extend datafile when full - increment - 10240KB - value - 32767MB - ok - перезапустить службу BSRImport - В админке обновлять авоматический импорт из СДП<br><strong>Task:</strong><br>Администрирование базы данных. Можно сделать это в командной строке, добавив дополнительный файл данных к табличному пространству и изменив размер текущего файла данных, Некоторые версии Oracle не позволяют такого!<br><strong>Decision:</strong><br>ALTER TABLESPACE USERS ADD DATAFILE '/u01/oradata/orcl/users02.dbf' size 25m;<br>ALTER DATABASE DATAFILE '/u01/oradata/orcl/users01.dbf' resize 50M;<br>Необходимо добавить новый датафайл к табличному пространству SYSTEM.<br><strong>Task:</strong><br>Написание скриптов для бэкап файлов. Написать скрипт, который копирует файлы с ftp://tipftp/Backups/tdir/MRBTS* в сетевую папку \\tdomain.ru\tdir каждую неделю ночью.<br><strong>Decision:</strong><br>PS C:\Users\tuser\Documents\scripts&gt; vim mrbtsbackup.bat<br>PS C:\Users\tuser\Documents\scripts&gt; cat mrbtsbackup.bat<br>rem xcopy C:\Users\tuser\Documents\scripts\new1\*.txt C:\Users\tuser\Documents\scripts\new2 /e<br>xcopy C:\Users\tuser\Documents\scripts\new1\test2.txt C:\Users\tuser\Documents\scripts\new2 /s<br>PS C:\Users\tuser\Documents\scripts&gt; ls .\new1\<br>&nbsp;&nbsp;Каталог: C:\Users\tuser\Documents\scripts\new1<br>Mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LastWriteTime&nbsp;&nbsp;&nbsp;&nbsp; Length Name<br>----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -------------&nbsp;&nbsp;&nbsp;&nbsp; ------ ----<br>d-----&nbsp;&nbsp;&nbsp;&nbsp;05.09.2024&nbsp;&nbsp; 14:21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test<br>d-----&nbsp;&nbsp;&nbsp;&nbsp;05.09.2024&nbsp;&nbsp; 14:18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test2<br>PS C:\Users\tuser\Documents\scripts&gt; ls .\new1\test\<br>&nbsp;&nbsp;Каталог: C:\Users\tuser\Documents\scripts\new1\test<br>Mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LastWriteTime&nbsp;&nbsp;&nbsp;&nbsp; Length Name<br>----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -------------&nbsp;&nbsp;&nbsp;&nbsp; ------ ----<br>d-----&nbsp;&nbsp;&nbsp;&nbsp;05.09.2024&nbsp;&nbsp; 14:17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Новая папка<br>d-----&nbsp;&nbsp;&nbsp;&nbsp;05.09.2024&nbsp;&nbsp; 14:18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Новая папка (2)<br>-a----&nbsp;&nbsp;&nbsp;&nbsp;05.09.2024&nbsp;&nbsp; 14:00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  3 test.txt<br>-a----&nbsp;&nbsp;&nbsp;&nbsp;05.09.2024&nbsp;&nbsp; 14:00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  3 test2.txt<br><strong>Task:</strong><br>Администрирование локальных, виртуальных и облачных серверов. Подключиться к ftp и скопировать файлы в сетевую папку.<br><strong>Decision:</strong><br>PS C:\Users\tuser\Documents\scripts&gt; ftp<br>ftp&gt; open tipftp<br>ftp&gt; tuser<br>ftp&gt; ls Backups/tdir<br>ftp&gt; get /Backups/tdir/MRBTS2279.xml \\tdomain.ru\tdir\Test.txt<br>200 PORT command successful. Consider using PASV.<br>150 Opening BINARY mode data connection for /Backups/tdir/MRBTS2279.xml (126410 bytes).<br>226 Transfer complete.<br>ftp: 126410 байт получено за 0.24 (сек) со скоростью 533.38 (КБ/сек).<br><strong>Task:</strong><br>Написание скриптов для бэкап файлов. Реализовать подключение и копирование файлов скриптом<br><strong>Decision:</strong><br>PS C:\Users\tuser\Documents\scripts&gt; vim mrbtsbackup.bat<br>PS C:\Users\tuser\Documents\scripts&gt; cat mrbtsbackup.bat<br>@Echo Off<br>:: ~Параметры соединения<br>Set $Host=tipftp<br>Set $User=tuser<br>Set $Pass=tpassword<br>:: ~Что и куда копируем<br>SET $SRC=/Backups/tdir/MRBTS2279.xml<br>SET $DST=\\tdomain.ru\tdir\Test2.txt<br>:: ~Временные файлы<br>Set $FFtp=%~dpn0.cfg<br>:: Готовим CFG-файл<br>Echo.%$User%&gt;"%$FFtp%"<br>Echo.%$Pass%&gt;&gt;"%$FFtp%"<br>Echo get "%$SRC%" "%$DST%"&gt;&gt;"%$FFtp%"<br>Echo bye&gt;&gt;"%$FFtp%"<br>:: Выполняем команду<br>FTP -s:"%$FFtp%" %$Host%<br>rem exit<br>pause<br><strong>Task:</strong><br>Написание скриптов для бэкап файлов. Написать команды, которые заархивируют скопированные файлы и удалят файлы. Добавить в скрипт команды<br><strong>Decision:</strong><br>C:\WINDOWS\system32&gt; "C:\Program Files\7-Zip\7z.exe" a -tzip \\tdomain.ru\tdir\Test.zip \\tdomain.ru\tdir\*.txt<br>C:\WINDOWS\system32&gt; del \\tdomain.ru\tdir\*.txt<br>PS C:\Users\tuser\Documents\scripts&gt; vim mrbtsbackup.bat<br>PS C:\Users\tuser\Documents\scripts&gt; cat mrbtsbackup.bat<br>@Echo Off<br>:: ~Параметры соединения<br>Set $Host=tipftp<br>Set $User=tuser<br>Set $Pass=tpassword<br>:: ~Что и куда копируем<br>SET $SRC=/Backups/tdir/MRBTS2279.xml<br>SET $DST=\\tdomain.ru\tdir\Test2.txt<br>:: Формат текущей даты<br>SET dd=%date:~0,2%<br>SET mm=%date:~3,2%<br>SET yyyy=%date:~6,4%<br>SET curdate=%dd%_%mm%_%yyyy%<br>:: ~Временные файлы<br>Set $FFtp=%~dpn0.cfg<br>:: Готовим CFG-файл<br>Echo.%$User%&gt;"%$FFtp%"<br>Echo.%$Pass%&gt;&gt;"%$FFtp%"<br>Echo get "%$SRC%" "%$DST%"&gt;&gt;"%$FFtp%"<br>Echo bye&gt;&gt;"%$FFtp%"<br>:: Выполняем команду<br>FTP -s:"%$FFtp%" %$Host%<br>:: Добавим в архив скопированные файлы<br>"C:\Program Files\7-Zip\7z.exe" a -tzip \\tdomain.ru\tdir\Test_%curdate%.zip \\tdomain.ru\tdir\*.txt<br>:: Удалим лишние файлы<br>del \\tdomain.ru\tdir\*.txt<br>rem exit<br>pause<br><strong>Task:</strong><br>Написание скриптов для бэкап файлов. Обработать все файлы с расширением .xml.<br><strong>Decision:</strong><br>PS C:\Users\tuser\Documents\scripts&gt; vim mrbtsbackup.bat<br>PS C:\Users\tuser\Documents\scripts&gt; cat mrbtsbackup.bat<br>@Echo Off<br>:: ~Параметры соединения<br>Set server=tipftp<br>Set user=tuser<br>Set pass=tpassword<br>:: ~Что и куда копируем<br>:: SET $SRC=/Backups/tdir/*.xml<br>SET src=/Backups/tdir<br>SET dst=\\tdomain.ru\tdir\<br>:: Формат текущей даты<br>SET dd=%date:~0,2%<br>SET mm=%date:~3,2%<br>SET yyyy=%date:~6,4%<br>SET curdate=%dd%_%mm%_%yyyy%<br>:: ~Временные файлы<br>::Set $FFtp=%~dpn0.cfg<br>:: Готовим CFG-файл<br>Echo open %server%&gt;tempfile.txt<br>Echo %user%&gt;&gt;tempfile.txt<br>Echo %pass%&gt;&gt;tempfile.txt<br>Echo lcd %dst%&gt;&gt;tempfile.txt<br>Echo cd %src%&gt;&gt;tempfile.txt<br>:: Echo mget *.* | Y&gt;&gt;tempfile.txt<br>Echo bye&gt;&gt;tempfile.txt<br>:: Выполняем команду<br>FTP -s:tempfile.txt<br>:: Добавим в архив скопированные файлы<br>"C:\Program Files\7-Zip\7z.exe" a -tzip \\tdomain.ru\tdir\Test_%curdate%.zip \\tdomain.ru\tdir\*.xml<br>:: Удалим лишние файлы<br>del \\tdomain.ru\tdir\*.txt<br>rem exit<br>pause<br><strong>Task:</strong><br>Написание скриптов для бэкап файлов. Реализация бэкап файлов на языке PowerShell.<br><strong>Decision:</strong><br>PS C:\Users\tuser\Documents\scripts&gt; Get-Date -Format "_MM_dd_yyyy_HH_mm"<br>_09_09_2024_09_23<br>PS C:\Users\tuser\Documents\scripts&gt; vim mrbtsbackup.ps1<br>PS C:\Users\tuser\Documents\scripts&gt; cat mrbtsbackup.ps1<br># Переменные<br>$ftpServer = "ftp://tipftp/Backups/tdir/"<br>$ftpUser = "tuser"<br>$ftpPassword = "tpassword"<br>$localFolder = "\\tdomain.ru\tdir\"<br>$curdate = Get-Date -Format "_MM_dd_yyyy_HH_mm"<br>#Write-Output $curdate<br># Создание объекта для загрузки<br>$webclient = New-Object System.Net.WebClient<br>$webclient.Credentials = New-Object System.Net.NetworkCredential($ftpUser, $ftpPassword)<br># Получение списка файлов на FTP-сервере<br>$ftpRequest = [System.Net.FtpWebRequest]::Create($ftpServer)<br>$ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectory<br>$ftpRequest.Credentials = $webclient.Credentials<br>$response = $ftpRequest.GetResponse()<br>$streamReader = New-Object System.IO.StreamReader($response.GetResponseStream())<br># Чтение имен файлов<br>$files = @()<br>while($file = $streamReader.ReadLine()) {<br>&nbsp;&nbsp;$files += $file<br>}<br>$streamReader.Close()<br>$response.Close()<br>#Write-Output $files<br># Скачивание файлов<br>foreach ($file in $files) {<br>&nbsp;&nbsp;$remoteFile = "$ftpServer/$file"<br>&nbsp;&nbsp;$localFile = Join-Path $localFolder $file<br>&nbsp;&nbsp;$webclient.DownloadFile($remoteFile, $localFile)<br>}<br># Завершение работы<br>$webclient.Dispose()<br>$compress = @{<br>&nbsp;&nbsp;Path = "\\tdomain.ru\tdir\*.xml"<br>&nbsp;&nbsp;CompressionLevel = "Fastest"<br>&nbsp;&nbsp;DestinationPath = "\\tdomain.ru\tdir\IRK$curdate.zip"<br>}<br>Compress-Archive @compress<br>Remove-Item \\tdomain.ru\tdir\*.xml<br>PS C:\Users\tuser\Documents\scripts\backups&gt; powershell -file mrbtsbackup.ps1<br>PS C:\Users\tuser\Documents\scripts\backups&gt; ls \\tdomain.ru\tdir\<br><strong>Task:</strong><br>Администрирование локальных, виртуальных и облачных серверов. Добавить раписание.<br><strong>Decision:</strong><br>- Планировщик задач - Создать задачу - Имя - Backup MTBTS - +Выполнить для всех пользователей - Триггеры - +Еженедельно - Начать - суббота - 23:00 - ок - действия - запуск программы - Программа или сценарий - powershell.exe - добавить аргументы<br>-file "C:\Users\tuser\Documents\scripts\backups\mrbtsbackup.ps1"<br>- ок<br><strong>Source:</strong><br># https://comp-security.net/%D0%BA%D0%B0%D0%BA-%D1%81%D0%BA%D0%BE%D0%BF%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C-%D1%84%D0%B0%D0%B9%D0%BB-%D0%BF%D0%B0%D0%BF%D0%BA%D1%83-%D0%B2-cmd/ - Как скопировать файл (папку) в командной строке Windows.<br># https://pc.ru/articles/kak-dobavit-kommentarii-v-bat-fajl - Как добавить комментарии в bat-файл.<br># https://learn.microsoft.com/ru-ru/powershell/module/microsoft.powershell.utility/get-date?view=powershell-7.4 - Get-Date.<br># https://learn.microsoft.com/ru-ru/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7.4 - Remove-Item.<br># https://learn.microsoft.com/ru-ru/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.4 - Write-Output.<br># https://docs.oracle.com/cd/E19120-01/open.solaris/819-1634/remotehowtoaccess-87541/index.html - How to Copy Files From a Remote System (ftp).<br># http://forum.oszone.net/post-2962057.html - Powershell. Копировать файлы в новую dir, созданную с именем текущей даты.<br># https://windowsnotes.ru/powershell-2/zapusk-powershell-skripta-po-raspisaniyu/ - Способ 1.<br># https://stackoverflow.com/questions/18180060/how-to-zip-a-file-using-cmd-line - How to zip a file using cmd line?<br># https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/del - del.<br># https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd - Резервное копирование с помощью 7-Zip.<br><strong>Task:</strong><br>Написание скриптов для бэкап файлов. Знакомство с Python.<br><strong>Decision:</strong><br>[tuser@kvmredhat(enm11) scripts]$ hostnamectl<br>   Static hostname: kvmredhat<br>&nbsp;&nbsp;&nbsp;&nbsp; Icon name: computer-vm<br>&nbsp;&nbsp;&nbsp;&nbsp;   Chassis: vm<br>&nbsp;&nbsp;&nbsp;&nbsp;Machine ID: tid1<br>&nbsp;&nbsp;&nbsp;&nbsp;   Boot ID: tid2<br>&nbsp;&nbsp;Virtualization: kvm<br>  Operating System: Red Hat Enterprise Linux Server 7.6 (Maipo)<br>&nbsp;&nbsp;   CPE OS Name: cpe:/o:redhat:enterprise_linux:7.6:GA:server<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kernel: Linux 3.10.0-957.66.1.el7.x86_64<br>&nbsp;&nbsp;  Architecture: x86-64<br>[tuser@kvmredhat(enm11) scripts]$ python3 -V<br>-bash: python3: command not found<br>[tuser@kvmredhat(enm11) scripts]$ python -V<br>Python 2.7.5<br>PS P:\&gt; cd c:\Users\tuser\Documents\py\<br>PS C:\Users\tuser\Documents\py&gt; python -m venv tenv<br>PS C:\Users\tuser\Documents\py&gt; ls<br>Mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LastWriteTime&nbsp;&nbsp;&nbsp;&nbsp; Length Name<br>----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -------------&nbsp;&nbsp;&nbsp;&nbsp; ------ ----<br>d-----&nbsp;&nbsp;&nbsp;&nbsp;09.09.2024&nbsp;&nbsp; 16:20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tenv<br>-a----&nbsp;&nbsp;&nbsp;&nbsp;09.09.2024&nbsp;&nbsp; 15:59&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;264 tpy.py<br>PS C:\Users\tuser\Documents\py&gt; .\tenv\Scripts\activate<br>pip install<br>(tenv) PS C:\Users\tuser\Documents\py&gt; pip list<br>Package&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Version<br>------------------ ---------<br>certifi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2024.8.30<br>charset-normalizer 3.3.2<br>idna&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   3.8<br>pip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;21.2.3<br>requests&nbsp;&nbsp;&nbsp;&nbsp;   2.32.3<br>setuptools&nbsp;&nbsp;&nbsp;&nbsp; 57.4.0<br>urllib3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.2.3<br>WARNING: You are using pip version 21.2.3; however, version 24.2 is available.<br>You should consider upgrading via the 'C:\Users\tuser\Documents\py\tenv\Scripts\python.exe -m pip install --upgrade pip' command.<br>(tenv) PS C:\Users\tuser\Documents\py&gt; C:\Users\tuser\Documents\py\tenv\Scripts\python.exe -m pip install --upgrade pip  --proxy http://t2rs-fgproxy.tdomain.ru:8080<br>(tenv) PS C:\Users\tuser\Documents\py&gt; pip install requests  --proxy http://t2rs-fgproxy.tdomain.ru:8080<br><strong>Source:</strong><br># https://docs.python.org/3/library/venv.html - Creating virtual environments.<br># https://realpython.com/python-coding-setup-windows/#installing-python-with-pyenv-for-windows - Installing Python With pyenv for Windows.<br># https://wiki.merionet.ru/articles/kak-opredelit-versiyu-linux#:~:text=%D0%A1%D0%B0%D0%BC%D1%8B%D0%B9%20%D0%BF%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%B9%20%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8E,%D0%B2%D0%BC%D0%B5%D1%81%D1%82%D0%B5%20%D1%81%20%D0%BA%D0%BE%D0%BD%D0%BA%D1%80%D0%B5%D1%82%D0%BD%D0%BE%D0%B9%20%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B5%D0%B9%20%D1%8F%D0%B4%D1%80%D0%B0. - Как определить версию Linux?<br><strong>Task:</strong><br>Написание скриптов для бэкап файлов. Реализация бэкап файлов на языке Python.<br><strong>Decision:</strong><br>PS C:\Users\tuser\Documents\py&gt; vim .\tpy.py<br>PS C:\Users\tuser\Documents\py&gt; cat .\tpy.py<br>from ftplib import FTP<br>ftp = FTP("tipftp")<br>ftp.login(user="tuser", passwd="tpassword")<br>local_file = '/Users/tuser/Documents/py/test/testfile.txt'<br>#files = ftp.nlst('/Backups/tdir/*.xml')<br>files = ftp.nlst('/Backups/tdir/MRBTS881364.xml')<br>#print(files)<br>for file in files:<br>&nbsp;&nbsp;print(file)<br>&nbsp;&nbsp;file_list=[]<br>&nbsp;&nbsp;file_list.append(file)<br>&nbsp;&nbsp;file_list1=str(file_list)<br>&nbsp;&nbsp;print(file_list1)<br>&nbsp;&nbsp;with open(local_file, 'wb') as tempfile:<br>&nbsp;&nbsp;&nbsp;&nbsp;#print("Работа с файлом testfile")<br>&nbsp;&nbsp;&nbsp;&nbsp;#ftp.retrbinary('RETR' + file_list1, tempfile.write)<br>&nbsp;&nbsp;&nbsp;&nbsp;ftp.retrbinary('retr ' + file, tempfile.write)<br>ftp.quit()<br><br><strong>Source:</strong><br># https://sky.pro/media/rabota-s-fajlami-v-python-kak-poluchit-spisok-vseh-fajlov-v-direktorii/<br># https://docs.python.org/3/library/ftplib.html<br># https://sky.pro/media/kak-ispolzovat-python-dlya-raboty-s-ftp/<br># https://pythonworld.ru/tipy-dannyx-v-python/spiski-list-funkcii-i-metody-spiskov.html<br># https://dvmn.org/encyclopedia/python_intermediate/python_lists/<br># https://metanit.com/python/tutorial/4.1.php<br># https://lavrynenko.com/python-ftplib-skachat-fajl/<br>

</p>