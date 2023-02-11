<html>

<head>
    <title>Word Scrambler</title>
</head>

<body>
    <h1>Word Scrambler</h1>
    <?php
    // Read words from text file
    $words = file("wordbank.txt");

    // Scramble the letters of the words
    $scrambled_words = array();
    foreach ($words as $word) {
        $scrambled_words[] = str_shuffle(trim($word));
    }

    // Store scrambled words and original words in an associative array
    $word_pairs = array();
    for ($i = 0; $i < count($words); $i++) {
        $word_pairs[trim($scrambled_words[$i])] = trim($words[$i]);
    }

    // Select 10 random scrambled words
    $selected_scrambled_words = array_rand($word_pairs, 10);

    if (isset($_POST["submit"])) {
        // Check if answers are correct
        $results = array();
        for ($i = 0; $i < count($selected_scrambled_words); $i++) {
            $scrambled_word = $selected_scrambled_words[$i];
            $answer = $_POST["word_$i"];
            if ($answer == $word_pairs[$scrambled_word]) {
                $results[$scrambled_word] = "Correct";
            } else {
                $results[$scrambled_word] = "Incorrect";
            }
        }
    }
    ?>
    <form method="post">
        <?php
        // Display scrambled words on a webpage form
        for ($i = 0; $i < count($selected_scrambled_words); $i++) {
            $scrambled_word = $selected_scrambled_words[$i];
            echo "$scrambled_word: <input type='text' name='word_$i'><br>";
        }
        ?>
        <input type="submit" name="submit" value="Submit">
        <input type="submit" name="reset" value="Play Again">
    </form>
    <?php
    // Give visual feedback on the form about correct/incorrect answers
    if (isset($_POST["submit"])) {
        echo "<h2>Results</h2>";
        foreach ($results as $scrambled_word => $result) {
            echo "$scrambled_word: $result<br>";
        }
    }
    ?>
</body>

</html>
