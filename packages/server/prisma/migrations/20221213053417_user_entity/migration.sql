/*
  Warnings:

  - You are about to drop the `medias` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ListingToMedia" DROP CONSTRAINT "_ListingToMedia_B_fkey";

-- DropTable
DROP TABLE "medias";

-- CreateTable
CREATE TABLE "Media" (
    "id" TEXT NOT NULL,
    "preview" VARCHAR(255) NOT NULL,
    "source" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL,

    CONSTRAINT "Media_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "_ListingToMedia" ADD CONSTRAINT "_ListingToMedia_B_fkey" FOREIGN KEY ("B") REFERENCES "Media"("id") ON DELETE CASCADE ON UPDATE CASCADE;
