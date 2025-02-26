import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final _storage = FlutterSecureStorage();
  static final _key = Key.fromUtf8('12345678901234567890123456789012');
  static final _iv = IV.fromLength(16);
  static final _encrypter = Encrypter(AES(_key,mode: AESMode.cbc));

  static Future<void> saveKey(String key, String value) async {
    final encrypted = _encrypter.encrypt(value, iv: _iv);
    await _storage.write(key: key, value: encrypted.base64);
  }

  static Future<String?> getKey(String key) async {
    final encrypted = await _storage.read(key: key);
    if (encrypted == null) return null;
    return _encrypter.decrypt64(encrypted, iv: _iv);
  }
}
