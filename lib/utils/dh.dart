// Copyright (c) 2016, Kwang Yul Seo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math' as math;
import 'dart:typed_data';

/// The Diffie-Hellman key.
class DhKey {
  final BigInt _privateKey;
  final BigInt _publicKey;
  final DhGroup _group;

  DhKey._(this._privateKey, this._publicKey, this._group);

  /// The Diffie-Hellman public key in hex string.
  String get publicKey {
    var pubkey = _publicKey.toRadixString(16);
    if (pubkey.length % 2 != 0) {
      //padding
      return "0$pubkey";
    }

    return pubkey;
  }

  /// Creates a [DhKey] from the given hex public key.
  factory DhKey.fromPublicKey(String hex) {
    BigInt publicKey = BigInt.parse(hex, radix: 16);
    // print('fromPublicKey: publicKey=$publicKey');
    return new DhKey._(null, publicKey, null);
  }

  /// Computes the shared secret using [other] as the other party's
  /// public key and returns the computed shared secret.
  BigInt computeKey(DhKey other) {
    if (other == null) {
      throw new ArgumentError.notNull('otherPublicKey');
    }
    if (other._publicKey <= BigInt.from(0) || other._publicKey > _group.prime) {
      throw new ArgumentError.value(other, 'DH parameter out of bounds');
    }
    if (_privateKey == null) {
      throw new StateError('Invalid private key');
    }

    // print('computeKey: other._publicKey = ${other._publicKey}');
    // print('computeKey: _privateKey = $_privateKey');

    // return (other._publicKey ^ _privateKey) % _group.prime;
    return other._publicKey.modPow(_privateKey, _group.prime);
  }
}

/// The Diffie-Hellman group.
class DhGroup {
  /// The Diffie-Hellman prime.
  final BigInt prime;

  /// The Diffie-Hellman generator
  final BigInt generator;

  /// Create a new [DhGroup]. Most users should prefer the use of [byGroupId]
  /// constructor which supplies [DhGroup]s defined in RFCs 2409 and 3526.
  ///
  /// WARNING: This constructor does not check if [prime] is in fact prime.
  DhGroup(this.prime, this.generator);

  /// Creates a [DhGroup] by its Id as defined in either RFC 2409 or RFC 3526.
  ///
  /// Valid [groupId]s are 1, 2 and 14.
  factory DhGroup.byGroupId(int groupId) {
    BigInt p;
    BigInt g;
    switch (groupId) {
      case 1:
        p = BigInt.parse(
            'FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD129024E088A67CC74020BBEA63B139B22514A08798E3404DDEF9519B3CD3A431B302B0A6DF25F14374FE1356D6D51C245E485B576625E7EC6F44C42E9A63A3620FFFFFFFFFFFFFFFF',
            radix: 16);
        g = BigInt.from(2);
        break;
      case 2:
        p = BigInt.parse(
            'FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD129024E088A67CC74020BBEA63B139B22514A08798E3404DDEF9519B3CD3A431B302B0A6DF25F14374FE1356D6D51C245E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7EDEE386BFB5A899FA5AE9F24117C4B1FE649286651ECE65381FFFFFFFFFFFFFFFF',
            radix: 16);
        g = BigInt.from(2);
        break;
      case 14:
        p = BigInt.parse(
            'FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD129024E088A67CC74020BBEA63B139B22514A08798E3404DDEF9519B3CD3A431B302B0A6DF25F14374FE1356D6D51C245E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7EDEE386BFB5A899FA5AE9F24117C4B1FE649286651ECE45B3DC2007CB8A163BF0598DA48361C55D39A69163FA8FD24CF5F83655D23DCA3AD961C62F356208552BB9ED529077096966D670C354E4ABC9804F1746C08CA18217C32905E462E36CE3BE39E772C180E86039B2783A2EC07A28FB5C55DF06F4C52C9DE2BCBF6955817183995497CEA956AE515D2261898FA051015728E5A8AACAA68FFFFFFFFFFFFFFFF',
            radix: 16);
        g = BigInt.from(2);
        break;
      default:
        throw new ArgumentError.value(groupId, 'Unknown groupId');
    }
    return new DhGroup(p, g);
  }

  /// Generates private and public Diffie-Hellman key value pair.
  DhKey generateKey() {
    BigInt private = randomInt(prime - BigInt.from(1)) + BigInt.from(1);
    BigInt public =
        generator.modPow(private, prime); // (generator ^ private) % prime;
    // print('generateKey private = $private');
    // print('generateKey public = $public');
    return new DhKey._(private, public, this);
  }
}

final math.Random _r = new math.Random.secure();

BigInt randomInt(BigInt max) {
  BigInt r;
  do {
    r = _randomInt(max.bitLength);
  } while (r >= max);
  return r;
}

BigInt _randomInt(int numBits) {
  List<int> bytes = _randomBytes(numBits);
  BigInt r = BigInt.from(0);
  for (final b in bytes) {
    r = (r << 8) + BigInt.from(b);
  }
  return r;
}

List<int> _randomBytes(int numBits) {
  if (numBits < 0) {
    throw new ArgumentError.value(numBits, 'numBits must be non-negative');
  }

  int numBytes = (numBits + 7) ~/ 8;
  Uint8List randomBytes = new Uint8List(numBytes);

  for (var i = 0; i < randomBytes.length; i++) {
    randomBytes[i] = _r.nextInt(255);
  }
  // Mask out any excess bits
  int excessBits = 8 * numBytes - numBits;
  randomBytes[0] &= (1 << (8 - excessBits)) - 1;

  return randomBytes;
}
