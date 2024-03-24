<?php
include('../admin/db.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>customer list</title>
    <link rel="stylesheet" href="cus_info_display.css">
 
</head>
<body>
<form class="example" action="">
  <button type="submit"><i class="fa fa-search"></i></button>
  <input type="text" placeholder="Search.." name="search">
  
</form>
    <table id="customers">
    <caption style="font-size: 30px;">Persons List</caption> 
        <tr>
            <th>Person ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
        </tr>
    <?php
     if ($conn->connect_error) { 
        die("Connection failed: " . $conn->connect_error); 
    } 
    
    // SQL QUERY 
    $query = "SELECT * FROM `persons`"; 
    
    // FETCHING DATA FROM DATABASE 
    $result = $conn->query($query); 
    

        if ($result->num_rows > 0)  
      { 
          // OUTPUT DATA OF EACH ROW 
          while($row = $result->fetch_assoc()) 
          { 
            $id   = $row['PersonID'];
            $fname = $row['FirstName'];
            $lname = $row['LastName'];
            $age = $row['Age']; 
            echo "<tr><td>".$id."</td><td>".$fname."</td><td>".$lname."</td><td>".$age."</td></tr>"; 
          } 
      }  
      else { 
          echo "0 results"; 
      }
      
    
     $conn->close(); 
    ?> 
    </table> 
</body>
</html>