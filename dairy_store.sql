-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2024 at 02:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dairy_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 2, '2024-07-16 21:42:01', '2024-07-16 21:42:01'),
(2, 3, 11, 2, '2024-07-16 21:42:19', '2024-07-16 21:42:19'),
(6, 2, 1, 1, '2024-07-17 11:09:08', '2024-07-17 11:09:08'),
(7, 83, 1, 4, '2024-07-17 11:54:40', '2024-07-17 11:54:40'),
(8, 2, 5, 6, '2024-07-17 12:45:28', '2024-07-17 12:45:28'),
(9, 2, 2, 4, '2024-07-17 12:46:14', '2024-07-17 12:46:14');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `categoryimg` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `categoryimg`) VALUES
(1, 'Milk', '1.jpg'),
(2, 'Ghee', '2.jpg'),
(3, 'Paneer', '3.jpg'),
(4, 'Buttermilk', '4.jpg'),
(5, 'Curd', '5.jpg'),
(6, 'Cheese', '6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `delivery_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `mrp` decimal(10,2) DEFAULT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `img1` varchar(255) NOT NULL,
  `img2` varchar(255) NOT NULL,
  `img3` varchar(255) NOT NULL,
  `img4` varchar(255) NOT NULL,
  `quantity` varchar(20) DEFAULT NULL,
  `quantity_unit` varchar(20) NOT NULL,
  `in_stock` tinyint(1) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `nutrients_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `category_id`, `mrp`, `offer_price`, `img1`, `img2`, `img3`, `img4`, `quantity`, `quantity_unit`, `in_stock`, `details`, `nutrients_info`) VALUES
(1, 'Full Cream Milk', 1, 80.00, 75.00, '11.jpg', '12.jpg', '13.jpg', '14.jpg', '1', 'liter', 100, 'Full cream milk provides rich taste and is perfect for making desserts and other dairy-based recipes. It is a great source of calcium, protein, and essential vitamins, ensuring overall health and wellness.', 'Contains 8g protein, 12g carbs, and 8g fat per serving. High in calcium and vitamin D, supporting bone health and immune function.'),
(2, 'Skimmed Milk', 1, 70.00, 65.00, '21.jpg', '22.jpg', '23.jpg', '24.jpg', '1', 'liter', 0, 'Skimmed milk is an ideal choice for health-conscious individuals. It has all the essential nutrients of regular milk but with reduced fat content, aiding in weight management while still providing necessary proteins and vitamins.', 'Contains 8g protein, 12g carbs, and 0.5g fat per serving. Rich in calcium, vitamins A and D, and low in cholesterol, promoting heart health.'),
(3, 'Chocolate Milk', 1, 90.00, 85.00, '31.jpg', '32.jpg', '33.jpg', '34.jpg', '1', 'liter', 70, 'Chocolate flavored milk is a favorite among children and adults alike. It combines the goodness of milk with the delightful taste of chocolate, making it both nutritious and enjoyable.', 'Contains 8g protein, 26g carbs, and 5g fat per serving. Fortified with calcium and vitamin D, it supports strong bones and energy levels.'),
(4, 'Toned Milk', 1, 75.00, 70.00, '41.jpg', '42.jpg', '43.jpg', '44.jpg', '1', 'liter', 60, 'Toned milk offers a balance between full cream and skimmed milk. It provides a moderate fat content while retaining all the essential nutrients, making it suitable for daily consumption.', 'Contains 8g protein, 12g carbs, and 3g fat per serving. Rich in calcium and vitamin B12, supporting nerve and blood cell health.'),
(5, 'Badam Milk', 1, 95.00, 90.00, '51.jpg', '52.jpg', '53.jpg', '54.jpg', '1', 'liter', 40, 'Badam milk is a nutritious beverage made from blending almonds with milk, offering a rich, nutty flavor and numerous health benefits. It is enriched with essential nutrients like proteins, vitamins, and minerals, making it ideal for overall health and wellness.', 'Contains 6g protein, 10g carbs, and 5g fat per serving. Rich in calcium, vitamin E, and antioxidants from almonds, promoting heart health and cognitive function.'),
(6, 'Organic Milk', 1, 100.00, 95.00, '61.jpg', '62.jpg', '63.jpg', '64.jpg', '1', 'liter', 30, 'Organic milk comes from cows that are not treated with antibiotics or growth hormones. It is a healthier option that is also environmentally friendly, ensuring natural and wholesome nutrition.', 'Contains 8g protein, 12g carbs, and 8g fat per serving. Rich in omega-3 fatty acids, supporting heart health and cognitive function.'),
(7, 'Pure Ghee', 2, 500.00, 450.00, '71.jpg', '72.jpg', '73.jpg', '74.jpg', '500', 'grams', 20, 'Pure ghee is a staple in Indian kitchens, known for its rich flavor and high smoke point. It is ideal for cooking and frying, enhancing the taste of various dishes while offering health benefits.', 'Contains 99.8g fat per 100g, including healthy saturated fats. Rich in vitamins A, D, E, and K, supporting immune function and vision health.'),
(8, 'Organic Ghee', 2, 600.00, 550.00, '81.jpg', '82.jpg', '83.jpg', '84.jpg', '500', 'grams', 15, 'Organic ghee is made from the milk of grass-fed cows and is free from any artificial additives. It provides a pure, rich flavor and numerous health benefits, including improved digestion and increased energy.', 'Contains 99.9g fat per 100g, including beneficial conjugated linoleic acid (CLA). High in fat-soluble vitamins, promoting overall health.'),
(9, 'Fresh Paneer', 3, 300.00, 275.00, '91.jpg', '92.jpg', '93.jpg', '94.jpg', '500', 'grams', 50, 'Fresh paneer is a versatile dairy product used in a variety of Indian dishes. It is made from high-quality milk and is known for its soft texture and mild flavor, making it a favorite in both vegetarian and non-vegetarian recipes.', 'Contains 18g protein, 4g carbs, and 20g fat per 100g. High in calcium and vitamin D, supporting bone health and muscle function.'),
(10, 'Low Fat Paneer', 3, 250.00, 225.00, '101.jpg', '102.jpg', '103.jpg', '104.jpg', '500', 'grams', 40, 'Low fat paneer offers all the benefits of regular paneer but with reduced fat content, making it an excellent choice for those looking to maintain a healthy diet without compromising on taste.', 'Contains 18g protein, 4g carbs, and 10g fat per 100g. Rich in calcium and vitamin D, aiding in bone strength and weight management.'),
(11, 'Buttermilk', 4, 30.00, 25.00, '111.jpg', '112.jpg', '113.jpg', '114.jpg', '500', 'ml', 100, 'Buttermilk is a refreshing dairy drink that aids in digestion and cooling down the body. It is perfect for hot summer days and can be used in various recipes.', 'Contains 3g protein, 4g carbs, and 1g fat per 100ml. High in probiotics, promoting gut health and digestion.'),
(12, 'Spiced Buttermilk', 4, 35.00, 30.00, '121.jpg', '122.jpg', '123.jpg', '124.jpg', '500', 'ml', 80, 'Spiced buttermilk combines the goodness of traditional buttermilk with the flavors of Indian spices. It is not only refreshing but also helps in digestion and provides a cooling effect.', 'Contains 3g protein, 4g carbs, and 1g fat per 100ml. Enriched with probiotics and essential minerals, supporting digestive health.'),
(13, 'Natural Curd', 5, 50.00, 45.00, '131.jpg', '132.jpg', '133.jpg', '134.jpg', '500', 'grams', 100, 'Natural curd is made from high-quality milk and contains live cultures that promote digestive health. It is a versatile dairy product used in various dishes and as a standalone snack.', 'Contains 4g protein, 5g carbs, and 3g fat per 100g. Rich in probiotics, calcium, and vitamins, supporting gut health and immunity.'),
(14, 'Greek Yogurt', 5, 70.00, 65.00, '141.jpg', '142.jpg', '143.jpg', '144.jpg', '500', 'grams', 0, 'Greek yogurt is known for its thick, creamy texture and high protein content. It is an excellent choice for a healthy snack or as an ingredient in recipes, providing a rich source of nutrients.', 'Contains 10g protein, 4g carbs, and 5g fat per 100g. High in probiotics, calcium, and vitamin B12, promoting muscle growth and digestive health.'),
(15, 'Flavored Yogurt', 5, 60.00, 55.00, '151.jpg', '152.jpg', '153.jpg', '154.jpg', '500', 'grams', 80, 'Flavored yogurt offers a delicious twist to regular yogurt with the addition of natural fruit flavors. It is a healthy snack that provides essential nutrients and a burst of flavor.', 'Contains 6g protein, 12g carbs, and 3g fat per 100g. Rich in probiotics, calcium, and vitamins, supporting overall health.'),
(16, 'Cheddar Cheese', 6, 400.00, 375.00, '161.jpg', '162.jpg', '163.jpg', '164.jpg', '250', 'grams', 50, 'Cheddar cheese is a popular cheese known for its rich, sharp flavor and smooth texture. It is versatile and can be used in various recipes, providing a good source of calcium and protein.', 'Contains 25g protein, 1g carbs, and 33g fat per 100g. High in calcium and vitamin D, supporting bone health and muscle function.'),
(17, 'Mozzarella Cheese', 6, 350.00, 325.00, '171.jpg', '172.jpg', '173.jpg', '174.jpg', '250', 'grams', 60, 'Mozzarella cheese is loved for its stretchy texture and mild flavor. It is perfect for pizzas, pasta dishes, and salads, offering a good balance of nutrients and delicious taste.', 'Contains 22g protein, 2g carbs, and 25g fat per 100g. Rich in calcium and phosphorus, promoting bone strength and dental health.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `phone_no`, `email`, `password`, `address`) VALUES
(1, 'Rajesh Kumar', '9876543210', 'rajesh.kumar@example.com', 'password123', 'Flat No. 302, Sunshine Apartments, Whitefield, Bangalore, Karnataka, India'),
(2, 'Priya Patel', '9998887776', 'a', '123', 'House No. 45, Green Park Colony, Saket, New Delhi, India'),
(3, 'Amit Singh', '8887776665', 'amit.singh@example.com', 'password789', 'Plot No. 15, Shanti Nagar, Andheri West, Mumbai, Maharashtra, India'),
(4, 'Neha Sharma', '7776665554', 'neha.sharma@example.com', 'passwordabc', 'Apartment No. 502, River View Towers, Salt Lake City, Kolkata, West Bengal, India'),
(5, 'Vikram Gupta', '6665554443', 'vikram.gupta@example.com', 'passwordxyz', 'Bungalow No. 10, Gandhi Nagar, Adyar, Chennai, Tamil Nadu, India'),
(18, 'Admin', '9876543210', 'admin', 'admin@123', 'Daily Dairy PVT LTD'),
(82, 'mohan', '65425812', 'a@tech', '123', 'Banglore'),
(83, 'b', '123', 'g@', '123', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
