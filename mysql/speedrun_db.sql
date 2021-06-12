-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2021 at 01:43 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `speedrun_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_t`
--

CREATE TABLE `admin_t` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_t`
--

INSERT INTO `admin_t` (`id`, `username`, `password`) VALUES
(1, 'elmercuenca74@gmail.com', 'Speedrun040700');

-- --------------------------------------------------------

--
-- Table structure for table `category_t`
--

CREATE TABLE `category_t` (
  `id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_t`
--

INSERT INTO `category_t` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(3, 'Basketball Shoes', '2021-06-08 00:05:43', '2021-06-08 00:05:43'),
(4, 'Running Shoes', '2021-06-08 00:05:54', '2021-06-08 00:05:54'),
(5, 'Golf Shoes', '2021-06-08 00:09:39', '2021-06-08 00:09:39'),
(6, 'Soccer Shoes', '2021-06-08 00:13:42', '2021-06-08 00:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `contact_t`
--

CREATE TABLE `contact_t` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_t`
--

INSERT INTO `contact_t` (`id`, `email`, `message`, `created_at`, `updated_at`) VALUES
(1, 'elmercuenca74@gmail.com', 'Hello World! Testing this mesasge to team feature :) Ciao!', '2021-06-03 17:51:48', '2021-06-03 17:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `customer_t`
--

CREATE TABLE `customer_t` (
  `id` int(11) NOT NULL COMMENT 'customer identifier',
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'timestamp when customer data is created',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'timestamp when customer data is updated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders_t`
--

CREATE TABLE `orders_t` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `total_amount` int(20) NOT NULL,
  `craeted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details_t`
--

CREATE TABLE `order_details_t` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `craeted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_t`
--

CREATE TABLE `products_t` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(11) NOT NULL,
  `picture` varchar(30) NOT NULL,
  `description` mediumtext NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_t`
--

INSERT INTO `products_t` (`id`, `name`, `price`, `color`, `picture`, `description`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Test Product 1', 42069, '0', 'ako2.png', 'Hi! Test Product 1', 2, '2021-06-04 19:34:13', '2021-06-04 19:34:13'),
(2, 'Test Product 1', 42069, '0', '../uploads/ako2.png', 'Hi! Test Product 1', 2, '2021-06-04 19:34:35', '2021-06-04 19:34:35'),
(3, 'Test product 2', 420, '0', '../uploads/sabaw.bmp', 'Test product 2', 0, '2021-06-04 19:37:06', '2021-06-04 19:37:06'),
(4, 'Test product 3', 420, 'White', '../uploads/sabaw.bmp', 'Test product 3', 0, '2021-06-04 19:38:17', '2021-06-04 19:38:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_t`
--
ALTER TABLE `admin_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_t`
--
ALTER TABLE `category_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_t`
--
ALTER TABLE `contact_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_t`
--
ALTER TABLE `customer_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_t`
--
ALTER TABLE `orders_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details_t`
--
ALTER TABLE `order_details_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_t`
--
ALTER TABLE `products_t`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_t`
--
ALTER TABLE `admin_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_t`
--
ALTER TABLE `category_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_t`
--
ALTER TABLE `contact_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_t`
--
ALTER TABLE `customer_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'customer identifier';

--
-- AUTO_INCREMENT for table `orders_t`
--
ALTER TABLE `orders_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details_t`
--
ALTER TABLE `order_details_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_t`
--
ALTER TABLE `products_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
