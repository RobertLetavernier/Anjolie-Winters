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
	
print_r ($csv);
