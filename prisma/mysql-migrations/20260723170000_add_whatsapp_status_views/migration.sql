-- CreateTable
CREATE TABLE `WhatsappStatus` (
    `id` VARCHAR(191) NOT NULL,
    `keyId` VARCHAR(100) NOT NULL,
    `messageId` VARCHAR(100) NULL,
    `type` VARCHAR(30) NULL,
    `targetJids` JSON NULL,
    `targetCount` INTEGER NOT NULL DEFAULT 0,
    `messageTimestamp` INTEGER NULL,
    `createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL,
    `instanceId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WhatsappStatusView` (
    `id` VARCHAR(191) NOT NULL,
    `keyId` VARCHAR(100) NOT NULL,
    `viewerJid` VARCHAR(100) NOT NULL,
    `viewerNumber` VARCHAR(100) NULL,
    `viewerName` VARCHAR(100) NULL,
    `readAt` INTEGER NULL,
    `receiptTimestamp` INTEGER NULL,
    `playedAt` INTEGER NULL,
    `rawReceipt` JSON NULL,
    `createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL,
    `statusId` VARCHAR(191) NOT NULL,
    `instanceId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `WhatsappStatus_instanceId_keyId_key` ON `WhatsappStatus`(`instanceId`, `keyId`);

-- CreateIndex
CREATE INDEX `WhatsappStatus_instanceId_idx` ON `WhatsappStatus`(`instanceId`);

-- CreateIndex
CREATE INDEX `WhatsappStatus_keyId_idx` ON `WhatsappStatus`(`keyId`);

-- CreateIndex
CREATE UNIQUE INDEX `WhatsappStatusView_instanceId_keyId_viewerJid_key` ON `WhatsappStatusView`(`instanceId`, `keyId`, `viewerJid`);

-- CreateIndex
CREATE INDEX `WhatsappStatusView_instanceId_idx` ON `WhatsappStatusView`(`instanceId`);

-- CreateIndex
CREATE INDEX `WhatsappStatusView_statusId_idx` ON `WhatsappStatusView`(`statusId`);

-- CreateIndex
CREATE INDEX `WhatsappStatusView_keyId_idx` ON `WhatsappStatusView`(`keyId`);

-- CreateIndex
CREATE INDEX `WhatsappStatusView_viewerJid_idx` ON `WhatsappStatusView`(`viewerJid`);

-- AddForeignKey
ALTER TABLE `WhatsappStatus` ADD CONSTRAINT `WhatsappStatus_instanceId_fkey` FOREIGN KEY (`instanceId`) REFERENCES `Instance`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WhatsappStatusView` ADD CONSTRAINT `WhatsappStatusView_statusId_fkey` FOREIGN KEY (`statusId`) REFERENCES `WhatsappStatus`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WhatsappStatusView` ADD CONSTRAINT `WhatsappStatusView_instanceId_fkey` FOREIGN KEY (`instanceId`) REFERENCES `Instance`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
