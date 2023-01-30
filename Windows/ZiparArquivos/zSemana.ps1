echo "Zipar as pastas e apagar os arquivos não zipados!"
echo "Deve rodar no fim da tarde de sexta feira"

$dia = get-date -UFormat %d
$semana  = get-date -UFormat %V
$mes  = get-date -UFormat %B
$ano = get-date -UFormat %Y
$data = get-date -uformat %V%B%Y

cd C:\backups\aZipar\$ano\$mes\
7z a -tzip "Semana_$data.zip" $semana\*
mv "Semana_$data.zip" C:\backups\zipados\$ano\$mes\
rm -R C:\backups\aZipar\$ano\$mes\$semana