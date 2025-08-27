@echo off
echo ========================================
echo   TICKETHUB BACKEND DEPLOYMENT
echo ========================================
echo.

echo [1/4] Checking backend dependencies...
cd backend
if not exist "node_modules" (
    echo 📦 Installing dependencies...
    call npm install
    if %errorlevel% neq 0 (
        echo ❌ Dependency installation failed!
        pause
        exit /b 1
    )
) else (
    echo ✅ Dependencies already installed
)

echo.
echo [2/4] Testing backend locally...
echo Starting backend server for testing...
start /B npm run dev
timeout /t 5 /nobreak >nul

echo Testing health endpoint...
curl -s http://localhost:4000/api/health >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Backend health check failed!
    echo    Make sure backend is running on port 4000
) else (
    echo ✅ Backend health check passed!
)

echo.
echo [3/4] Environment check...
if not exist ".env.production" (
    echo ⚠️  Production environment file not found.
    echo    Creating template...
    (
        echo NODE_ENV=production
        echo PORT=10000
        echo MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/tickethub
        echo JWT_SECRET=your_super_secure_jwt_secret_here_minimum_64_characters
        echo ADMIN_EMAIL=admin@yourdomain.com
        echo ADMIN_PASSWORD=your_secure_admin_password
    ) > .env.production
    echo ✅ Created .env.production template
) else (
    echo ✅ Production environment file found
)

echo.
echo [4/4] Ready for Render deployment!
echo.
echo 📋 Next steps:
echo    1. Push changes to GitHub
echo    2. Connect repository to Render
echo    3. Set environment variables in Render
echo    4. Deploy!
echo.
echo 🌐 Your backend will be available at:
echo    https://your-service.onrender.com
echo.
echo ========================================
pause
