import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:just_audio_background/just_audio_background.dart';

import 'package:univalle_estereo/providers/providers.dart';
import 'package:univalle_estereo/themes/app_theme.dart';
import 'package:univalle_estereo/routers/app_router.dart';

void main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => NoticiasProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => BannerProvider(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => RadioOnlineProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CheckConectionProvider(),
        lazy: false,
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Univalle Estéreo',
      initialRoute: AppRouter.initialRouter,
      routes: AppRouter.routes,
      theme: AppTheme.themeLight,
    );
  }
}
