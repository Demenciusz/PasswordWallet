import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:bsi/constant.dart';

class Encrypter {
  static String generateSalt() {
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        32,
        (_) => chars.codeUnitAt(
          random.nextInt(32),
        ),
      ),
    );
  }

  static String makeSha(String text) =>
      sha512.convert(utf8.encode(text)).toString();

  static String makeHMAC(String text, String key) {
    final hmac = Hmac(sha512, utf8.encode(key));
    final digest = hmac.convert(utf8.encode(text));
    return digest.toString();
  }

  //static String encryptPass(){}

}
