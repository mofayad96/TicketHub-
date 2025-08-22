@echo off
echo ========================================
echo    EventX Studio - Service Manager
echo ========================================
echo.

echo Starting Backend Service...
cd backend
start "EventX Backend" cmd /k "node src/server.js"
cd ..

echo.
echo Starting Frontend Service...
cd frontend
start "EventX Frontend" cmd /k "npm run dev"
cd ..

echo.
echo ========================================
echo Services are starting...
echo ========================================
echo Backend:  http://localhost:4000
echo Frontend: http://localhost:5173
echo.
echo Note: Backend may show MongoDB connection errors
echo until MongoDB is properly configured.
echo.
echo Press any key to exit...
pause > nul
