<?php
include("koneksi_barang.php");
//menangkap variabel idbuku yang di kirim oleh view.php untuk di hapus
$Kd_barang=$_GET[Kd_barang];
 
//query untuk menghapus data
$query="delete from stuktur_barang WHERE Kd_barang='$Kd_barang'";
$exe=mysql_query($query);
 
//laporan untuk data yang dihapus
//berhasil atau tidak data dihapus
if ($exe){
    echo "<script>alert('Data Berhasil Dihapus')
    location.replace('view_barang.php')</script>";
}else{
    echo "<script>alert('Data Gagal Dihapus')
    location.replace('view_barang.php')</script>";
}
?>