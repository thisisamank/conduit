import 'dart:developer' as developer;

import 'package:hooks_riverpod/hooks_riverpod.dart';

void devLog(String message, {String name = ""}) {
  developer.log(message, name: name);
}

class ProviderStateObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    devLog('''
{
  "provider": "${provider.name ?? provider.runtimeType} ${provider.from}",
  "newValue": "$newValue"
}
''');
  }
}
