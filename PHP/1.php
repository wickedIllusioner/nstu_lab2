<?php
function task1($s) {
    $n = strlen($s);
    $steps = [];
    $current = "";
    
    for ($i = (int)($n / 2); $i > 0; $i--) {
        if (substr($s, 0, $i) === substr($s, $i, $i)) {
            for ($j = 0; $j < $i; $j++) {
                $current .= $s[$j];
                $steps[] = $current;
            }
            $current .= $current;
            $steps[] = $current;
            $current = "";
            for ($j = 2 * $i; $j < $n; $j++) {
                $current .= $s[$j];
                $steps[] = $current;
            }
            return [$i + 1 + ($n - 2 * $i), $steps];
        }
    }
    
    for ($k = 0; $k < $n; $k++) {
        $current .= $s[$k];
        $steps[] = $current;
    }
    return [$n, $steps];
}

$input = readline();
list($count, $steps) = task1($input);

echo "$count = " . implode("->", $steps);
echo "\n";
?>
