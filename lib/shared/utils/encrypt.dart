import 'package:encrypt/encrypt.dart' as Cipher;
import 'dart:convert';
import 'dart:math';
import 'package:pointycastle/export.dart' as Crypto;

String generateRandomString(int length) {
  const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random.secure();
  return List.generate(
      length, (index) => characters[random.nextInt(characters.length)]).join();
}

class EncryptionHelper {
  // 随机生成aes 密钥
  static String generateRandomAESKey(int length) {
    // return generateRandomString(length);
    return '0heTnTxGpLOLTNN3f3WbqHJDhEHTGNnr';
  }

  // 使用密钥对数据进行加密
  static String encryptWithAes(String message, String aesKey) {
    final key = Cipher.Key.fromUtf8(aesKey);
    final iv = Cipher.IV.fromLength(16); // 使用随机 IV
    final encrypter = Cipher.Encrypter(Cipher.AES(
      key,
      mode: Cipher.AESMode.ecb,
    ));

    final encrypted = encrypter.encrypt(message, iv: iv);
    return encrypted.base64;
  }

  // 使用密钥对数据进行解密
  static String decryptWithAes(String encryptedMessage, String aesKey) {
    final key = Cipher.Key.fromUtf8(aesKey);
    final iv = Cipher.IV.fromLength(16); // 使用相同的 IV
    final encrypter = Cipher.Encrypter(Cipher.AES(
      key,
      mode: Cipher.AESMode.ecb,
    ));

    final decrypted = encrypter.decrypt64(encryptedMessage, iv: iv);
    return decrypted;
  }
}

class Base64Helper {
  // 加密base64
  static String encryptBase64(String data) {
    return base64.encode(utf8.encode(data));
  }

  // 解密base64
  static String decryptBase64(String base64Data) {
    return utf8.decode(base64.decode(base64Data));
  }
}

class RSAHelper {
  // RSA 加密
  static String rsaEncrypt(String data, Crypto.RSAPublicKey publicKey) {
    final encryptor = Crypto.OAEPEncoding(Crypto.RSAEngine())
      ..init(true, Crypto.PublicKeyParameter<Crypto.RSAPublicKey>(publicKey));
    final encrypted = encryptor.process(utf8.encode(data));
    return base64.encode(encrypted);
  }

  // RSA 解密
  static String rsaDecrypt(String encryptedData, Crypto.RSAPrivateKey privateKey) {
    final decryptor = Crypto.OAEPEncoding(Crypto.RSAEngine())
      ..init(false, Crypto.PrivateKeyParameter<Crypto.RSAPrivateKey>(privateKey));
    final decrypted = decryptor.process(base64.decode(encryptedData));
    return utf8.decode(decrypted);
  }

  // 用于从字符串中解析公钥
  static Crypto.RSAPublicKey parsePublicKey(String publicKeyPem) {
    final parser = Crypto.RSAKeyParser();
    return parser.parse(publicKeyPem) as Crypto.RSAPublicKey;
  }
}
