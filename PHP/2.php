<?php
function countRounds($teams) {
    if ($teams == 1) {
        return 0;
    }
    elseif ($teams % 2 == 0) {
        $matches = $teams / 2;
        return $matches + countRounds($matches); 
    }
    else {
        $matches = ($teams - 1) / 2;
        return $matches + countRounds($matches+1);
    }
}

$total_teams = readline();
echo countRounds($total_teams);
?>