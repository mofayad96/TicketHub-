Write-Host "Starting EventX Studio..." -ForegroundColor Green
Write-Host ""

Write-Host "1. Starting MongoDB (Docker)..." -ForegroundColor Yellow
docker-compose up -d

Write-Host ""
Write-Host "2. Starting Backend..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd backend; npm run dev" -WindowStyle Normal

Write-Host ""
Write-Host "3. Starting Frontend..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd frontend; npm run dev" -WindowStyle Normal

Write-Host ""
Write-Host "Services are starting..." -ForegroundColor Green
Write-Host "- Backend: http://localhost:4000" -ForegroundColor Cyan
Write-Host "- Frontend: http://localhost:5173" -ForegroundColor Cyan
Write-Host "- MongoDB Express: http://localhost:8081" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
