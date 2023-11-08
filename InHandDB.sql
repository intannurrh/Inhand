-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 07 Nov 2023 pada 15.12
-- Versi server: 5.7.39
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `InHandDB`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dishub`
--

CREATE TABLE `dishub` (
  `id_laporan` varchar(10) NOT NULL,
  `id_daerah` varchar(15) NOT NULL,
  `id_dishub` varchar(10) NOT NULL,
  `daerah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id_daerah` varchar(20) NOT NULL,
  `id_laporan` varchar(10) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `isi_laporan` varchar(255) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `tanggal_laporan` date NOT NULL,
  `id_user` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemerintah`
--

CREATE TABLE `pemerintah` (
  `id_laporan` varchar(10) NOT NULL,
  `id_pemerintah` varchar(15) NOT NULL,
  `nama_pemerintah` varchar(50) NOT NULL,
  `id_daerah` varchar(15) NOT NULL,
  `daerah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(12) NOT NULL,
  `id_ktp` varchar(15) NOT NULL,
  `no_telepon` varchar(13) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nama_ktp` varchar(255) NOT NULL,
  `nama_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dishub`
--
ALTER TABLE `dishub`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `pemerintah`
--
ALTER TABLE `pemerintah`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dishub`
--
ALTER TABLE `dishub`
  ADD CONSTRAINT `dishub_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`);

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `pemerintah`
--
ALTER TABLE `pemerintah`
  ADD CONSTRAINT `pemerintah_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
