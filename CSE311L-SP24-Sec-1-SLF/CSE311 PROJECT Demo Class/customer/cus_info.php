<?php 
include('../admin/db.php');
if(isset($_POST["sub"])){

    $s_id=$_POST['student_id'];
    $s_name=$_POST['student_name'];
    $s_semester=$_POST['semester'];
    $s_number=$_POST['number'];
    $insert_query= "insert into `Student_Details` ('student_id','student_name', 'semester' ,'number') values( '$s_id', '$s_name','$s_semester',$s_number')";
    $result= mysqli_query($conn,$insert_query);
    if($result){
        echo "Student Details has been inserted successfully";
    } 
    else{   
        echo "Failed!";
    }
}
?>
