@echo off

docker ps -a --filter "name=Verevkin_AI_Docker_for_adm" | findstr "Verevkin_AI_Docker_for_adm"
IF %ERRORLEVEL% EQU 1 (
    docker build -t my-vscode-server .
    start docker run --name Verevkin_AI_Docker_for_adm -p 8080:8080 -v "%PWD%:/home/coder/project" my-vscode-server
) ELSE (
    docker start Verevkin_AI_Docker_for_adm
)
FOR /F "tokens=*" %%A IN ('docker ps -aqf "name=Verevkin_AI_Docker_for_adm"') DO SET CONTAINER_ID=%%A
docker cp %CONTAINER_ID%:/home/coder/.config/code-server/config.yaml "%CD%\config_for_Verevkin_AI_Docker_for_adm.txt"
start "" "http://localhost:8080/"
config_for_Verevkin_AI_Docker_for_adm.txt