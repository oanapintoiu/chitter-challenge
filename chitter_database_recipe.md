# Chitter - 3 tablles Recipe

_Copy this recipe template to design and create two related database tables having a Many-to-Many relationship._

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORIES:

STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

```
Nouns:

first_name, last_name, username, email, password, peep_text, username, time_tag, peep_tag
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| users                 | full_name, username, email, password
| peeps                 | peep_text, username, time_tag
| notifications         | username, peep_tag, time_tag

1. Name of the first table (always plural): `users` 

    Column names: `full_name`, `username`, `email`, `password`

2. Name of the second table (always plural): `peeps` 

    Column names: `peep_text`, `username`, `time_tag`

3. Name of the third table (alwyas plural): `notifications` 
    Column names: `username`, `peep_tag`, `time_tag`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: posts
id: SERIAL
title: text
content: text

Table: tags
id: SERIAL
name: text
```

## 4. Design the Many-to-Many relationship

Make sure you can answer YES to these questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)
3. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

```
# EXAMPLE

1. Can one user have many peeps? YES
2. Can one peep have many users? NO
3. Can one user have many notifications? YES
4. Can one notification have many users? NO
5. Can one peep have many notifications? NO
6. Can one notifications have many peeps? NO
```

_If you would answer "No" to one of these questions, you'll probably have to implement a One-to-Many relationship, which is simpler. Use the relevant design recipe in that case._

## 5. Design the Join Table

The join table usually contains two columns, which are two foreign keys, each one linking to a record in the two other tables.

The naming convention is `table1_table2`.

```
# EXAMPLE

Join table for tables: posts and tags
Join table name: posts_tags
Columns: post_id, tag_id
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: posts_tags.sql

-- Replace the table name, columm names and types.

-- Create the first table.
CREATE TABLE "public"."users" (
    "id" SERIAL,
    "full_name" text,
    "username" text,
    "email" text,
    "password" char(12), 
    PRIMARY KEY ("id")
);


-- Create the second table.
CREATE TABLE "public"."peeps" (
    "id" SERIAL,
    "peep_text" text,
    "username" text,
    "time_tag" timestamp,
    PRIMARY KEY ("id")
);

-- Create the third table.
CREATE TABLE "public"."notifications" (
    "id" SERIAL,
    "username" text,
    "peep_tag" text,
    "time_tag" timestamp,
    PRIMARY KEY ("id")
);

-- Create the join table.
-- CREATE TABLE posts_tags (
--   post_id int,
--   tag_id int,
--   constraint fk_post foreign key(post_id) references posts(id) on delete cascade,
--   constraint fk_tag foreign key(tag_id) references tags(id) on delete cascade,
--   PRIMARY KEY (post_id, tag_id)
-- );

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < posts_tags.sql
```
