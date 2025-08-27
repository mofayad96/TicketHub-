@echo off
echo ========================================
echo   TICKETHUB FRONTEND DEPLOYMENT
echo ========================================
echo.

echo [1/4] Building frontend for production...
cd frontend
call npm run build
if %errorlevel% neq 0 (
    echo ❌ Build failed! Please check for errors.
    pause
    exit /b 1
)
echo ✅ Frontend built successfully!

echo.
echo [2/4] Checking build output...
if not exist "dist\index.html" (
    echo ❌ Build output not found! Check build process.
    pause
    exit /b 1
)
echo ✅ Build output verified!

echo.
echo [3/4] Environment check...
if not exist ".env.production" (
    echo ⚠️  Production environment file not found.
    echo    Creating template...
    echo VITE_API_URL=https://your-backend-url.onrender.com/api > .env.production
    echo ✅ Created .env.production template
) else (
    echo ✅ Production environment file found
)

echo.
echo [4/4] Ready for Vercel deployment!
echo.
echo 📋 Next steps:
echo    1. Push changes to GitHub
echo    2. Connect repository to Vercel
echo    3. Set environment variables in Vercel
echo    4. Deploy!
echo.
echo 🌐 Your frontend will be available at:
echo    https://your-project.vercel.app
echo.
echo ========================================
pause
