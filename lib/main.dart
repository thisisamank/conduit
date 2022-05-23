import 'package:conduit/app_widget.dart';
import 'package:conduit/di/dependency_manager.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  setUpDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(child: AppWidget()),
  );
}
