import { Listing } from '@prisma/client';
import { prisma } from '../utils/prisma';

export const findListing = async (slug: string) => {
    return (await prisma?.listing.findUnique({
        where: {
          slug: String(slug)
        }
      })
)};

export const hidrateListing = async (listing: Listing) => {
    const {proId, skillId, ...cleanListing} = {...listing}
    const listingId = cleanListing.id
    return {
        ...cleanListing,
        pro: await findListingPro(proId),
        skill: await findListingSkill(skillId),
        reviews: await findListingReviews(listingId),
        media: await findListingMedia(listingId),
        locations: await findListingLocations(listingId),
        infoBlocks: await findListingInfoBlocks(listingId)
    }
};

const findListingPro = async (proId: string) => {
    return (await prisma?.pro.findFirst({
        where: {
           id: proId
        }
     })
)};

const findListingSkill = async (skillId: string) => {
    return await prisma?.skill.findFirst({
        where: {
           id: skillId
        }
     })
};

const findListingReviews = async (listingId: string) => {
    return (await prisma?.review.findMany({
        where: {
          listing: {
            id: listingId
          }
        }
      })
)};

const findListingMedia = async (listingId: string) => {
    return (await prisma?.media.findMany({
        where: {
          listings: {
            some: {
              id: listingId
            }
          }
        }
      })
)};

const findListingLocations = async (listingId: string) => {
    return (await prisma?.location.findMany({
        where: {
          listings: {
            some: {
              id: listingId
            }
          }
        }
      })
)};

const findListingInfoBlocks = async (listingId: string) => {
    return (await prisma?.infoBlock.findMany({
        where: {
          listing: {
            id: listingId
          }
        }
      })
)};
  