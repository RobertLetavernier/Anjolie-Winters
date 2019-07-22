<?php
$file = 'data.csv';
function getCsv($input) {
	return str_getcsv ( $input, ';', '"', '\\');
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
    echo PHP_EOL . "<div class=\"cardFrame\">                            ";
    echo PHP_EOL . "	<div class=\"container title\">                  ";
    echo PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['suit']}\"  /></div>";
    echo PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['color']}\" /></div>";
    echo PHP_EOL . "		<div class=\"inner head\">{$card['id']}{$card['Bang name']}</div> ";
    echo PHP_EOL . "	</div>                                           ";
    echo PHP_EOL . "	<div class=\"container left-bar\">               ";
    echo PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['rule picto 1']}\" /></div>";
    echo PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['rule picto 2']}\" /></div>";
    echo PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['rule picto 3']}\" /></div>";
    echo PHP_EOL . "		<div class=\"inner picto\"><img src=\"picto/{$card['rule picto 4']}\" /></div>";
    echo PHP_EOL . "	</div>                                           ";
    echo PHP_EOL . "	<div class=\"container right-bar\">              ";
    echo PHP_EOL . "		<div class=\"inner picto\">c</div>           ";
    echo PHP_EOL . "		<div class=\"inner picto\">d</div>           ";
    echo PHP_EOL . "	</div>                                           ";
    echo PHP_EOL . "	<div class=\"container rulebox\">                ";
    echo PHP_EOL . "		{$card['Ability box']}                         ";
    echo PHP_EOL . "	</div>                                           ";
    echo PHP_EOL . "</div>                                               ";
 }
?>

</body>
</html>