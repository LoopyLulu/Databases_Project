<?php
require("connect-db.php");

function getFilteredSnacks($excludedAllergens)
{
    global $db;

    $query = "SELECT * FROM Project_Snack WHERE snack_ID NOT IN (SELECT SnackID FROM Project_ContainsAllergen WHERE ";

    $conditions = [];
    foreach ($excludedAllergens as $allergen) {
        $conditions[] = "$allergen = 1";
    }

    // Join all conditions with OR (since we want to exclude snacks that have any of these allergens)
    $query .= implode(' OR ', $conditions);

    $query .= ")";

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

function addSnack($snackName, $ingredients, $allergens)
{
   global $db;


   try {
      #Modifying the Snack Table
      $query1 = "INSERT INTO Project_Snack (Sname, ingredients, allergens) VALUES (:snackName, :ingredients, :allergens)";
      $statement1 = $db->prepare($query);
      $statement1->bindValue(':snackName', $snackName);
      $statement1->bindValue(':ingredients', $ingredients);
      $statement1->bindValue(':allergens', $allergens);

      $statement1->execute();
      $snackId = $db->lastInsertId();
      $statement1->closeCursor();

      #Modifying the ContainsAllergen Table
      $query2 = "INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) 
                 VALUES (:snackId, :milk, :eggs, :fish, :shellfish, :tree_nuts, :peanuts, :wheat, :soybeans, :sesame)";
      $statement2 = $db->prepare($query2);

      // Default all allergens to 0 and set based on allergenList
      $defaultAllergens = array_fill_keys(['milk', 'eggs', 'fish', 'shellfish', 'tree_nuts', 'peanuts', 'wheat', 'soybeans', 'sesame'], 0);

      foreach ($allergenList as $allergen) {
          $defaultAllergens[strtolower($allergen)] = 1;
      }

      $statement2->bindValue(':snackId', $snackId);
      foreach ($defaultAllergens as $key => $value) {
          $statement2->bindValue(':' . $key, $value);
      }

      $statement2->execute();
      $statement2->closeCursor();
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
?>

