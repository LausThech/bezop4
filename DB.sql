
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `comments` (`id`, `comment`) VALUES
(2, '2312111'),
(3, '123123123'),
(4, '123123'),
(5, '124124124124124'),
(6, '123123'),
(7, '123123'),
(8, '1241241'),
(9, '1241241'),
(10, 'fff');


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, '11', '$2y$10$wKo.uFcxCnfd.uiL4V.VEOOGLNSUXrvLBzzGm4S8g8SkeVwMqSKD6', '2022-10-14 14:56:46'),
(2, '123', '$2y$10$2jYjXciJ644yE.rGt0PkG.jFRsnxswMXOKT.Np7PM8yRJ/ekcqCJW', '2022-10-14 15:45:17'),
(3, '1234', '$2y$10$i3v605VIyR6ZkZQqIrNtR.2WFoXDGN7ynxMYp8u2/VTMYRVkvc5B.', '2022-12-23 14:38:45');

ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;
