-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2021 at 09:01 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
(1, 'elmercuenca74@gmail.com', 'Speedrun040700'),
(2, 'nitaantasuda@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `category_t`
--

CREATE TABLE `category_t` (
  `id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_t`
--

INSERT INTO `category_t` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(3, 'Basketball Shoes', '2021-06-08 00:05:43', '2021-06-08 00:05:43'),
(4, 'Running Shoes', '2021-06-08 00:05:54', '2021-06-08 00:05:54'),
(5, 'Golf Shoes', '2021-06-08 00:09:39', '2021-06-08 00:09:39'),
(6, 'Training', '2021-07-04 21:06:33', '2021-07-04 21:06:33'),
(7, 'Tennis', '2021-07-04 21:41:39', '2021-07-04 21:41:39'),
(8, 'Football', '2021-06-08 00:13:42', '2021-06-08 00:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `contact_t`
--

CREATE TABLE `contact_t` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when customer data is created',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when customer data is updated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_t`
--

INSERT INTO `customer_t` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'nitaantasuda@gmail.com', 'lol', '2021-07-05 01:01:34', '2021-07-05 01:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `orders_t`
--

CREATE TABLE `orders_t` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `total_amount` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_t`
--

INSERT INTO `orders_t` (`id`, `customer_id`, `address`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 'sfs', 43766, '2021-07-05 02:33:09', '2021-07-05 02:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_details_t`
--

CREATE TABLE `order_details_t` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `craeted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details_t`
--

INSERT INTO `order_details_t` (`id`, `order_id`, `product_id`, `quantity`, `craeted_at`, `updated_at`) VALUES
(1, 0, 0, 1, '2021-07-05 01:02:45', '2021-07-05 01:02:45'),
(2, 0, 0, 1, '2021-07-05 01:10:15', '2021-07-05 01:10:15'),
(3, 0, 0, 1, '2021-07-05 01:10:15', '2021-07-05 01:10:15'),
(4, 0, 0, 1, '2021-07-05 01:14:56', '2021-07-05 01:14:56'),
(5, 1, 0, 5, '2021-07-05 02:39:46', '2021-07-05 02:39:46'),
(6, 1, 0, 1, '2021-07-05 02:42:33', '2021-07-05 02:42:33'),
(7, 1, 0, 1, '2021-07-05 02:45:23', '2021-07-05 02:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `products_t`
--

CREATE TABLE `products_t` (
  `id` int(11) NOT NULL,
  `SKU_name` varchar(25) NOT NULL COMMENT 'Category tag + Abbreviated Name',
  `name` varchar(40) NOT NULL,
  `price` float NOT NULL,
  `weight` float NOT NULL,
  `size` int(2) NOT NULL,
  `dimension` tinytext NOT NULL,
  `color` varchar(40) NOT NULL,
  `picture` varchar(30) NOT NULL,
  `description` mediumtext NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_t`
--

INSERT INTO `products_t` (`id`, `SKU_name`, `name`, `price`, `weight`, `size`, `dimension`, `color`, `picture`, `description`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'BBNAJ1', 'Nike Air Jordan 1', 27912.1, 14.84, 7, '9.6 in / 24.4', 'Satin Red', 'uploads/BB001.jpg', 'The Air Jordan 1 changed footwear forever—and the original \'Black Toe\' colourway played an essential role in establishing the silhouette as a cultural icon.This release also showcases parallel styling, but incorporates a mix of both satin and faux snakeskin. Timeless black and red colour-blocking remains unchanged, as does the shoe\'s timeless construction and support.', 3, '2021-07-04 20:19:35', '2021-07-04 20:19:35'),
(2, 'BBAJ11RB', 'Nike Air Jordan 11 Retro Bred', 15853.5, 14.7, 8, '~10.125 in / 25.7', 'Black', 'uploads/BS002.jpg', 'This timeless model and classic colourway need no introduction but we\'ll break it down for those that don\'t know. Tinker Hatfield created the Air Jordan XI to redefine limits, with a carbon-fibre plate for unrivalled performance and patent leather for an unprecedented touch of luxury. The inventive design debuted as MJ returned from his first retirement, capturing the attention of the rest of the league (and the shoe game).\r\n', 3, '2021-07-04 20:39:38', '2021-07-04 20:39:38'),
(3, 'BBNKAJ3', 'Nike \"Katrina\" Air Jordan 3', 21154.1, 18.6, 9, '~10.25 in ~26', 'White/Fire Red', 'uploads/BB003.jpg', 'The Air Jordan 3 “Katrina” is a special white, grey, and red version of Michael Jordan’s third signature shoe. It was created exclusively in 2006 for charity auctions supporting Hurricane Katrina relief efforts. The shoe features a mix of leather, elephant print, and visible Air. ', 3, '2021-07-04 20:41:43', '2021-07-04 20:41:43'),
(4, 'BBNAFOXX', 'Nike Air Foamposite One XX', 23815.6, 18, 8, '~9.9 in / 25.2', 'Royal Blue', 'uploads/BB004.jpg', 'The Air Foamposite One XX ‘Royal’ dropped in 2017 to celebrate the 20th anniversary of the groundbreaking silhouette. The colorway and build are true to the OG release, itself inspired by Penny Hardaway’s legendary run with the Orlando Magic. The design is dominated by a synthetic Foamposite shell in metallic royal blue, accented with black nubuck trim and a translucent rubber outsole.', 3, '2021-07-04 20:44:19', '2021-07-04 20:44:19'),
(5, 'BBNK4PCD', 'Nike Kobe 4 Protro Carpe Diem', 8431.06, 14.5, 10, '~10.6 in / 26.8', 'Black/Purple', 'uploads/BB005.jpg', 'Feed your sneakerhead soul and cop the Kobe 4 Proto Carpe Diem. This Kobe 4 comes with a black upper plus yellow and purple accents, yellow Nike “Swoosh” outlined in purple, grey midsole, and a blue sole.', 3, '2021-07-04 20:46:45', '2021-07-04 20:46:45'),
(6, 'BBRQMRT', 'Reebok Question Mid Red Toe', 9485.42, 16.5, 8, '~9.9 in / 25.2', 'White/Red', 'uploads/BB006.jpg', '2020 was a good year for Allen Iverson’s famed Reebok Question, and the release of the original suede toe colorway was even more evidence of the sneaker’s prominent return. During A.I.’s prime, the Basketball Hall of Famer wore Questions as he crossed over none other than Michael Jordan in 1996. The sneaker has been a classic for Reebok ever since.\r\n\r\nThe Reebok Question Mid Red Toe 25th Anniversary brings back the sneaker in OG form. The upper is made of white tumbled leather and hits of red on the Reebok Delta logo and lace loops. The midsole displays the brand’s signature “Hexalite” cushioning technology, present in many of Iverson’s signature kicks. The toebox is the most notable detail, with its red suede patch that adds luxe elements to the sneaker. ', 3, '2021-07-04 20:49:11', '2021-07-04 20:49:11'),
(7, 'BBNAMU', 'Nike Air More Uptempo', 14544, 17, 8, '~9.9 in / 25.2', 'Blue/White', 'uploads/BB007.jpg', 'The Nike Air More Uptempo \'96 brings classic basketball back to the streets.It features \'90s graffiti-styled graphics alongside visible full-length Air cushioning.Elastic straps over the tongue keep your style sharp whether you rock them laced or unlaced.The throwback, chunky design is combined with of-era over-branding for a look that will never fade.', 3, '2021-07-04 20:51:59', '2021-07-04 20:51:59'),
(8, 'BBACKB8AS', 'Adidas Crazy KB8 All Star', 23975.4, 13.3, 7, '~9.6 in / 24.4', 'Black/White/Purple', 'uploads/BB008.jpg', 'The Crazy 8 is best known for its mix of canvas, leather and mesh upper that’s paired with an inner bootie construction for lockdown, which allows for airflow to the wearer’s foot while minimalizing friction. The design is finished off with a soft EVA foam midsole including a Torsion system plate and the brand’s innovative Feet You Wear outsole design that’s slated to provide the athletes with a natural stride and feel.', 3, '2021-07-04 20:56:24', '2021-07-04 20:56:24'),
(9, 'BBUAC4MR', 'Under armour Curry 4: More Rings', 9600.9, 11.1, 9, '~10.25 in ~26', 'White/Gold', 'uploads/BB009.jpg', 'The two-time MVP laced up the Under Armour Curry 4 “More Rings” silhouette while doing so – the same shoe he wore during Game 5 of last year’s NBA Finals. Under Armour is separating that sneaker from the previously released “Championship Pack” for a run of its own this weekend.  This model of the Curry 4 comes adorned in white with hints of gold to represent the sharp-shooting point guard’s championship winning ways.', 3, '2021-07-04 21:00:46', '2021-07-04 21:00:46'),
(10, 'BBNL8SBPH', 'Nike Lebron 8 South Beach Pre-Heat', 33603.1, 14.2, 10, '~10.6 in / 26.8', 'Retro/Black-Pink Flash-Filament Green', 'uploads/BB010.jpg', 'For LeBron James, the sneaker most often pointed out as his single greatest signature release is the “South Beach” LeBron 8, a pre-heat colorway from 2010 that perfectly ushered in his tenure in Miami. The “South Beach” 8 is perhaps the cornerstone of Nike Basketball’s late 2000s/early 2010s Golden Era and partially responsible for modern sneaker hype as we know it.', 3, '2021-07-04 21:03:43', '2021-07-04 21:03:43'),
(11, 'TGRBN9', 'Reebok Nano 9', 6284, 12.8, 8, '~9.9 in / 25.2', 'Black/White', 'uploads/TG001.jpg', 'Reebok has made a step in the right direction with the long-awaited Nano 9. The wearers consider it an excellent evolution of the Nano 8. The brand takes the already successful model and brings its comfort, stability, and versatility to a new level. Both experts and enthusiasts applaud the balance between stability and cushioning which the Reebok Nano 9 offers.', 6, '2021-07-04 21:09:30', '2021-07-04 21:09:30'),
(12, 'TGRNX', 'Reebok Nano X ', 6284, 14.4, 6, '~8.75 in / 22.5', 'White / Pink / Blue', 'uploads/TG002.jpg', 'Reebok Nano X Women\'s Training Shoes\r\nWorkout shoes for The Sport of Fitness\r\n\r\nTo celebrate the 10th anniversary of the Nano, Reebok has re-imagined this iconic shoe. This women\'s version has a soft woven textile upper with targeted areas of support and stretch. Lightweight cushioning keeps you fast on your feet.', 6, '2021-07-04 21:12:17', '2021-07-04 21:12:17'),
(13, 'TGNM5', 'Nike Metcon 5', 7497, 13.2, 9, '~10.25 in ~26', 'Blue/White/Brown', 'uploads/TG003.jpg', 'The Nike Metcon 5 is the most tuned Metcon yet. This means specific stability for heavy lifting, traction made for speed and durability where you need it. It even includes a Hyperlift insert that\'s compatible with all prior versions of the Metcon. Meet your secret weapon for weight-lifting and high-impact training.', 6, '2021-07-04 21:14:42', '2021-07-04 21:14:42'),
(14, 'TGNAMAT2', 'Nike Air Max Alpha Trainer 2', 4195, 12, 10, '~10.6 in / 26.8', 'Grey/Black/Silver', 'uploads/TG004.jpg', 'The Nike Air Max Alpha Trainer 2 is built for durability and traction with plenty of cushioning that\'s designed for athletes who want to get stronger every day.', 6, '2021-07-04 21:16:17', '2021-07-04 21:16:17'),
(15, 'TGTC11W', 'TC-11 WOMENS', 7009, 10, 8, '~9.5 in / 24', 'White', 'uploads/TG005.jpg', 'Mizuno C.O.B. Technology: Mizuno COB midsole has a textured upper surface that is linked with the outsole and directly transmits information from the ground to the bottom of the feet.  By increasing sensitivity under foot, Mizuno COBtechnology enables improvement of an athlete’s balance and ultimately their performance. ', 6, '2021-07-04 21:18:20', '2021-07-04 21:18:20'),
(16, 'TGUATR2', 'Under Armour TriBase Reign 2.0', 6284, 10.84, 9, '~10.25 in ~26', 'Grey', 'uploads/TG006.jpg', 'The new upaded Under Armour® TriBase™ 2 training shoe will change the way you work out. This training shoe provides all the grip and comfort you need for heavy weight lifting. ', 6, '2021-07-04 21:20:51', '2021-07-04 21:20:51'),
(17, 'TGFLG230', 'F-Lite G 230', 9300, 8.11, 9, '~9.875 in / 25 (W)~10.25 in ~26 (M)\r\n', 'White/Black', 'uploads/TG007.jpg', 'Lightweight cushioning paired with superior support - the ultimate functional training and cardio hybrid. Light and flexible for all your running and bodyweight sessions. Stable and supportive for all your functional fitness workouts. A Cordura mesh upper offers increased durability, while revolutionary graphene-enhanced G-GRIP outsoles deliver the world\'s toughest and most durable grip.', 6, '2021-07-04 21:23:29', '2021-07-04 21:23:29'),
(18, 'TGNB624', 'New Balance 624', 3625, 10.5, 7, '~9.25 in / 23.5', 'White', 'uploads/TG008.jpg', 'You can do anything. And, in the New Balance 624 cross-trainer, you can do everything. With increased flexibility and cushioning, the possibilities — and comfort — are endless.', 6, '2021-07-04 21:25:19', '2021-07-04 21:25:19'),
(19, 'TGNSGJXI', 'Nike SuperRep GoAir Jordan XI', 4995, 10, 10, '~10.6 in / 26.8', 'Black/Grey/White', 'uploads/TG009.jpg', 'The Nike SuperRep Go combines comfortable foam cushioning, flexibility and support to get you moving in circuit-based fitness classes or while streaming workouts at home.', 6, '2021-07-04 21:27:34', '2021-07-04 21:27:34'),
(20, 'TGAU21T', 'Adidas Ultraboost 21 Trainers  ', 9500, 11.9, 10, '~10.2 in / 25.9', 'White/Black/Yellow', 'uploads/TG010.jpg', 'Energy was just energy until energy met Ultraboost 21. Prototype after prototype. Innovation after innovation. Testing after testing. Meet us in the hot pursuit of the pinnacle harmonization of weight, cushioning, and responsiveness. Ultraboost 21. Say hello to incredible energy return.', 6, '2021-07-04 21:30:16', '2021-07-04 21:30:16'),
(21, 'TGAU21T', 'Nike Air Max 3 Women', 6073, 11.4, 7, '~9.25 in / 23.5', 'White/Blue/Pink', 'uploads/TG011.jpg', 'Recognized by many as the “Concord” or “Laser Pink”, an additional retro of the Nike Air Max III sees the light of day, part of its 30th anniversary. The now dubbed WMNS Nike Air Max 90, the silhouette is elegantly dressed in a white mesh base, white and grey leather mudguards as well as “Concord” Swoosh.  Finishing off the original aesthetic, black and pink elements are found on its midsole and outsole, matching the upper. Lastly, woven tongue labels and a flamboyant rubber heel patch are details worth mentioning.', 6, '2021-07-04 21:32:36', '2021-07-04 21:32:36'),
(22, 'TGNAM90PC', 'Nike Air Max 90 premium curry', 60438, 15, 8, '~9.9 in / 25.2', 'White/Gold/Green/Blue', 'uploads/TG012.jpg', 'Featuring clean lines and timeless design, the Air Max 90 from Nike are available in a variation of colourways & styles. The shapes and patterns are constructed to convey speed, but they remain aesthetically appealing in bold color combinations.', 6, '2021-07-04 21:34:38', '2021-07-04 21:34:38'),
(23, 'RGMM4', 'Men\'s Mach 4', 6284, 6.8, 11, '~10.9 in / 27.8 ', 'Black / Dark Shadow', 'uploads/RG001.jpg', 'The Hoka One One Mach 4 is a super stable, lightweight daily trainer that’s stiff enough for faster efforts and fits like a glove.', 4, '2021-07-04 21:47:33', '2021-07-04 21:47:33'),
(24, 'RGSEP', 'Saucony Endorphin Pro', 9668, 7.5, 8, '~9.9 in / 25.2', 'White/ Bright Orange / Bubblegum Blue', 'uploads/RG002.jpg', 'The Endorphin Pro was engineered with elite athletes and built to give runners a fair advantage at the starting line. Featuring propulsive SPEEDROLL Technology, our signature S-curve carbon fiber plate combines with ultralight PWRRUN PB cushioning for powerful race-day performance. And weighing in at just 7.5oz, it\'s undeniable. These shoes weren’t made for chasing personal bests. They were made for smashing them', 4, '2021-07-04 22:13:54', '2021-07-04 22:13:54'),
(25, 'RGSK3', 'Saucony Kinvara 3', 6284, 8, 9, '~9.875 in / 25 cm (W)/~10.25 in /~26 cm(M)', 'Black/ Yellow Green / Red', 'uploads/RG003.jpg', 'A perennial favorite of wear-testers, the Kinvara saw several minor fixes. Most notably, Saucony stripped rubber from where it wasn\'t as necessary on the outsole and added pods where heavy wear occurs during toe-off. Visually prominent welded overlays wrap across the upper, providing a surprisingly firm grip on the foot, while also reducing weight.', 4, '2021-07-04 22:16:34', '2021-07-04 22:16:34'),
(26, 'RGNF6', 'Newton Fate 6', 6767, 9.2, 7, '~9.6 in / 24.4', 'Red / Black', 'uploads/RG004.jpg', 'The sixth generation is crafted to elevate Fate’s signature ride. The improved Action Reaction Technology™ enhances smoothness and responsiveness with every stride, and the modified upper maximizes comfort and support. There’s never been a better time to master your Fate.', 4, '2021-07-04 22:18:29', '2021-07-04 22:18:29'),
(27, 'RGNBFFV11', 'New Balance Fresh Foam 1080 v11', 7251, 9.1, 8, '~9.5 in / 24 cm (W) / ~9.9 in / 25.2 (M)', 'Black with Thunder', 'uploads/RG005.jpg', 'The Fresh Foam 1080v11 provides luxurious comfort for the long run. This soft, plush shoe features responsive underfoot Fresh Foam partnered perfectly with a soft, selectively stretchy knit upper offering 360-degree comfort for high mileage. Including Ultra Heel technology that hugs the back of the foot for a snug, supportive fit, this men\'s running shoe fully wraps the foot in pure comfort. ', 4, '2021-07-04 22:20:35', '2021-07-04 22:20:35'),
(28, 'RGFOG14', 'Nike Free OG 14', 6332, 8.3, 12, '~11.25 in / 28.6', 'Sport Royal/Varsity Maize/White/Black', 'uploads/RG006.jpg', 'The Nike Free OG replicates its silhouette and provides updates for a modern look and feel. A traditional tongue replaces the original bootie for a wider range of fit and increased comfort, while an updated Nike Free outsole specific to Nike Sportswear lends a contemporary, sleek aesthetic. The original synthetic suede, perforated upper and dynamic heel pocket are carried over, completing the 10-year celebration of Nike Free.', 4, '2021-07-04 22:26:16', '2021-07-04 22:26:16'),
(29, 'RGBAGTS20', 'Brooks Adrenaline GTS 20', 5800, 9.4, 7, '~9.25 in / 23.5', 'Black/Purple', 'uploads/RG007.jpg', 'The Brooks Adrenaline GTS 20 is the best stability technology yet from Brooks, springy and solid responsive feel on the road, with equal plush cushioning than the Levitate or Ghost. This is a light and durable yet stylish shoe for walking or other types of cross-training as well, designed for mild-moderate overpronators. This shoe can do just about anything but is ideal for me on long runs and marathon/half marathon training.', 4, '2021-07-04 22:28:28', '2021-07-04 22:28:28'),
(30, 'RGBG19', 'Brooks Glycerin 19', 7251, 10.2, 8, '~9.5 in / 24 cm (W)/ ~9.9 in / 25.2 cm (M)', 'Blue', 'uploads/RG008.jpg', 'Lace up in the responsive and generously cushioned Glycerin 19 for all kinds of runs. Their luscious feel didn’t weigh us down as we pushed the pace during training.', 4, '2021-07-04 22:31:54', '2021-07-04 22:31:54'),
(31, 'RGHOOC3', 'Hoka One One clifton 3', 6284, 8.6, 9, '~9.875 in / 25 cm (W)/ ~10.25 in ~26 (M)', 'Blue Jewel / Neon Coral ', 'uploads/RG009.jpg', 'The CLIFTON 3 improves upon its decorated heritage with this new release. The upper features a new fit with a more accommodating forefoot, as well as a seamless speed frame construction for light weight and supreme comfort. A similar midsole geometry means that the industry leading ride remains as light and smooth as ever. When cushioning and light weight are your top priorities, look no further.', 4, '2021-07-04 22:33:50', '2021-07-04 22:33:50'),
(32, 'RGAE2', 'Asics EvoRide 2', 5440, 6.9, 11, '~10.9 in / 27.8', 'French Blue/Digital Grape', 'uploads/RG010.jpg', 'Whether it\'s tempo runs, long runs, or racing, the EVORIDE 2 shoe is built for neutral and supinated runners focused on conserving energy. Our intent with the second iteration of this series was to preserve the shoe\'s easy forward rolling properties while reducing the overall weight and softening the cushioning underfoot. Additionally, the shoe\'s engineered mesh upper is designed with a multi-directional stretch mesh that adjusts better to the foot\'s natural shape. The shoe\'s upper is also made with recycled materials, while the sockliner is produced with a solution dyeing process that reduces carbon emissions and water usage.', 4, '2021-07-04 22:35:45', '2021-07-04 22:35:45'),
(33, 'RGNLCEW', 'Nike LunarCharge Essential Women', 5392, 7.4, 8, '~9.5 in / 24', 'Black', 'uploads/RG011.jpg', 'This iteration of the Nike LunarCharge provides a rather comfortable and lightweight feeling for the foot with the added Lunarlon cushioning system. The shoe though may not be able to provide the needed foot support for some. It may also run a bit small for others. But with its stylish look, the breathable feeling it offers, and a variety of cool colorways to choose from, the Nike LunarCharge Essential, is a good deal.\r\n', 4, '2021-07-04 22:38:00', '2021-07-04 22:38:00'),
(34, 'TSASSO', 'Adidas Stan Smith Originals', 4800, 12.3, 7, '~9.6 in / 24.4', 'Cloud White / Off White / Green', 'uploads/TS001.jpg', 'An authentic version of the iconic 1971 tennis classic. Roll with the classic. Back in the day, Stan Smith won big on the tennis court. Slide into the adidas shoe worthy of his name and you\'ll win big on the streets. Top to bottom, these shoes capture the essential style of the 1971 original, with a minimalist leather build and clean trim.', 7, '2021-07-04 23:07:18', '2021-07-04 23:07:18'),
(35, 'TSCJPJLO', 'Converse Jack Purcell Jack Leather Ox', 3545, 15, 9, '~10.25 in ~26', 'White', 'uploads/TS002.jpg', 'The Converse Jack Purcell is a classic canvas-and-rubber sneaker originally designed for badminton and known for its large rubber toe cap. The shoe was first created in 1935 for the B.F. Goodrich Company of Canada, but Converse purchased the trademark rights in the 1970s. Nowadays, the Purcell is a popular casual sneaker. Read the articles below to learn more about the latest Converse Jack Purcell releases.', 7, '2021-07-04 23:09:57', '2021-07-04 23:09:57'),
(36, 'TSAGR8RTM', 'Asics Gel Resolution 8 L.E. Retro Tokyo', 9856, 14.6, 8, '~9.5 in / 24 cm(W)/ ~9.9 in / 25.2 (M)', 'White/Electric Blue/Red ', 'uploads/TS003.jpg', 'The GEL-RESOLUTION 8 limited-model tennis shoe pays homage to the upcoming celebration in Tokyo, while commemorating the spirit of ASICS heritage and our Japanese roots. The RETRO TOKYO variation of our tennis shoe features a limited-model colorway, while promoting a responsive stride with a close-to-the-court feel. The FLEXION FIT upper provides form-fitting support with the integration of DYNAWALL technology, which offers added midfoot support during lateral movements and coast-to-coast coverage. Implementing a torque control feature in the heel counter, this shoe is designed to help maintain a locked in feel during abrupt transitions. ', 7, '2021-07-04 23:12:07', '2021-07-04 23:12:07'),
(37, 'TSNZVRFXAJ3', 'NIKECOURT ZOOM VAPOR RF X AJ3', 29600, 13.6, 9, '~10.25 in ~26', 'Black, Fire red and Cement grey', 'uploads/TS004.jpg', 'NikeCourt combines basketball and tennis with the Zoom Vapor AJ3. The sneaker is a combination of Roger Federer\'s Zoom Vapor 9.5 signature sneaker and the classic Air Jordan 3. They feature Dynamic Fit technology, a Zoom Air unit housed in cushioned and supportive Phylon, an embroidered Jumpman logo on the tongue, elephant print panels and \"Nike Air\" branding on the back heel. They came out in three classic Air Jordan 3 colorways. The White Cement and Black Cement in 2014 and the Fire Red in 2017. ', 7, '2021-07-04 23:15:00', '2021-07-04 23:15:00'),
(38, 'TSNATC2', 'Nike Air Tech Challenge II', 7212, 13, 8, '~9.9 in / 25.2', 'Hot Lava Red / White / Black', 'uploads/TS005.jpg', 'Three decades after its audacious debut, this \'90s court classic is marking a comeback in its most renowned color scheme, but with flipped color-blocking. Sculpted by the inimitable Tinker Hatfield, the unforgettable silhouette graced the feet of an eccentric tennis talent as he made his name (and unmatched aesthetic) known across the globe. A black, premium leather upper is complemented by overlays of white and flat silver on the midfoot, collar and mudguard. Splatters of hot lava add heat to the Swoosh, tongue, heel and sole, infusing this look with the retro flavor we still crave.', 7, '2021-07-04 23:16:57', '2021-07-04 23:16:57'),
(39, 'TSACFF2', 'Asics Court FF 2', 9135, 14.8, 7, '~9.25 in / 23.5 cm (W)/ ~9.6 in / 24.4 (M)', 'White/Blue/Red', 'uploads/TS006.jpg', 'Power your clay court game in the COURT FF tennis shoe by Asics that is packed full of technical features to help you twist and jump for each ball.\r\n\r\nThe shoe\'s FLYTEFOAM midsole will help put a spring in your run - it\'s an advanced formulation that responds to the energy of your jumps. There\'s also GEL technology in the front and back of the shoe, cushioning your landings so you can reach up for that killer smash with confidence. The SOLYTE insole also improves your bounce-back, as well as helping the shoe last well. And because comfort is key, we\'ve fitted the COURT FF™ model with a MONO-SOCK™ fit that makes it easy to put on and wear. ', 7, '2021-07-04 23:19:09', '2021-07-04 23:19:09'),
(40, 'TSWCF2', 'W Court Flare 2', 5899, 9.5, 7, '~9.25 in / 23.5', 'White/ Black', 'uploads/TS007.jpg', 'Inspired by Serena Williams’ on-court shoe, the Nike NikeCourt 2 QS tennis shoes combine speed and style for a lightweight feel on hard courts. ', 7, '2021-07-04 23:20:54', '2021-07-04 23:20:54'),
(41, 'TSNAM97Q', 'Nike Air Max 97 \"Queen\"', 57571, 11.3, 7, '~9.6 in / 24.4', 'Elemental Rose/ Black/Barely Rose/White ', 'uploads/TS008.jpg', 'Looking to ace your outfit? These Air Max 97 Off-White Elemental Rose Serena “Queen” sneakers are a must own. Part of Nike and Virgil Abloh’s Serena Williams “Queen” Collection, the Off-White x Nike Air Max 97 celebrates the 50th U.S. Open tournament taking place in Flushing Meadows. Coming in a sleek Elemental Rose, Black, Barely Rose, and White color scheme. This super limited Air Max 97 is also highlighted with a color gradient on the midsole, along with a new Volt zip-tie. Dropping in August of 2018, these are a must own for any Serena Williams fan', 7, '2021-07-04 23:23:51', '2021-07-04 23:23:51'),
(42, 'TSNBFFL', 'New Balance Fresh Foam Lav   ', 2249, 14.46, 10, '~10.6 in / 26.8', 'Mint Green', 'uploads/TS009.jpg', 'Dominate the court in the New Balance Fresh Foam Lav men’s tennis shoe. This special edition NB is inspired by professional tennis player Milos Raonic, with data-driven features like an external heel counter, a signature Fresh Foam midsole and a kinetic stitch to help bring lockdown strength and elevate your game. Plus, this version of the Fresh Foam Lav features gold detailing.', 7, '2021-07-04 23:25:47', '2021-07-04 23:25:47'),
(43, 'TSADCB', 'Adidas CourtJam Bounce   ', 4500, 13.6, 7, '~9.25 in / 23.5 cm (W)/ ~9.6 in / 24.4 (M)', 'White/Black/Grey', 'uploads/TS010.jpg', 'Breathable tennis shoes designed for durability. Take on all challengers. These adidas tennis shoes feature a breathable mesh upper that keeps your feet comfortable from opening serve to match point. Step into every shot in comfort. Show off your footwork as you keep rallies alive.', 7, '2021-07-04 23:27:47', '2021-07-04 23:27:47'),
(44, 'FBNMV4', 'Nike Mercurial Vapor IV', 12167.2, 7.4, 9, '~10.25 in ~26', 'Lime green', 'uploads/FB001.jpg', 'The Mercurial Vapor IV paved the way for what the Mercurial is today. This was the boot that truly cemented the Mercurial as the fast, pacey boot, and further played into the silos iconic image. Through the use of their star studded line-up, including the magnificent CR7, the Mercurial very quickly rose to prominence and stayed there. ', 8, '2021-07-04 23:31:28', '2021-07-04 23:31:28'),
(45, 'FBAX1FGIP', 'Adidas X Ghosted 1 FG \'InFlight Pack\'', 13290, 6.7, 8, '~9.9 in / 25.2', 'White/Gold', 'uploads/FB002.jpg', 'Adidas’ dedicated speed silo, the X is built with one thing in mind – using pace to ghost past opposition defenses. The whole cleat is built with lightweight materials at every step, keeping you light on your feet and quick on the bounce. The Ghost’s new Mirageskin upper takes charge across the cleat, being so ghostly thin it’s practically translucent while still maintaining a stable build that molds around the foot. The new laceless vacuum fit uses a 4 way stretch material that secures the foot in a suction experience while allowing for an easier step. Meanwhile, the minimalist collar takes away all unnecessary parts, providing free movement of the ankle as you phase between the lines like a stealthy apparition.', 8, '2021-07-04 23:33:39', '2021-07-04 23:33:39'),
(46, 'FBGBSNB', 'George Best Stylo Matchmaker boots', 8148, 6.8, 10, '~10.6 in / 26.8', 'Black/White', 'uploads/FB003.jpg', 'Created by defunct high street chain Barratts, Stylo Matchmakers were true trailblazers in the 1960s.They were the first brand to move on from all-black boots - adding a dash of white along the top - and also the first to give players their own signature models.They were the boots worn by George Best, Kevin Keegan, Pele and the dominant Liverpool and Leeds United sides of the 1970s.', 8, '2021-07-04 23:36:27', '2021-07-04 23:36:27'),
(47, 'FBDBG', 'Diadora Brasil \"Gold\"', 15613, 6.4, 7, '~9.6 in / 24.4', 'Gold', 'uploads/FB004.jpg', 'The golden presentation pays homage to the Balon d’Or, an award that Marco Van Basten, George Weah and Roberto Baggio picked up while wearing the iconic silo. Fully covered in a premium golden aesthetic with the only break in the colour being the Italian flag, the richness and softness of the Brasil’s hand crafted k-leather upper and all over golden styling has been designed for the purest of touch, exquisite control and sublime movement with the ball. The multi studded firm ground sole plate is effortlessly evolved from the original Brasil’s tooling to meet the demands of the modern player, with flex, stability and comfort the key protagonists. ', 8, '2021-07-04 23:57:52', '2021-07-04 23:57:52'),
(48, 'FBAA2', 'Adidas Adipure II', 11680, 9.2, 9, '~10.25 in ~26', 'Black/White', 'uploads/FB005.jpg', 'Handcrafted for comfort, quality and performance. A pure and sleek design that is all football. Features superb fit, super-soft leather upper and firm-ground TRAXION outsole. ', 8, '2021-07-05 00:00:13', '2021-07-05 00:00:13'),
(49, 'FBAPMXHR', 'Adidas Predator Mutator x Human Race', 16229, 8.2, 11, '~10.9 in / 27.8', 'True Red / Cloud White / Core Black', 'uploads/FB006.jpg', 'Designed by hand for the Human Race.For this Limited Collection soccer cleat, we took the iconic design of the classic Accelerator and hand-painted it onto the laceless, knit textile upper for a standout look. A 360-degree fit keeps you locked in. Rubber spikes add unmatched grip.', 8, '2021-07-05 00:03:21', '2021-07-05 00:03:21'),
(50, 'FBACM', 'Adidas Copa Mundial', 7297, 11.7, 8, '~9.9 in / 25.2', 'Black/White', 'uploads/FB007.jpg', 'The adidas Copa Mundial was produced in 1979, in view of making its debut in the 1982 World Cup. The idea of a brand launching a boot 3 years prior to their big marketing event is wild by today’s standards considering how boots are launched a month before the World Cup or Euros with sponsored athletes wearing them almost immediately.', 8, '2021-07-05 00:06:26', '2021-07-05 00:06:26'),
(51, 'FBNPVNMT90', 'Nike Phantom VNM T90 \'Future DNA\'', 11680, 7, 12, '~11.25 in / 28.6', 'White/Black', 'uploads/FB008.jpg', 'The off-centre, asymmetrical lacing system of the Phantom VNM ties in perfectly with the design of the T90 II, which also featured an asymmetrical lacing system, with the trademark stripe leads from the tongue, through the laces, and right down to the toe box. Seeing as the Phantom VNM replaced the Hypervenom, and the Hypervenom replaced the T90 series, this feels like something of a full circle.', 8, '2021-07-05 00:08:27', '2021-07-05 00:08:27'),
(52, 'FBLZG', 'Lotto Zhero Gravity', 8118.18, 9.4, 8, '~9.9 in / 25.2', 'White/Gold/Black', 'uploads/FB009.jpg', 'These shoes were flying the flag for Italy in 2006 when they released the Zhero Gravity, the white and gold version of which was simply glorious. The poster boy for the laceless boots, Luca Toni, wore them as Italy won the World Cup in Germany, only adding to quintessentially Italian aura.', 8, '2021-07-05 00:15:23', '2021-07-05 00:15:23'),
(53, 'FBNMDS003', 'Nike Mercurial Dream Speed 003', 12441.6, 6.6, 7, '~9.6 in / 24.4', 'White', 'uploads/FB010.jpg', 'The third installment of the Nike Mercurial Dream Speed series showcases a one-of-a-kind look, featuring a mixture of CR7 signature designs in black which cover a significant portion of the white-based football boots. The new MDS 003 boots are designed for Cristiano Ronaldo, Kylian Mbappe and Sam Kerr to wear', 8, '2021-07-05 00:17:31', '2021-07-05 00:17:31'),
(54, 'FBPK1970', 'Puma King 1970', 7090, 10.4, 9, '~10.25 in ~26', 'Black/White', 'uploads/FB011.jpg', 'These 1970\'s Puma King football boots are what gets us boot fans passionate, to the boot world it\'s like looking at a classic car! In 1958 Puma introduced the now iconic trademark, the unmistakable Puma form strip, a symbol that has become synonymous with football boots and the Puma King. In the same year a Puma boot is the only German-made football boot in the final of the World Cup in Sweden. And after the Brazilian team\'s victory, Puma celebrated and embarked on one of the first football advertising campaigns. ', 8, '2021-07-05 00:21:03', '2021-07-05 00:21:03'),
(55, 'GFAZG21', 'Adidas ZG21', 12000, 12.98, 10, '~10.6 in / 26.8', 'Black', 'uploads/GF001.jpg', 'Golf spikes for a light, low and responsive feel.Step up to the tee with confidence. The lightweight, low profile of these adidas ZG21 golf shoes provides a solid foundation for every drive. A hybrid Lightstrike and Boost midsole is super light and charges each step with energy, and the wide fit gives the foot room to expand. The waterproof upper keeps feet dry through wet conditions. Line up your next shot with the power and stability to split the fairway. ', 5, '2021-07-05 00:25:37', '2021-07-05 00:25:37'),
(56, 'GFFPSLC', 'Footjoy Pro SL Carbon   ', 9800, 17.7, 11, '~10.9 in / 27.8', 'White', 'uploads/GF002.jpg', 'FootJoy Pro SL Carbon BOA Spikeless Golf Shoes feature ChromoSkin leather uppers and a complete ground contact design for stability and comfort out on the links.\r\n\r\nThese FootJoy golf shoes come equipped with a reimagined PowerHarness to wrap your foot in comfort and release power into your golf swing, and the Dual-Density (D2) midsole for the perfect balance of stability and comfort.\r\n\r\nThe BOA Lacing System was designed to address the long list of deficiencies found in traditional closures and delivers the following benefits completely foreign to traditional shoe and boot laces, buckles, ratchets, Velcro straps, and other closures of yesteryear. The BOA Lace System provides custom comfort with smooth, even closure and no pressure points. Get easy, one-handed adjustment with a quick turn of the dial and stay one step ahead.', 5, '2021-07-05 00:28:38', '2021-07-05 00:28:38'),
(57, 'GFACC', 'Adidas CodeChaos', 8690, 13.1, 8, '~9.5 in / 24 cm (W)/ ~9.9 in / 25.2 (M)', 'Cloud White / Signal Green / Glow Blue', 'uploads/GF003.jpg', 'Golf shoes with inspired style and technology.Work on your swing. Perfect your form. Inspire your game with the high-performance design of the spikeless adidas Codechaos Golf Shoes. Every step is light and energised. Each swing secure and confident.', 5, '2021-07-05 00:30:29', '2021-07-05 00:30:29'),
(58, 'GFEBCP', 'Ecco BIOM Cool Pro', 12600, 12.88, 10, '~10.6 in / 26.8', 'Black', 'uploads/GF004.jpg', 'The Cool Pro’s are constructed with premium Yak leather and 100% waterproof Gore-Tex surround.  This provides 360 degree climate comfort keeping water out yet allowing perspiration to escape. The Yak hides are cut into very thin leather which reduces weight without sacrificing performance.  The ultimate combination of comfort, breathability, performance, and quality.', 5, '2021-07-05 00:33:16', '2021-07-05 00:33:16'),
(59, 'GFCC', 'Callaway Coronado', 5845, 14.99, 8, '~9.5 in / 24 cm(W) /~9.9 in / 25.2 (M)', 'White/Black', 'uploads/GF005.jpg', 'Lace up for your next round in the Callaway Coronado Golf Shoes. Lightweight microfiber leather uppers equipped with Opti-Repel waterproof treatment and Opti-Vent mesh liners create the perfect blend of weather protection and air circulation. Opti-Soft EVA midsoles combine with EVA sockliners to enable natural ground feel for a comfortable ride. TPU Fusion-Lite outsoles fitted with SLIM-Lok Pivix cleats provide world-class traction.', 5, '2021-07-05 00:36:02', '2021-07-05 00:36:02'),
(60, 'GFATXTSL', 'Adidas Tour360 XT SL', 6137, 16.05, 7, '~9.6 in / 24.4', 'White/Black', 'uploads/GF006.jpg', 'Spikeless golf shoes with enhanced cushioning. The stress fades the moment you tee off. The adidas TOUR360 XT-SL 2.0 Wide Golf shoes offer a stable platform and dry comfort so every hole feels as good as the first. Every drive and putt goes your way when you can focus on the ball.', 5, '2021-07-05 00:37:49', '2021-07-05 00:37:49'),
(61, 'GFUAS5SL', 'Under Armour Spieth 5 SL', 9743, 12.5, 10, '~10.6 in / 26.8', 'White / Metallic Silver', 'uploads/GF007.jpg', 'It is the fifth iteration of Under Armour’s signature shoe designed with insights from Jordan Spieth himself as well as leading biomechanist JJ Rivet to unlock new levels of performance and comfort.The big story in terms of the design is the inclusion of a 4th dimension of traction called internal traction. This manifests itself in the form of a new and unique 3D moulded footbed that features an additional wrap over the inside and top of the foot. This wrap eliminates ‘gapping’ between your foot and the shoe from the inside to create a fit that is tailored to your specific foot shape.', 5, '2021-07-05 00:40:24', '2021-07-05 00:40:24'),
(62, 'GFNAM90G', 'Nike Air Max 90 G   ', 6400, 12.69, 8, '~9.9 in / 25.2', 'White/Black', 'uploads/GF008.jpg', 'The well-loved Nike Air Max 90 has now been tweaked for golfing performance. Geared toward golf players who are fans of the iconic sneaker, it can keep the wearer looking casually cool without compromising golf efficiency.\r\n\r\n', 5, '2021-07-05 00:42:51', '2021-07-05 00:42:51'),
(63, 'GFSGGPV4', 'Skechers GO GOLF Pro v.4   ', 6630, 14.99, 7, '~9.6 in / 24.4', 'Black/Grey/White/Blue', 'uploads/GF009.jpg', 'The Skechers GO GOLF Pro v.4 received plenty of praise from the golfing community. The walkers especially found much use from this shoe as it helped them course through the 18 holes without issues. The waterproof coating also comes in handy for many as it is one less thing to think about. ', 5, '2021-07-05 00:44:19', '2021-07-05 00:44:19'),
(64, 'GFATR2.0', 'Adidas Tech Response 2.0   ', 3164, 14.39, 9, '~10.25 in ~26', 'Black/White', 'uploads/GF010.jpg', 'Golf spikes with the lightweight, responsive feel of a running shoe. Lightweight comfort and confident grip to get you through the back nine. The responsive fit and feel of a running shoe blends with the dependable footing and stability of golf spikes. Their lightweight, breathable feel helps you focus on shaving strokes.', 5, '2021-07-05 00:45:46', '2021-07-05 00:45:46');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_t`
--
ALTER TABLE `category_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_t`
--
ALTER TABLE `contact_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_t`
--
ALTER TABLE `customer_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'customer identifier', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders_t`
--
ALTER TABLE `orders_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_details_t`
--
ALTER TABLE `order_details_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products_t`
--
ALTER TABLE `products_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
