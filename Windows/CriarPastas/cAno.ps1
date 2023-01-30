echo off
echo Criar pasta dos anos 

$dia = get-date -UFormat %d
$semana  = get-date -UFormat %V
$mes  = get-date -UFormat %B
$ano = get-date -UFormat %Y

cd C:\backups\
mkdir .\aZipar\$ano
mkdir .\zipados\$ano