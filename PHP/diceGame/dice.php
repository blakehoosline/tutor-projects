<?php

$Dice = array();
$Dice[0] = mt_rand(1, 6);
$Dice[1] = mt_rand(1, 6);
$Dice[2] = mt_rand(1, 6);
$Dice[3] = mt_rand(1, 6);
$Dice[4] = mt_rand(1, 6);

$player = $Dices[0] + $Dices[1];
$com = $Dices[2] + $Dices[3] + $Dices[4];


if ($player > $com) {
    $result = "You Win";
} elseif ($player < $com) {
    $result = "Com Win";
} else {
    $result = "Tie";
} ?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Homepage</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
</head>

<body>
    <header>
        <?php include '../includes/header.php' ?>
    </header>
    <nav>
        <?php include '../includes/nav.php' ?>
    </nav>
    <main>
        <h2>Dice Roller Game</h2>
        <p>Your Score:
            <?= $player ?>
        </p>
        <p>
        <div style="display: inline-block;">
            <?php
            switch ($Dice[0]) {
                case 1:
                    echo '<img src="/images/dice1.png">';
                    break;
                case 2:
                    echo '<img src="/images/dice2.png">';
                    break;
                case 3:
                    echo '<img src="/images/dice3.png">';
                    break;
                case 4:
                    echo '<img src="/images/dice4.png">';
                    break;
                case 5:
                    echo '<img src="/images/dice5.png">';
                    break;
                case 6:
                    echo '<img src="/images/dice6.png">';
                    break;
            }

            switch ($Dice[1]) {
                case 1:
                    echo '<img src="/images/dice1.png ">';
                    break;
                case 2:
                    echo '<img src="/images/dice2.png">';
                    break;
                case 3:
                    echo '<img src="/images/dice3.png">';
                    break;
                case 4:
                    echo '<img src="/images/dice4.png">';
                    break;
                case 5:
                    echo '<img src="/images/dice5.png">';
                    break;
                case 6:
                    echo '<img src="/images/dice6.png">';
                    break;
            }
            ?>
        </div>
        </p>
        <p>Computers score:
            <?= $com ?>
        </p>
        <p>
        <div style="display: inline-block;">
            <?php
            switch ($Dice[2]) {
                case 1:
                    echo '<img src="/images/dice1.png">';
                    break;
                case 2:
                    echo '<img src="/images/dice2.png">';
                    break;
                case 3:
                    echo '<img src="/images/dice3.png">';
                    break;
                case 4:
                    echo '<img src="/images/dice4.png">';
                    break;
                case 5:
                    echo '<img src="/images/dice5.png">';
                    break;
                case 6:
                    echo '<img src="/images/dice6.png">';
                    break;
            }
            switch ($Dice[3]) {
                case 1:
                    echo '<img src="/images/dice1.png">';
                    break;
                case 2:
                    echo '<img src="/images/dice2.png">';
                    break;
                case 3:
                    echo '<img src="/images/dice3.png">';
                    break;
                case 4:
                    echo '<img src="/images/dice4.png">';
                    break;
                case 5:
                    echo '<img src="/images/dice5.png">';
                    break;
                case 6:
                    echo '<img src="/images/dice6.png">';
                    break;
            }
            switch ($Dice[4]) {
                case 1:
                    echo '<img src="/images/dice1.png">';
                    break;
                case 2:
                    echo '<img src="/images/dice2.png">';
                    break;
                case 3:
                    echo '<img src="/images/dice3.png">';
                    break;
                case 4:
                    echo '<img src="/images/dice4.png">';
                    break;
                case 5:
                    echo '<img src="/images/dice5.png">';
                    break;
                case 6:
                    echo '<img src="/images/dice6.png">';
                    break;
            }
            ?>
        </div>
        </p>
        <p>Result:
            <?= $result ?>
        </p>

    </main>
    <footer>
        <?php include '../includes/footer.php' ?>
    </footer>
</body>

</html>
