-- CreateEnum
CREATE TYPE "Country" AS ENUM ('BRAZIL', 'UNITED_STATES', 'GERMANY', 'CHINA');

-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- CreateEnum
CREATE TYPE "Language" AS ENUM ('EN_US', 'PT_BR', 'PT_PT', 'ZH_CN', 'ES');

-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('ERP', 'PUBLIC', 'API', 'SYSTEM', 'ANONYMOUS', 'ROOT', 'ADMIN');

-- CreateTable
CREATE TABLE "profiles" (
    "id" INTEGER NOT NULL,
    "photo" BYTEA,
    "biography" TEXT,
    "tittle" VARCHAR(255),
    "description" TEXT,
    "birth" TIMESTAMP(6),
    "phone" VARCHAR(255),
    "profile_description" TEXT,
    "profile_status" VARCHAR(255),
    "social_network" JSONB,
    "interests" JSONB,
    "preferences" JSONB,
    "configurations" JSONB,
    "gender" "Gender",
    "language" "Language",
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255),
    "last_name" VARCHAR(255),
    "country" "Country",
    "user_type" "UserType" NOT NULL DEFAULT 'PUBLIC',
    "active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_id_fkey" FOREIGN KEY ("id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
