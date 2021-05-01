-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para credito_
CREATE DATABASE IF NOT EXISTS `credito_` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `credito_`;

-- Volcando estructura para tabla credito_.bancos
CREATE TABLE IF NOT EXISTS `bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `banco` varchar(255) NOT NULL,
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_.bancos: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` (`id`, `nombre`, `banco`) VALUES
	(32, 'Asociación de Bancos Privados del Ecuador', 'Asociación de Bancos Privados del Ecuador'),
	(5, 'Banco Amazonas', 'Banco Amazonas'),
	(12, 'Banco Bolivariano', 'Banco Bolivariano'),
	(15, 'Banco Capital', 'Banco Capital'),
	(28, 'Banco Central del Ecuador', 'Banco Central del Ecuador'),
	(16, 'Banco Comercial de Manabí', ''),
	(17, 'Banco Coopnacional', ''),
	(18, 'Banco D-Miro', ''),
	(27, 'Banco de Desarrollo del Ecuador', ''),
	(36, 'Banco de Desarrollo Económico y Social de Venezuela «BANDES»', ''),
	(7, 'Banco de Guayaquil', ''),
	(10, 'Banco de Loja', ''),
	(13, 'Banco de Machala', ''),
	(11, 'Banco del Austro', ''),
	(14, 'Banco Del Bank', ''),
	(24, 'Banco del Instituto Ecuatoriano de Seguridad Social', ''),
	(9, 'Banco del Pacífico', ''),
	(22, 'Banco Diners Club del Ecuador', ''),
	(19, 'Banco Finca', ''),
	(8, 'Banco General Rumiñahui', ''),
	(4, 'Banco Internacional', ''),
	(20, 'Banco Litoral', ''),
	(3, 'Banco Pichincha', ''),
	(6, 'Banco Procredit', ''),
	(2, 'Banco Produbanco', ''),
	(1, 'Banco Solidario', 'Banco Solidario'),
	(23, 'Banco VisionFund', ''),
	(21, 'Bancodesarrollo', ''),
	(26, 'BanEcuador', ''),
	(39, 'Citibank', ''),
	(40, 'Cobro terreno', ''),
	(30, 'Corporación del Seguro de Depósitos COSEDE', ''),
	(25, 'Corporación Financiera Nacional', ''),
	(34, 'EFG Bank', ''),
	(31, 'FELABAN – Federación Latinoamericana de Bancos', ''),
	(38, 'Foreign Exchange Ecuador', ''),
	(35, 'Helm Bank (matriz Miami)', ''),
	(29, 'Junta de Regulación Monetaria y Financiera', ''),
	(37, 'Milcambios S.A.', ''),
	(33, 'Wells Fargo Bank N. A.', '');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;

-- Volcando estructura para tabla credito_.bancosdestino
CREATE TABLE IF NOT EXISTS `bancosdestino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `banco` varchar(255) NOT NULL,
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla credito_.bancosdestino: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `bancosdestino` DISABLE KEYS */;
INSERT INTO `bancosdestino` (`id`, `nombre`, `banco`) VALUES
	(7, 'Banco de Guayaquil', ''),
	(9, 'Banco del Pacífico', ''),
	(4, 'Banco Internacional', ''),
	(3, 'Banco Pichincha', ''),
	(2, 'Banco Produbanco', '');
/*!40000 ALTER TABLE `bancosdestino` ENABLE KEYS */;

-- Volcando estructura para tabla credito_.enviomasivo
CREATE TABLE IF NOT EXISTS `enviomasivo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero` varchar(50) DEFAULT NULL,
  `script` varchar(1500) DEFAULT NULL,
  `direccion` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_.enviomasivo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enviomasivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `enviomasivo` ENABLE KEYS */;

-- Volcando estructura para tabla credito_.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla credito_.permissions: ~44 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Mostrar usuarios', 'users.index', NULL, '2019-08-12 18:06:25', '2019-08-12 18:06:25'),
	(2, 'Crear un usuario', 'users.create', NULL, '2019-08-12 18:06:39', '2019-08-12 18:06:39'),
	(3, 'Mostrar empresas', 'empresas.index', NULL, '2019-08-12 18:08:53', '2019-08-12 18:08:53'),
	(4, 'Crear empresas', 'empresas.create', NULL, '2019-08-12 18:09:12', '2019-08-12 18:09:12'),
	(5, 'Editar usuario', 'users.edit', NULL, '2019-08-13 16:50:33', '2019-08-13 16:50:33'),
	(6, 'Guardar usuario', 'users.store', NULL, '2019-08-13 16:50:44', '2019-08-13 16:50:44'),
	(7, 'Ver usuario', 'users.show', NULL, '2019-08-13 16:51:07', '2019-08-13 16:51:07'),
	(8, 'Actualizar usuario', 'users.update', NULL, '2019-08-13 16:51:29', '2019-08-13 16:51:29'),
	(9, 'Eliminar usuario', 'users.destroy', NULL, '2019-08-13 16:51:39', '2019-08-13 16:51:39'),
	(10, 'Mostrar roles', 'roles.index', NULL, '2019-08-13 16:51:55', '2019-08-13 16:51:55'),
	(11, 'Crear roles', 'roles.create', NULL, '2019-08-13 16:52:02', '2019-08-13 16:52:02'),
	(12, 'Guardar roles', 'roles.store', NULL, '2019-08-13 16:52:13', '2019-08-13 16:52:13'),
	(13, 'Ver rol', 'roles.show', NULL, '2019-08-13 16:52:22', '2019-08-13 16:52:22'),
	(14, 'Editar rol', 'roles.edit', NULL, '2019-08-13 16:52:31', '2019-08-13 16:52:31'),
	(15, 'Actualizar rol', 'roles.update', NULL, '2019-08-13 16:52:46', '2019-08-13 16:52:46'),
	(16, 'Eliminar rol', 'roles.destroy', NULL, '2019-08-13 16:52:59', '2019-08-13 16:52:59'),
	(17, 'Mostrar todos los permisos', 'permissions.index', NULL, '2019-08-13 16:53:14', '2019-08-13 16:53:14'),
	(18, 'Crear nuevo permiso', 'permissions.create', NULL, '2019-08-13 16:53:26', '2019-08-13 16:53:26'),
	(19, 'Ver un permiso', 'permissions.show', NULL, '2019-08-13 16:54:01', '2019-08-13 16:54:01'),
	(20, 'Guardar un permiso', 'permissions.store', NULL, '2019-08-13 16:54:23', '2019-08-13 16:54:23'),
	(21, 'Editar un permiso', 'permissions.edit', NULL, '2019-08-13 16:54:36', '2019-08-13 16:54:36'),
	(22, 'Actualizar permiso', 'permissions.update', NULL, '2019-08-13 16:54:50', '2019-08-13 16:54:50'),
	(23, 'Eliminar permiso', 'permissions.destroy', NULL, '2019-08-13 16:55:04', '2019-08-13 16:55:04'),
	(24, 'Guardar una empresa', 'empresas.store', NULL, '2019-08-13 16:55:53', '2019-08-13 16:55:53'),
	(25, 'Editar una empresa', 'empresas.edit', NULL, '2019-08-13 16:56:05', '2019-08-13 16:56:05'),
	(26, 'Actualizar empresa', 'empresas.update', NULL, '2019-08-13 16:56:16', '2019-08-13 16:56:16'),
	(27, 'Eliminar empresa', 'empresas.destroy', NULL, '2019-08-13 16:56:28', '2019-08-13 16:56:28'),
	(28, 'Asignacion de puesto', 'puestos.index', NULL, '2019-08-23 12:30:32', '2019-08-23 12:30:32'),
	(29, 'procesos', 'procesos.index', NULL, '2019-08-27 19:46:30', '2019-08-27 19:46:30'),
	(30, 'listado de clientes cobranza', 'clientes.index', NULL, '2019-08-30 18:06:06', '2019-08-30 18:06:06'),
	(31, 'editar clientes cobranza', 'clientes.edit', NULL, '2019-08-30 18:06:23', '2019-08-30 18:06:23'),
	(32, 'ver detalle de clientes Cobranza', 'clientes.show', NULL, '2019-08-30 18:58:11', '2019-08-30 18:58:11'),
	(33, 'bandeja clientes cobranza', 'bandeja.index', NULL, '2019-09-08 19:08:43', '2019-09-08 19:08:43'),
	(34, 'bandeja clientes VENTAS', 'agenda.index', NULL, '2019-09-08 19:08:43', '2019-09-16 12:55:51'),
	(35, 'bandeja', 'ventasgrupos', 'bandejas de agendados por grupos', '2019-10-05 14:07:08', '2019-10-05 14:07:08'),
	(36, 'Manuales de Sistemas', 'manuales.index', 'manuales de sistemas', '2019-11-13 14:49:06', '2019-11-13 14:49:06'),
	(37, 'Rechazos', 'rechazos.index', 'rechazos.index', '2019-11-28 14:20:35', '2019-11-28 14:44:49'),
	(38, 'segmentación', 'contactos', 'segmentación de clientes de cobranza rf', '2020-01-10 16:02:04', '2020-01-10 16:02:04'),
	(39, 'Asignaciones', 'Asignaciones.index', 'asignaciones de clientes cobranza', '2020-01-17 17:29:11', '2020-01-17 17:29:11'),
	(40, 'BANDEJA SAC', 'bandejasac.index', 'modulo de servicio al cliente', '2020-02-01 13:42:37', '2020-02-01 13:42:37'),
	(41, 'VER DETALLE CONTACTOS  DE CLIENTE COBRANZA', 'deudor.show', 'VER EL DETALLE DE CONTACTO LAS GESTIONES DE SISTEMA AGENDA Y CONTACTOS', '2020-02-03 18:08:15', '2020-02-03 18:08:15'),
	(42, 'Whatsapp Masivos', 'whatsappmasivo.index', 'permite ingresar los whatsapp de envio masivos y descargar para el envio tambien', '2020-02-06 10:23:25', '2020-02-06 10:23:25'),
	(43, 'reportes dinamicos', 'reporte.index', 'reportes dinamicos', '2020-02-29 14:07:32', '2020-02-29 14:07:32'),
	(44, 'reportesdetablas', 'reportesdetablas.index', 'modulo de reporteria suministrada por el mosulo de reportes dinamicos', '2020-03-01 17:57:04', '2020-03-01 17:57:04');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Volcando estructura para tabla credito_.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla credito_.permission_role: ~53 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(2, 28, 3, '2019-08-23 12:35:47', '2019-08-23 12:35:47'),
	(3, 28, 4, '2019-08-30 18:07:19', '2019-08-30 18:07:19'),
	(4, 30, 4, '2019-08-30 18:07:19', '2019-08-30 18:07:19'),
	(5, 32, 4, '2019-08-30 18:58:24', '2019-08-30 18:58:24'),
	(6, 28, 5, '2019-08-31 09:27:59', '2019-08-31 09:27:59'),
	(7, 30, 5, '2019-08-31 09:27:59', '2019-08-31 09:27:59'),
	(8, 31, 5, '2019-08-31 09:27:59', '2019-08-31 09:27:59'),
	(9, 32, 5, '2019-08-31 09:27:59', '2019-08-31 09:27:59'),
	(12, 30, 2, '2019-09-08 19:08:03', '2019-09-08 19:08:03'),
	(13, 33, 2, '2019-09-08 19:09:00', '2019-09-08 19:09:00'),
	(14, 34, 6, '2019-09-14 14:28:51', '2019-09-14 14:28:53'),
	(15, 2, 7, '2019-09-19 11:24:37', '2019-09-19 11:24:37'),
	(16, 3, 7, '2019-09-19 11:24:37', '2019-09-19 11:24:37'),
	(17, 4, 7, '2019-09-19 11:24:37', '2019-09-19 11:24:37'),
	(18, 5, 7, '2019-09-19 11:24:37', '2019-09-19 11:24:37'),
	(19, 6, 7, '2019-09-19 11:24:37', '2019-09-19 11:24:37'),
	(20, 7, 7, '2019-09-19 11:24:37', '2019-09-19 11:24:37'),
	(21, 8, 7, '2019-09-19 11:24:37', '2019-09-19 11:24:37'),
	(22, 1, 7, '2019-09-19 11:26:06', '2019-09-19 11:26:06'),
	(23, 28, 8, '2019-10-05 14:11:01', '2019-10-05 14:11:01'),
	(24, 34, 8, '2019-10-05 14:11:01', '2019-10-05 14:11:01'),
	(25, 36, 8, '2019-11-13 14:49:39', '2019-11-13 14:49:39'),
	(26, 36, 3, '2019-11-14 12:39:44', '2019-11-14 12:39:44'),
	(28, 36, 5, '2019-11-14 12:40:35', '2019-11-14 12:40:35'),
	(29, 37, 9, '2019-11-28 14:21:21', '2019-11-28 14:21:21'),
	(30, 37, 10, '2019-11-28 14:46:15', '2019-11-28 14:46:15'),
	(31, 38, 11, '2020-01-10 16:03:00', '2020-01-10 16:03:00'),
	(33, 40, 12, '2020-02-01 13:43:01', '2020-02-01 13:43:01'),
	(34, 30, 12, '2020-02-01 13:46:56', '2020-02-01 13:46:56'),
	(35, 32, 12, '2020-02-01 13:46:56', '2020-02-01 13:46:56'),
	(36, 33, 12, '2020-02-01 13:46:56', '2020-02-01 13:46:56'),
	(37, 38, 12, '2020-02-01 13:46:56', '2020-02-01 13:46:56'),
	(38, 41, 2, '2020-02-03 18:12:45', '2020-02-03 18:12:45'),
	(39, 41, 4, '2020-02-03 18:21:10', '2020-02-03 18:21:10'),
	(41, 33, 4, '2020-02-03 18:26:47', '2020-02-03 18:26:47'),
	(42, 38, 4, '2020-02-03 18:26:47', '2020-02-03 18:26:47'),
	(43, 42, 12, '2020-02-06 10:23:39', '2020-02-06 10:23:39'),
	(44, 31, 12, '2020-02-21 16:39:02', '2020-02-21 16:39:02'),
	(45, 1, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(46, 7, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(47, 30, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(48, 31, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(49, 32, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(50, 33, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(51, 34, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(52, 36, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(53, 38, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(54, 39, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(55, 40, 13, '2020-03-05 09:14:37', '2020-03-05 09:14:37'),
	(56, 41, 13, '2020-03-05 09:14:38', '2020-03-05 09:14:38'),
	(57, 42, 13, '2020-03-05 09:14:38', '2020-03-05 09:14:38'),
	(58, 43, 13, '2020-03-05 09:14:38', '2020-03-05 09:14:38'),
	(59, 44, 13, '2020-03-05 09:14:38', '2020-03-05 09:14:38');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Volcando estructura para tabla credito_.permission_user
CREATE TABLE IF NOT EXISTS `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla credito_.permission_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;

-- Volcando estructura para tabla credito_.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` enum('all-access','no-access') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla credito_.roles: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`, `special`) VALUES
	(1, 'Admin', 'admin.admin', 'Usuario administrador', NULL, '2019-08-12 18:07:19', 'all-access'),
	(2, 'Agente Cobranza', 'agente', NULL, '2019-08-12 18:06:55', '2019-11-20 13:06:25', NULL),
	(3, 'LIDERES', 'LIDERES', NULL, '2019-08-23 12:35:47', '2019-08-23 12:35:47', NULL),
	(4, 'LIDER_COBRANZA', 'LIDER', NULL, '2019-08-30 18:07:18', '2019-08-30 18:07:18', NULL),
	(5, 'Procesos', 'Procesos', NULL, '2019-08-31 09:27:58', '2019-08-31 09:27:58', NULL),
	(6, 'Agente ventas', 'agente ventas', NULL, '2019-08-12 18:06:55', '2019-08-12 18:06:55', NULL),
	(7, 'usuarios', 'users.index', NULL, '2019-09-19 11:24:37', '2019-09-19 11:24:37', NULL),
	(8, 'lirder de ventas', 'lider ventas', NULL, '2019-10-05 14:11:01', '2019-10-05 14:11:01', NULL),
	(9, 'Operaciones', 'operaciones', NULL, '2019-11-28 14:21:21', '2019-11-28 14:21:21', NULL),
	(10, 'Rechazos Operaciones', 'rechazos.index', NULL, '2019-11-28 14:46:15', '2019-11-28 14:46:15', NULL),
	(11, 'SEGMENTACIÓN', 'contactos', NULL, '2020-01-10 16:03:00', '2020-01-10 16:03:00', NULL),
	(12, 'SAC', 'bandejasac.index', NULL, '2020-02-01 13:43:01', '2020-02-03 18:03:43', NULL),
	(13, 'GERENCIA', 'GERENCIA', NULL, '2020-03-05 09:14:37', '2020-03-05 09:14:37', NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla credito_.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla credito_.role_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(15, 1, 3328, '2019-08-26 10:29:29', '2019-08-26 10:29:29');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Volcando estructura para tabla credito_.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_paterno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_materno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci,
  `celular` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_civil` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` text COLLATE utf8mb4_unicode_ci,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discapacidad` tinyint(1) NOT NULL DEFAULT '0',
  `comentario` text COLLATE utf8mb4_unicode_ci,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `perfil_actualizado` tinyint(1) NOT NULL,
  `usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero_id` int(10) unsigned NOT NULL,
  `area` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grupo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_usuario_unique` (`usuario`),
  KEY `users_genero_id_foreign` (`genero_id`),
  KEY `users_password_unique` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla credito_.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `cedula`, `nombre1`, `nombre2`, `apellido_paterno`, `apellido_materno`, `direccion`, `celular`, `telefono`, `estado_civil`, `foto`, `fecha_nacimiento`, `email`, `discapacidad`, `comentario`, `extension`, `enabled`, `perfil_actualizado`, `usuario`, `password`, `genero_id`, `area`, `grupo`, `remember_token`, `created_at`, `updated_at`) VALUES
	(3328, '1200828463', 'GREGORIO', 'ENRIQUE', 'OSORIO', 'ANDRADES', 'GARZOTA', '0999218183', '04000000', 'Soltero', 'fotocarnet.png', '2019-08-26', 'gregorioenrique14@gmail.com', 0, NULL, '136', 1, 1, 'gosorio', '$2y$12$ii7vQtOv3QxDytzt6inNWu.PI.d0UtOOF/IP4VDG7Pg7QdNZUtw2K', 1, 'COBRANZA', 'LIDERES', NULL, '2019-08-26 10:29:10', '2019-08-31 11:09:42');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._categoria
CREATE TABLE IF NOT EXISTS `_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) DEFAULT 'of',
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._categoria: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `_categoria` DISABLE KEYS */;
INSERT INTO `_categoria` (`id`, `estado`, `nombre`, `descripcion`, `nota`, `created_at`, `updated_at`) VALUES
	(1, 'on', 'SMARTPHONE', 'TELEFONOS', 'gvvhvmgh', NULL, NULL),
	(2, 'on', 'LINEA MARRON', 'MUEBLES', 'ddsdsd', NULL, NULL),
	(3, 'of', 'LINEA BLANCA', 'ELECTRODOMESTICOS', 'mmmmmmm mmmm', NULL, NULL),
	(5, 'of', 'customControlValidation1', 'customControlValidation1', 'customControlValidation1 mControlValidation1', NULL, NULL),
	(11, 'on', 'pruebas', 'pruebas', 'notas de pruebas', NULL, NULL);
/*!40000 ALTER TABLE `_categoria` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._clientes
CREATE TABLE IF NOT EXISTS `_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(11) NOT NULL DEFAULT '',
  `nombre1` varchar(100) DEFAULT NULL,
  `nombre2` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(100) DEFAULT NULL,
  `apellidoMaterno` varchar(100) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `prefijo` int(11) DEFAULT '0',
  `numero` varchar(15) DEFAULT NULL,
  `telefonoConvencional` varchar(15) DEFAULT NULL,
  `prefijotrabajo` int(11) DEFAULT '0',
  `telefonoTrabajo` varchar(15) DEFAULT NULL,
  `extension` varchar(15) DEFAULT NULL,
  `direccionDomicilio` varchar(255) DEFAULT NULL,
  `ciudad_id` int(11) DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `municipio_id` int(11) DEFAULT NULL,
  `direccionTrabajo` varchar(255) DEFAULT NULL,
  `nombreEmpresa` varchar(255) DEFAULT NULL,
  `salario` varchar(50) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `nombreDocumento` varchar(255) DEFAULT NULL,
  `agenteDocumetno` varchar(255) DEFAULT NULL,
  `fechadocumento` date DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._clientes: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `_clientes` DISABLE KEYS */;
INSERT INTO `_clientes` (`id`, `cedula`, `nombre1`, `nombre2`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `email`, `prefijo`, `numero`, `telefonoConvencional`, `prefijotrabajo`, `telefonoTrabajo`, `extension`, `direccionDomicilio`, `ciudad_id`, `provincia_id`, `municipio_id`, `direccionTrabajo`, `nombreEmpresa`, `salario`, `cargo`, `documento`, `nombreDocumento`, `agenteDocumetno`, `fechadocumento`, `usuario`, `created_at`, `updated_at`) VALUES
	(6, '0962398350', 'GREGORIO', 'ENRIQUE', 'OSORIO', 'ANDRADES', '2021-04-19', 'GRE@GMAIL.COM', 9, '0999921818', NULL, 2, '022545564', '5454', 'PRUEBAS DE DIRECCIONES CLIENTE', NULL, NULL, NULL, 'PRUEBAS DE DIRECCION LABORAL', 'DATA', '400', 'PROGRAMADOR', NULL, NULL, NULL, NULL, 'gosorio', '2021-04-19 21:17:07', '2021-04-19 21:17:07');
/*!40000 ALTER TABLE `_clientes` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._cuotas
CREATE TABLE IF NOT EXISTS `_cuotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `venta_id` int(11) NOT NULL DEFAULT '0',
  `saldodeuda` float(18,2) DEFAULT '0.00',
  `periodo` int(11) NOT NULL,
  `interes` double NOT NULL,
  `cuota` double NOT NULL,
  `abono` double NOT NULL,
  `saldo_abono` double DEFAULT NULL,
  `estado_abono` int(1) DEFAULT NULL,
  `fecha_pago` date NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `estado` binary(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagos_user_id_foreign` (`user_id`),
  KEY `venta_id` (`venta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla credito_._cuotas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `_cuotas` DISABLE KEYS */;
INSERT INTO `_cuotas` (`id`, `cliente_id`, `venta_id`, `saldodeuda`, `periodo`, `interes`, `cuota`, `abono`, `saldo_abono`, `estado_abono`, `fecha_pago`, `user_id`, `fecha_registro`, `estado`, `created_at`, `updated_at`) VALUES
	(1, 6, 1, 252.52, 7, 0.1, 93.23, 50, 0, 0, '2021-05-30', 3328, '2021-05-01 14:22:00', _binary 0x31, '2021-05-01 14:22:36', '2021-05-01 15:12:50');
/*!40000 ALTER TABLE `_cuotas` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._cuotasdetalle
CREATE TABLE IF NOT EXISTS `_cuotasdetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuota_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  `saldo_inicial` float(18,2) NOT NULL,
  `interes` float(18,2) NOT NULL,
  `cuota` float(18,2) NOT NULL,
  `abono` float(18,2) NOT NULL,
  `saldo_cuota` float(18,2) NOT NULL DEFAULT '0.00',
  `estado` varchar(50) NOT NULL DEFAULT '',
  `fecha_pago` date NOT NULL,
  `saldo_final` float(18,2) NOT NULL,
  `asesor` varchar(50) NOT NULL,
  `fecha_registro` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__cuotasdetalle__cuotas` (`cuota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._cuotasdetalle: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `_cuotasdetalle` DISABLE KEYS */;
INSERT INTO `_cuotasdetalle` (`id`, `cuota_id`, `venta_id`, `periodo`, `saldo_inicial`, `interes`, `cuota`, `abono`, `saldo_cuota`, `estado`, `fecha_pago`, `saldo_final`, `asesor`, `fecha_registro`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 650.00, 0.65, 93.23, 92.58, 0.00, 'CANCELADA', '2021-06-30', 557.42, 'gosorio', '2021-05-01 14:22', '2021-05-01 14:22:36', '2021-05-01 14:26:53'),
	(2, 1, 1, 2, 557.42, 0.56, 93.23, 92.67, 0.00, 'CANCELADA', '2021-07-30', 464.75, 'gosorio', '2021-05-01 14:22', '2021-05-01 14:22:36', '2021-05-01 14:29:24'),
	(3, 1, 1, 3, 464.75, 0.46, 93.23, 92.76, 0.00, 'CANCELADA', '2021-08-30', 371.99, 'gosorio', '2021-05-01 14:22', '2021-05-01 14:22:36', '2021-05-01 14:32:07'),
	(4, 1, 1, 4, 371.99, 0.37, 93.23, 92.86, 0.00, 'CANCELADA', '2021-09-30', 279.13, 'gosorio', '2021-05-01 14:22', '2021-05-01 14:22:36', '2021-05-01 15:12:50'),
	(5, 1, 1, 5, 279.13, 0.28, 93.23, 92.95, 66.15, 'PENDIENTE', '2021-10-30', 186.18, 'gosorio', '2021-05-01 14:22', '2021-05-01 14:22:36', '2021-05-01 15:12:50'),
	(6, 1, 1, 6, 186.18, 0.19, 93.23, 93.04, 93.23, 'PENDIENTE', '2021-11-30', 93.14, 'gosorio', '2021-05-01 14:22', '2021-05-01 14:22:36', '2021-05-01 14:22:36'),
	(7, 1, 1, 7, 93.14, 0.09, 93.14, 93.04, 93.14, 'PENDIENTE', '2021-12-30', 0.10, 'gosorio', '2021-05-01 14:22', '2021-05-01 14:22:36', '2021-05-01 14:22:36');
/*!40000 ALTER TABLE `_cuotasdetalle` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._estadoventa
CREATE TABLE IF NOT EXISTS `_estadoventa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'0',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._estadoventa: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `_estadoventa` DISABLE KEYS */;
INSERT INTO `_estadoventa` (`id`, `nombre`, `descripcion`, `estado`) VALUES
	(1, 'CANCELADA', 'DEUDA PAGADA', b'1'),
	(2, 'PENDIENTE', 'DEUNDA CON VALORES PENDIENTE', b'1'),
	(3, 'SIN PAGO', 'DEUDA SIN UN PAGO', b'1'),
	(4, 'ANULADA', 'DEUDA ANULADA', b'1'),
	(5, 'AJUSTE', 'ADJUSTAR DEUDA', b'1'),
	(6, 'LIQUIDADA', 'LIQUIDACION DEUDA', b'1');
/*!40000 ALTER TABLE `_estadoventa` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._formapago
CREATE TABLE IF NOT EXISTS `_formapago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._formapago: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `_formapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `_formapago` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._pagos
CREATE TABLE IF NOT EXISTS `_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ventas_id` int(11) NOT NULL,
  `clientes_id` varchar(50) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `agente` varchar(100) DEFAULT NULL,
  `origen_id` varchar(255) DEFAULT NULL,
  `destino_id` varchar(255) DEFAULT NULL,
  `formapago` varchar(255) DEFAULT NULL,
  `Columna 16` float(18,2) DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `tipopago` varchar(50) DEFAULT NULL,
  `saldo_anterior` float(18,2) DEFAULT NULL,
  `letra` int(11) DEFAULT NULL,
  `valor` float(18,2) DEFAULT NULL,
  `saldo_actual` float(18,2) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `nombreArchivo` varchar(255) DEFAULT NULL,
  `comentario` varchar(600) DEFAULT NULL,
  `agenteRecibo` varchar(50) DEFAULT NULL,
  `fechaRecibo` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._pagos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `_pagos` DISABLE KEYS */;
INSERT INTO `_pagos` (`id`, `ventas_id`, `clientes_id`, `documento`, `fecha`, `agente`, `origen_id`, `destino_id`, `formapago`, `Columna 16`, `fechapago`, `tipopago`, `saldo_anterior`, `letra`, `valor`, `saldo_actual`, `archivo`, `nombreArchivo`, `comentario`, `agenteRecibo`, `fechaRecibo`, `created_at`, `updated_at`) VALUES
	(1, 1, '6', '569865', '2021-05-01 14:25:00', 'gosorio', '3', '3', 'DEPOSITO', NULL, '2021-05-01', '1', 702.52, 0, 50.00, 652.52, NULL, NULL, 'erere erer eere abono', NULL, NULL, '2021-05-01 14:25:25', '2021-05-01 14:29:25'),
	(2, 1, '6', '24254401', '2021-05-01 14:26:00', 'gosorio', '3', '3', 'TRANSFERENCIA', NULL, '2021-05-01', '2', 702.52, 1, 100.00, 602.52, NULL, NULL, 'primera cuota', NULL, NULL, '2021-05-01 14:26:52', '2021-05-01 14:26:52'),
	(3, 1, '6', '25565464', '2021-05-01 14:29:00', 'gosorio', '3', '3', 'TRANSFERENCIA', NULL, '2021-05-01', '2', 602.52, 2, 100.00, 502.52, NULL, NULL, 'notassss', NULL, NULL, '2021-05-01 14:29:24', '2021-05-01 14:29:24'),
	(4, 1, '6', '55645', '2021-05-01 14:32:00', 'gosorio', '3', '3', 'TRANSFERENCIA', NULL, '2021-05-01', NULL, 502.52, 3, 100.00, 402.52, NULL, NULL, 'notas', NULL, NULL, '2021-05-01 14:32:07', '2021-05-01 14:32:08'),
	(5, 1, '6', '265656', '2021-05-01 15:12:00', 'gosorio', '3', '3', 'DEPOSITO', NULL, '2021-05-01', '2', 402.52, 4, 100.00, 302.52, NULL, NULL, 'otras cuotas', NULL, NULL, '2021-05-01 15:12:50', '2021-05-01 15:12:50');
/*!40000 ALTER TABLE `_pagos` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._productos
CREATE TABLE IF NOT EXISTS `_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` float(18,2) DEFAULT NULL,
  `preciocomprado` float(18,2) DEFAULT NULL,
  `iva` float(18,2) DEFAULT NULL,
  `ice` float(18,2) DEFAULT '0.00',
  `total` float(18,2) DEFAULT NULL,
  `inversion` float(18,2) DEFAULT NULL,
  `recuperado` float(18,2) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `peso` float(18,2) DEFAULT NULL,
  `tamano` float(18,2) DEFAULT NULL,
  `cantidad` float(18,2) NOT NULL,
  `restante` float(18,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `nota` varchar(300) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `nombreArchivo` varchar(255) DEFAULT NULL,
  `agenteArchivo` varchar(255) DEFAULT NULL,
  `fechaArchivo` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_productos_proveedor` (`categoria_id`),
  KEY `FK__productos__proveedor` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._productos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `_productos` DISABLE KEYS */;
INSERT INTO `_productos` (`id`, `proveedor_id`, `categoria_id`, `nombre`, `descripcion`, `precio`, `preciocomprado`, `iva`, `ice`, `total`, `inversion`, `recuperado`, `marca`, `modelo`, `color`, `peso`, `tamano`, `cantidad`, `restante`, `imagen`, `nota`, `usuario`, `archivo`, `nombreArchivo`, `agenteArchivo`, `fechaArchivo`, `created_at`, `updated_at`) VALUES
	(13, 1, 1, 'Samsung Galaxy A11', 'es un movil del año 2020 con un peso de 177 gramos y un tamaño de 161.4 x 76.3 x 8 mm.. Tiene una pantalla de 6.4 pulgadas, cámara de 13 MP y memoria de 32GB 2GB RAM, 32GB 3GB RAM. Su procesador es Octa-core 1.8 GHz', 350.00, NULL, 42.00, 0.00, 392.00, NULL, NULL, 'Samsung', 'Galaxy A11', NULL, 1.00, 6.40, 1.00, 0.00, NULL, 'Para conocer las especificaciones completas del smartphone consulte las caracteristicas y especificaciones, la revisión de videos, las opiniones y las comparaciones.', 'gosorio', 'imagenes/productos/2020/05/14/1589513901_descarga.jpg', '1589513901_descarga.jpg', 'gosorio', '2020-05-14 22:38:00', '2020-05-14 22:36:35', '2021-04-25 20:58:26'),
	(18, 1, 1, 'pruebas', 'sdsdsd', 300.00, 300.00, 36.00, 0.00, 336.00, 600.00, NULL, 'gregorio', '0962398350', '#00ff00', 3.00, 2.00, 2.00, 1.00, NULL, 'sdasfdgfhjkl', 'gosorio', NULL, NULL, NULL, NULL, '2020-05-19 20:18:50', '2021-04-25 21:13:29'),
	(19, 1, 2, 'juego de casa', 'cómoda, cama, mesa, cilindro, ventiladores', 700.00, 500.00, 0.00, 0.00, 700.00, 700.00, NULL, 'rratan', 'marron', '#683c3b', 12.00, 0.00, 1.00, 0.00, NULL, 'Varidad de productos', 'gosorio', NULL, NULL, NULL, NULL, '2021-05-01 13:15:12', '2021-05-01 14:22:37');
/*!40000 ALTER TABLE `_productos` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._proveedor
CREATE TABLE IF NOT EXISTS `_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._proveedor: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `_proveedor` DISABLE KEYS */;
INSERT INTO `_proveedor` (`id`, `nombre`, `tipo`, `descripcion`, `direccion`, `telefono`, `comentario`, `created_at`, `updated_at`) VALUES
	(1, 'TECNOLOGING', 'Distribuidor', 'EMPRESA DE TECNOLOGIA VENTA DE TELEFONOS', 'GUYAQUIL', '0999218183', 'GUYAQUIL', '0000-00-00 00:00:00', '2020-04-27 12:20:26'),
	(3, 'LGcc', 'Fabricantes', 'lggg', 'MIAMI', '0999218186s', 'MIAMI', '2020-04-26 23:39:56', '2020-04-27 13:11:50'),
	(6, 'gregorio osorio', 'Fabricantes', 'ventas de software', 'urdenor2', '0999218183', 'pruebas de sistema', '2020-04-27 12:21:14', '2020-04-27 12:21:14');
/*!40000 ALTER TABLE `_proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._recaudaciones
CREATE TABLE IF NOT EXISTS `_recaudaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ventas_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `agente` varchar(100) DEFAULT NULL,
  `origen` varchar(255) DEFAULT NULL,
  `destino` varchar(255) DEFAULT NULL,
  `formapago` varchar(255) DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `valor` float(18,2) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `nombreArchivo` varchar(255) DEFAULT NULL,
  `comentario` varchar(600) DEFAULT NULL,
  `agenteRecibo` varchar(50) DEFAULT NULL,
  `fechaRecibo` datetime DEFAULT NULL,
  KEY `id` (`id`),
  KEY `FK__recaudaciones__ventas` (`ventas_id`),
  KEY `FK__recaudaciones__clientes` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._recaudaciones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `_recaudaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `_recaudaciones` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._tipopago
CREATE TABLE IF NOT EXISTS `_tipopago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._tipopago: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `_tipopago` DISABLE KEYS */;
INSERT INTO `_tipopago` (`id`, `nombre`) VALUES
	(1, 'ABONO'),
	(2, 'CUOTAS');
/*!40000 ALTER TABLE `_tipopago` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._tipoventa
CREATE TABLE IF NOT EXISTS `_tipoventa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `porcentaje` float(18,2) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._tipoventa: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `_tipoventa` DISABLE KEYS */;
INSERT INTO `_tipoventa` (`id`, `nombre`, `descripcion`, `porcentaje`, `created_at`, `updated_at`) VALUES
	(1, 'CREDITO', 'VENTA DE PRODUCTO POR CREDICTO DIRECTO', 30.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'DECONTADO', 'VENTA DIRECTA', 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `_tipoventa` ENABLE KEYS */;

-- Volcando estructura para tabla credito_._ventas
CREATE TABLE IF NOT EXISTS `_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `tipoVenta_id` int(11) NOT NULL,
  `cuota_id` int(11) DEFAULT NULL,
  `cantidadproducto` int(11) DEFAULT '0',
  `interes` float DEFAULT '0',
  `valorDeuda` float(18,2) DEFAULT NULL,
  `porcentajeVenta` float(18,2) DEFAULT NULL,
  `adicional` float(18,2) DEFAULT '0.00',
  `abono` float(18,2) DEFAULT '0.00',
  `saldo_abono` float(18,2) DEFAULT '0.00',
  `estado_abono` int(1) DEFAULT NULL,
  `descuento` float(18,2) DEFAULT '0.00',
  `intereses` float(18,2) DEFAULT '0.00',
  `monto_cobrar` float(18,2) DEFAULT NULL,
  `saldoDeuda` float(18,2) DEFAULT NULL,
  `letras` int(11) DEFAULT NULL,
  `letrasCanceladas` int(11) DEFAULT NULL,
  `totalPagar` float(18,2) DEFAULT NULL,
  `devolucion` float(18,2) DEFAULT '0.00',
  `contrato` varchar(255) DEFAULT '',
  `users_id` varchar(50) DEFAULT '',
  `estadoVenta_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__ventas__clientes` (`cliente_id`),
  KEY `FK__ventas__productos` (`producto_id`),
  KEY `FK__ventas__cuotas` (`cuota_id`),
  KEY `FK__ventas__estadoventa` (`estadoVenta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla credito_._ventas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `_ventas` DISABLE KEYS */;
INSERT INTO `_ventas` (`id`, `cliente_id`, `producto_id`, `tipoVenta_id`, `cuota_id`, `cantidadproducto`, `interes`, `valorDeuda`, `porcentajeVenta`, `adicional`, `abono`, `saldo_abono`, `estado_abono`, `descuento`, `intereses`, `monto_cobrar`, `saldoDeuda`, `letras`, `letrasCanceladas`, `totalPagar`, `devolucion`, `contrato`, `users_id`, `estadoVenta_id`, `created_at`, `updated_at`) VALUES
	(1, 6, 19, 1, 1, 1, 0.1, 700.00, 0.00, 0.00, 50.00, 0.00, 1, 0.00, 2.60, 650.00, 252.52, 7, 4, 652.52, 0.00, '4545445', 'gosorio', 2, '2021-05-01 14:22:35', '2021-05-01 15:12:50');
/*!40000 ALTER TABLE `_ventas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
