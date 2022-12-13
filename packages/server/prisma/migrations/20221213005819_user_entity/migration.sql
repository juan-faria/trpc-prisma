-- CreateTable
CREATE TABLE "listings" (
    "id" TEXT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "price" INTEGER NOT NULL,
    "maxPeople" INTEGER NOT NULL,
    "proId" TEXT NOT NULL,
    "skillId" TEXT NOT NULL,

    CONSTRAINT "listings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pros" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "avatar" VARCHAR(255) NOT NULL,
    "headline" TEXT NOT NULL,
    "bio" TEXT NOT NULL,

    CONSTRAINT "pros_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "avatar" VARCHAR(255) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills" (
    "id" TEXT NOT NULL,
    "label" VARCHAR(255) NOT NULL,
    "packageCta" TEXT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "whatsIncluded" TEXT NOT NULL,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "locations" (
    "id" TEXT NOT NULL,
    "placeName" VARCHAR(255) NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "timezone" VARCHAR(255) NOT NULL,

    CONSTRAINT "locations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reviews" (
    "id" TEXT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "rating" DOUBLE PRECISION NOT NULL,
    "listingId" TEXT NOT NULL,

    CONSTRAINT "reviews_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medias" (
    "id" TEXT NOT NULL,
    "preview" VARCHAR(255) NOT NULL,
    "source" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL,

    CONSTRAINT "medias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "infoBlocks" (
    "id" TEXT NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "content" TEXT NOT NULL,
    "listingId" TEXT NOT NULL,

    CONSTRAINT "infoBlocks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ListingToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ListingToLocation" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ListingToMedia" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ProToSkill" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ListingToUser_AB_unique" ON "_ListingToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ListingToUser_B_index" ON "_ListingToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ListingToLocation_AB_unique" ON "_ListingToLocation"("A", "B");

-- CreateIndex
CREATE INDEX "_ListingToLocation_B_index" ON "_ListingToLocation"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ListingToMedia_AB_unique" ON "_ListingToMedia"("A", "B");

-- CreateIndex
CREATE INDEX "_ListingToMedia_B_index" ON "_ListingToMedia"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProToSkill_AB_unique" ON "_ProToSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_ProToSkill_B_index" ON "_ProToSkill"("B");

-- AddForeignKey
ALTER TABLE "listings" ADD CONSTRAINT "listings_proId_fkey" FOREIGN KEY ("proId") REFERENCES "pros"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "listings" ADD CONSTRAINT "listings_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_listingId_fkey" FOREIGN KEY ("listingId") REFERENCES "listings"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "infoBlocks" ADD CONSTRAINT "infoBlocks_listingId_fkey" FOREIGN KEY ("listingId") REFERENCES "listings"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ListingToUser" ADD CONSTRAINT "_ListingToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "listings"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ListingToUser" ADD CONSTRAINT "_ListingToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ListingToLocation" ADD CONSTRAINT "_ListingToLocation_A_fkey" FOREIGN KEY ("A") REFERENCES "listings"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ListingToLocation" ADD CONSTRAINT "_ListingToLocation_B_fkey" FOREIGN KEY ("B") REFERENCES "locations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ListingToMedia" ADD CONSTRAINT "_ListingToMedia_A_fkey" FOREIGN KEY ("A") REFERENCES "listings"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ListingToMedia" ADD CONSTRAINT "_ListingToMedia_B_fkey" FOREIGN KEY ("B") REFERENCES "medias"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProToSkill" ADD CONSTRAINT "_ProToSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "pros"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProToSkill" ADD CONSTRAINT "_ProToSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;
