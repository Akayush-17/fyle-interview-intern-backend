@echo off
REM Stop on first error
setlocal enabledelayedexpansion
set ERRORS=0

REM Delete older .pyc files (optional on Windows, but for reference)
for /R %%G in (*.pyc) do del /F /Q "%%G"

REM Set FLASK_APP environment variable
set FLASK_APP=core\server.py

REM Uncomment below if needed to run migrations
REM flask db init -d core/migrations/
REM flask db migrate -m "Initial migration." -d core/migrations/
flask db upgrade -d core/migrations/

REM Run server (Gunicorn is Unix-only; use Flask's built-in server on Windows)
python -m flask run
