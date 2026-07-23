-- CreateTable
CREATE TABLE "WhatsappStatus" (
    "id" TEXT NOT NULL,
    "keyId" VARCHAR(100) NOT NULL,
    "messageId" VARCHAR(100),
    "type" VARCHAR(30),
    "targetJids" JSONB,
    "targetCount" INTEGER NOT NULL DEFAULT 0,
    "messageTimestamp" INTEGER,
    "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP NOT NULL,
    "instanceId" TEXT NOT NULL,

    CONSTRAINT "WhatsappStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WhatsappStatusView" (
    "id" TEXT NOT NULL,
    "keyId" VARCHAR(100) NOT NULL,
    "viewerJid" VARCHAR(100) NOT NULL,
    "viewerNumber" VARCHAR(100),
    "viewerName" VARCHAR(100),
    "readAt" INTEGER,
    "receiptTimestamp" INTEGER,
    "playedAt" INTEGER,
    "rawReceipt" JSONB,
    "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP NOT NULL,
    "statusId" TEXT NOT NULL,
    "instanceId" TEXT NOT NULL,

    CONSTRAINT "WhatsappStatusView_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "WhatsappStatus_instanceId_keyId_key" ON "WhatsappStatus"("instanceId", "keyId");

-- CreateIndex
CREATE INDEX "WhatsappStatus_instanceId_idx" ON "WhatsappStatus"("instanceId");

-- CreateIndex
CREATE INDEX "WhatsappStatus_keyId_idx" ON "WhatsappStatus"("keyId");

-- CreateIndex
CREATE UNIQUE INDEX "WhatsappStatusView_instanceId_keyId_viewerJid_key" ON "WhatsappStatusView"("instanceId", "keyId", "viewerJid");

-- CreateIndex
CREATE INDEX "WhatsappStatusView_instanceId_idx" ON "WhatsappStatusView"("instanceId");

-- CreateIndex
CREATE INDEX "WhatsappStatusView_statusId_idx" ON "WhatsappStatusView"("statusId");

-- CreateIndex
CREATE INDEX "WhatsappStatusView_keyId_idx" ON "WhatsappStatusView"("keyId");

-- CreateIndex
CREATE INDEX "WhatsappStatusView_viewerJid_idx" ON "WhatsappStatusView"("viewerJid");

-- AddForeignKey
ALTER TABLE "WhatsappStatus" ADD CONSTRAINT "WhatsappStatus_instanceId_fkey" FOREIGN KEY ("instanceId") REFERENCES "Instance"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WhatsappStatusView" ADD CONSTRAINT "WhatsappStatusView_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "WhatsappStatus"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WhatsappStatusView" ADD CONSTRAINT "WhatsappStatusView_instanceId_fkey" FOREIGN KEY ("instanceId") REFERENCES "Instance"("id") ON DELETE CASCADE ON UPDATE CASCADE;
