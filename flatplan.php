<?php
/*
 * @see https://game-icons.net/tags/hand.html
 * @see https://www.makeplayingcards.com/products/playingcard/design/dn_playingcards_front_dynamic.aspx?ssid=0782A34F9813420FBE38F50EA4609995
 */

$file = 'data.csv';
function getCsv($input) {
	return str_getcsv ( $input, ',', '"', '\\');
}

function pictify($str) {
	$ret = "<span>{$str}</span>";
	if (is_file("picto/{$str}")) {
		$ret = "<img src=\"picto/{$str}\" />";
	}
	return $ret;
}

    $csv = array_map('getCsv', file($file));
    array_walk($csv, function(&$a) use ($csv) {
      $a = array_combine($csv[0], $a);
    });
    array_shift($csv); # remove column header
	
// print_r ($csv);
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
	if ($i < 15 OR $i > 45) continue;
    echo "<div class=\"cardFrame\">                            ";
	echo '<!-- ' . print_r($card, 1) . ' -->';
    echo "<div class=\"cardBorder\">                            ";
    echo "<div class=\"cardBackground color-{$card['color']}\" style=\"background-image: url('img/{$card['id']}.jpg');\">                            ";
    echo "	<div class=\"container title\">                  ";
    echo !strlen($card['s1']) ? '' : "	<div class=\"inner picto\" style=\"position:absolute; left:10px;\">" . pictify($card['s1']) . "</div>";
    echo "	<div class=\"inner head\">" . pictify($card['Bang name']) . "</div>";
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
    // echo !strlen($card['EDS']) ? '' : "	<div class=\"container head\">{$card['EDS']}</div> ";
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