BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "transactions" ADD COLUMN "sellerId" bigint;
ALTER TABLE "transactions" ADD COLUMN "paymentMethod" text;
ALTER TABLE "transactions" ADD COLUMN "balanceAfter" double precision;
ALTER TABLE "transactions" ALTER COLUMN "userId" DROP NOT NULL;

--
-- MIGRATION VERSION FOR airbar_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('airbar_backend', '20260607094534825', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260607094534825', "timestamp" = now();

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
