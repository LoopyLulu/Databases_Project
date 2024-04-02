<?php 
echo "help";
require("connect-db.php");
require("snack-db.php");

$snack_to_update = null;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  if (!empty($_POST['addBtn'])) {
      $allergens = isset($_POST['allergens']) ? 1 : 0;
      addSnack($_POST['snackName'], $_POST['ingredients'], $allergens, $_POST['allergenList']);
      $list_of_snacks = getAllSnacks();
  }
  else if (!empty($_POST['updateBtn'])) {
      $snack_to_update = getSnackById($_POST['snackId']);
  }   
  else if (!empty($_POST['cofmBtn'])) {
     $allergens = isset($_POST['allergens']) ? 1 : 0;
     updateSnack($_POST['cofm_snackId'], $_POST['snackName'], $_POST['ingredients'], $allergens, $_POST['allergenList']);
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
  <title>Snack Allergens</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">  
  <link rel="stylesheet" href="snack-system.css">  
</head>
<body>  
<?php include("header.php"); ?>

<div class="container">
  <div class="row g-3 mt-2">
    <div class="col">
      <h2>Snack Information</h2>
    </div>  
  </div>
  
  <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
    <div class='mb-3'>
      Snack Name:
      <input type='text' class='form-control' id='snackName' name='snackName' placeholder='Enter snack name' value="<?php if ($snack_to_update != null) echo $snack_to_update['Sname']; ?>" />
    </div>
    <div class='mb-3'>
      Ingredients:
      <input type='text' class='form-control' id='ingredients' name='ingredients' placeholder='List ingredients separated by commas' value="<?php if ($snack_to_update != null) echo $snack_to_update['ingredients']; ?>" />
    </div>
    <div class='mb-3'>
      Allergens:
      <div class="checkbox">
        <label><input type="checkbox" name="allergens" value="1" <?php if ($snack_to_update != null && $snack_to_update['allergens']) echo 'checked'; ?>> Contains allergens</label>
      </div>
      Select allergens (if applicable):
      <div class="checkbox">
        <label><input type="checkbox" name="allergenList[]" value="Milk"> Milk</label>
        <label><input type="checkbox" name="allergenList[]" value="Eggs"> Eggs</label>
        <label><input type="checkbox" name="allergenList[]" value="Fish"> Fish</label>
        <label><input type="checkbox" name="allergenList[]" value="Shellfish"> Shellfish </label>
        <label><input type="checkbox" name="allergenList[]" value="Treenuts"> Treenuts </label>
        <label><input type="checkbox" name="allergenList[]" value="Peanuts"> Peanuts </label>
        <label><input type="checkbox" name="allergenList[]" value="Wheat"> Wheat </label>
        <label><input type="checkbox" name="allergenList[]" value="Soy"> Soy </label>
        <label><input type="checkbox" name="allergenList[]" value="Sesame"> Sesame </label>
        <!-- Add other allergens as needed -->
      </div>
    </div>
    <input type="submit" value="Add Snack" id="addBtn" name="addBtn" class="btn btn-dark" />
    <?php if ($snack_to_update): ?>
    <input type="submit" value="Confirm Update" id="cofmBtn" name="cofmBtn" class="btn btn-primary" />
    <input type="hidden" value="<?php echo $snack_to_update['snack_ID']; ?>" name="cofm_snackId" />
    <?php endif; ?>
    <input type="reset" value="Clear form" name="clearBtn" id="clearBtn" class="btn btn-secondary" />
  </form>
</div>

<hr/>
<div class="container">
<h3>List of Snacks</h3>
<div class="row justify-content-center">  
<table class="w3-table w3-bordered w3-card-4 center" style="width:100%">
  <thead>
  <tr style="background-color:#B0B0B0">
    <th>Snack Name</th>
    <th>Ingredients</th>        
    <th>Allergens</th> 
    <th>Update?</th>
    <th>Delete?</th>
  </tr>
  </thead>
  <?php foreach ($list_of_snacks as $snack): ?>
  <tr>
    <td><?php echo $snack['Sname']; ?></td>
    <td><?php echo $snack['ingredients']; ?></td>
    <td><?php echo $snack['allergens'] ? 'Yes' : 'No'; ?></td>
    <td>
      <form action="<?php $_SERVER['PHP_SELF'] ?>" method="post">
        <input type="submit" value="Update" name="updateBtn" class="btn btn-primary btn-sm"/>
        <input type="hidden" name="snackId" value="<?php echo $snack['snack_ID']; ?>"/>
      </form>
    </td>
    <td>
      <form action="<?php $_SERVER['PHP_SELF'] ?>" method="post">
        <input type="submit" value="Delete" name="deleteBtn" class="btn btn-danger btn-sm" onClick="return confirm('Are you sure you want to delete?')"/>
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

