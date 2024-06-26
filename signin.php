<?php
// Start a session
session_start();

require("connect-db.php");

$username = "";
$password = "";
$username_error_message = "";
$password_error_message = "";

// After login form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if the username field is empty
    if(empty($_POST["Username"])){
        $username_error_message = "Username can not be blank!";
    } else {
        $username = $_POST["Username"];
    }
    
    // Check if the password field is empty
    if(empty($_POST["Password"])){
        $password_error_message = "Password can not be empty!";
    } else {
        $password = $_POST["Password"];
    }
    
    // Check the database
    if(empty($username_error_message) && empty($password_error_message)){

        $get_hashed_password_statement = "SELECT password FROM Project_Login_Password WHERE username=:UsernameGet";
        $prepared_get_hash_statement = $db->prepare($get_hashed_password_statement);
        $prepared_get_hash_statement-> bindValue(':UsernameGet', $username);
        $prepared_get_hash_statement->execute();
        $hash_pass_from_database = $prepared_get_hash_statement->fetch();
        $prepared_get_hash_statement->closeCursor();

        if(password_verify($password, $hash_pass_from_database[0])){
            // Password is correct, so we login and start a new session
            session_start();
            
            $query = "SELECT userID FROM Project_Login WHERE username=:username";
            $statement = $db->prepare($query);
            $statement->bindValue(':username', $_SESSION['Username']);
            $statement->execute();
            $userID = $statement->fetch()[0];
            $statement->closeCursor();
            // Store data in session variables
            $_SESSION["Username"] = $username;
            $_SESSION["Loggedin"] = true;
            $_SESSION["UserID"] = $userID;

            // Redirect user to snack page
            header("location: snack.php");
        } else {
            // Username is not valid
            echo "Invalid username or password.";
        }

    } else {
        echo "Oops! Something went wrong. Please try again later.";
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
        label {
            margin-top: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .checkbox-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Sign In</h1>
        <label for="Username">Username:</label>
        <form action="signin.php" method="POST">
        <input type="text" id="username" name="Username" required>

        <label for="Password">Password:</label>
        <input type="text" id="password" name="Password" required>

        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
