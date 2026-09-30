Write-Host "================ CI/CD PIPELINE STARTED ================" -ForegroundColor Cyan

# ----------------- STAGE 1: CI (Continuous Integration) -----------------
Write-Host "`n[STAGE 1] Running Automated Unit Tests..." -ForegroundColor Yellow
python -m pytest test_app.py

if ($LASTEXITCODE -ne 0) {
    Write-Host "`n[CI FAILED] Tests failed! Blocking deployment." -ForegroundColor Red
    exit 1
}
Write-Host "[CI SUCCESS] All tests passed cleanly!" -ForegroundColor Green

# ----------------- STAGE 2: BUILD -----------------
Write-Host "`n[STAGE 2] Packaging Artifact..." -ForegroundColor Yellow
mkdir -Force dist | Out-Null
Copy-Item app.py -Destination dist\
Write-Host "[BUILD SUCCESS] Artifact copied to dist folder." -ForegroundColor Green

# ----------------- STAGE 3: CD (Continuous Deployment) -----------------
Write-Host "`n[STAGE 3] Deploying Application..." -ForegroundColor Yellow
python dist\app.py
Write-Host "[CD SUCCESS] Deployment completed successfully!" -ForegroundColor Green

Write-Host "`n================ PIPELINE PASSED SUCCESSFULLY ================" -ForegroundColor Cyan