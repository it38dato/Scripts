dir /AS /B > list.txt 
FOR /F "eol=# tokens=1* delims=:" %%i in (list.txt) do ( 
attrib -s -h -r "%%i" 
) 
pause