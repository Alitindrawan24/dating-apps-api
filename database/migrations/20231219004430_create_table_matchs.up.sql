CREATE TABLE "matchs" (
    "uuid" uuid NOT NULL,
    "user_id" bigint NOT NULL,
    "target_id" bigint NOT NULL,
    "status" smallint NOT NULL,
    "created_at" timestamp
);

ALTER TABLE "matchs" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "matchs" ADD FOREIGN KEY ("target_id") REFERENCES "users" ("id");