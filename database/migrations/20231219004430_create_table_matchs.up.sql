CREATE TABLE "matchs" (
    "initial_id" bigint NOT NULL,
    "target_id" bigint NOT NULL,
    "is_match" bool NOT NULL,
    "created_at" timestamp
);

ALTER TABLE "matchs" ADD FOREIGN KEY ("initial_id") REFERENCES "users" ("id");

ALTER TABLE "matchs" ADD FOREIGN KEY ("target_id") REFERENCES "users" ("id");