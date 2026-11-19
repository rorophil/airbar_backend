import 'package:airbar_backend_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Facturation par lot', (sessions, endpoints) {
    test('débite chaque membre et ne refacture pas une reprise', () async {
      final admin = await endpoints.user.createUser(
        sessions,
        'admin@test.invalid',
        'x',
        'Admin',
        'Test',
        '1234',
        UserRole.admin,
      );
      final first = await endpoints.user.createUser(
        sessions,
        'first@test.invalid',
        'x',
        'First',
        'Test',
        '1111',
        UserRole.user,
      );
      final second = await endpoints.user.createUser(
        sessions,
        'second@test.invalid',
        'x',
        'Second',
        'Test',
        '2222',
        UserRole.user,
      );
      final category = await endpoints.category.createCategory(
        sessions,
        'Test',
        null,
        null,
        0,
      );
      final product = await endpoints.product.createProduct(
        sessions,
        'Repas',
        null,
        5,
        category.id!,
        4,
        1,
        null,
        isBulkProduct: false,
        trackStock: true,
      );
      final lines = [
        BatchBillingLine(
          userId: first.id!,
          productId: product.id!,
          quantity: 1,
        ),
        BatchBillingLine(
          userId: second.id!,
          productId: product.id!,
          quantity: 2,
        ),
      ];
      await endpoints.cart.addToCart(sessions, first.id!, product.id!, 1);
      await expectLater(
        endpoints.batchBilling.charge(
          sessions,
          'bad-pin',
          admin.id!,
          '0000',
          lines,
        ),
        throwsA(isA<BusinessException>()),
      );
      await expectLater(
        endpoints.batchBilling.charge(
          sessions,
          'not-admin',
          first.id!,
          '1111',
          lines,
        ),
        throwsA(isA<BusinessException>()),
      );
      await endpoints.user.deactivateUser(sessions, second.id!);
      await expectLater(
        endpoints.batchBilling.charge(
          sessions,
          'inactive',
          admin.id!,
          '1234',
          lines,
        ),
        throwsA(isA<BusinessException>()),
      );
      await endpoints.user.reactivateUser(sessions, second.id!);
      final result = await endpoints.batchBilling.charge(
        sessions,
        'request-a',
        admin.id!,
        '1234',
        lines,
      );
      await endpoints.user.deactivateUser(sessions, first.id!);
      final retry = await endpoints.batchBilling.charge(
        sessions,
        'request-a',
        admin.id!,
        '1234',
        lines,
      );
      expect(result.map((t) => t.id), retry.map((t) => t.id));
      await endpoints.user.reactivateUser(sessions, first.id!);
      expect(await endpoints.cart.getCart(sessions, first.id!), hasLength(1));
      final cancelledAfterSale = await endpoints.batchBilling.cancel(
        sessions,
        'request-a',
        admin.id!,
        '1234',
        lines,
      );
      expect(cancelledAfterSale.map((t) => t.id), result.map((t) => t.id));
      expect(
        (await endpoints.user.getUserById(sessions, first.id!))!.balance,
        -5,
      );
      expect(
        (await endpoints.user.getUserById(sessions, second.id!))!.balance,
        -10,
      );
      expect(
        (await endpoints.product.getProductById(
          sessions,
          product.id!,
        ))!.stockQuantity,
        1,
      );
      await expectLater(
        endpoints.product.updateProduct(
          sessions,
          product.id!,
          'Repas',
          null,
          5,
          category.id!,
          1,
          null,
          stockQuantity: 4,
          expectedUpdatedAt: product.updatedAt,
        ),
        throwsA(isA<BusinessException>()),
      );
      final current = (await endpoints.product.getProductById(
        sessions,
        product.id!,
      ))!;
      await endpoints.product.updateProduct(
        sessions,
        product.id!,
        'Repas',
        null,
        7,
        category.id!,
        1,
        null,
        expectedUpdatedAt: current.updatedAt,
      );
      final newer = await endpoints.batchBilling.charge(
        sessions,
        'new-price',
        admin.id!,
        '1234',
        [lines.first],
      );
      expect(newer.single.totalAmount, 7);
      await expectLater(
        endpoints.batchBilling.charge(
          sessions,
          'request-a',
          admin.id!,
          '1234',
          [lines.first],
        ),
        throwsA(isA<BusinessException>()),
      );
      final session = sessions.build();
      final legacyItem = (await TransactionItem.db.find(
        session,
        where: (t) => t.transactionId.equals(newer.single.id!),
      )).single;
      legacyItem.stockWasTracked = null;
      legacyItem.stockWasBulk = null;
      legacyItem.stockBulkCapacity = null;
      await TransactionItem.db.updateRow(session, legacyItem);
      await endpoints.transaction.refundTransaction(
        sessions,
        newer.single.id!,
        'Ancienne transaction',
      );
      expect(
        (await endpoints.product.getProductById(
          sessions,
          product.id!,
        ))!.stockQuantity,
        1,
      );
      expect(
        (await endpoints.user.getUserById(sessions, first.id!))!.balance,
        -5,
      );
    });

    test('un stock insuffisant annule tout le lot', () async {
      final admin = await endpoints.user.createUser(
        sessions,
        'admin2@test.invalid',
        'x',
        'Admin',
        'Test',
        '1234',
        UserRole.admin,
      );
      final first = await endpoints.user.createUser(
        sessions,
        'first2@test.invalid',
        'x',
        'First',
        'Test',
        '1111',
        UserRole.user,
      );
      final second = await endpoints.user.createUser(
        sessions,
        'second2@test.invalid',
        'x',
        'Second',
        'Test',
        '2222',
        UserRole.user,
      );
      final category = await endpoints.category.createCategory(
        sessions,
        'Test',
        null,
        null,
        0,
      );
      final product = await endpoints.product.createProduct(
        sessions,
        'Repas',
        null,
        5,
        category.id!,
        1,
        1,
        null,
        isBulkProduct: false,
        trackStock: true,
      );
      await expectLater(
        endpoints.batchBilling.charge(
          sessions,
          'request-b',
          admin.id!,
          '1234',
          [
            BatchBillingLine(
              userId: first.id!,
              productId: product.id!,
              quantity: 1,
            ),
            BatchBillingLine(
              userId: second.id!,
              productId: product.id!,
              quantity: 1,
            ),
          ],
        ),
        throwsA(isA<BusinessException>()),
      );
      expect(
        (await endpoints.user.getUserById(sessions, first.id!))!.balance,
        0,
      );
      expect(
        (await endpoints.user.getUserById(sessions, second.id!))!.balance,
        0,
      );
      expect(
        (await endpoints.product.getProductById(
          sessions,
          product.id!,
        ))!.stockQuantity,
        1,
      );
    });
    test(
      'le vrac et les produits sans stock se remboursent correctement',
      () async {
        final admin = await endpoints.user.createUser(
          sessions,
          'admin3@test.invalid',
          'x',
          'Admin',
          'Test',
          '1234',
          UserRole.admin,
        );
        final user = await endpoints.user.createUser(
          sessions,
          'buyer3@test.invalid',
          'x',
          'Buyer',
          'Test',
          '1111',
          UserRole.user,
        );
        final category = await endpoints.category.createCategory(
          sessions,
          'Test',
          null,
          null,
          0,
        );
        final bulk = await endpoints.product.createProduct(
          sessions,
          'Bière',
          null,
          0,
          category.id!,
          1,
          0,
          null,
          isBulkProduct: true,
          trackStock: true,
          bulkUnit: 'litres',
          bulkTotalQuantity: 6,
          currentUnitRemaining: 1,
        );
        final portion = await endpoints.productPortion.createPortion(
          sessions,
          bulk.id!,
          '50cl',
          0.5,
          2,
          displayOrder: 0,
        );
        final smallPortion = await endpoints.productPortion.createPortion(
          sessions,
          bulk.id!,
          '25cl',
          0.25,
          1,
          displayOrder: 1,
        );
        await expectLater(
          endpoints.batchBilling.charge(
            sessions,
            'bulk-insufficient',
            admin.id!,
            '1234',
            [
              BatchBillingLine(
                userId: user.id!,
                productId: bulk.id!,
                productPortionId: portion.id!,
                quantity: 10,
              ),
              BatchBillingLine(
                userId: user.id!,
                productId: bulk.id!,
                productPortionId: smallPortion.id!,
                quantity: 10,
              ),
            ],
          ),
          throwsA(isA<BusinessException>()),
        );
        final untracked = await endpoints.product.createProduct(
          sessions,
          'Café',
          null,
          1,
          category.id!,
          0,
          0,
          null,
          isBulkProduct: false,
          trackStock: false,
        );
        final otherBulk = await endpoints.product.createProduct(
          sessions,
          'Autre fût',
          null,
          0,
          category.id!,
          1,
          0,
          null,
          isBulkProduct: true,
          trackStock: true,
          bulkUnit: 'litres',
          bulkTotalQuantity: 6,
        );
        await expectLater(
          endpoints.batchBilling.charge(
            sessions,
            'wrong-portion',
            admin.id!,
            '1234',
            [
              BatchBillingLine(
                userId: user.id!,
                productId: otherBulk.id!,
                productPortionId: portion.id!,
                quantity: 1,
              ),
            ],
          ),
          throwsA(isA<BusinessException>()),
        );
        expect(
          (await endpoints.user.getUserById(sessions, user.id!))!.balance,
          0,
        );
        final sales = await endpoints.batchBilling.charge(
          sessions,
          'bulk-request',
          admin.id!,
          '1234',
          [
            BatchBillingLine(
              userId: user.id!,
              productId: bulk.id!,
              productPortionId: portion.id!,
              quantity: 3,
            ),
            BatchBillingLine(
              userId: user.id!,
              productId: untracked.id!,
              quantity: 1,
            ),
          ],
        );
        expect(sales.single.totalAmount, 7);
        final afterSale = (await endpoints.product.getProductById(
          sessions,
          bulk.id!,
        ))!;
        expect(afterSale.stockQuantity, 0);
        expect(afterSale.currentUnitRemaining, 5.5);
        expect(
          await endpoints.stock.getStockHistory(sessions, untracked.id!),
          isEmpty,
        );
        await endpoints.product.updateProduct(
          sessions,
          untracked.id!,
          'Café',
          null,
          1,
          category.id!,
          0,
          null,
          trackStock: true,
          expectedUpdatedAt: untracked.updatedAt,
        );
        await endpoints.product.updateProduct(
          sessions,
          bulk.id!,
          'Bière',
          null,
          0,
          category.id!,
          0,
          null,
          isBulkProduct: true,
          bulkUnit: 'litres',
          bulkTotalQuantity: 8,
          trackStock: true,
          expectedUpdatedAt: afterSale.updatedAt,
        );
        await expectLater(
          endpoints.transaction.refundTransaction(
            sessions,
            sales.single.id!,
            'Test',
          ),
          throwsA(isA<BusinessException>()),
        );
        expect(
          (await endpoints.user.getUserById(sessions, user.id!))!.balance,
          -7,
        );
        final incompatible = (await endpoints.product.getProductById(
          sessions,
          bulk.id!,
        ))!;
        expect(incompatible.stockQuantity, 0);
        expect(incompatible.currentUnitRemaining, 5.5);
        await endpoints.product.updateProduct(
          sessions,
          bulk.id!,
          'Bière',
          null,
          0,
          category.id!,
          0,
          null,
          isBulkProduct: true,
          bulkUnit: 'litres',
          bulkTotalQuantity: 6,
          trackStock: true,
          expectedUpdatedAt: incompatible.updatedAt,
        );
        await endpoints.transaction.refundTransaction(
          sessions,
          sales.single.id!,
          'Test',
        );
        final afterRefund = (await endpoints.product.getProductById(
          sessions,
          bulk.id!,
        ))!;
        expect(afterRefund.stockQuantity, 1);
        expect(afterRefund.currentUnitRemaining, 1);
        expect(
          (await endpoints.product.getProductById(
            sessions,
            untracked.id!,
          ))!.stockQuantity,
          0,
        );
        expect(
          await endpoints.stock.getStockHistory(sessions, untracked.id!),
          isEmpty,
        );
        expect(
          (await endpoints.user.getUserById(sessions, user.id!))!.balance,
          0,
        );
      },
    );
  });

  withServerpod('Concurrence de facturation', (sessions, endpoints) {
    test(
      'deux reprises simultanées et un crédit ne perdent aucun débit',
      () async {
        final admin = await endpoints.user.createUser(
          sessions,
          'admin4@test.invalid',
          'x',
          'Admin',
          'Test',
          '1234',
          UserRole.admin,
        );
        final user = await endpoints.user.createUser(
          sessions,
          'buyer4@test.invalid',
          'x',
          'Buyer',
          'Test',
          '1111',
          UserRole.user,
        );
        final category = await endpoints.category.createCategory(
          sessions,
          'Test',
          null,
          null,
          0,
        );
        final product = await endpoints.product.createProduct(
          sessions,
          'Repas',
          null,
          5,
          category.id!,
          10,
          0,
          null,
          isBulkProduct: false,
          trackStock: true,
        );
        final lines = [
          BatchBillingLine(
            userId: user.id!,
            productId: product.id!,
            quantity: 1,
          ),
        ];
        final results = await Future.wait([
          endpoints.batchBilling.charge(
            sessions,
            'concurrent',
            admin.id!,
            '1234',
            lines,
          ),
          endpoints.batchBilling.charge(
            sessions,
            'concurrent',
            admin.id!,
            '1234',
            lines,
          ),
          endpoints.user.creditAccount(sessions, user.id!, 10, null),
        ]);
        final first = results[0] as List<Transaction>;
        final second = results[1] as List<Transaction>;
        expect(first.single.id, second.single.id);
        expect(
          (await endpoints.user.getUserById(sessions, user.id!))!.balance,
          5,
        );
        expect(
          (await endpoints.product.getProductById(
            sessions,
            product.id!,
          ))!.stockQuantity,
          9,
        );
      },
    );
    test('une annulation interdit une demande arrivée en retard', () async {
      final admin = await endpoints.user.createUser(
        sessions,
        'admin7@test.invalid',
        'x',
        'Admin',
        'Test',
        '1234',
        UserRole.admin,
      );
      final user = await endpoints.user.createUser(
        sessions,
        'buyer7@test.invalid',
        'x',
        'Buyer',
        'Test',
        '1111',
        UserRole.user,
      );
      final category = await endpoints.category.createCategory(
        sessions,
        'Test',
        null,
        null,
        0,
      );
      final product = await endpoints.product.createProduct(
        sessions,
        'Repas',
        null,
        5,
        category.id!,
        1,
        0,
        null,
        isBulkProduct: false,
        trackStock: true,
      );
      final lines = [
        BatchBillingLine(userId: user.id!, productId: product.id!, quantity: 1),
      ];
      expect(
        await endpoints.batchBilling.cancel(
          sessions,
          'cancelled',
          admin.id!,
          '1234',
          lines,
        ),
        isEmpty,
      );
      await expectLater(
        endpoints.batchBilling.charge(
          sessions,
          'cancelled',
          admin.id!,
          '1234',
          lines,
        ),
        throwsA(isA<BusinessException>()),
      );
      expect(
        (await endpoints.user.getUserById(sessions, user.id!))!.balance,
        0,
      );
      expect(
        (await endpoints.product.getProductById(
          sessions,
          product.id!,
        ))!.stockQuantity,
        1,
      );
    });

    test(
      'un panier et un lot concurrents ne vendent pas le même stock',
      () async {
        final admin = await endpoints.user.createUser(
          sessions,
          'admin6@test.invalid',
          'x',
          'Admin',
          'Test',
          '1234',
          UserRole.admin,
        );
        final user = await endpoints.user.createUser(
          sessions,
          'buyer6@test.invalid',
          'x',
          'Buyer',
          'Test',
          '1111',
          UserRole.user,
        );
        final category = await endpoints.category.createCategory(
          sessions,
          'Test',
          null,
          null,
          0,
        );
        final product = await endpoints.product.createProduct(
          sessions,
          'Repas',
          null,
          5,
          category.id!,
          1,
          0,
          null,
          isBulkProduct: false,
          trackStock: true,
        );
        await endpoints.user.creditAccount(sessions, user.id!, 20, null);
        await endpoints.cart.addToCart(sessions, user.id!, product.id!, 1);
        Future<bool> succeeded(Future<Object> operation) async {
          try {
            await operation;
            return true;
          } on BusinessException {
            return false;
          }
        }

        final outcomes = await Future.wait([
          succeeded(
            endpoints.batchBilling.charge(
              sessions,
              'compete',
              admin.id!,
              '1234',
              [
                BatchBillingLine(
                  userId: user.id!,
                  productId: product.id!,
                  quantity: 1,
                ),
              ],
            ),
          ),
          succeeded(endpoints.transaction.checkout(sessions, user.id!, '1111')),
        ]);
        expect(outcomes.where((success) => success), hasLength(1));
        expect(
          (await endpoints.product.getProductById(
            sessions,
            product.id!,
          ))!.stockQuantity,
          0,
        );
        expect(
          (await endpoints.user.getUserById(sessions, user.id!))!.balance,
          15,
        );
      },
    );

    test('la caisse et le lot concurrents respectent le stock', () async {
      final admin = await endpoints.user.createUser(
        sessions,
        'admin8@test.invalid',
        'x',
        'Admin',
        'Test',
        '1234',
        UserRole.admin,
      );
      final buyer = await endpoints.user.createUser(
        sessions,
        'buyer8@test.invalid',
        'x',
        'Buyer',
        'Test',
        '1111',
        UserRole.user,
      );
      final category = await endpoints.category.createCategory(
        sessions,
        'Test',
        null,
        null,
        0,
      );
      final product = await endpoints.product.createProduct(
        sessions,
        'Repas',
        null,
        5,
        category.id!,
        1,
        0,
        null,
        isBulkProduct: false,
        trackStock: true,
      );
      Future<bool> succeeded(Future<Object> operation) async {
        try {
          await operation;
          return true;
        } on BusinessException {
          return false;
        }
      }

      final outcomes = await Future.wait([
        succeeded(
          endpoints.batchBilling.charge(
            sessions,
            'cashier-compete',
            admin.id!,
            '1234',
            [
              BatchBillingLine(
                userId: buyer.id!,
                productId: product.id!,
                quantity: 1,
              ),
            ],
          ),
        ),
        succeeded(
          endpoints.cashier.processCashSale(
            sessions,
            admin.id!,
            [CashSaleItemData(productId: product.id!, quantity: 1)],
            PaymentMethod.cash,
            '1234',
          ),
        ),
      ]);
      expect(outcomes.where((success) => success), hasLength(1));
      expect(
        (await endpoints.product.getProductById(
          sessions,
          product.id!,
        ))!.stockQuantity,
        0,
      );
    });

    test(
      'une erreur après la première écriture annule tous les débits',
      () async {
        final admin = await endpoints.user.createUser(
          sessions,
          'admin5@test.invalid',
          'x',
          'Admin',
          'Test',
          '1234',
          UserRole.admin,
        );
        final first = await endpoints.user.createUser(
          sessions,
          'first5@test.invalid',
          'x',
          'First',
          'Test',
          '1111',
          UserRole.user,
        );
        final second = await endpoints.user.createUser(
          sessions,
          'second5@test.invalid',
          'x',
          'Second',
          'Test',
          '2222',
          UserRole.user,
        );
        final category = await endpoints.category.createCategory(
          sessions,
          'Test',
          null,
          null,
          0,
        );
        final product = await endpoints.product.createProduct(
          sessions,
          'Repas',
          null,
          5,
          category.id!,
          10,
          0,
          null,
          isBulkProduct: false,
          trackStock: true,
        );
        final session = sessions.build();
        await session.db.unsafeExecute(
          'ALTER TABLE transaction_items ADD CONSTRAINT test_failure CHECK ("quantity" < 2)',
        );
        await expectLater(
          endpoints.batchBilling.charge(
            sessions,
            'rollback',
            admin.id!,
            '1234',
            [
              BatchBillingLine(
                userId: first.id!,
                productId: product.id!,
                quantity: 1,
              ),
              BatchBillingLine(
                userId: second.id!,
                productId: product.id!,
                quantity: 2,
              ),
            ],
          ),
          throwsA(anything),
        );
        expect(
          (await endpoints.user.getUserById(sessions, first.id!))!.balance,
          0,
        );
        expect(
          (await endpoints.user.getUserById(sessions, second.id!))!.balance,
          0,
        );
        expect(
          (await endpoints.product.getProductById(
            sessions,
            product.id!,
          ))!.stockQuantity,
          10,
        );
        expect(
          await endpoints.stock.getStockHistory(sessions, product.id!),
          isEmpty,
        );
        await session.close();
      },
    );
  }, rollbackDatabase: RollbackDatabase.disabled);
}
