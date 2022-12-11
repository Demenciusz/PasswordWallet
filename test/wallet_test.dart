import 'package:bsi/domain/encrypter.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('test ', () {
    test('salt length', () {
      final salt = Encrypter.generateSalt();
      final length = salt.length;
      expect(length, 32);
    });
  });

  group('test ', () {
    test('encrypt de', () {
      const pass = 'jakieshaslo';
      final salt = Encrypter.generateSalt();
      final enc = Encrypter.encryptPass(pass, salt);
      final dec = Encrypter.decryptPass(enc, salt);
      expect(pass, dec);
    });
  });

  group('test ', () {
    final list = <String>[
      'cohasloda',
      'haslosuper',
      'haselkonakanapke',
      'ostatniehaslo'
    ];
    for (final element in list) {
      test('en de', () {
        final salt = Encrypter.generateSalt();
        final enc = Encrypter.encryptPass(element, salt);
        final dec = Encrypter.decryptPass(enc, salt);
        expect(element, dec);
      });
    }
  });
  group('test ', () {
    final list = <String>[
      'cohasloda',
      'haslosuper',
      'haselkonakanapke',
      'ostatniehaslo'
    ];
    for (final element in list) {
      test('sha len', () {
        final enc = Encrypter.makeSha(element);
        expect(enc.length, 128);
      });
    }
  });
  group('', () {
    final list = <String>[
      'cohasloda',
      'haslosuper',
      'haselkonakanapke',
      'ostatniehaslo'
    ];
    for (final element in list) {
      test('hmac len', () {
        final salt = Encrypter.generateSalt();
        final enc = Encrypter.makeHMAC(element, salt);
        expect(enc.length, 128);
      });
    }
  });
}
