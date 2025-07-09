import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/auth_cubit.dart';
import 'repository/firebase_config.dart';
import 'utils/routers.dart';
import 'view_model/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, // iOS specific
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated = false;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          MediaQuery.of(context).size.width <= 700
              ? Size(375, 848)
              : Size(1440, 1024),
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthCubit())],
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            //context.read<AuthCubit>().trackDeviceSize(context);
            var router =
                MediaQuery.of(context).size.width <= 700
                    ? BRRouter().unAuthenticatedRouterMobile
                    : BRRouter().unAuthenticatedRouter;

            if (state is AuthenticatedState) {
              router =
                  state.userType == UserType.user
                      ? MediaQuery.of(context).size.width <= 700
                          ? BRRouter().authenticatedUserRouterMobile
                          : BRRouter().authenticatedUserRouter
                      : MediaQuery.of(context).size.width <= 700
                      ? BRRouter().authenticatedTravellerRouterMobile
                      : BRRouter().authenticatedTravellerRouter;
            }

            return MaterialApp.router(
              title: 'Zent',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                pageTransitionsTheme: PageTransitionsTheme(
                  builders: {
                    // No animations for every OS if the app running on the web
                    for (final platform in TargetPlatform.values)
                      platform: const NoTransitionsBuilder(),
                  },
                ),
              ),
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    // only return the child without warping it with animations
    return child!;
  }
}
