/*
  Warnings:

  - Added the required column `adress` to the `locations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "locations" ADD COLUMN     "adress" VARCHAR(255) NOT NULL;
