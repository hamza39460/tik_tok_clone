import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/globals/app_constants.dart';
import 'package:tiktok_clone/globals/global_providers.dart';
import 'package:tiktok_clone/globals/utils.dart';
import 'package:tiktok_clone/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      ref.read(timerProvider.notifier).state++;
    });
    return MaterialApp.router(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SFProRounded'),
      routerConfig: AppRouter.router,
      builder: (context, child) {
        Utils.screenHeight = MediaQuery.of(context).size.height;
        Utils.screenWidth = MediaQuery.of(context).size.width;
        double designHeight = 812;
        double designWidth =
            Utils.screenHeight / Utils.screenWidth < 1.6 ? 480.0 : 375.0;
        final designSize = Size(designWidth, designHeight);
        return ScreenUtilInit(
          designSize: designSize,
          builder: (context, _) {
            return child!;
          },
        );
      },
    );
  }
}
