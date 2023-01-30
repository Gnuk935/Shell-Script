echo "Zipar as pastas e apagar os arquivos não zipados!"

$dia = get-date -UFormat %d
$semana  = get-date -UFormat %V
$mes  = get-date -UFormat %B
$ano = get-date -UFormat %Y
$data = get-date -uformat %V%B%Y

cd C:\backups\aZipar\$ano\$mes\
7z a -tzip "Semana_$data.zip" $semana
mv "$data.zip" C:\backups\zipados\2023\janeiro
rm C:\backups\aZipar\$ano\$mes\$semana