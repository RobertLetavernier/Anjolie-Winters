<?php
// phpinfo();
// die('x_x');

/*
 * @see https://game-icons.net/tags/hand.html
 * @see https://www.makeplayingcards.com/products/playingcard/design/dn_playingcards_front_dynamic.aspx?ssid=0782A34F9813420FBE38F50EA4609995
 */

function pictify($str) {
	if (strlen($str)) {
		$ret = "<span>{$str}</span>";
		if (is_file("picto/{$str}")) {
			$ret = "<img src=\"picto/{$str}\" />";
		}
		return $ret;
	}
}

/**/
$url = 'https://docs.google.com/spreadsheets/d/1NfLyZARK8k5lUvSt9xj-v4gAmCw4qMiJ0TqC_FsZDfI/export?gid=1675210374&format=csv&id=1NfLyZARK8k5lUvSt9xj-v4gAmCw4qMiJ0TqC_FsZDfI';
$csv = array();
if (($handle = fopen($url, "r")) !== FALSE) {
    while (($csv[] = fgetcsv($handle, 1000, ",")) !== FALSE);
    fclose($handle);
}
/*/
function getCsv($input) {
	return str_getcsv ( $input, ',', '"', '\\');
}
$csv = array_map('getCsv', file('data.csv'));
array_walk($csv, function(&$a) use ($csv) {
  $a = array_combine($csv[0], $a);
});
/**/

array_walk($csv, function(&$a) use ($csv) {
  if ($a) {
	  $a = array_combine($csv[0], $a);
  }
});

array_shift($csv); # remove column header
	
// print_r ($csv);
// die('x_x');
?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="tpt.css">
	<link href="https://fonts.googleapis.com/css?family=Chewy|Eagle+Lake|Indie+Flower|Knewave|Permanent+Marker|Roboto|Shojumaru&display=swap" rel="stylesheet"> 
</head>
<body>
<?php
/*
 * id
 * color
 * suit
 * love letter name
 * lover letter value
 * love letter rule box
 * Bang name
 * Border
 * rule picto 1
 * rule picto 2
 * rule picto 3
 * rule picto 4
 * Ability box
 */
 foreach ($csv as $i => $card) {
	// if ($i < 15 OR $i > 45) continue;
	// if ($i > 3) continue;
	
	if ($_GET['id'] && $_GET['id'] != $card['id']) continue;
	$img = is_file("img/{$card['id']}.jpg") ? "img/{$card['id']}.jpg" : "https://picsum.photos/400/800?random=" . ($i%7);
    echo "<div class=\"cardFrame color-{$card['color']}\">                            ";
	echo '<!-- ' . print_r($card, 1) . ' -->';
    echo "<div class=\"cardBorder\" style=\"background-image: url('{$img}');\">                            ";
    echo "<div class=\"cardBackground\">                            ";
    echo "	<div class=\"container title\">                  ";
    echo !strlen($card['s1']) ? '' : "	<div class=\"inner picto\" style=\"position:absolute; left:10px;\">" . pictify($card['s1']) . "</div>";
    echo "	<div class=\"inner head\">{$card['Bang name']}<br>" . pictify($card['ll']) . "</div>";
    echo !strlen($card['s2']) ? '' : "	<div class=\"inner picto\" style=\"position:absolute; right:10px;\">" . pictify($card['s2']) . "</div>";
    echo "	</div>                                           ";
    echo !strlen($card['p1']) ? '' : "	<div class=\"container left-bar\">               ";
    echo !strlen($card['p1']) ? '' : "		<div class=\"inner picto\">" . pictify($card['p1']) . "</div>";
    echo !strlen($card['p2']) ? '' : "		<div class=\"inner picto\">" . pictify($card['p2']) . "</div>";
    echo !strlen($card['p3']) ? '' : "		<div class=\"inner picto\">" . pictify($card['p3']) . "</div>";
    echo !strlen($card['p4']) ? '' : "		<div class=\"inner picto\">" . pictify($card['p4']) . "</div>";
    echo !strlen($card['p1']) ? '' : "	</div>                                           ";
    echo !strlen($card['p5']) ? '' : "	<div class=\"container right-bar\">              ";
    echo !strlen($card['p5']) ? '' : "		<div class=\"inner picto\">" . pictify($card['p5']) . "</div>           ";
    echo !strlen($card['p5']) ? '' : "		<div class=\"inner picto\">" . pictify($card['p6']) . "</div>           ";
    echo !strlen($card['p5']) ? '' : "		<div class=\"inner picto\">" . pictify($card['p7']) . "</div>           ";
    echo !strlen($card['p5']) ? '' : "	</div>                                           ";
    // echo "	<div class=\"inner head\">{$card['Bang name']}</div>";
    echo !strlen($card['ll'])          ? '' : "	<div class=\"container ll\">                ";
    echo !strlen($card['ll'])          ? '' : "		<div class=\"inner picto\">" . pictify($card['ll']) . "</div>";
    echo !strlen($card['ll'])          ? '' : "	</div>                                           ";
    echo !strlen($card['Ability box']) ? '' : "	<div class=\"container rulebox\">                ";
    echo !strlen($card['Ability box']) ? '' : "		{$card['Ability box']}                         ";
    echo !strlen($card['Ability box']) ? '' : "	</div>                                           ";
    echo "</div>                                               ";
    echo "</div>                                               ";
    echo "</div>                                               ";
 }
?>

</body>
</html>