# serve.ps1 — prosty lokalny serwer HTTP do testowania aplikacji na Windowsie.
# Nie wymaga instalowania Pythona ani Node.js — korzysta wyłącznie z wbudowanego .NET.
#
# Jak uruchomić:
#   1. Kliknij prawym przyciskiem na ten plik -> "Uruchom za pomocą programu PowerShell"
#      (albo otwórz PowerShell w tym folderze i wpisz: .\serve.ps1)
#   2. W przeglądarce na komputerze otwórz: http://localhost:8000
#   3. Aby zatrzymać serwer, zamknij okno PowerShell albo naciśnij Ctrl+C.

$root = $PSScriptRoot
$port = 8000
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()

Write-Host "Plan Treningowy — serwer testowy uruchomiony."
Write-Host "Otwórz w przeglądarce: http://localhost:$port"
Write-Host "Aby zatrzymać, zamknij to okno lub naciśnij Ctrl+C."

$mime = @{
    ".html" = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".png"  = "image/png"
    ".svg"  = "image/svg+xml"
}

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $req = $context.Request
    $res = $context.Response
    try {
        $path = $req.Url.AbsolutePath
        if ($path -eq "/") { $path = "/index.html" }
        $filePath = Join-Path $root ($path.TrimStart("/"))
        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath)
            $contentType = $mime[$ext]
            if (-not $contentType) { $contentType = "application/octet-stream" }
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $res.ContentType = $contentType
            $res.ContentLength64 = $bytes.Length
            $res.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $res.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found: $path")
            $res.OutputStream.Write($msg, 0, $msg.Length)
        }
    } catch {
        $res.StatusCode = 500
    } finally {
        $res.OutputStream.Close()
    }
}
