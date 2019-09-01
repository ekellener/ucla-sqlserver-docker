
#wait for the SQL Server to come up
sleep 25s


echo "running set up script"
/opt/mssql-tools/bin/sqlcmd -S . -U sa -P $SA_PASSWORD -Q "CREATE DATABASE [Adventureworks] ON (FILENAME = '/var/opt/sqlserver/Adventureworks.mdf') FOR ATTACH"
