-- 创建数据库
CREATE DATABASE  `privatedb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- 创建普通用户 grant all PRIVILEGES on test.* to test@'%' identified by '123456';
CREATE USER 'hopexdev'@'%' IDENTIFIED BY 'devhopex';
grant all privileges on privatedb.* to 'hopexdev'@'%';
flush privileges;
use privatedb;


