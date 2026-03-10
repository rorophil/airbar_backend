BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "cart_items" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "quantity" bigint NOT NULL DEFAULT 1,
    "addedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "cart_user_product_idx" ON "cart_items" USING btree ("userId", "productId");
CREATE INDEX "cart_user_idx" ON "cart_items" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "product_categories" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "iconName" text,
    "displayOrder" bigint NOT NULL DEFAULT 0,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "products" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "price" double precision NOT NULL,
    "categoryId" bigint NOT NULL,
    "stockQuantity" bigint NOT NULL DEFAULT 0,
    "minStockAlert" bigint NOT NULL DEFAULT 5,
    "imageUrl" text,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "products_category_idx" ON "products" USING btree ("categoryId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "stock_movements" (
    "id" bigserial PRIMARY KEY,
    "productId" bigint NOT NULL,
    "quantity" bigint NOT NULL,
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
-- ACTION CREATE TABLE
--
CREATE TABLE "transaction_items" (
    "id" bigserial PRIMARY KEY,
    "transactionId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "productName" text NOT NULL,
    "quantity" bigint NOT NULL,
    "unitPrice" double precision NOT NULL,
    "subtotal" double precision NOT NULL
);

-- Indexes
CREATE INDEX "transaction_items_transaction_idx" ON "transaction_items" USING btree ("transactionId");
CREATE INDEX "transaction_items_product_idx" ON "transaction_items" USING btree ("productId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "transactions" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "type" text NOT NULL,
    "totalAmount" double precision NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "notes" text,
    "refundedTransactionId" bigint
);

-- Indexes
CREATE INDEX "transactions_user_idx" ON "transactions" USING btree ("userId");
CREATE INDEX "transactions_timestamp_idx" ON "transactions" USING btree ("timestamp");
CREATE INDEX "transactions_type_idx" ON "transactions" USING btree ("type");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "role" text NOT NULL,
    "balance" double precision NOT NULL DEFAULT 0.0,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "users_email_idx" ON "users" USING btree ("email");


--
-- MIGRATION VERSION FOR airbar_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('airbar_backend', '20260303165531206', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260303165531206', "timestamp" = now();

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
