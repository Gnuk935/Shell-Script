echo "Zipar as pastas e apagar os arquivos não zipados!"
echo "Deve rodar no fim da tarde do ultimo dia util do mês"

$dia = get-date -UFormat %d
$semana  = get-date -UFormat %V
$mes  = get-date -UFormat %B
$ano = get-date -UFormat %Y
$data = get-date -uformat %V%B%Y

cd C:\backups\zipados\$ano\
7z a -tzip "$mes.zip" $mes\*
mv "$mes.zip" C:\backups\zipados\$ano\
rm -R C:\backups\aZipar\$ano\$mes
rm -R C:\backups\zipados\$ano\$mes