<?php
/*
 * @see https://game-icons.net/tags/hand.html
 * @see https://www.makeplayingcards.com/products/playingcard/design/dn_playingcards_front_dynamic.aspx?ssid=0782A34F9813420FBE38F50EA4609995
 */

$file = 'data.csv';
function getCsv($input) {
	return str_getcsv ( $input, ',', '"', '\\');
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
	// if ($i > 5) break;
	echo '<!-- ' . print_r($card, 1) . ' -->';
    echo "<div class=\"cardFrame color-{$card['color']}\" style=\"background-image: url('img/{$card['id']}.jpg');\">                            ";
    echo "	<div class=\"container title\">                  ";
    echo !$card['color'] ? '' : "		<div class=\"inner picto\"><img src=\"picto/{$card['color']}\" /></div>";
    echo !$card['suit']  ? '' : "		<div class=\"inner picto\"><img src=\"picto/{$card['suit']}\"  /></div>";
    // echo "		<div class=\"inner head\">{$card['Bang name']}</div> ";
    echo "	</div>                                           ";
    echo !$card['p1'] ? '' : "	<div class=\"container left-bar\">               ";
    echo !$card['p1'] ? '' : "		<div class=\"inner picto\"><img src=\"picto/{$card['p1']}\" /></div>";
    echo !$card['p2'] ? '' : "		<div class=\"inner picto\"><img src=\"picto/{$card['p2']}\" /></div>";
    echo !$card['p3'] ? '' : "		<div class=\"inner picto\"><img src=\"picto/{$card['p3']}\" /></div>";
    echo !$card['p4'] ? '' : "		<div class=\"inner picto\"><img src=\"picto/{$card['p4']}\" /></div>";
    echo !$card['p1'] ? '' : "	</div>                                           ";
    echo !$card['p5'] ? '' : "	<div class=\"container right-bar\">              ";
    echo !$card['p5'] ? '' : "		<div class=\"inner picto\">{$card['p5']}</div>           ";
    echo !$card['p5'] ? '' : "		<div class=\"inner picto\">{$card['p6']}</div>           ";
    echo !$card['p5'] ? '' : "		<div class=\"inner picto\">{$card['p7']}</div>           ";
    echo !$card['p5'] ? '' : "	</div>                                           ";
    echo !$card['Ability box'] ? '' : "	<div class=\"container rulebox\">                ";
    echo !$card['Ability box'] ? '' : "		{$card['Ability box']}                         ";
    echo !$card['Ability box'] ? '' : "	</div>                                           ";
    echo "</div>                                               ";
 }
?>

</body>
</html>