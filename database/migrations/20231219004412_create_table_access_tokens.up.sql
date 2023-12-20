CREATE TABLE "access_tokens" (
    "id" bigserial PRIMARY KEY,
    "user_id" bigint NOT NULL,
    "token" varchar NOT NULL,
    "created_at" timestamp
);


ALTER TABLE "access_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");