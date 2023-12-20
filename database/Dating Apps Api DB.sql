CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "email" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "gender" char(1) NOT NULL,
  "date_of_birth" date NOT NULL,
  "location" varchar,
  "description" text,
  "profile_picture" varchar,
  "password" varchar NOT NULL,
  "is_premium" bool NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "matchs" (
  "uuid" uuid NOT NULL,
  "user_id" bigint NOT NULL,
  "target_id" bigint NOT NULL,
  "status" smallint NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "access_tokens" (
  "id" bigserial PRIMARY KEY,
  "user_id" bigint NOT NULL,
  "token" varchar NOT NULL,
  "created_at" timestamp
);

ALTER TABLE "matchs" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "matchs" ADD FOREIGN KEY ("target_id") REFERENCES "users" ("id");

ALTER TABLE "access_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
