<?
function countEven($num) {
    $counter = 0;
    while ($num != 0) {
        $n = (int)($num % 10);
        if ($n % 2 == 0) {
            $counter += 1;
        }
        $num = (int)($num /= 10);
    }
    return $counter;
}

$n = readline();
for ($i = 0; $i < $n; $i++) {
    $num = readline();
    echo countEven($num) . "\n";
}
?>