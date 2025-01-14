﻿param($tenant)

try {
    $body = '{"isMacSyncAppEnabled": false}'
    New-GraphPostRequest -tenantid $tenant -Uri "https://graph.microsoft.com/beta/admin/sharepoint/settings" -AsApp $true -Type patch -Body $body -ContentType "application/json"
    Log-request -API "Standards" -tenant $tenant -message  "Disabled Mac OneDrive Sync" -sev Info
}
catch {
    Log-request -API "Standards" -tenant $tenant -message  "Failed to disable Mac OneDrive Sync: $($_.exception.message)" -sev Error
}