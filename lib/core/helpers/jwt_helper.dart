import 'dart:convert';

class JwtHelper {
  static bool isExpired(
    String token, {
    Duration clockSkew = const Duration(seconds: 30),
  }) {
    if (token.isEmpty) {
      return true;
    }

    final parts = token.split('.');
    if (parts.length != 3) {
      return true;
    }

    final payload = _decodeBase64Url(parts[1]);
    if (payload == null) {
      return true;
    }

    final exp = _parseExpiry(payload['exp']);
    if (exp == null) {
      return true;
    }

    final expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000, isUtc: true);
    final now = DateTime.now().toUtc().add(clockSkew);
    return now.isAfter(expiry);
  }

  static int? _parseExpiry(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is double) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  static Map<String, dynamic>? _decodeBase64Url(String input) {
    try {
      final normalized = base64Url.normalize(input);
      final decoded = utf8.decode(base64Url.decode(normalized));
      final jsonMap = jsonDecode(decoded);
      if (jsonMap is Map<String, dynamic>) {
        return jsonMap;
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
