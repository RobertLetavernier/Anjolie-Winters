<?php
$sCmdline = 'php -f "D:\www/src/goaland/arsypia/dev/_data/temp/calculus_script_3.php"';
        exec($sCmdline, $aOut, $return_var);

echo '<pre>';
var_dump($return_var);
var_dump($aOut);

/* Glyph convert * /

$asGlyphsMap[] = range('a', 'z');
$asGlyphsMap[] = range('A', 'Z');
$asGlyphsMap[] = range(0,9);

function toGlyph($input, $glyphsMap, $shift = true) {
	$power = 0;
	$a = $input;
	do 
	{
		if (isset($glyphsMap[$power])) {
			$glyphs = $glyphsMap[$power];
			$b = count($glyphs);
		} // else : keep last glyphs
		
		// a = b.q + r
		$r = $a % $b;
		$q = ($a - $r) / $b;
		// echo PHP_EOL . "$a = $b x $q + $r";
		$output[] = $glyphs[$r];
		$a = $q - ($shift);
		$power++;
	}
	while($q > 0 && $power < 6);
	
	return implode(array_reverse($output));
}
echo '<pre>';
for ($k = 0; $k <= 17500; $k++) {
	if (! ($k % 26)) echo PHP_EOL;
	echo str_pad(toGlyph($k, $asGlyphsMap), 4, ' ', STR_PAD_LEFT);
}

		

/* _REQUEST * /

echo '<pre>';
var_dump($_REQUEST);

echo '<form method="post">';
echo '<label for="company.name">Raison Sociale</label>';
echo '<input type="text" class="inptText" name="company.name" />';
echo '<input type="submit" />';
echo '</form>';
die('x_x');

/* SERVER * /

echo PHP_EOL; print_r($_SERVER);

/* Preg split * /
$input = '[TextColor:255,0,0]p[/TextColor][TextColor:0,255,0][3-18][Font:Arial,BI,15]@@nom@@[/Font][/TextColor]';
// $subpattern1 = '\[(TextColor):(.*)\](.*)\[/TextColor\]';
// $subpattern2 = '\[(Font):(.*)\](.*)\[/Font\]';
$subpattern1 = '\[(TextColor):(.*)\](.)';
$subpattern2 = '\[(Font):(.*)\](.)';
// $pattern = addslashes('%' . $subpattern1 . '|' . $subpattern2 . '%U');
$pattern = '%' . $subpattern1 . '|' . $subpattern2 . '%U';

$matches = array();
preg_match_all($pattern, $input, $matches, PREG_SET_ORDER|PREG_OFFSET_CAPTURE);
// echo '<pre>';
echo PHP_EOL; print_r($input);
echo PHP_EOL; print_r($subpattern1);
echo PHP_EOL; print_r($subpattern2);
echo PHP_EOL; print_r($pattern);
echo PHP_EOL; print_r($matches);

/* Preg split 2 * /

$input = '[TextColor:255,0,0]p [/TextColor][TextColor:0,255,0][3 - 18][Font:Arial,BI,15]Panda Aligator[/Font][/TextColor]';
// $input = 'Panda aligator allouette';

$asSubPattern = array();
$asSubPattern[] = '(\[TextColor:.*\])';
$asSubPattern[] = '(\[/TextColor\])';
$asSubPattern[] = '(\[Font:.*\])';
$asSubPattern[] = '(\[/Font\])';

$sPattern = implode('|', $asSubPattern);
$sPattern = '%' . $sPattern . '%U';

$parts = preg_split($sPattern, $input, -1, PREG_SPLIT_DELIM_CAPTURE|PREG_SPLIT_NO_EMPTY);
// $parts = preg_split($pattern, $input);

echo '<pre>';
echo PHP_EOL; print_r($input);
echo PHP_EOL; print_r($parts);


/* Php info * /
phpinfo();


/* Datas * /
echo '<pre>';
print_r(get_html_translation_table());


/* Session Explorer * /

session_start();
echo '<pre>';

echo PHP_EOL . 'Easy3p_3.13.6 : ';
echo PHP_EOL . 'easyV_Prod_SITyIdx : ' . (!isset($_SESSION['Easy3p_3.13.6']['easyV_Prod_SITyIdx']) ? '-' : $_SESSION['Easy3p_3.13.6']['easyV_Prod_SITyIdx']);
echo PHP_EOL . 'easyV_ShIn_SITyIdx : ' . (!isset($_SESSION['Easy3p_3.13.6']['easyV_ShIn_SITyIdx']) ? '-' : $_SESSION['Easy3p_3.13.6']['easyV_ShIn_SITyIdx']);
echo PHP_EOL . 'Easy3p_3.15.0 : ';
echo PHP_EOL . 'easyV_Prod_SITyIdx : ' . (!isset($_SESSION['Easy3p_3.15.0']['easyV_Prod_SITyIdx']) ? '-' : $_SESSION['Easy3p_3.15.0']['easyV_Prod_SITyIdx']);
echo PHP_EOL . 'easyV_ShIn_SITyIdx : ' . (!isset($_SESSION['Easy3p_3.15.0']['easyV_ShIn_SITyIdx']) ? '-' : $_SESSION['Easy3p_3.15.0']['easyV_ShIn_SITyIdx']);
echo PHP_EOL .  PHP_EOL;
print_r($_SESSION);


/* Server * /
echo '<pre>';
print_r($_SERVER);


/* Test ==  * /

$bInput1 = '5';
$bInput2 = 5;

echo '<pre>';
var_dump($bInput1 == $bInput2);
var_dump($bInput1 === $bInput2);

/* Sort * /

function ksortRecursive(&$array, $sort_flags = SORT_REGULAR) {
    if (!is_array($array)) return false;
    ksort($array, $sort_flags);
    foreach ($array as &$arr) {
        ksortRecursive($arr, $sort_flags);
    }
    return true;
}

$disorder = array(
	12 => array(5 => 'a', 6 => 'b', 2 => 'c'),
	13 => array(1 => 'd', 2 => 'e', 4 => 'f'),
	11 => array(3 => 'g', 2 => 'h', 1 => 'i'),
);

ksortRecursive($disorder);
echo '<pre>';
echo PHP_EOL . ' --- ';
print_r($disorder);
die('x_x');

/* AES crypt * /
$p_sClear = 't2GfK5okGq8T';
$sPassword = md5('mR3m');
$sEncoded = base64_encode(openssl_encrypt($p_sClear, 'AES-128-CBC', $sPassword, 0, '0123456789abcdef'));
echo '<pre>';
var_dump($p_sClear);
echo PHP_EOL . ' --- ';
var_dump('Nota : expected is "PSIJv8FxFdWtH84gHm7fht5vaYLZhydhO6rVMc4BtiI="');
echo PHP_EOL . ' --- ';
var_dump($sPassword);
echo PHP_EOL . ' --- ';
var_dump($sEncoded);
die('x_x');

/* Sting Pos * /

$sTmpNom = 'something - something else + something i dont need';
$iLastSeparatorPos = strrpos($sTmpNom, ' - ');
$sNumNom = $iLastSeparatorPos !== false ? substr($sTmpNom, 0, $iLastSeparatorPos) : $sTmpNom;
$sFiliCode = $iLastSeparatorPos !== false ? substr($sTmpNom, $iLastSeparatorPos + 3) : '';

$replacement = 'something i do need';
$final = $sNumNom . ' - ' . $replacement;

echo PHP_EOL . ' --- ';
var_dump($sTmpNom);
echo PHP_EOL . ' --- ';
var_dump($iLastSeparatorPos);
echo PHP_EOL . ' --- ';
var_dump($sNumNom);
echo PHP_EOL . ' --- ';
var_dump($sFiliCode);
echo PHP_EOL . ' --- ';
var_dump($final);

/* Bitwise * /

// formatage
$format = '(%1$2d = %1$04b) = (%2$2d = %2$04b)'
        . ' %3$s (%4$2d = %4$04b)' . "\n";

echo <<<EOH
 ---------     ---------  -- ---------
 resultat       valeur        test
 ---------     ---------  -- ---------
EOH;

// exemples
$values = array(0, 1, 3, 00, 01, 11, '00', '01', '11');
$test = 2;

echo "\n Bitwise AND \n";
foreach ($values as $value) {
    $result = $value & $test;
    printf($format, $result, $value, '&', $test);
}

echo "\n Bitwise Inclusive OR \n";
foreach ($values as $value) {
    $result = $value | $test;
    printf($format, $result, $value, '|', $test);
}

echo "\n Bitwise Exclusive OR (XOR) \n";
foreach ($values as $value) {
    $result = $value ^ $test;
    printf($format, $result, $value, '^', $test);
}

/* Variable variable * /

$DIM_1 = 150;
// $DIM_2 = 300;
$DIM_3 = 435;
$mDimL = 'dimL';
$mDimH = 'dimH';
$mDimP = 'dimP';
$mDimD = 'dimD'; 
                        
$sDimNode = 'XDP';
 // TODO this needs to be fed with the new node COD_DIM_ORDER

$asDimensions = str_split($sDimNode);
$iDimData = 0;
foreach ($asDimensions as $sDimension)
{
    ++$iDimData;
    $iDimValue = isset(
    ${"mDim$sDimension"} = ${"DIM_$iDimData"};
}
echo PHP_EOL . $mDimH;
echo PHP_EOL . $mDimP;
echo PHP_EOL . $mDimD;

/* Array merge * /

$one = array(13 => 'white', 14 => 'blue', 15 =>'black');
$two = array(13 => 'white', 14 => 'blue', 15 => 'blaK', 16 => 'red', 17 => 'green');

print '<pre>';
print_r($one+$two);
print_r($two+$one);
print_r(array_merge($one, $two));

$two += $one;
print '<pre>';
print_r($one+$two);
print_r(array_merge($one, $two));

$one = array('white', 'blue', 'black');
$two = array();

print '<pre>';
print_r(array_merge($one, $two));

/* Array array_intersect * /

$one = array(13 => 'white', 14 => 'blue', 15 =>'black');
$two = array(13 => 'white', 14 => 'blue', 15 => 'blaK', 16 => 'red', 17 => 'green');

print '<pre>';
print_r(array_intersect($one, $two));

/* Array filter * /

$out = array(14, 15, 17);
$data = array(13 => 'white', 14 => 'blue', 15 => 'blaK', 16 => 'red', 17 => 'green');

print '<pre>';
print_r(array_intersect($one, $two));

/* log formating * /
$input = 'INSERT INTO easy_exportvmedia             (    Fl,In, "dataL", \'tcsv\', text )     VALUES (         30.11,        50,  \'1,2,3\',            "\'un\', \'deux\', \'trois\'",     "lorem ipsum, \"dolor\" sit amet")';

$sOutput = $input;
$count = 1;
while ($count != 0) {
    $sOutput = str_replace('  ', ' ', $sOutput, $count);
}

$asMatches = array();
preg_match('%INSERT INTO (\w+)\s?\(([\w, ]+)\)\s?VALUES\s\((.*)\)%sm', $sOutput, $asMatches);
if (count($asMatches) == 4)
{
    $asCols = explode(',', $asMatches[2]);
    $asVals = explode(',', $asMatches[3]);

    $sOutput1 =         'INSERT INTO ' . $asMatches[1] . ' (';
    $sOutput2 = str_pad('VALUES', strlen($sOutput1)-2) . ' (';
    for($k = 0; $k<count($asCols); $k++) {
        $pad = 1+max(strlen($asCols[$k]), strlen($asVals[$k]));
        $sOutput1 .= str_pad($asCols[$k], $pad, ' ', STR_PAD_LEFT);
        $sOutput2 .= str_pad($asVals[$k], $pad, ' ', STR_PAD_LEFT);
    }

    $sOutput = PHP_EOL . substr($sOutput1, 0, -1) . ') ' . PHP_EOL . substr($sOutput2, 0, -1) . ');';
}

echo PHP_EOL . "Insert query : [" . $input . "]";
echo PHP_EOL . "Insert query : [" . $sOutput . "]";
/**/
