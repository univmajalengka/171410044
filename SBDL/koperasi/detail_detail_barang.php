<?php
include("koneksi_barang.php");
?>
<a href="index.php">Home</a>
<h3 align="center">Data Anggota</h3>
<div class="table-responsive">
<table border="1" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <th>No.</th>
        <th>Kode Jual</th>
        <th>Kode Barang</th>
        <th>Harga Jual</th>
        <th>Jumlah Jual</th>
        <th>Toatl Jual</th>         
    </tr>
<?php
    $no=1;
    $kd= $_GET['kd_jual'];
    $query=("SELECT * FROM struktur_detail_transaksi WHERE kd_jual='$kd'");
    $lihat = mysqli_query($con, $query) or die('Error, query failed. ' . mysqli_error());
    $jml_data=mysqli_num_rows($lihat);
    while($r=mysqli_fetch_array($lihat)){
?>
    <tr>
        <td><?php echo"$no.";?></td>
        <td><?php echo"$r[kd_jual]";?></td>
        <td><?php echo"$r[kd_barang]";?></td>
        <td><?php echo"$r[hrg_jual]";?></td>
        <td><?php echo"$r[jml_jual]";?></td>
        <td><?php echo"$r[total_jual]";?></td>
          
    </tr>
<?php 
$no++;
} ?>
</table>

</div>