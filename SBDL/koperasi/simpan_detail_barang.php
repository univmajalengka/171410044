<?php

include 'koneksi_barang.php';

$kd_jual = $_POST['kd_jual'];
$kd_barang = $_POST['kd_barang'];
$hrg_jual = $_POST['hrg_jual'];
$jml_jual = $_POST['jml_jual'];
$total_jual = $_POST['total_jual'];

$query = "INSERT INTO struktur_barang_masuk VALUES ('$kd_jual','$kd_barang','$hrg_jual','$jml_jual','total_jual')";
$result = mysqli_query($con, $query);

if($result){
	echo"<script>
			alert('input data sukses');
	</script>";
	echo"<meta http-equiv='refresh' content='1;url=view_detail_barang.php'>";
} else {
	echo"<script>
			alert('input data gagal');
	</script>";
}
?>