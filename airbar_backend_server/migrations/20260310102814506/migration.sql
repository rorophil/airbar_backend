BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "products" DROP COLUMN "stockQuantity";
ALTER TABLE "products" DROP COLUMN "minStockAlert";
ALTER TABLE "products" ADD COLUMN "currentUnitRemaining" double precision;
ALTER TABLE "products" ADD COLUMN "stockQuantity" bigint NOT NULL DEFAULT 0;
ALTER TABLE "products" ADD COLUMN "minStockAlert" bigint NOT NULL DEFAULT 5;

--
-- MIGRATION VERSION FOR airbar_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('airbar_backend', '20260310102814506', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260310102814506', "timestamp" = now();

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
