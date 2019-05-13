<?php

include 'koneksi_barang.php';

$Kd_Pelanggan = $_POST['Kd_Pelanggan'];
$Nm_Anggota = $_POST['Nm_Anggota'];
$Almt_Anggota = $_POST['Almt_Anggota'];
$Telp_Anggota = $_POST['Telp_Anggota'];

$query = "INSERT INTO struktur_anggota VALUES ('$Kd_Pelanggan','$Nm_Anggota','$Almt_Anggota','$Telp_Anggota')";
$result = mysqli_query($con, $query);

if($result){
	echo"<script>
			alert('input data sukses');
	</script>";
	echo"<meta http-equiv='refresh' content='1;url=view_anggota.php'>";
} else {
	echo"<script>
			alert('input data gagal');
	</script>";
}
?>