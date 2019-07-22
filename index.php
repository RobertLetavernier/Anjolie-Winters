<?php
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
 foreach ($csv as $card) {
	echo PHP_EOL . '<!-- ' . print_r($card, 1) . ' -->';
    echo PHP_EOL . "<div class=\"cardFrame\" style=\"background-image: url('img/{$card['id']}.jpg');\">                            ";
    echo PHP_EOL . "	<div class=\"container title\">                  ";
    echo !$card['color'] ? '' : PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['color']}\" /></div>";
    echo !$card['suit']  ? '' : PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['suit']}\"  /></div>";
    // echo PHP_EOL . "		<div class=\"inner head\">{$card['Bang name']}</div> ";
    echo PHP_EOL . "	</div>                                           ";
    echo PHP_EOL . "	<div class=\"container left-bar\">               ";
    echo !$card['p1'] ? '' : PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['p1']}\" /></div>";
    echo !$card['p2'] ? '' : PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['p2']}\" /></div>";
    echo !$card['p3'] ? '' : PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['p3']}\" /></div>";
    echo !$card['p4'] ? '' : PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['p4']}\" /></div>";
    echo PHP_EOL . "	</div>                                           ";
    echo PHP_EOL . "	<div class=\"container right-bar\">              ";
    echo !$card['p5'] ? '' : PHP_EOL . "		<div class=\"inner picto\">{$card['p5']}</div>           ";
    echo !$card['p6'] ? '' : PHP_EOL . "		<div class=\"inner picto\">{$card['p6']}</div>           ";
    echo !$card['p7'] ? '' : PHP_EOL . "		<div class=\"inner picto\">{$card['p7']}</div>           ";
    echo PHP_EOL . "	</div>                                           ";
    echo !$card['Ability box'] ? '' : PHP_EOL . "	<div class=\"container rulebox\">                ";
    echo !$card['Ability box'] ? '' : PHP_EOL . "		{$card['Ability box']}                         ";
    echo !$card['Ability box'] ? '' : PHP_EOL . "	</div>                                           ";
    echo PHP_EOL . "</div>                                               ";
 }
?>

</body>
</html>