echo "Release network..."
ipconfig /release | Out-Null

echo "Renew Network..."
ipconfig /renew | Out-Null

echo "NEW IP"
ipconfig

pause