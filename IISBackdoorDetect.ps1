Set-StrictMode -Version 2

$modules = (Get-WebConfiguration //globalmodules).collection

foreach($module in $modules) {
    $imageFile = $module.image -ireplace "%windir%", "$env:WINDIR"
    $imageFile = $imageFile -ireplace  "%systemroot%", "$env:SYSTEMROOT"
    Write-Verbose "Processing $imagefile"
    $sig = Get-AuthenticodeSignature $imageFile
    if ($sig.Status -ne 'Valid') {
        Write-Output "Potential backdoor: $imageFile is unsigned"
        continue
    }
    if ($sig.SignerCertificate.Subject -cnotmatch "O=Microsoft Corporation") {
        Write-Output "Potential backdoor: $imageFile is signed but not by Microsoft"
        continue
    }
}
