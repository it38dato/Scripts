from ftplib import FTP
ftp = FTP("tipftp")
ftp.login(user="tuser", passwd="tpassword")
local_file = '/Users/tuser/Documents/py/test/testfile.txt'
#files = ftp.nlst('/Backups/tdir/*.xml')
files = ftp.nlst('/Backups/tdir/MRBTS881364.xml')
#print(files)
for file in files:
  print(file)
  file_list=[]
  file_list.append(file)
  file_list1=str(file_list)
  print(file_list1)
  with open(local_file, 'wb') as tempfile:
    #print("Работа с файлом testfile")
    #ftp.retrbinary('RETR' + file_list1, tempfile.write)
    ftp.retrbinary('retr ' + file, tempfile.write)
ftp.quit()