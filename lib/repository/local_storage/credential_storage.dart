import 'package:conduit/models/credentials.dart';
import 'package:conduit/repository/local_storage/base_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CredentialStorage implements BaseStorage<Credentials> {
  static const _key = 'app_creds';

  CredentialStorage(this._secureStorage);

  Credentials? _cachedCredentials;
  final FlutterSecureStorage _secureStorage;
  @override
  Future<Credentials?> read() async {
    if (_cachedCredentials != null) {
      return _cachedCredentials;
    }
    final json = await _secureStorage.read(key: _key);
    if (json == null) {
      return null;
    }
    try {
      return _cachedCredentials = Credentials.fromRawJson(json);
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(Credentials credentials) async {
    _cachedCredentials = credentials;
    return _secureStorage.write(key: _key, value: credentials.toRawJson());
  }

  @override
  Future<void> clear() {
    _cachedCredentials = null;
    return _secureStorage.delete(key: _key);
  }
}
