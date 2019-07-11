<!DOCTYPE html>
<html>
<body>
<h2> Blacklisted </h2>

<?php

$command = escapeshellcmd('python /var/www/html/blacklist.py');
$output = shell_exec($command);
$output_ar = explode(', ', substr($output,1,-2));
$len = count($output_ar);
if($len > 0)
{
if($len == 1)
{
echo " Blacklisted IP of the attacker is ".str_replace('u','',$output);
}
else
{
for($i=0;$i<$len;$i++)
{
echo " Blacklisted IP of the attacker is ".str_replace('u','',$output_ar[$i]);
echo "<br>";
}
}
}
else
{
echo "No attackes Yet!!";
}

?>
</body>
</html>
