<?php

include 'koneksi_barang.php';

$Kd_jenis = $_POST['Kd_jenis'];
$Nm_Jenis = $_POST['Nm_Jenis'];

$query = "INSERT INTO struktur_kd_jenis VALUES ('$Kd_jenis','$Nm_Jenis')";
$result = mysqli_query($con, $query);

if($result){
	echo"<script>
			alert('input data sukses');
	</script>";
	echo"<meta http-equiv='refresh' content='1;url=view_jenis.php'>";
} else {
	echo"<script>
			alert('input data gagal');
	</script>";
}
?>