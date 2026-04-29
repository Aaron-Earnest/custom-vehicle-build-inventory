-- CreateTable
CREATE TABLE "Vehicle" (
    "id" TEXT NOT NULL,
    "nickname" TEXT NOT NULL,
    "baseModel" TEXT,
    "paintColor" TEXT,
    "paintCode" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Vehicle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Part" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "partNumber" TEXT,
    "manufacturer" TEXT,
    "isCustom" BOOLEAN NOT NULL DEFAULT false,
    "paintColor" TEXT,
    "paintCode" TEXT,
    "warrantyStatus" TEXT,
    "purchaseDate" TIMESTAMP(3),
    "expiryDate" TIMESTAMP(3),
    "vehicleId" TEXT NOT NULL,

    CONSTRAINT "Part_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Part" ADD CONSTRAINT "Part_vehicleId_fkey" FOREIGN KEY ("vehicleId") REFERENCES "Vehicle"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
