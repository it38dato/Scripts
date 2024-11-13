from ftplib import FTP
import os
import zipfile
import datetime
ftp = FTP("tipftp")
ftp.login(user="tuser", passwd="tpassword")
files = ftp.nlst('/Backups/tdir/')
local_dir = '//tdomain.ru/tdir/MRBTS/'
xml_files_ftp = [file for file in files if file.endswith('.xml')]
#print(xml_files_ftp)
'''
for file in xml_files_ftp:
    #print(file)
    local_file = os.path.join(local_dir, os.path.basename(file))
    #print(local_file)
    with open(local_file, 'wb') as tempfile:
        ftp.retrbinary(f'RETR {file}', tempfile.write)        
ftp.quit()
'''
'''
archive = zipfile.ZipFile('//tdomain.ru/tdir/MRBTS/IRK{}_{}.zip'.format('', datetime.date.today().strftime("%d-%m-%y")), 'w')
for loc_dir, loc_subdir, files_local in os.walk(local_dir):
    #print(loc_dir)
    for all_files_local in files_local:
        #print(all_files_local)
        if all_files_local.endswith('.xml'):
            xml_files_local=os.path.join(loc_dir, all_files_local)
            archive.write(xml_files_local, os.path.relpath(xml_files_local, local_dir), compress_type = zipfile.ZIP_DEFLATED)            
            #print(xml_files_local)
            #os.remove(xml_files_local)
archive.close()
'''
archive = zipfile.ZipFile('//tdomain.ru/tdir/MRBTS/IRK{}_{}.zip'.format('', datetime.date.today().strftime("%d-%m-%y")), 'w')
for file in xml_files_ftp:
    local_file = os.path.join(local_dir, os.path.basename(file))
    with open(local_file, 'wb') as tempfile:
        ftp.retrbinary(f'RETR {file}', tempfile.write)
    for loc_dir, loc_subdir, files_local in os.walk(local_dir):
        #print(loc_dir)
        for all_files_local in files_local:
            #print(all_files_local)
            if all_files_local.endswith('.xml'):
                xml_files_local=os.path.join(loc_dir, all_files_local)
                archive.write(xml_files_local, os.path.relpath(xml_files_local, local_dir), compress_type = zipfile.ZIP_DEFLATED)
                #print(xml_files_local)
                os.remove(xml_files_local)
archive.close()
ftp.quit()