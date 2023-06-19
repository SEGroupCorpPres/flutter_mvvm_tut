import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_tut/utils/routes/routes.dart';
import 'package:flutter_mvvm_tut/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_tut/viewmodel/auth_viewmodel.dart';
import 'package:flutter_mvvm_tut/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
    SharedPreferences.setMockInitialValues({});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
      ],
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.tertiarySystemFill,
          primaryContrastingColor: CupertinoColors.tertiarySystemBackground,
          barBackgroundColor: CupertinoColors.secondarySystemBackground,
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
          applyThemeToAll: true,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
