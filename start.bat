@echo off
echo Starting EventX Studio...
echo.

echo 1. Starting MongoDB (Docker)...
docker-compose up -d

echo.
echo 2. Starting Backend...
cd backend
start "EventX Backend" cmd /k "npm run dev"

echo.
echo 3. Starting Frontend...
cd ..\frontend
start "EventX Frontend" cmd /k "npm run dev"

echo.
echo Services are starting...
echo - Backend: http://localhost:4000
echo - Frontend: http://localhost:5173
echo - MongoDB Express: http://localhost:8081
echo.
echo Press any key to exit this window...
pause > nul
