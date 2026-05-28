import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._();
  static AppConfig get instance => _instance;
  AppConfig._();

  Map<String, dynamic>? _data;

  Future<void> load() async {
    final json = await rootBundle.loadString('assets/config/app_config.json');
    _data = jsonDecode(json) as Map<String, dynamic>;
  }

  String get logo => _data?['logo'] as String? ?? 'assets/images/logo.png';
  String get heroPromo => _data?['heroPromo'] as String? ?? 'assets/images/promo1.png';
  List<String> get screenshots => (_data?['screenshots'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [];

  String get googlePlayUrl => _data?['downloads']?['googlePlay'] as String? ?? '';
  String get apkUrl => _resolveUrl(_data?['downloads']?['apk'] as String? ?? '');
  String get appStoreUrl => _data?['downloads']?['appStore'] as String? ?? '';

  String _resolveUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri != null && !uri.hasScheme && uri.path.isNotEmpty) {
      return Uri.base.resolve(url).toString();
    }
    return url;
  }
}
