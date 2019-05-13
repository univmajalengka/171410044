<?php

include 'koneksi_barang.php';

$kd_jual = $_POST['Kd_jual'];
$kd_pelanggan = $_POST['Kd_pelanggan'];
$tgl_jual = $_POST['Tgl_jual'];

$query = "INSERT INTO struktur_transaksi_penjualan VALUES ('$Kd_jual','$Kd_pelanggan','$Tgl_jual')";
$result = mysqli_query($con, $query);

if($result){
	echo"<script>
			alert('input data sukses');
	</script>";
	echo"<meta http-equiv='refresh' content='1;url=view_transaksi.php'>";
} else {
	echo"<script>
			alert('input data gagal');
	</script>";
}
?>