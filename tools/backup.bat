@echo off
REM Backup do projeto site-creation-skills -> philipeapenas/site-creation-skills (main)
REM Uso: clique duplo. Stage tudo que o .gitignore deixa passar, commit com timestamp, push.

REM Sobe 1 nivel: tools/ -> raiz do projeto
cd /d "%~dp0.."

echo.
echo === site-creation-skills backup ===
echo Repo: %CD%
echo.

REM Sem remote o push falha com erro cru do git e parece que o script quebrou.
REM Aqui o motivo aparece com o comando que resolve.
git remote get-url origin >nul 2>&1
if errorlevel 1 goto :semremote

REM Timestamp YYYY-MM-DD_HH-MM-SS (locale-independente via PowerShell)
for /f "delims=" %%i in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd_HH-mm-ss'"') do set TS=%%i

git add -A
if errorlevel 1 goto :err

REM Sai limpo se nao houver nada pra commitar
git diff --cached --quiet
if not errorlevel 1 (
    echo Nada novo pra commitar. Tentando push mesmo assim...
    goto :push
)

git commit -m "backup %TS%"
if errorlevel 1 goto :err

:push
git push origin main
if errorlevel 1 goto :err

echo.
echo === OK: backup %TS% salvo no GitHub ===
echo.
pause
exit /b 0

:semremote
echo.
echo === ERRO: o remote "origin" nao esta configurado. ===
echo O commit ate funcionaria, mas nada sairia desta maquina.
echo.
echo Rode uma vez, na raiz do projeto:
echo   gh repo create philipeapenas/site-creation-skills --private --source=. --remote=origin --push
echo.
pause
exit /b 1

:err
echo.
echo === ERRO no backup. Veja a saida acima. ===
echo.
pause
exit /b 1
