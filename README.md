# SISTEM-BISNIS-TOKO-BUAH

## Entity Eelationship diagram Toko Buah
![WhatsApp Image 2024-06-24 at 23 22 08](https://github.com/Febytrinita/SISTEM-BISNIS-TOKO-BUAH/assets/168648613/6f4b058b-8bdb-48d5-8246-188b79bf9c76)

## Relasi
1. Pesanan dan pelanggan (one to many)
   Relasi ini menunjukkan bahwa satu pelanggan dapat melakukan banyak pesanan. Hal ini diimplementasikan dengan menghubungkan kolom id_pelanggan pada tabel Pelanggan dengan kolom id_pelanggan pada tabel Pesanan.
2. Pesanan dan Produk (many to many)
   Relasi ini menunjukkan bahwa satu pesanan dapat memuat banyak produk, dan satu produk dapat dipesan dalam banyak pesanan. Hal ini diimplementasikan dengan menggunakan tabel perantara ItemPesanan yang menghubungkan tabel Pesanan dan Produk.
3. Produk dan ItemPesanan (one to one)
   Relasi ini menunjukkan bahwa satu item pesanan hanya dapat memuat satu produk, dan satu produk hanya dapat dipesan dalam satu item pesanan. Hal ini diimplementasikan dengan menghubungkan kolom id_produk pada tabel Produk dengan kolom id_produk pada tabel ItemPesanan.
   
# Deskripsi Toko Bunga

## Latar Belakang 
Pada jaman modern seperti sekarang banyak toko buah yang mulai menggunakan sistem informasi untuk mengelola bisnis mereka. Penggunaan teknologi informasi memungkinkan manajemen stok, transaksi penjualan, dan data pelanggan dilakukan dengan lebih efisien dan akurat. Sistem informasi yang baik dapat membantu toko buah dalam mengoptimalkan operasional, mengurangi kesalahan manusia, dan meningkatkan kepuasan pelanggan.

## Tujuan
Tujuan utama dari proyek ini adalah untuk merancang dan mengimplementasikan sistem basis data yang dapat mendukung operasional toko buah secara efisien. Sistem ini dirancang untuk:
Mengelola stok buah secara otomatis.
Mencatat transaksi penjualan secara terperinci. 
Menyediakan laporan penjualan yang komprehensif.
Mempermudah proses backup dan replikasi data untuk memastikan integritas dan ketersediaan data.

## Lingkup Proyek
Lingkup proyek ini mencakup:
Perancangan dan implementasi basis data untuk toko buah.
Implementasi proses trigger dan view untuk mengelola stok buah.
Penerapan operasi agregat dan indeks untuk meningkatkan performa query.
Penyusunan berbagai jenis query untuk mendukung analisis data dan operasional toko.
Strategi backup dengan metode dump.
Implementasi replikasi basis data untuk memastikan ketersediaan data.

## Sfesifikasi Teknis Toko Buah
Basis Data: MySQL
Bahasa Pemrograman: SQL untuk operasi basis data
Indexing: Indeks diterapkan pada kolom buah_id di tabel detail_transaksi untuk mempercepat query yang sering digunakan, seperti pencarian dan join.
View: View buah_tersedia digunakan untuk menyederhanakan query yang kompleks dengan menampilkan daftar buah yang masih tersedia untuk dijual.
Trigger: Trigger update_stok_trigger digunakan untuk otomatisasi pengurangan stok buah setiap kali terjadi transaksi penjualan.

## Skemma Basis Data
