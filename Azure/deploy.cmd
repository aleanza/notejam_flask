rm NoteJam.zip
7z a -r NoteJam.zip .\..\.
REM Compress-Archive -Path .\..\* -DestinationPath NoteJam.zip

REM git deploy of entire repo
REM git remote add azure https://notejamazure.scm.azurewebsites.net:443/notejamazure.git
REM git push azure master

az webapp deployment source config-zip -g "nordcloud" -n "NoteJamAzure" --src .\NoteJam.zip

REM az webapp config show --resource-group "nordcloud" --name "NoteJamAzure" --query linuxFxVersion
REM az webapp config set --resource-group "nordcloud" --name "NoteJamAzure" --linux-fx-version "PYTHON|3.8"


REM az webapp config set --resource-group "nordcloud" --name "NoteJamAzure" --startup-file "python runserver.py"
az webapp config set --resource-group "nordcloud" --name "NoteJamAzure" --startup-file "startup.txt"