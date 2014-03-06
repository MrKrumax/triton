<?
$db="users";
$mysql_host="77.120.116.10";
$mysql_login="nazarbazar";
$mysql_password="633486k";
@mysql_connect("$mysql_host", "$mysql_login", "$mysql_password") or die (mysql_error());
mysql_select_db ($db) or die (mysql_error());
 
?>