echo off
echo Criar pasta do mês 

$dia = get-date -UFormat %d
$semana  = get-date -UFormat %V
$mes  = get-date -UFormat %B
$ano = get-date -UFormat %Y

cd C:\backups\
mkdir .\aZipar\$ano\$mes
mkdir .\zipados\$ano\$mes