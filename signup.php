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
    if(empty(trim($_POST["Username"]))){
        $username_error_message = "Username can not be blank!";
    }
    
    else{
        $username = trim($_POST["Username"]);
    }
    
    // Check if the password field is empty
    if(empty(trim($_POST["Password"]))){
        $password_error_message = "Password can not be empty!";
    }
    
    else{
        $password = trim($_POST["Password"]);
    }
    
    // Check the database
    if(empty($username_error_message) && empty($password_error_message)){

        $insert_statement = "INSERT INTO Project_Login_Password (username, password) VALUES (:Username, :Password)";

        $prepared_insert_statement = $db->prepare($insert_statement);

        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        $prepared_insert_statement->bindValue(':Username', $username);
        $prepared_insert_statement->bindValue(':Password', $hashed_password);

        $prepared_insert_statement->execute();
        $prepared_insert_statement->closeCursor();


        header("location: signin.php");
    }
  
// Close connection
$db->close();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up!</title>
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
    <h1>Sign Up</h1>
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