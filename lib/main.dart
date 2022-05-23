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

class AppWidget extends ConsumerStatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
