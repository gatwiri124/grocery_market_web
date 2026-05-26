Add-Type -AssemblyName System.Drawing

function Create-Placeholder {
    param($filename, $color, $text)
    $bmp = New-Object System.Drawing.Bitmap(400,300)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear($color)
    $font = New-Object System.Drawing.Font("Arial", 24)
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = [System.Drawing.StringAlignment]::Center
    $sf.LineAlignment = [System.Drawing.StringAlignment]::Center
    $rect = New-Object System.Drawing.RectangleF(0, 0, 400, 300)
    $g.DrawString($text, $font, $brush, $rect, $sf)
    $g.Dispose()
    $bmp.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
}

$green = [System.Drawing.Color]::FromArgb(76, 175, 80)
$orange = [System.Drawing.Color]::FromArgb(255, 152, 0)
$blue = [System.Drawing.Color]::FromArgb(33, 150, 243)

Create-Placeholder "assets\images\hero_image.png" $green "Soko Fresh"
Create-Placeholder "assets\images\features_app.png" $orange "Shop Anywhere"
Create-Placeholder "assets\images\how_it_works.png" $blue "Easy Ordering"
Create-Placeholder "assets\images\app_preview.png" $green "Get Started"

Write-Host "Images created successfully"