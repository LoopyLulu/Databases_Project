<?php
require("connect-db.php");

function addSnack($snackName, $ingredients, $allergens)
{
   global $db;

   $query = "INSERT INTO Project_Snack (Sname, ingredients, allergens) VALUES (:snackName, :ingredients, :allergens)";

   try {
      $statement = $db->prepare($query);
      $statement->bindValue(':snackName', $snackName);
      $statement->bindValue(':ingredients', $ingredients);
      $statement->bindValue(':allergens', $allergens);

      $statement->execute();
      $statement->closeCursor();
   } catch (PDOException $e) {
      echo "Error: " . $e->getMessage();
   }
}

function getAllSnacks()
{
   global $db;

   $query = "SELECT * FROM Project_Snack";
   $statement = $db->prepare($query);
   $statement->execute();
   $result = $statement->fetchAll();
   $statement->closeCursor();

   return $result;
}

function getSnackById($id)
{
   global $db;

   $query = "SELECT * FROM Project_Snack WHERE snack_ID=:id";
   $statement = $db->prepare($query);
   $statement->bindValue(':id', $id);
   $statement->execute();
   $result = $statement->fetch();
   $statement->closeCursor();

   return $result;
}

function updateSnack($snackId, $snackName, $ingredients, $allergens)
{
   global $db;

   $query = "UPDATE Project_Snack SET Sname=:snackName, ingredients=:ingredients, allergens=:allergens WHERE snack_ID=:snackId";

   $statement = $db->prepare($query);
   $statement->bindValue(':snackId', $snackId);
   $statement->bindValue(':snackName', $snackName);
   $statement->bindValue(':ingredients', $ingredients);
   $statement->bindValue(':allergens', $allergens);

   $statement->execute();
   $statement->closeCursor();
}

function deleteSnack($snackId)
{
   global $db;

   $query = "DELETE FROM Project_Snack WHERE snack_ID=:snackId";

   $statement = $db->prepare($query);
   $statement->bindValue(':snackId', $snackId);

   $statement->execute();
   $statement->closeCursor();
}
?>

