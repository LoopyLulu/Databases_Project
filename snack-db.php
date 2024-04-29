<?php
require("connect-db.php");

function getFilteredSnacks($excludedAllergens)
{
    global $db;

    $query = "SELECT * FROM Project_Snack natural join Project_MakesSnacks natural join Project_Company WHERE snack_ID NOT IN (SELECT SnackID FROM Project_ContainsAllergen WHERE ";

    $conditions = [];
    foreach ($excludedAllergens as $allergen) {
        $conditions[] = "$allergen = 1";
    }

    // Join all conditions with OR (since we want to exclude snacks that have any of these allergens)
    $query .= implode(' OR ', $conditions);

    $query .= ")";

	// echo $query;

    try {
        $statement = $db->prepare($query);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}


function addSnack($snackName, $ingredients, $allergens, $allergenList) {
   global $db; // Database connection

   try {
       $query1 = "INSERT INTO Project_Snack (Sname, ingredients, allergens) VALUES (:snackName, :ingredients, :allergens)";
       $statement1 = $db->prepare($query1);
       $statement1->bindValue(':snackName', $snackName);
       $statement1->bindValue(':ingredients', $ingredients);
       $statement1->bindValue(':allergens', $allergens);
       $statement1->execute();

       $snackID = $db->lastInsertId();
       $statement1->closeCursor();
       
       $query2 = "INSERT INTO Project_ContainsAllergen (SnackID) VALUES (:snackID)";
       $statement2 = $db->prepare($query2);
       $statement2->bindValue(':snackID', $snackID);
       $statement2->execute();
       $statement2->closeCursor();

       
       foreach ($allergenList as $allergen) {
           $query3 = "UPDATE Project_ContainsAllergen SET $allergen = 1 WHERE SnackID = :snackID";
           $statement3 = $db->prepare($query3);
           $statement3->bindValue(':snackID', $snackID);
           $statement3->execute();
           $statement3->closeCursor();
       }
   } catch (PDOException $e) {
       echo "Error: " . $e->getMessage();
   }
}

function getAllSnacks()
{
    global $db;

    try {
	$query = "select * from Project_Snack natural join Project_MakesSnacks natural join Project_Company";
        $statement = $db->prepare($query);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();

        return $result;
    }catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}

function getSnackById($id)
{
   global $db;
   
   try {
   $query = "SELECT * FROM Project_Snack WHERE snack_ID=:id";
   $statement = $db->prepare($query);
   $statement->bindValue(':id', $id);
   $statement->execute();
   $result = $statement->fetch();
   $statement->closeCursor();

   return $result;

   } catch (PDOException $e) {
       echo "Error: " . $e->getMessage();
   }
}

function updateSnack($snackId, $snackName, $ingredients, $allergens, $allergenList)
{
    global $db;

    try {
    // reset all to 0
    $query2 = "UPDATE Project_ContainsAllergen SET milk=0, eggs=0, fish=0, shellfish=0, tree_nuts=0, peanuts=0, wheat=0, soybeans=0, sesame=0 WHERE SnackID=:snackId";
    $statement2 = $db->prepare($query2);
    $statement2->bindValue(':snackId', $snackId);
    $statement2->execute();
    $statement2->closeCursor();
    
    $query = "UPDATE Project_Snack SET Sname=:snackName, ingredients=:ingredients, allergens=:allergens WHERE snack_ID=:snackId";

    $statement = $db->prepare($query);
    $statement->bindValue(':snackId', $snackId);
    $statement->bindValue(':snackName', $snackName);
    $statement->bindValue(':ingredients', $ingredients);
    $statement->bindValue(':allergens', $allergens);

    $statement->execute();
    $statement->closeCursor();


    // re-update the list
    foreach ($allergenList as $allergen) {
        $query3 = "UPDATE Project_ContainsAllergen SET $allergen=1 WHERE SnackID=:snackId";
        $statement3 = $db->prepare($query3);
        $statement3->bindValue(':snackId', $snackId);
        $statement3->execute();
        $statement3->closeCursor();
    }

   } catch (PDOException $e) {
       echo "Error: " . $e->getMessage();
   }
}

function deleteSnack($snackId)
{
   global $db;

   $query1 = "DELETE FROM Project_ContainsAllergen WHERE SnackID=:snackId";
   $statement1 = $db->prepare($query1);
   $statement1->bindValue(':snackId', $snackId);
   $statement1->execute();
   $statement1->closeCursor();

   $query2 = "DELETE FROM Project_Snack WHERE snack_ID=:snackId";
   $statement2 = $db->prepare($query2);
   $statement2->bindValue(':snackId', $snackId);
   $statement2->execute();
   $statement2->closeCursor();

}

function favoriteSnack($snackId)
{
   global $db;
       if (isset($_SESSION['Loggedin']) && $_SESSION['Loggedin']) {

           $query1 = "INSERT INTO Project_FavoritesTable (userID, snack_ID) VALUES (:userID, :snack_ID)";
           $statement1 = $db->prepare($query1);
           $statement1->bindValue(':userID', $_SESSION['UserID']);
           $statement1->bindValue(':snack_ID', $snackId);
           $statement1->execute();
           $statement1->closeCursor();
       }else{
           echo('Please login to use the favorite function!');
	}
}
   
