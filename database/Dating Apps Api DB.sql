-- -------------------------------------------------------------
-- TablePlus 5.6.8(524)
--
-- https://tableplus.com/
--
-- Database: dating_apps
-- Generation Time: 2023-12-20 18:13:36.1720
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."access_tokens";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS access_tokens_id_seq;

-- Table Definition
CREATE TABLE "public"."access_tokens" (
    "id" int8 NOT NULL DEFAULT nextval('access_tokens_id_seq'::regclass),
    "user_id" int8 NOT NULL,
    "token" varchar NOT NULL,
    "created_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."matchs";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."matchs" (
    "uuid" uuid NOT NULL,
    "user_id" int8 NOT NULL,
    "target_id" int8 NOT NULL,
    "status" int2 NOT NULL,
    "created_at" timestamp
);

DROP TABLE IF EXISTS "public"."schema_migrations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."schema_migrations" (
    "version" int8 NOT NULL,
    "dirty" bool NOT NULL,
    PRIMARY KEY ("version")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "email" varchar NOT NULL,
    "full_name" varchar NOT NULL,
    "gender" bpchar(1) NOT NULL,
    "date_of_birth" date NOT NULL,
    "location" varchar,
    "description" text,
    "profile_picture" varchar,
    "password" varchar NOT NULL,
    "is_premium" bool NOT NULL,
    "created_at" timestamp,
    "updated_at" timestamp,
    PRIMARY KEY ("id")
);

-- Column Comment
COMMENT ON COLUMN "public"."users"."email" IS 'Users email to be used for login';

INSERT INTO "public"."schema_migrations" ("version", "dirty") VALUES
(20231219004430, 'f');

INSERT INTO "public"."users" ("id", "email", "full_name", "gender", "date_of_birth", "location", "description", "profile_picture", "password", "is_premium", "created_at", "updated_at") VALUES
(1, 'john@example.com', 'Greta Breitenberg', 'm', '1998-05-04', 'Monaco', 'Soluta error est non placeat harum magni molestiae nesciunt dolorem expedita deleniti.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(2, 'maria@example.org', 'Birdie Bode', 'f', '1990-03-24', 'Austria', 'Dolor nostrum beatae exercitationem ut molestias dicta sint omnis consequatur est.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(3, 'chaag@example.com', 'Greta Breitenberg', 'f', '2016-05-04', 'Monaco', 'Soluta error est non placeat harum magni molestiae nesciunt dolorem expedita deleniti.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(4, 'porter.labadie@example.com', 'Linnea Carroll PhD', 'f', '2021-06-27', 'Paraguay', 'Quos assumenda beatae dolorem maxime et delectus eum vitae ut sunt et id expedita.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(5, 'rkuvalis@example.com', 'Anissa Wintheiser', 'm', '1991-03-06', 'Cameroon', 'Voluptas quidem quaerat dolore illum natus et quia deserunt iusto sit quia ex consectetur.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(6, 'dianna01@example.net', 'Kelton Roberts', 'f', '2005-04-18', 'United States of America', 'Quo maiores aliquam nemo quia cumque voluptates fugiat.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(7, 'vicenta94@example.com', 'Georgette Smitham I', 'f', '2016-03-10', 'Ecuador', 'Illum deserunt odit quia qui eos cumque ut odit qui et.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(8, 'dgerhold@example.org', 'Aglae Stiedemann', 'm', '2001-03-11', 'Christmas Island', 'Dolorem quas nihil sed hic ea voluptas est in commodi autem natus quas.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(9, 'dach.halie@example.com', 'Krystel Sipes', 'f', '2003-09-29', 'France', 'Quo magni ut doloribus consectetur ut unde temporibus esse qui voluptatibus rem.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(10, 'hsauer@example.org', 'Mason Doyle', 'm', '1970-05-09', 'Cuba', 'Ex ratione dolorem tempora qui voluptate et nostrum error nobis illo quisquam eveniet.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(11, 'fmorar@example.net', 'Magnus Welch', 'f', '1986-08-14', 'Kuwait', 'Est minus libero ut consequatur rerum et rem ut hic vitae est.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(12, 'murray.daphney@example.org', 'Jett Gerhold', 'm', '2009-05-04', 'Dominican Republic', 'Vitae consequatur incidunt perspiciatis ipsa et ea quos et provident qui quia reiciendis possimus.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(13, 'tyrique.mclaughlin@example.com', 'Martine Batz', 'f', '2010-03-10', 'Botswana', 'Et temporibus atque minus voluptas voluptatibus at corporis nisi dolorum qui ullam voluptas commodi.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(14, 'christa.herzog@example.net', 'Jana Hartmann', 'm', '2005-12-28', 'Guadeloupe', 'Molestiae distinctio nihil dolorum adipisci repellat consequatur ut sit et enim dolores voluptate placeat.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(15, 'hgislason@example.org', 'Caleigh Nikolaus V', 'm', '1993-09-27', 'Turkey', 'Sequi est at totam dignissimos voluptas et aut.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(16, 'stokes.wava@example.com', 'Ruben Dach', 'f', '2000-02-07', 'Christmas Island', 'Non tempore aut eius molestiae doloremque quas harum ullam in.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(17, 'imckenzie@example.com', 'Dameon Hudson', 'm', '2007-05-01', 'Mozambique', 'Quam porro labore consequatur beatae magnam placeat commodi minus quibusdam qui.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(18, 'jailyn.streich@example.com', 'Mathew Larson', 'm', '2023-06-29', 'Swaziland', 'Nesciunt velit ad eius aut saepe minima numquam autem sit et.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(19, 'adelbert.bernier@example.org', 'Mr. Oliver Crist', 'f', '1994-10-12', 'India', 'Reprehenderit omnis sint eum soluta eos molestiae voluptas debitis doloribus sint.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(20, 'kerluke.darius@example.com', 'Hettie Upton', 'm', '1999-01-28', 'Saint Lucia', 'Itaque rerum sed sit laudantium provident consequatur sed officia enim et commodi laborum.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(21, 'timmy83@example.org', 'Oral Durgan', 'f', '2021-02-20', 'Croatia', 'Sit dolores sit repudiandae eveniet et quos voluptatum qui est.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(22, 'harold.mckenzie@example.com', 'Christ Stiedemann IV', 'm', '1995-06-22', 'Germany', 'Corporis sint vel harum doloribus perferendis enim.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(23, 'lueilwitz.roselyn@example.com', 'Dr. Geovanni Quigley', 'm', '2015-05-30', 'Reunion', 'Provident aut architecto facilis voluptas et pariatur a.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(24, 'mayert.nichole@example.net', 'Ms. Cecelia Schinner III', 'f', '2015-08-11', 'Chad', 'Vitae possimus aut neque architecto nobis eum autem quia aut dolores nisi eius.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(25, 'abdullah76@example.net', 'Deion Cole', 'm', '2002-10-22', 'Martinique', 'Ratione dolores quisquam asperiores et modi fugiat sit ut.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(26, 'borer.rachel@example.net', 'Prof. Marjorie Towne', 'f', '1977-03-22', 'Guyana', 'Consequatur ut similique ab velit quo et libero minus et.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(27, 'nienow.joanny@example.com', 'Ms. Delphine Sipes', 'f', '1975-12-14', 'Palestinian Territories', 'Totam ab perspiciatis maxime earum hic et laboriosam amet quae minus incidunt.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(28, 'corkery.norwood@example.org', 'Stella Kemmer', 'm', '1988-08-04', 'Finland', 'Et et unde aut eaque ipsum quia.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(29, 'aracely39@example.net', 'Prof. Myron Stroman MD', 'f', '2003-04-16', 'Belgium', 'Dolor est officia quia expedita mollitia sit consequuntur quibusdam.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(30, 'esauer@example.com', 'Delpha Sanford IV', 'f', '2015-12-27', 'Denmark', 'Mollitia nulla perferendis expedita quia modi perferendis qui.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(31, 'gerlach.abel@example.com', 'Eunice Hamill', 'm', '2021-09-25', 'Uganda', 'Eaque est earum voluptatem et quasi harum eos.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(32, 'palma99@example.net', 'Tess Okuneva', 'f', '2001-08-22', 'Mexico', 'Corrupti qui et rerum labore dolor minima cupiditate vero nemo error aspernatur quae debitis officia.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(33, 'ajacobson@example.net', 'Laurine Vandervort', 'm', '1973-06-10', 'Belgium', 'Enim accusantium hic provident soluta aut commodi autem.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(34, 'mcdermott.cierra@example.net', 'Tessie Pfannerstill', 'f', '2017-03-19', 'Liberia', 'Illo expedita culpa eum quod a ullam est consequatur sed dolore.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(35, 'canderson@example.org', 'Esmeralda Vandervort', 'm', '1982-06-14', 'Azerbaijan', 'Sit sit quo iste ut et accusamus et dolores est.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(36, 'justina.gerlach@example.net', 'Claudie Lueilwitz', 'm', '2019-02-03', 'Pakistan', 'Id iusto voluptas quas consequuntur dolores laboriosam.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(37, 'kkris@example.net', 'Prof. Clinton Becker', 'm', '2007-02-19', 'Guyana', 'Illum eaque exercitationem et est enim vitae quo odit non nulla.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(38, 'mariam.walter@example.net', 'Mr. Darrell Muller', 'm', '1977-11-22', 'Chile', 'Possimus omnis veniam atque nihil sint consequatur et qui voluptatem occaecati.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(39, 'stamm.jennyfer@example.com', 'Chauncey Donnelly', 'f', '1973-02-18', 'Turkmenistan', 'Omnis culpa eum dicta saepe praesentium fugit vel quam modi et molestias.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(40, 'macey58@example.org', 'Ms. Zelma Bernier', 'm', '1984-08-05', 'France', 'Reprehenderit laborum velit non velit consectetur qui sed recusandae numquam et sequi.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(41, 'abelardo28@example.net', 'Clara Lesch', 'f', '1993-02-16', 'Turkey', 'Eos sunt reiciendis error magnam vel repudiandae sint et.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(42, 'aiyana.durgan@example.net', 'Tobin Funk', 'f', '1974-02-26', 'Belarus', 'Explicabo aliquam ex sunt quaerat sed sunt.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(43, 'wzulauf@example.com', 'Gaetano Kuhn', 'm', '1995-08-28', 'Greenland', 'Quae explicabo sit sit impedit tenetur maiores est repudiandae ut voluptatem.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(44, 'jast.lonny@example.org', 'Mr. Terence Wiegand DVM', 'f', '2012-09-27', 'Puerto Rico', 'Cum unde eum voluptas quis laudantium error sapiente.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(45, 'kole.kerluke@example.net', 'Austyn Brekke V', 'f', '1995-12-01', 'Algeria', 'Consequuntur incidunt eum et et voluptatem et.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(46, 'cummings.wyatt@example.net', 'Prof. Eddie Corkery IV', 'm', '1981-02-05', 'Costa Rica', 'Neque a consequatur qui ab doloremque non nulla laboriosam.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(47, 'johann.corwin@example.com', 'Denis Mante PhD', 'f', '1996-12-31', 'Benin', 'Est eveniet optio ea illum eius enim sed nisi nemo.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(48, 'crist.myrna@example.com', 'Dr. Madisen Daugherty Jr.', 'm', '2013-08-06', 'Bolivia', 'Aut cupiditate autem deserunt recusandae dolor neque.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(49, 'hammes.alex@example.org', 'Dr. Darrell Rau III', 'f', '1979-04-21', 'Andorra', 'Ducimus tempore atque qui facere rerum sint deserunt distinctio et quidem explicabo voluptatum.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(50, 'guiseppe94@example.org', 'Maggie Koelpin PhD', 'm', '1991-12-27', 'Faroe Islands', 'Eos sequi ipsa tempora consequatur corporis nobis deleniti nam dolore repellat rerum non.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(51, 'gcorwin@example.org', 'Cathy Waelchi', 'm', '1985-02-08', 'United States Minor Outlying Islands', 'Illum quis labore qui nulla illum officia sit.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(52, 'ricardo06@example.com', 'Audreanne Howe', 'f', '1981-03-04', 'Guadeloupe', 'Sint nam voluptas nam velit dolorem molestias at aperiam.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(53, 'sophie55@example.net', 'Tate Nienow', 'm', '2019-02-14', 'Somalia', 'Amet nemo eligendi eos quis quisquam dolor optio omnis.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(54, 'mgorczany@example.com', 'Mr. Gennaro Reichel III', 'm', '1971-05-03', 'San Marino', 'Iusto voluptatem provident a voluptatem quasi rem.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(55, 'avis.schmitt@example.org', 'Neoma Bahringer', 'f', '2003-02-24', 'Nicaragua', 'Perspiciatis sequi itaque sit ratione autem enim aspernatur.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(56, 'brandyn50@example.org', 'Prof. Germaine Mueller', 'm', '1990-08-23', 'Hungary', 'Quia itaque eos tenetur consequatur adipisci neque magnam eos.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(57, 'goldner.hannah@example.net', 'Dr. Clare Leuschke PhD', 'f', '1987-08-28', 'Iraq', 'Nemo totam quaerat et numquam sequi suscipit accusantium dolore alias est asperiores perspiciatis.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(58, 'krippin@example.org', 'Loren Doyle', 'm', '1997-08-05', 'Heard Island and McDonald Islands', 'Repudiandae et nihil adipisci unde odio perferendis libero eum similique ut.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(59, 'jwyman@example.net', 'Dr. Kimberly Dicki II', 'f', '2008-05-20', 'French Guiana', 'Aperiam dolores quaerat ut mollitia vero illo cum maiores debitis eum necessitatibus rerum unde.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(60, 'taurean12@example.com', 'Prof. Fabiola Krajcik', 'm', '2000-11-28', 'Nepal', 'Molestiae facilis temporibus et molestias debitis quae.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(61, 'adah51@example.net', 'Daryl Thiel', 'm', '2017-05-13', 'Kazakhstan', 'Molestiae fugit ut et sit pariatur alias enim dolores sunt rerum consectetur.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(62, 'lucinda.senger@example.org', 'Stevie Gorczany', 'm', '1980-11-10', 'Guinea', 'Iusto quidem ut eaque tenetur deleniti quae sit placeat qui ipsam excepturi exercitationem aliquid.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(63, 'loren65@example.net', 'Tia Morissette', 'm', '1986-12-27', 'British Virgin Islands', 'Magnam dolor amet ducimus totam consequatur neque dicta quos commodi aliquid laudantium quae.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(64, 'hbashirian@example.com', 'Prof. Marianna Armstrong Sr.', 'm', '1975-11-23', 'Mozambique', 'Sint iure fugiat magnam ut error tempore animi corrupti.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(65, 'vinnie60@example.com', 'Mr. Blair Marvin Sr.', 'm', '2008-05-24', 'Georgia', 'Itaque aut quidem rem a et modi.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(66, 'meagan.miller@example.com', 'Cordell Ward', 'm', '1990-05-22', 'Bahrain', 'Voluptatem vero facilis dolorum animi itaque a suscipit culpa occaecati ut sunt.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(67, 'skovacek@example.com', 'Lester Zemlak III', 'f', '2001-02-21', 'Benin', 'Iure et cumque culpa eum rerum veniam ducimus voluptate voluptatem voluptatem.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(68, 'denesik.delbert@example.org', 'Shyanne Lemke', 'f', '1983-06-20', 'Cote d''Ivoire', 'Quia aspernatur fuga totam aperiam et eos fugit neque in tenetur voluptates.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(69, 'keeling.tania@example.org', 'Prof. Preston Bode III', 'f', '1972-10-26', 'Bolivia', 'Atque dolore at est dolorem totam quibusdam nihil molestiae mollitia inventore.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(70, 'schuster.era@example.com', 'Macie Bartoletti', 'f', '2001-09-16', 'Burundi', 'Nesciunt dolorem qui in autem officia voluptas eos voluptatem corporis officiis blanditiis doloremque.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(71, 'hamill.hardy@example.com', 'Emmie D''Amore', 'm', '2009-12-10', 'Tokelau', 'Eos aut consequuntur quo qui rerum nostrum libero perferendis culpa.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(72, 'giovanni16@example.com', 'Cletus Franecki', 'm', '2016-07-04', 'Lesotho', 'Hic error id facere impedit molestiae minus vero blanditiis expedita.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(73, 'connelly.clint@example.org', 'Bria Bartoletti IV', 'm', '1974-01-23', 'Bahamas', 'Qui ea quia consequuntur officiis tempore aut illum eos.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(74, 'pgutkowski@example.net', 'Jamaal Mills', 'f', '1994-10-13', 'Cape Verde', 'Rerum voluptatem illo ut aliquam quis beatae consectetur incidunt et esse vitae voluptate architecto.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(75, 'lmraz@example.org', 'Dannie Kuhlman', 'm', '2017-02-18', 'Heard Island and McDonald Islands', 'Facilis vitae illo voluptas totam voluptates quas est molestiae ut placeat corporis.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(76, 'zgraham@example.com', 'Johan Tillman PhD', 'f', '1973-02-07', 'Malta', 'Sint aut quo soluta dolores occaecati nihil.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(77, 'mayra.rutherford@example.com', 'Favian Huel', 'f', '2018-03-30', 'Bolivia', 'Aperiam cumque quas officiis consequatur dolorum cupiditate placeat deserunt placeat amet odit animi voluptatem.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(78, 'dtorphy@example.org', 'Mr. Enrico Orn IV', 'f', '1971-11-24', 'Gibraltar', 'Possimus adipisci voluptas est quam iste magni.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(79, 'ddoyle@example.org', 'Ruthe Carter', 'm', '2006-10-26', 'Serbia', 'Corporis consequuntur voluptas reprehenderit voluptatum corporis eius eos sed aut possimus.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(80, 'eduardo13@example.net', 'Annabell Wilkinson', 'f', '1995-04-06', 'Timor-Leste', 'Rerum est in voluptatem dolores dignissimos illum quod soluta consectetur ut.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(81, 'williamson.francesco@example.org', 'Cloyd Gerhold', 'm', '1976-04-01', 'Canada', 'Et voluptate ipsa nam quis et aperiam cupiditate dolorem tempore nostrum dolores.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(82, 'lstracke@example.org', 'Raegan Kuphal', 'm', '2011-09-11', 'Svalbard & Jan Mayen Islands', 'Qui quaerat vel quisquam laudantium saepe maiores non.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(83, 'jody80@example.org', 'Donald Gislason Sr.', 'm', '1999-12-14', 'Hong Kong', 'Quod magnam accusamus voluptatum accusamus qui commodi enim sit similique sed.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(84, 'apowlowski@example.net', 'Raquel Nitzsche', 'f', '1983-10-19', 'Mayotte', 'Error eligendi error error et delectus cum numquam eaque tempore vero libero est.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(85, 'juston.kuphal@example.com', 'Paxton Kunde', 'm', '1970-09-30', 'Bahamas', 'Qui et nesciunt aut debitis et natus cupiditate tempora fuga et nihil quos et.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(86, 'patricia.friesen@example.org', 'Ramiro Von', 'm', '2022-12-11', 'Netherlands Antilles', 'Ipsam odit nulla consequuntur perspiciatis facilis aliquid assumenda ad quis.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(87, 'pkeebler@example.com', 'London Cummerata', 'f', '2012-12-29', 'French Southern Territories', 'Porro debitis eos est doloribus qui voluptatem deserunt illum hic facilis consequatur necessitatibus officiis.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(88, 'conn.jaron@example.net', 'Prof. Lulu Bogan', 'm', '1997-11-04', 'Netherlands', 'Sit maxime qui voluptate saepe voluptatem fuga.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(89, 'violet.okeefe@example.com', 'Burnice Kiehn', 'f', '1971-11-22', 'Guinea', 'Est et ut dolores provident delectus fuga quia.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(90, 'cboyle@example.net', 'Mabel Wiza', 'f', '2022-02-22', 'Greenland', 'Optio atque est labore occaecati ipsa officia voluptate sint et enim incidunt.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(91, 'lueilwitz.alford@example.org', 'Dr. Jacinto Reilly', 'm', '1997-07-07', 'Antigua and Barbuda', 'Aperiam culpa eveniet error nisi perferendis sapiente maiores accusantium dolore.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(92, 'candace.wuckert@example.org', 'Charlie Rosenbaum I', 'f', '1985-12-26', 'Saint Kitts and Nevis', 'Voluptatem enim atque a vel nobis reiciendis omnis aut voluptatem non iusto.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(93, 'ofelia.kris@example.org', 'Brandyn Moen', 'm', '1974-02-07', 'Solomon Islands', 'Eos incidunt magnam officia ex sed sunt eos quaerat id.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(94, 'becker.brycen@example.org', 'Micheal Emmerich', 'f', '2007-03-08', 'Bosnia and Herzegovina', 'Magni possimus expedita et excepturi molestiae sit maxime commodi sed distinctio sed quod aperiam.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(95, 'akirlin@example.com', 'Nettie Anderson', 'm', '1995-04-19', 'Belarus', 'Enim iste nobis consectetur ullam modi ea temporibus inventore ea quam enim.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(96, 'rempel.elyssa@example.org', 'Joannie McGlynn', 'm', '2009-02-23', 'Iraq', 'Et deleniti assumenda atque quibusdam deleniti harum tempore itaque voluptates qui quis necessitatibus quia.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(97, 'rpaucek@example.net', 'Irwin Howe', 'f', '1999-11-16', 'Lesotho', 'Aut excepturi non ea itaque et laborum et.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(98, 'hudson.mcclure@example.org', 'Virginia Bradtke', 'm', '1994-09-05', 'Saudi Arabia', 'Quia adipisci ut atque et labore aut cum sapiente et deserunt blanditiis.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(99, 'ricardo.block@example.org', 'Liam Wilderman', 'f', '1986-11-24', 'Timor-Leste', 'Quia ea incidunt animi voluptates iusto quibusdam.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(100, 'upredovic@example.org', 'Maeve Ortiz', 'm', '1970-06-30', 'Antigua and Barbuda', 'Sed totam quia ipsa ut accusamus ut numquam ut et.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(101, 'premium@example.org', 'Elroy Bednar', 'm', '1977-05-29', 'Israel', 'Sequi voluptatem nostrum quia pariatur nulla commodi.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 't', '2023-12-20 18:10:12', '2023-12-20 18:10:12'),
(102, 'xdoyle@example.org', 'Birdie Bode', 'f', '1990-03-24', 'Austria', 'Dolor nostrum beatae exercitationem ut molestias dicta sint omnis consequatur est.', 'https://picsum.photos/200', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f', '2023-12-20 18:10:12', '2023-12-20 18:10:12');

ALTER TABLE "public"."access_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("id");
ALTER TABLE "public"."matchs" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("id");
ALTER TABLE "public"."matchs" ADD FOREIGN KEY ("target_id") REFERENCES "public"."users"("id");
