<?php

include 'koneksi_barang.php';

$Kd_barang = $_POST['kd_barang'];
$Nm_barang = $_POST['nm_barang'];
$Satuan_barang = $_POST['satuan_barang'];
$Hrg_beli = $_POST['hrg_beli'];
$Hrg_jual = $_POST['hrg_jual'];
$Jml_barang = $_POST['jml_barang'];
$Kd_jenis = $_POST['kd_jenis'];

$query = "INSERT INTO struktur_barang VALUES ('$Kd_barang','$Nm_barang','$Satuan_barang','$Hrg_beli','$Hrg_jual','$Jml_barang','$Kd_jenis')";
$result = mysqli_query($con, $query);

if($result){
	echo"<script>
			alert('input data sukses');
	</script>";
	echo"<meta http-equiv='refresh' content='1;url=view_barang.php'>";
} else {
	echo"<script>
			alert('input data gagal');
	</script>";
}
?>