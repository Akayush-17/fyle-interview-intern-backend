@echo off
REM to stop on first error
setlocal EnableExtensions EnableDelayedExpansion

REM Restore db to initial state
set FLASK_APP=core/server.py
if exist core\store.sqlite3 del core\store.sqlite3
flask db upgrade -d core/migrations/

REM Run tests
pytest -vvv -s tests/

if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%
