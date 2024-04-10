/*
  Warnings:

  - A unique constraint covering the columns `[NumeroDeTelephone]` on the table `client` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `client` MODIFY `NumeroDeTelephone` VARCHAR(10) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `client_NumeroDeTelephone_key` ON `client`(`NumeroDeTelephone`);
