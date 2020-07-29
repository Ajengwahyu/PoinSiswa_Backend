-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jul 2020 pada 10.36
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_poin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(8, '2019_11_17_070437_poin_siswa', 3),
(16, '2019_11_17_070252_siswa', 5),
(17, '2019_11_17_070339_kelas', 5),
(18, '2019_11_17_070413_pelanggaran', 6),
(21, '2019_11_17_070437_poinsiswa', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id` int(20) NOT NULL,
  `nama_pelanggaran` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('kedisiplinan','kerapian','kerajinan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kedisiplinan',
  `poin` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pelanggaran`
--

INSERT INTO `pelanggaran` (`id`, `nama_pelanggaran`, `kategori`, `poin`, `created_at`, `updated_at`) VALUES
(2, 'Barang tertinggal', 'kedisiplinan', 15, '2019-11-17 01:31:49', '2019-11-20 07:09:53'),
(3, 'Terlambat', 'kedisiplinan', 15, '2019-11-20 07:02:18', '2019-11-20 07:02:18'),
(6, 'Tidak memakai dasi', 'kerapian', 5, '2020-02-05 22:35:50', '2020-02-05 22:35:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poin_siswa`
--

CREATE TABLE `poin_siswa` (
  `id` int(20) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_pelanggaran` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_petugas` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `poin_siswa`
--

INSERT INTO `poin_siswa` (`id`, `id_siswa`, `id_pelanggaran`, `tanggal`, `keterangan`, `id_petugas`, `created_at`, `updated_at`) VALUES
(4, 2, 3, '2019-11-20 00:00:00', 'melanggar', 1, '2019-12-05 06:55:56', '2019-12-05 06:55:56'),
(5, 2, 2, '2019-11-20 00:00:00', 'melanggar', 1, '2019-12-05 06:57:27', '2019-12-05 06:57:27'),
(6, 3, 2, '2020-02-04 00:00:00', 'xxx', 1, '2020-02-05 00:07:41', '2020-02-05 00:07:41'),
(7, 6, 6, '2020-02-06 00:00:00', 'xxx', 1, '2020-02-05 22:47:34', '2020-02-05 22:47:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(20) NOT NULL,
  `nis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_siswa` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama_siswa`, `kelas`, `created_at`, `updated_at`) VALUES
(2, 'ABC/1456/2019', 'Muhammad Asrofi', 'XI RPL 2', '2019-11-17 01:04:49', '2019-11-17 01:08:26'),
(3, '112/80/2019.1', 'Bayu Wicaksono', 'XI RPL 2', '2019-11-20 06:41:09', '2019-11-20 06:41:09'),
(6, '123', 'salwaa', 'XI RPL 2', '2020-02-05 22:34:50', '2020-02-06 23:19:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','petugas') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'petugas',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Pak Emil', 'b@b.b', '$2y$10$UumImT6oTVKXj09i8vZz9u3XJGRFG5qWvozsrveT0ybwJq.7brakK', 'admin', '2019-11-16 23:52:16', '2019-11-17 00:59:53');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `poin_siswa`
--
ALTER TABLE `poin_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_pelanggaran` (`id_pelanggaran`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `siswa_nis_unique` (`nis`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `poin_siswa`
--
ALTER TABLE `poin_siswa`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `poin_siswa`
--
ALTER TABLE `poin_siswa`
  ADD CONSTRAINT `poin_siswa_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `poin_siswa_ibfk_2` FOREIGN KEY (`id_pelanggaran`) REFERENCES `pelanggaran` (`id`),
  ADD CONSTRAINT `poin_siswa_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
