import 'package:flutter/material.dart';
import 'package:pseudo_medqcx/common/hive_helper.dart';
import 'package:pseudo_medqcx/common/navigation_helper.dart';
import 'package:pseudo_medqcx/dependency_injection/bloc_injection.dart';
import 'package:pseudo_medqcx/dependency_injection/repository_injection.dart';
import 'package:pseudo_medqcx/device_list/screens/device_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryInjection(
      child: BlocInjection(
        child: MaterialApp(
          title: 'Pseudo MedQCX',
          onGenerateRoute: NavigationHelper.generateRoute,
          onGenerateInitialRoutes: (String initialRouteName) {
            return [
              MaterialPageRoute(
                builder: (_) => const DeviceListScreen(),
              ),
            ];
          },
        ),
      ),
    );
  }
}
