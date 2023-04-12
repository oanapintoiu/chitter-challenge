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
    "username" text,
    "time_tag" timestamp,
    PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS "public"."notifications";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS notifications_id_seq;

-- Table Definition
CREATE TABLE "public"."notifications" (
    "id" SERIAL,
    "username" text,
    "peep_tag" text,
    "time_tag" timestamp,
    PRIMARY KEY ("id")
);


INSERT INTO users (full_name, username, email, password)
VALUES
  ('Mary Moon', 'shinning_moon', 'mmoon@email.com', '1234'),
  ('Eliana Budd', 'rose_budd', 'ebudd@email.com', '4567'),
  ('Bob Jr', 'bubba_j', 'bjr@email.com', 'abc1'),
  ('Kitty Cat', 'cute_kitty', 'meow@email.com', 'prrr'),
  ('Duggee Dog', 'good_boy', 'woof@email.com', 'woofwoof');

INSERT INTO peeps (peep_text, username, time_tag)
VALUES
  ('Full moon tonight!', 'shinning_moon', '2023-04-11 10:00:00'),
  ('Have you seen Schitts Creek?', 'rose_budd', '2023-04-11 18:00:00'),
  ('Hey there', 'bubba_j', '2023-04-11 12:00:00'),
  ('How are all of yall?', 'bubba_j', '2023-04-08 20:30:00'),
  ('MEOOOOOOOW', 'cute_kitty', '2023-04-11 13:00:00'),
  ('Such a lovely evening.', 'shinning_moon', '2023-04-11 14:00:00'),
  ('Going to the seaside next week - looking forward to it!', 'rose_budd', '2023-04-11 15:00:00'),
  ('woof woof wooooooof', 'good_boy', '2023-04-12 10:00:00'),
  ('woof woof ... aaaaaaah woof', 'good_boy','2023-04-12 10:01:00');

INSERT INTO notifications (username, peep_tag, time_tag)
VALUES
  ('rose_budd', 1, '2023-04-11 10:30:00'),
  ('bubba_j', 2, '2023-04-13 12:30:00'),
  ('shinning_moon', 3, '2023-04-08 12:30:00'),
  ('good_boy', 5, '2023-04-11 13:05:00'),
  ('cute_kitty', 8, '2023-04-12 10:01:00'),
  ('cute_kitty', 9, '2023-04-12 10:02:00');