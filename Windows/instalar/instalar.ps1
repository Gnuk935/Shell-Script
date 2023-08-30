echo "Vc esta sendo hakeado"
echo "Peço que aguarde ate entrarmos na rede"
Start-Process -FilePath "winget" -ArgumentList "install -e --id Google.Chrome" -Verb RunAs
Start-Process -FilePath "winget" -ArgumentList "install -e --id AnyDeskSoftwareGmbH.AnyDesk"
echo "Voce foi hakeado obg pela colaboração"
