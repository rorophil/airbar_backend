BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "products" DROP COLUMN "stockQuantity";
ALTER TABLE "products" DROP COLUMN "minStockAlert";
ALTER TABLE "products" ADD COLUMN "stockQuantity" double precision NOT NULL DEFAULT 0;
ALTER TABLE "products" ADD COLUMN "minStockAlert" double precision NOT NULL DEFAULT 5;
--
-- ACTION DROP TABLE
--
DROP TABLE "stock_movements" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "stock_movements" (
    "id" bigserial PRIMARY KEY,
    "productId" bigint NOT NULL,
    "quantity" double precision NOT NULL,
    "movementType" text NOT NULL,
    "userId" bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "notes" text
);

-- Indexes
CREATE INDEX "stock_movements_product_idx" ON "stock_movements" USING btree ("productId");
CREATE INDEX "stock_movements_timestamp_idx" ON "stock_movements" USING btree ("timestamp");
CREATE INDEX "stock_movements_user_idx" ON "stock_movements" USING btree ("userId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "transaction_items" ADD COLUMN "stockDeduction" double precision DEFAULT 0;

--
-- MIGRATION VERSION FOR airbar_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('airbar_backend', '20260310100427651', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260310100427651', "timestamp" = now();

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
