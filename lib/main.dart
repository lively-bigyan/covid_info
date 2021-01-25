import 'package:corona_nepal/locators.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UI/theme.dart';
import 'initScreen.dart';
import 'providers/theme_notifier.dart';

final _assetsToWarmup = [
  AssetFlare(bundle: rootBundle, name: 'assets/Liquid.flr'),
  AssetFlare(bundle: rootBundle, name: 'assets/loading.flr')
];

Future<void> warmupFlare() async {
  for (final asset in _assetsToWarmup) {
    await cachedActor(asset);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? false;
    FlareCache.doesPrune = false;
    warmupFlare().then((_) {
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeNotifier>(
            create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
          ),
        ],
        child: MyApp(),
      ));
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          title: 'Corona Nepal',
          theme: themeNotifier.getTheme,
          home: InitScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
