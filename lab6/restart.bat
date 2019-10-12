sc stop dnscache >NUL
timeout 5 /nobreak >NUL
sc query >C:\LAB6\sc.after
sc start dnscache >NUL