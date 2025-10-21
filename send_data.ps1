
$apiUrl = "https://api.powerbi.com/beta/b65da667-66cf-4b3d-b862-71082a9dc60f/datasets/63539ea5-e71a-4fc3-a9dc-70d12ca694e3/rows?experience=power-bi&key=HDI132VuiIcEfvtt%2Fb6ibf88XZcAuP11VdwoD1Kn7TtSqOu5P53lFk9pIyZuKwqSwWfuIHlgn19IPgRwqHtdmQ%3D%3D"

while ($true) {
    $temperature = Get-Random -Minimum 20 -Maximum 35
    $timestamp = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")

    $body = "[{""timestamp"": ""$timestamp"", ""temperature"": $temperature}]"

    try {
        Invoke-RestMethod -Method Post -Uri $apiUrl -Body $body -ContentType "application/json"
        Write-Host "✅ Sent: temperature=$temperature, timestamp=$timestamp" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host $body
    }

    Start-Sleep -Seconds 5
}