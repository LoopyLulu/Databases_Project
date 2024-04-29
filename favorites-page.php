<?php 
require("connect-db.php");
require("favorites-db.php");

$snack_to_update = null;
$allergens = ['milk', 'eggs', 'fish', 'shellfish', 'tree_nuts', 'peanuts', 'wheat', 'soybeans', 'sesame'];

$list_of_snacks = getAllSnacks(); 

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['filterBtn'])) {
    $excludedAllergens = [];
    //foreach (['milk', 'eggs', 'fish', 'shellfish', 'tree_nuts', 'peanuts', 'wheat', 'soybeans', 'sesame'] as $allergen) {
    foreach ($allergens as $allergen) {
        if (!empty($_POST[$allergen])) {
            $excludedAllergens[] = $allergen;
        }
    }
    if (!empty($excludedAllergens)) {
        $list_of_snacks = getFilteredSnacks($excludedAllergens);
    } else {
        $list_of_snacks = getAllSnacks();
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  if (!empty($_POST['addBtn'])) {
      $allergens = isset($_POST['allergens']) ? 1 : 0;
      $allergenList = isset($_POST['allergenList']) ? $_POST['allergenList'] : [];
      addSnack($_POST['snackName'], $_POST['ingredients'], $allergens, $allergenList);
      $list_of_snacks = getAllSnacks();
  }
  else if (!empty($_POST['updateBtn'])) {
      $snack_to_update = getSnackById($_POST['snackId']);
  }   
  else if (!empty($_POST['cofmBtn'])) {
     $allergens = isset($_POST['allergens']) ? 1 : 0;
     $allergenList = isset($_POST['allergenList']) ? $_POST['allergenList'] : [];
     updateSnack($_POST['cofm_snackId'], $_POST['snackName'], $_POST['ingredients'], $allergens, $allergenList);
     $list_of_snacks = getAllSnacks();
  }
  else if (!empty($_POST['deleteBtn'])) {
    deleteSnack($_POST['snackId']);
    $list_of_snacks = getAllSnacks();
  }
}
else {
  $list_of_snacks = getAllSnacks();
}
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">    
  <title>Favorites Page</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">  
  <link rel="stylesheet" href="snack-system.css">  
</head>
<body>  
<?php include("header.php"); ?>

<div class="container">
  <div class="row g-3 mt-2">
    <div class="col">
      <h2>Favorites</h2>
    </div>  
  </div>
</div>

<hr/>
<div class="container">
<h3>Favorite Snacks</h3>
<table class="w3-table w3-bordered w3-card-4 center" style="width:100%">
  <thead>
  <tr style="background-color:#B0B0B0">
    <th>Snack Name</th>
    <th>Ingredients</th>        
    <th>Allergens</th> 
    <th>Unfavorite?</th>
  </tr>
  </thead>
  <?php foreach ($list_of_snacks as $snack): ?>
  <tr>
    <td><?php echo $snack['Sname']; ?></td>
    <td><?php echo $snack['ingredients']; ?></td>
    <td><?php echo $snack['allergens'] ? 'Yes' : 'No'; ?></td>

    <td>
      <form action="<?php $_SERVER['PHP_SELF'] ?>" method="post">
        <input type="submit" value="Unfavorite" name="unFavBtn" class="btn btn-danger btn-sm" onClick="return confirm('Are you sure you want to unfavorite?')"/>
        <input type="hidden" name="snackId" value="<?php echo $snack['snack_ID']; ?>"/>
      </form>
    </td>
  </tr>
  <?php endforeach; ?>
</table>

<hr/>
<div class="container">
<h3>List of Snacks</h3>
<table class="w3-table w3-bordered w3-card-4 center" style="width:100%">
  <thead>
  <tr style="background-color:#B0B0B0">
    <th>Snack Name</th>
    <th>Ingredients</th>        
    <th>Allergens</th> 
    <th>Favorite?</th>
  </tr>
  </thead>
  <?php foreach ($list_of_snacks as $snack): ?>
  <tr>
    <td><?php echo $snack['Sname']; ?></td>
    <td><?php echo $snack['ingredients']; ?></td>
    <td><?php echo $snack['allergens'] ? 'Yes' : 'No'; ?></td>
    <td>
      <form action="<?php $_SERVER['PHP_SELF'] ?>" method="post">
        <input type="submit" value="Favorite" name="favBtn" class="btn btn-primary btn-sm"/>
        <input type="hidden" name="snackId" value="<?php echo $snack['snack_ID']; ?>"/>
      </form>
    </td>
  </tr>
  <?php endforeach; ?>
</table>
</div>
</div>
</body>
</html>

