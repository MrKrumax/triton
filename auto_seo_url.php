<?php


$hostname = "localhost";
$username = "tritonon_shop";
$password = "shop123!";
$dbName   = "tritonon_shop";


$link = mysql_connect($hostname, $username, $password) OR DIE("Не могу создать соединение ");
mysql_set_charset('utf8', $link);

mysql_select_db($dbName) or die(mysql_error());

switch ($_GET['target']) {
    
    case 'cat':
        seo_cat();
        break;
    
    case 'prod':
        seo_prod();
        break;
        
}



mysql_close();


function seo_cat()
{
    echo '<div style="color:blue;"><br>Categories seolization in progress...</div>';
    $query = "SELECT category_id, name from category_description";
    $res = mysql_query($query) or die(mysql_error());
    
    while ($row = mysql_fetch_array($res)) {
        $name = translitIt(str_replace(' ', '_', trim($row['name'])));
        if (!is_exist('category_id=' . $row['category_id'])) {
            $query = "INSERT INTO url_alias VALUES((SELECT max(url_alias_id) from url_alias as x)+1,'category_id=" . $row['category_id'] . "', '" . $name . "')";
            echo '<br>' . $name . ' is added';
            
        } else {
            echo '...so updating to ' . $name;
            $query = "UPDATE url_alias SET keyword='" . $name . "' WHERE query='category_id=" . $row['category_id'] . "'";
            
        }
        mysql_query($query) or die(mysql_error());
    }
    echo '<div style="color:green;"><br>Categories seolization complete!</div>';
}



function seo_prod()
{
    echo '<div style="color:blue;"><br>Products seolization in progress...</div>';
    $query = "SELECT product_id, name from product_description";
    $res = mysql_query($query) or die(mysql_error());
    
    while ($row = mysql_fetch_array($res)) {
        $name = translitIt(str_replace(' ', '_', trim($row['name'])), ENT_QUOTES, "UTF-8");
        if (!is_exist('product_id=' . $row['product_id'])) {
            $query = "INSERT INTO url_alias VALUES((SELECT max(url_alias_id) from url_alias as x)+1,'product_id=" . $row['product_id'] . "', '" . $name . "')";
            echo '<br>' . $name . ' was added';
            
        } else {
            echo '...so updating to ' . $name;
            $query = "UPDATE url_alias SET keyword='" . $name . "' WHERE query='product_id=" . $row['product_id'] . "'";
            
        }
        mysql_query($query) or die(mysql_error());
    }
    echo '<div style="color:green;"><br>Products seolization complete!</div>';
}


function is_exist($target)
{
    $query = "SELECT url_alias_id from url_alias where query like '" . trim($target) . "'";
    $res = mysql_query($query) or die(mysql_error());
    $number = mysql_num_rows($res);
    
    if ($number > 0) {
        echo '<br>Target ' . $target . ' is already exist';
        return 1;
    }
    return 0;
    
}


function translitIt($str)
{
    $tr = array(
        "А" => "A",
        "Б" => "B",
        "В" => "V",
        "Г" => "G",
        "Д" => "D",
        "Е" => "E",
        "Ж" => "J",
        "З" => "Z",
        "И" => "I",
        "Й" => "Y",
        "К" => "K",
        "Л" => "L",
        "М" => "M",
        "Н" => "N",
        "О" => "O",
        "П" => "P",
        "Р" => "R",
        "С" => "S",
        "Т" => "T",
        "У" => "U",
        "Ф" => "F",
        "Х" => "H",
        "Ц" => "TS",
        "Ч" => "CH",
        "Ш" => "SH",
        "Щ" => "SCH",
        "Ъ" => "",
        "Ы" => "YI",
        "Ь" => "",
        "Э" => "E",
        "Ю" => "YU",
        "Я" => "YA",
        "а" => "a",
        "б" => "b",
        "в" => "v",
        "г" => "g",
        "д" => "d",
        "е" => "e",
        "ж" => "j",
        "з" => "z",
        "и" => "i",
        "й" => "y",
        "к" => "k",
        "л" => "l",
        "м" => "m",
        "н" => "n",
        "о" => "o",
        "п" => "p",
        "р" => "r",
        "с" => "s",
        "т" => "t",
        "у" => "u",
        "ф" => "f",
        "х" => "h",
        "ц" => "ts",
        "ч" => "ch",
        "ш" => "sh",
        "щ" => "sch",
        "ъ" => "y",
        "ы" => "yi",
        "ь" => "",
        "э" => "e",
        "ю" => "yu",
        "я" => "ya",
        '!' => "",
        '*' => "",
        "'" => "",
        "(" => "",
        ")" => "",
        ";" => "",
        ":" => "",
        "@" => "",
        "&" => "and",
        "=" => "",
        "+" => "plus",
        "$" => "",
        "," => "",
        "/" => "",
        "?" => "",
        "%" => "percent",
        "#" => "",
        "[" => "",
        "]" => "",
        "«" => "",
        "»" => ""
    );
    return strtr($str, $tr);
}


?>