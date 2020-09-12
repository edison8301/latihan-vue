-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Sep 2020 pada 03.37
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan-isman`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nomor_anggota` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `nomor_anggota`, `alamat`, `telepon`, `email`) VALUES
(1, 'Anggota 1', '1200', 'Jl almaat', '21312441', 'adasdwad@adsa.com'),
(2, 'Anggota 2', '1300', 'adasdasdas', '12311231', 'asd@adasds.com'),
(3, 'Anggota 3', '1400', 'asdasas', '0898912', 'jnaddwn@and.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `id_penulis` int(11) DEFAULT NULL,
  `id_penerbit` int(11) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `tahun_terbit` varchar(255) DEFAULT NULL,
  `tempat` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `judul`, `id_kategori`, `id_penulis`, `id_penerbit`, `sinopsis`, `tahun_terbit`, `tempat`, `gambar`) VALUES
(3, 'Judul Buku 3', 3, 3, 3, '<p>Sinopsis 3</p>\r\n', '2020', 'Parunghalang', ''),
(17, 'Judul 7', 3, 3, 3, '<p>kangguru</p>\r\n', '2018', 'Bandung', ''),
(24, 'asdasdsadas', 2, 3, 3, '<p>asdsasadsadas</p>\r\n', '2019', 'bdgg', ''),
(26, 'bukunanasda', 1, 2, 3, '<p>asdasdasadasdasdads</p>\r\n', '2020', 'bdg', ''),
(28, 'ahahahuahuahuahuahuahuahu', 1, 2, 3, '<p>ahuahuahuahuahuahuahau</p>\r\n', '2019', 'bdg', ''),
(29, 'Tutorial MobilMatic', 1, 2, 4, '<p>cihuy</p>\r\n', '2021', 'bdg', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Kategori 1'),
(2, 'Kategori 2'),
(3, 'Kategori 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `waktu_pinjam` datetime NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_anggota`, `id_buku`, `waktu_pinjam`, `tanggal_pinjam`, `tanggal_kembali`) VALUES
(1, 1, 29, '0000-00-00 00:00:00', '0000-00-00', '0000-00-00'),
(2, 1, 3, '2020-09-09 07:45:12', '2020-09-09', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id`, `nama`, `telepon`, `email`, `alamat`) VALUES
(3, 'Penerbit 3 Ruangguru', '1233512', 'r@rr.com', 'asdasda'),
(4, 'Yii Sun Shin', '1231232', 'asd@asdf.com', 'test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penulis`
--

CREATE TABLE `penulis` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penulis`
--

INSERT INTO `penulis` (`id`, `nama`, `telepon`, `email`, `alamat`) VALUES
(2, 'Penulis 2 Dadan Nugraha', '2131231232', 'dadan@dans.com', 'adasadadadadsa'),
(3, 'Penulis 3 Iqbal', '12313129948', 'iqbal@asda.com', 'test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_user_role` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `id_user_role`, `id_anggota`, `auth_key`, `access_token`) VALUES
(1, 'admin', '$2y$13$mTyNbwpHJHx/aTP/1VqPiO7.oadpbvI1z75ffBaOQYxY8HRJ9wzL2', 1, 1, 'asdhijashd12', 'ashd8whsuhefuw23'),
(2, 'anggota', '$2y$13$mTyNbwpHJHx/aTP/1VqPiO7.oadpbvI1z75ffBaOQYxY8HRJ9wzL2', 2, 2, '', ''),
(8, 'cek', '$2y$13$mTyNbwpHJHx/aTP/1VqPiO7.oadpbvI1z75ffBaOQYxY8HRJ9wzL2', 2, 3, NULL, NULL),
(9, 'admin2', 'admin2', 1, 1, NULL, NULL),
(10, 'user', '$2y$13$RnhE4avhSRrUcVVB0IgcX.XgYHSEOclBpqZrXFw4vwcJnJXf04Hjm', 2, 3, NULL, NULL),
(11, 'oke', 'oke', 2, 1, NULL, NULL),
(12, 'uwa', '$2y$13$mRi3sMR94NFXBNFmc9BnVeWpH9FCKPslmYVianb9nAjdoD149hpjq', 2, 1, NULL, NULL),
(13, 'thomas', '$2y$13$DeWHe3wY3jaN4wmdUj8MPu2w0Z23ZCtxtEC/ti67COuAno7lpRD/2', 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `nama`) VALUES
(1, 'Administrator'),
(2, 'Anggota');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
