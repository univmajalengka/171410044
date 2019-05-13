<?php

include 'koneksi_login.php';

$username = $_POST['username'];
$password = $_POST['password'];

$query = "INSERT INTO id_user VALUES ('$username','$password')";
$result = mysqli_query($conn, $query);

if($result){
	echo"<script>
			alert('input data sukses');
	</script>";
} else {
	echo"<script>
			alert('input data gagal');
	</script>";
}
?>