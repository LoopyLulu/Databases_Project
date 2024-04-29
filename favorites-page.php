<?php 
require("connect-db.php");
require("favorites-db.php");

$list_of_snacks = getAllFavorites(); 

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (!empty($_POST['unFavBtn'])) {
    unfavoriteSnack($_POST['userID'], $_POST['snackId']);
    $list_of_snacks = getAllFavorites();
  }
}
else {
  $list_of_snacks = getAllFavorites();
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

</body>
</html>

