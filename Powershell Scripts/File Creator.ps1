$list = Get-Content '.\list.txt'
$i = 0
do {
New-Item $list[$i] -ItemType File
$i++ 
}while($i -le $tst.Length)