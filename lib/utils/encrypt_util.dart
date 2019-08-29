import 'dart:convert';
import "dart:typed_data";
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';

class EncryptUtil {
  static Uint8List _convertBigIntKey(BigInt bikey) {
    var skey = bikey.toString();
    var md5 = crypto.md5;
    var content = Utf8Encoder().convert(skey);
    var digest = md5.convert(content);
    var key = Uint8List.fromList(digest.bytes);
    var hexkey = hex.encode(key);
    // print('hexkey = $hexkey');
    var u8lhexkey = Uint8List.fromList(hexkey.codeUnits);
    // print('u8lhexkey = $u8lhexkey');
    return u8lhexkey;
  }

  static Uint8List _buildIV(Uint8List key) {
    var iv = key.buffer.asUint8List(0, 8);
    // print('u8l iv = $iv');
    return iv;
  }

  static ParametersWithIV<KeyParameter> _buildKey(BigInt bikey) {
    var u8lkey = _convertBigIntKey(bikey);

    return ParametersWithIV<KeyParameter>(
        KeyParameter(u8lkey), _buildIV(u8lkey));
  }

  static Uint8List encrypt(BigInt bikey, Uint8List plain) {
    var s = Salsa20Engine();
    s.init(true, _buildKey(bikey));
    // print('plain  = ${plain}');
    // print('plain length = ${plain.lengthInBytes}');
    var encrypted = s.process(plain);
    // print('encrypted  = ${encrypted}');
    // print('encrypted length = ${encrypted.lengthInBytes}');

    return encrypted;
  }

  static Uint8List decrypt(BigInt bikey, Uint8List encryptedData) {
    var s = Salsa20Engine();
    s.init(false, _buildKey(bikey));
    // print('encryptedData  = ${encryptedData}');
    // print('encryptedData length = ${encryptedData.lengthInBytes}');
    var decrypted = s.process(encryptedData);
    // print('decrypted  = ${decrypted}');
    // print('decrypted length = ${decrypted.lengthInBytes}');

    return decrypted;
  }
}
