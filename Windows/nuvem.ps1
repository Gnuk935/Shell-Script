echo "Move o arquivo do mês para a nuvem! e depois apaga o arquivo na pasta"

echo "Deve rodar no ultimo dia util do mês"

cd C:\backups\zipados\2023
$mes  = get-date -UFormat %B
$ano = get-date -UFormat %Y

mv "$mes.zip" C:\backups\nuvem