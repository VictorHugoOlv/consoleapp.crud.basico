until /opt/mssql-tools/bin/sqlcmd -S sql-server -U sa -P AulaGeekJobs1 -Q "SELECT 1" &> /dev/null; do
	echo "Aguardando o servidor SQL server ficar pronto"
	sleep 10
done

echo "Iniciando criação base de dados"
/opt/mssql-tools/bin/sqlcmd -S sql-server -U sa -P AulaGeekJobs1 -d master -i /tmp/scripts/script-criacao-database.sql
echo "Finalizando criação base de dados"

echo "Iniciando carga de dados"
/opt/mssql-tools/bin/sqlcmd -S sql-server -U sa -P AulaGeekJobs1 -d geekjobs -i /tmp/scripts/carga-dados.sql
echo "Finalizando carga de dados na base de dados Geekjobs"