<?php 
require("connect-db.php");    // include("connect-db.php");
require("request-db.php");
?>


<?php   // form handling

$list_of_requests = getAllRequests();
// var_dump($list_of_requests);   // debug
  
if ($_SERVER['REQUEST_METHOD'] == 'POST')   // GET
{
  if (!empty($_POST['addBtn']))    // $_GET['....']
  {
      addRequests($_POST['requestedDate'], $_POST['roomNo'], $_POST['requestedBy'], $_POST['requestDesc'], $_POST['priority_option']);
      $list_of_requests = getAllRequests();
  }
  else if (!empty($_POST['updateBtn']))
  {  
      // get reqId
      $request_to_update = getRequestById($_POST['reqId']);
      // var_dump($request_to_update );
  }   
  else if (!empty($_POST['cofmBtn']))
  {
     // echo $_POST['cofm_reqId'] . ", " . $_POST['requestedDate'] .", " .  $_POST['roomNo'] .", " .  $_POST['requestedBy'] .", " .  $_POST['requestDesc'] .", " .  $_POST['priority_option']; 
     updateRequest($_POST['cofm_reqId'], $_POST['requestedDate'], $_POST['roomNo'], $_POST['requestedBy'], $_POST['requestDesc'], $_POST['priority_option']); 
     $list_of_requests = getAllRequests();
  }
  else if (!empty($_POST['deleteBtn']))
  {
    deleteRequest($_POST['reqId']);
    $list_of_requests = getAllRequests();
  }
}

?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">    
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Upsorn Praphamontripong">
  <meta name="description" content="Maintenance request form, a small/toy web app for ISP homework assignment, used by CS 3250 (Software Testing)">
  <meta name="keywords" content="CS 3250, Upsorn, Praphamontripong, Software Testing">
  <link rel="icon" type="image/png" href="https://www.cs.virginia.edu/~up3f/cs4750/images/db-icon.png" />
  
  <title>Maintenance Services</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">  
  <link rel="stylesheet" href="maintenance-system.css">  
</head>

<body>  
<?php include("header.php"); ?>

<div class="container">
  <div class="row g-3 mt-2">
    <div class="col">
      <h2>Maintenance Request</h2>
    </div>  
  </div>
  
  <!---------------->

  <form method="post" action="<?php $_SERVER['PHP_SELF'] ?>" onsubmit="return validateInput()">
    <table style="width:98%">
      <tr>
        <td width="50%">
          <div class='mb-3'>
            Requested date:
            <input type='text' class='form-control' 
                   id='requestedDate' name='requestedDate' 
                   placeholder='Format: yyyy-mm-dd' 
                   pattern="\d{4}-\d{1,2}-\d{1,2}" 
                   value="<?php if ($request_to_update != null) echo $request_to_update['reqDate'] ?>" />
          </div>
        </td>
        <td>
          <div class='mb-3'>
            Room Number:
            <input type='text' class='form-control' id='roomNo' name='roomNo' 
            value="<?php if ($request_to_update != null) echo $request_to_update['roomNumber'] ?>" />
          </div>
        </td>
      </tr>
      <tr>
        <td colspan=2>
          <div class='mb-3'>
            Requested by: 
            <input type='text' class='form-control' id='requestedBy' name='requestedBy'
                   placeholder='Enter your name'
                   value="<?php if ($request_to_update != null) echo $request_to_update['reqBy'] ?>" />
          </div>
        </td>
      </tr>
      <tr>
        <td colspan=2>
          <div class="mb-3">
            Description of work/repair:
            <input type='text' class='form-control' id='requestDesc' name='requestDesc'
            value="<?php if ($request_to_update != null) echo $request_to_update['repairDesc'] ?>" />
        </div>
        </td>
      </tr>
      <tr>
        <td colspan=2>
          <div class='mb-3'>
            Requested Priority:
            <select class='form-select' id='priority_option' name='priority_option'>
              <option selected></option>
              <option value='high' <?php if ($request_to_update!=null && $request_to_update['reqPriority']=='high') echo ' selected="selected"' ?> >
                High - Must be done within 24 hours</option>
              <option value='medium' <?php if ($request_to_update!=null && $request_to_update['reqPriority']=='medium') echo ' selected="selected"' ?> >
                Medium - Within a week</option>
              <option value='low' <?php if ($request_to_update!=null && $request_to_update['reqPriority']=='low') echo ' selected="selected"' ?> >
                Low - When you get a chance</option>
            </select>
          </div>
        </td>
      </tr>
    </table>

    <div class="row g-3 mx-auto">    
      <div class="col-4 d-grid ">
      <input type="submit" value="Add" id="addBtn" name="addBtn" class="btn btn-dark"
           title="Submit a maintenance request" />                  
      </div>	    
      <div class="col-4 d-grid ">
      <input type="submit" value="Confirm update" id="cofmBtn" name="cofmBtn" class="btn btn-primary"
           title="Update a maintenance request" />      
      <input type="hidden" value="<?= $_POST['reqId'] ?>" name="cofm_reqId" />      
      <!-- Why need to attach this cofm_reqId? 
           Because of HTTP stateless property, $_POST['reqId'] is available to this request only. 
           To carry over the reqId to the next round of form submision, need to pass a token to the next request. 
      -->
      </div>	    
      <div class="col-4 d-grid">
        <input type="reset" value="Clear form" name="clearBtn" id="clearBtn" class="btn btn-secondary" />
      </div>      
    </div>  
    <div>
  </div>  
</form>

</div>


<hr/>
<div class="container">
<h3>List of requests</h3>
<div class="row justify-content-center">  
<table class="w3-table w3-bordered w3-card-4 center" style="width:100%">
  <thead>
  <tr style="background-color:#B0B0B0">
    <th><b>ReqID</b></th>
    <th><b>Date</b></th>        
    <th><b>Room#</b></th> 
    <th><b>By</b></th>
    <th><b>Description</b></th>        
    <th><b>Priority</b></th> 
    <th><b>Update?</b></th>
    <th><b>Delete?</b></th>
  </tr>
  </thead>
  <!-- iterate array of results, display the existing requests -->
  <?php foreach ($list_of_requests as $req_info): ?>
  <tr>
     <td><?php echo $req_info['reqId']; ?></td>
     <td><?php echo $req_info['reqDate']; ?></td>        
     <td><?php echo $req_info['roomNumber']; ?></td>          
     <td><?php echo $req_info['reqBy']; ?></td>
     <td><?php echo $req_info['repairDesc']; ?></td>        
     <td><?php echo $req_info['reqPriority']; ?></td>               
     <td>
       <form action="request.php" method="post">   <!-- get --> 
          <input type="submit" value="Update" name="updateBtn" 
                 class="btn btn-primary" /> 
          <input type="hidden" name="reqId" 
                 value="<?php echo $req_info['reqId']; ?>" /> 
       </form>
     </td>
     <td>
       <form action="request.php" method="post">   <!-- get --> 
          <input type="submit" value="Delete" name="deleteBtn" 
                 class="btn btn-danger" /> 
          <input type="hidden" name="reqId" 
                 value="<?php echo $req_info['reqId']; ?>" /> 
       </form>
     </td>
  </tr>
<?php endforeach; ?>  

</table>
</div>   


<br/><br/>

<?php // include('footer.html') ?> 

<!-- <script src='maintenance-system.js'></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>