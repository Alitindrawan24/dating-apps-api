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

COMMENT ON COLUMN users.email IS 'Users email to be used for login';