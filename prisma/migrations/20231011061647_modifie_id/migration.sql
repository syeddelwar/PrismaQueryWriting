/*
  Warnings:

  - You are about to alter the column `id` on the `category` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `parentId` on the `category` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `id` on the `post` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `authorId` on the `post` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `id` on the `post_category` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `postId` on the `post_category` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `id` on the `post_comment` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `postId` on the `post_comment` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `id` on the `post_meta` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `postId` on the `post_meta` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `id` on the `post_tag` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `postId` on the `post_tag` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `tagId` on the `post_tag` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `id` on the `tag` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.
  - You are about to alter the column `id` on the `user` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `MediumInt`.

*/
-- DropForeignKey
ALTER TABLE `category` DROP FOREIGN KEY `category_parentId_fkey`;

-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `post_authorId_fkey`;

-- DropForeignKey
ALTER TABLE `post_category` DROP FOREIGN KEY `post_category_postId_fkey`;

-- DropForeignKey
ALTER TABLE `post_comment` DROP FOREIGN KEY `post_comment_postId_fkey`;

-- DropForeignKey
ALTER TABLE `post_meta` DROP FOREIGN KEY `post_meta_postId_fkey`;

-- DropForeignKey
ALTER TABLE `post_tag` DROP FOREIGN KEY `post_tag_postId_fkey`;

-- DropForeignKey
ALTER TABLE `post_tag` DROP FOREIGN KEY `post_tag_tagId_fkey`;

-- AlterTable
ALTER TABLE `category` MODIFY `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
    MODIFY `parentId` MEDIUMINT NOT NULL;

-- AlterTable
ALTER TABLE `post` MODIFY `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
    MODIFY `authorId` MEDIUMINT NOT NULL;

-- AlterTable
ALTER TABLE `post_category` MODIFY `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
    MODIFY `postId` MEDIUMINT NOT NULL;

-- AlterTable
ALTER TABLE `post_comment` MODIFY `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
    MODIFY `postId` MEDIUMINT NOT NULL;

-- AlterTable
ALTER TABLE `post_meta` MODIFY `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
    MODIFY `postId` MEDIUMINT NOT NULL;

-- AlterTable
ALTER TABLE `post_tag` MODIFY `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
    MODIFY `postId` MEDIUMINT NOT NULL,
    MODIFY `tagId` MEDIUMINT NOT NULL;

-- AlterTable
ALTER TABLE `tag` MODIFY `id` MEDIUMINT NOT NULL AUTO_INCREMENT;

-- AlterTable
ALTER TABLE `user` MODIFY `id` MEDIUMINT NOT NULL AUTO_INCREMENT;

-- AddForeignKey
ALTER TABLE `post` ADD CONSTRAINT `post_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_comment` ADD CONSTRAINT `post_comment_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_tag` ADD CONSTRAINT `post_tag_tagId_fkey` FOREIGN KEY (`tagId`) REFERENCES `tag`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_tag` ADD CONSTRAINT `post_tag_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_meta` ADD CONSTRAINT `post_meta_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_category` ADD CONSTRAINT `post_category_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `category` ADD CONSTRAINT `category_parentId_fkey` FOREIGN KEY (`parentId`) REFERENCES `post_category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
