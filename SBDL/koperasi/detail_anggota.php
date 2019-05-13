<?php
include("koneksi_barang.php");
?>
<a href="index.php">Home</a>
<h3 align="center">Data Anggota</h3>
<div class="table-responsive">
<table border="1" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <th>No.</th>
        <th>Kode Pelanggan</th>
        <th>Nama Anggota</th>
        <th>Alamat</th>
        <th>Telepon</th>           
    </tr>
<?php
    $no=1;
    $kd= $_GET['Kd_Pelanggan'];
    $query=("SELECT * FROM struktur_anggota WHERE Kd_Pelanggan='$kd'");
    $lihat = mysqli_query($con, $query) or die('Error, query failed. ' . mysqli_error());
    $jml_data=mysqli_num_rows($lihat);
    while($r=mysqli_fetch_array($lihat)){
?>
    <tr>
        <td><?php echo"$no.";?></td>
        <td><?php echo"$r[Kd_Pelanggan]";?></td>
        <td><?php echo"$r[Nm_Anggota]";?></td>
        <td><?php echo"$r[Almt_Anggota]";?></td>
        <td><?php echo"$r[Telp_Anggota]";?></td>
          
    </tr>
<?php 
$no++;
} ?>
</table>

</div>