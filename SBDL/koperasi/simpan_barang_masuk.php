<?php

include 'koneksi_barang.php';

$kd_masuk = $_POST['kd_masuk'];
$tgl_masuk = $_POST['tgl_masuk'];
$kd_barang = $_POST['kd_barang'];
$hrg_beli = $_POST['hrg_beli'];
$jml_masuk = $_POST['jml_masuk'];

$query = "INSERT INTO struktur_barang_masuk VALUES ('$kd_masuk','$tgl_masuk','$kd_barang','$hrg_beli','jml_masuk')";
$result = mysqli_query($con, $query);

if($result){
	echo"<script>
			alert('input data sukses');
	</script>";
	echo"<meta http-equiv='refresh' content='1;url=view_detail_barang_masuk.php'>";
} else {
	echo"<script>
			alert('input data gagal');
	</script>";
}
?>