SET client_min_messages = warning;

TRUNCATE TABLE users, peeps, notifications RESTART IDENTITY CASCADE;

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" SERIAL,
    "full_name" text,
    "username" text,
    "email" text,
    "password" varchar, 
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."peeps";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE "public"."peeps" (
    "id" SERIAL,
    "peep_text" text,
    "time_tag" timestamp,
    "user_id" int,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."notifications";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS notifications_id_seq;

-- Table Definition
CREATE TABLE "public"."notifications" (
    "id" SERIAL,
    "peep_id" int,
    "user_id" int,
    PRIMARY KEY ("id")
);


INSERT INTO users (full_name, username, email, password)
VALUES
  ('Mary Moon', 'shinning_moon', 'mmoon@email.com', '1234'),
  ('Eliana Budd', 'rose_budd', 'ebudd@email.com', '4567'),
  ('Bob Jr', 'bubba_j', 'bjr@email.com', 'abc1'),
  ('Kitty Cat', 'cute_kitty', 'meow@email.com', 'prrr'),
  ('Duggee Dog', 'good_boy', 'woof@email.com', 'woofwoof');

INSERT INTO peeps (peep_text, time_tag, user_id)
VALUES
  ('Full moon tonight!', '2023-04-11 10:00:00', 1),
  ('Have you seen Schitts Creek?', '2023-04-11 18:00:00', 2),
  ('Hey there', '2023-04-13 12:00:00', 3),
  ('MEOOOOOOOW',  '2023-04-11 13:00:00', 4),
  ('woof woof wooooooof', '2023-04-12 10:00:00', 5);

INSERT INTO notifications (peep_id, user_id)
VALUES
  (1, 3),
  (2, 3),
  (3, 1),
  (4, 5),
  (5, 4);