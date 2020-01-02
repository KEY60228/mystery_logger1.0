BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS "performances" ("id" serial PRIMARY KEY NOT NULL, "image_name" varchar, "contents" text, "created_at" TIMESTAMP NOT NULL, "updated_at" TIMESTAMP NOT NULL);
INSERT INTO performances VALUES(1,'/performance_images/radio_studio_revival.jpg','あるラジオ放送局からの脱出','2019-11-12 13:43:02.779907','2019-12-15 13:24:46.435243');
INSERT INTO performances VALUES(2,'/performance_images/sunken_ship.jpg','ある沈没船からの脱出','2019-11-25 11:10:10.575073','2019-12-15 13:24:23.343737');
INSERT INTO performances VALUES(3,'/performance_images/wonderland.jpg','不思議の国からの脱出','2019-12-15 13:21:19.997606','2019-12-15 13:23:47.218186');
INSERT INTO performances VALUES(4,'/performance_images/vampire_hotel.jpg','ヴァンパイアホテルからの脱出','2019-12-15 13:27:33.666524','2019-12-15 13:27:33.666524');
INSERT INTO performances VALUES(5,'/performance_images/snowy_mountain.jpg','閉ざされた雪山からの脱出','2019-12-15 13:28:18.331862','2019-12-15 13:28:18.331862');
INSERT INTO performances VALUES(6,'/performance_images/night_mystery_hotel.jpg','夜のミステリーホテルからの脱出','2019-12-15 13:29:01.832665','2019-12-15 13:29:01.832665');
INSERT INTO performances VALUES(7,'/performance_images/demon_castle.jpg','魔王城からの脱出','2019-12-15 13:29:39.587383','2019-12-15 13:29:39.587383');
INSERT INTO performances VALUES(8,'/performance_images/demon_castle2.jpg','魔王城からの脱出2','2019-12-15 13:32:57.132454','2019-12-15 13:34:25.972894');

CREATE TABLE IF NOT EXISTS "posts" ("id" serial PRIMARY KEY NOT NULL, "content" varchar, "created_at" TIMESTAMP NOT NULL, "updated_at" TIMESTAMP NOT NULL, "performance_id" integer, "user_id" integer);
INSERT INTO posts VALUES(1,'難しかった！','2019-11-15 23:57:51.319182','2019-11-19 10:41:11.230269',1,1);
INSERT INTO posts VALUES(2,'楽しかった！','2019-11-16 00:44:28.200000','2019-11-19 10:41:23.133880',1,1);
INSERT INTO posts VALUES(4,'shut the fuck up and write some code!!!','2019-11-16 01:55:33.968989','2019-11-19 10:41:31.277217',1,1);
INSERT INTO posts VALUES(5,'ノってきた！！','2019-11-16 02:10:05.523616','2019-11-19 10:41:35.995163',1,1);
INSERT INTO posts VALUES(7,'めちゃめちゃ面白かった！！','2019-12-18 14:25:38.395357','2019-12-18 14:25:38.395357',2,1);
INSERT INTO posts VALUES(8,'Great','2019-12-29 13:20:18.472713','2019-12-29 13:20:18.472713',4,1);

CREATE TABLE IF NOT EXISTS "dones" ("id" serial PRIMARY KEY NOT NULL, "performance_id" integer, "user_id" integer, "created_at" TIMESTAMP NOT NULL, "updated_at" TIMESTAMP NOT NULL);
INSERT INTO dones VALUES(12,1,1,'2019-11-20 12:48:08.602890','2019-11-20 12:48:08.602890');
INSERT INTO dones VALUES(13,2,1,'2019-12-15 10:06:13.583877','2019-12-15 10:06:13.583877');
INSERT INTO dones VALUES(14,5,1,'2019-12-15 13:42:13.562563','2019-12-15 13:42:13.562563');

CREATE TABLE IF NOT EXISTS "wannas" ("id" serial PRIMARY KEY NOT NULL, "performance_id" integer, "user_id" integer, "created_at" TIMESTAMP NOT NULL, "updated_at" TIMESTAMP NOT NULL);
INSERT INTO wannas VALUES(11,7,1,'2019-12-15 13:42:33.596402','2019-12-15 13:42:33.596402');
INSERT INTO wannas VALUES(12,8,1,'2019-12-15 13:42:39.347794','2019-12-15 13:42:39.347794');

CREATE TABLE IF NOT EXISTS "users" ("id" serial NOT NULL PRIMARY KEY, "name" varchar DEFAULT NULL, "email" varchar DEFAULT NULL, "created_at" TIMESTAMP NOT NULL, "updated_at" TIMESTAMP NOT NULL, "image_name" varchar DEFAULT NULL, "password_digest" varchar DEFAULT NULL);
INSERT INTO users VALUES(1,'GUCCI','gucci@gmail.com','2019-11-16 07:49:16.957206','2019-11-20 14:14:04.037147','1.jpg','$2a$12$KGwYhmZi1zEIAyRVKzEBKuBgccGJfT1Inoh43m0s/G069SkUipuIm');
INSERT INTO users VALUES(2,'yamaguchi','yamaguchi@gmail.com','2019-11-17 10:06:59.421124','2019-11-20 14:14:26.876993',NULL,'$2a$12$Va5pyjCttQfdqZzQh2f8QuGfKQWHXtLbaSYg9NVquuO5tSJe8vyEO');
INSERT INTO users VALUES(3,'wanko','wanko@prog-8.com','2019-11-17 10:16:30.031844','2019-11-20 14:14:39.369693',NULL,'$2a$12$Tjyj.MIzUioOY6l4SxXYnu.PGEes4h21Gq.KXUzIn./JOEOR6v13.');

COMMIT;
