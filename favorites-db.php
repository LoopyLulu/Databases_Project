<?php
require("connect-db.php");


function favoriteSnack($userID, $snack_ID) {
   global $db; // Database connection

   try {
       $query1 = "INSERT INTO Project_FavoritesTable (userID, snack_ID) VALUES (:userID, :snack_ID)";
       $statement1 = $db->prepare($query1);
       $statement1->bindValue(':userID', $userID);
       $statement1->bindValue(':snack_ID', $snack_ID);
       $statement1->execute();

       $snackID = $db->lastInsertId();
       $statement1->closeCursor();
      
   } catch (PDOException $e) {
       echo "Error: " . $e->getMessage();
   }
}

function getAllFavorites($userID)
{
    global $db;

    try {
        $query = "SELECT * FROM Project_FavoritesTable NATURAL JOIN Project_Snack WHERE userID = :userID";
        $statement = $db->prepare($query);
		$statement->bindValue(':userID', $userID);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();

        return $result;
    }catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}

function unfavoriteSnack($userID, $snackId)
{
   global $db;

   $query1 = "DELETE FROM Project_FavoritesTable WHERE userID=:userID AND SnackID=:snackId";
   $statement1 = $db->prepare($query1);
   $statement1->bindValue(':snackId', $snackId);
   $statement1->bindValue(':userID', $userID);
   $statement1->execute();
   $statement1->closeCursor();

}
?>

