CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "category" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "challenges" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question_id" integer, "description" varchar(1600), "created_at" datetime, "updated_at" datetime, "title" varchar(255), "submission_deadline" datetime, "vote_deadline" datetime, "user_id" integer, "location" varchar(255), "categories_id" integer, "popularity" integer DEFAULT 0, "most_recent" datetime DEFAULT '2011-11-28 00:07:34.939818');
CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime, "title" varchar(255), "user_id" integer, "location" varchar(255), "description" varchar(255), "time" datetime, "categories_id" integer, "challenge_id" integer, "popularity" integer DEFAULT 0, "most_recent" datetime DEFAULT '2011-11-28 00:07:34.940322');
CREATE TABLE "folders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "parent_id" integer, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "followed_challenges" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "challenge_id" integer NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "followed_events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "event_id" integer NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "followed_questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "question_id" integer NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "followed_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "followed_user_id" integer NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "message_copies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "message_id" integer, "user_id" integer, "folder_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "messages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "subject" varchar(255), "body" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "proposals" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "challenge_id" integer NOT NULL, "title" varchar(255) NOT NULL, "description" varchar(1600) NOT NULL, "rating" integer DEFAULT 0 NOT NULL, "created_at" datetime, "updated_at" datetime, "user_id" integer);
CREATE TABLE "questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "title" varchar(255), "location" varchar(1600), "created_at" datetime, "updated_at" datetime, "anonymous" integer DEFAULT 0, "description" varchar(255), "categories_id" integer, "popularity" integer DEFAULT 0, "most_recent" datetime DEFAULT '2011-11-28 00:07:34.938968');
CREATE TABLE "response_challenges" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "challenge_id" integer NOT NULL, "user_id" integer NOT NULL, "response" varchar(1600) NOT NULL, "created_at" datetime, "updated_at" datetime, "anonymous" integer DEFAULT 0);
CREATE TABLE "response_events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "event_id" integer NOT NULL, "user_id" integer NOT NULL, "response" varchar(1600) NOT NULL, "created_at" datetime, "updated_at" datetime, "anonymous" integer DEFAULT 0);
CREATE TABLE "response_questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question_id" integer NOT NULL, "user_id" integer NOT NULL, "response" varchar(1600) NOT NULL, "created_at" datetime, "updated_at" datetime, "anonymous" integer DEFAULT 0);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(75) NOT NULL, "picture" varchar(255), "created_at" datetime, "updated_at" datetime, "email" varchar(75) DEFAULT ' ' NOT NULL, "password_digest" varchar(255), "location" varchar(255), "lat" varchar(255), "lng" varchar(255));
CREATE TABLE "voting_records" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "created_at" datetime, "updated_at" datetime, "proposal_id" integer);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20111010231912');

INSERT INTO schema_migrations (version) VALUES ('20111017000942');

INSERT INTO schema_migrations (version) VALUES ('20111121061511');

INSERT INTO schema_migrations (version) VALUES ('20111123093546');