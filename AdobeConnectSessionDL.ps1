<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$AdobeConnectDownloader          = New-Object system.Windows.Forms.Form
$AdobeConnectDownloader.ClientSize  = New-Object System.Drawing.Point(400,400)
$AdobeConnectDownloader.text     = "Adobe Connect Downloader"
$AdobeConnectDownloader.TopMost  = $false

$URL                             = New-Object system.Windows.Forms.TextBox
$URL.multiline                   = $false
$URL.width                       = 300
$URL.height                      = 20
$URL.location                    = New-Object System.Drawing.Point(25,68)
$URL.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$FileName                        = New-Object system.Windows.Forms.TextBox
$FileName.multiline              = $false
$FileName.width                  = 200
$FileName.height                 = 20
$FileName.location               = New-Object System.Drawing.Point(25,175)
$FileName.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$UrlPrompt                       = New-Object system.Windows.Forms.Label
$UrlPrompt.text                  = "Please enter the adobe connect session URL"
$UrlPrompt.AutoSize              = $true
$UrlPrompt.width                 = 25
$UrlPrompt.height                = 10
$UrlPrompt.location              = New-Object System.Drawing.Point(25,38)
$UrlPrompt.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$ZipFilePrompt                   = New-Object system.Windows.Forms.Label
$ZipFilePrompt.text              = "Please enter a file name for the downloaded zip archive"
$ZipFilePrompt.AutoSize          = $true
$ZipFilePrompt.width             = 25
$ZipFilePrompt.height            = 10
$ZipFilePrompt.location          = New-Object System.Drawing.Point(25,142)
$ZipFilePrompt.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Ok                              = New-Object system.Windows.Forms.Button
$Ok.text                         = "OK"
$Ok.width                        = 60
$Ok.height                       = 30
$Ok.location                     = New-Object System.Drawing.Point(25,235)
$Ok.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$cancelButton                    = New-Object system.Windows.Forms.Button
$cancelButton.text               = "Cancel"
$cancelButton.width              = 60
$cancelButton.height             = 30
$cancelButton.location           = New-Object System.Drawing.Point(109,235)
$cancelButton.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$AdobeConnectDownloader.controls.AddRange(@($URL,$FileName,$UrlPrompt,$ZipFilePrompt,$Ok,$cancelButton))

$Ok.Add_Click({ download })
$cancelButton.Add_Click({ closeForm })

#Write your logic code here

function download(){
    $file = $FileName.text
    $downloadurl = $URL.text + "output/$file.zip?download=zip"
    start $downloadurl
}
function closeForm {$AdobeConnectDownloader.close()}
[void]$AdobeConnectDownloader.ShowDialog()