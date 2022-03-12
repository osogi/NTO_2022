$aesManaged=new-object "System.Security.Cryptography.AesManaged";
$aesManaged.Mode=[System.Security.Cryptography.CipherMode]::CBC;
$aesManaged.Padding=[System.Security.Cryptography.PaddingMode]::Zeros;
$aesManaged.BlockSize=128;
$aesManaged.KeySize=256;

$string = "DXySLmtRkp9RWI/+RrEdxZAZ1ApBWZapUSRi3LpO/3U=";
$array = $string.ToCharArray();

$key =  [System.Convert]::FromBase64CharArray($array, 0, $array.Length);

 $string = "HLjnip/6TvNwDoPabcdk7g==";
$array = $string.ToCharArray();
$IV = [System.Convert]::FromBase64CharArray($array, 0, $array.Length);


$aesManaged.Key = $key
$aesManaged.IV = $IV

Write-Output "Decryption phase" 

$decryptor=$aesManaged.CreateDecryptor();
$directory = "C:\Share"
$files=gci $directory -Recurse -Include *.crpt;
foreach($file in $files) {
    $bytes=[System.IO.File]::ReadAllBytes($($file.FullName));
    $dt = $IV.Length
    $decryptedData=$decryptor.TransformFinalBlock($bytes, $dt, $bytes.Length-$dt);

    [System.IO.File]::WriteAllBytes($($file.FullName+".bak"),$decryptedData);

    }