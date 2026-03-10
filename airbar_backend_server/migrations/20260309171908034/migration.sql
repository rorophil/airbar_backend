BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "product_portions" (
    "id" bigserial PRIMARY KEY,
    "productId" bigint NOT NULL,
    "name" text NOT NULL,
    "quantity" double precision NOT NULL,
    "price" double precision NOT NULL,
    "displayOrder" bigint NOT NULL DEFAULT 0,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "product_portions_product_idx" ON "product_portions" USING btree ("productId");
CREATE INDEX "product_portions_active_idx" ON "product_portions" USING btree ("isActive", "displayOrder");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "products" ADD COLUMN "isBulkProduct" boolean NOT NULL DEFAULT false;
ALTER TABLE "products" ADD COLUMN "bulkUnit" text;
ALTER TABLE "products" ADD COLUMN "bulkTotalQuantity" double precision;

--
-- MIGRATION VERSION FOR airbar_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('airbar_backend', '20260309171908034', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260309171908034', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260129181124635', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181124635', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260129181112269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181112269', "timestamp" = now();


COMMIT;
