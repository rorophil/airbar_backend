BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "cart_items" ADD COLUMN "productPortionId" bigint;

--
-- Drop old index and create new one with productPortionId
--
DROP INDEX IF EXISTS "cart_user_product_idx";
CREATE UNIQUE INDEX "cart_user_product_idx" ON "cart_items" USING btree ("userId", "productId", "productPortionId");

--
-- MIGRATION VERSION FOR airbar_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('airbar_backend', '20260309183616648', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260309183616648', "timestamp" = now();

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
