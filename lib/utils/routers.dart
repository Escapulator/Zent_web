import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zent_web/view_mobile/mobile_waitlist.dart';

import '../view_mobile/home.dart';
import '../view_model/login_cubit.dart';
import '../views/home.dart';

class BRRouter {
  final GoRouter _unAuthenticatedRouter = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => LoginCubit(),
              child: Home(),
            ),
          );
        },
      ),
      // GoRoute(
      //   path: '/',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (context) => LoginCubit(),
      //         child: LoginView(),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/login',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (context) => LoginCubit(),
      //         child: LoginView(),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/request-demo',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //         key: state.pageKey, child: RequestDemoPage());
      //   },
      // ),
      // GoRoute(
      //   path: '/getting-started',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //         key: state.pageKey, child: GettingStartedPage());
      //   },
      // ),
    ],
  );

  final GoRouter _authenticatedTravellerRouter = GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.DASHBOARD),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/test',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(key: state.pageKey, child: TestPage());
      //   },
      // ),
      // GoRoute(
      //   path: '/transactions',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => FiboRootCubit(
      //               FibonacciSelectedSection.TRANSACTIONS,
      //               transactionIndex: null,
      //             ),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/transactions/:tIndex',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => FiboRootCubit(
      //               FibonacciSelectedSection.TRANSACTIONS,
      //               transactionIndex: state.pathParameters["tIndex"],
      //             ),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/blacklist',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.BLACKLIST),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/settings',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.SETTINGS),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/rules',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.RULES),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/rules/:tIndex',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => FiboRootCubit(
      //               FibonacciSelectedSection.RULES,
      //               ruleIndex: state.pathParameters["tIndex"],
      //             ),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
    ],
  );

  final GoRouter _authenticatedUserRouter = GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => EuclidRootCubit(EuclidSelectedSection.DASHBOARD),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/test',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(key: state.pageKey, child: TestPage());
      //   },
      // ),
      // GoRoute(
      //   path: '/portfolio',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => EuclidRootCubit(
      //               EuclidSelectedSection.PORTFOLIO,
      //               transactionIndex: null,
      //             ),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/risk',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => EuclidRootCubit(
      //               EuclidSelectedSection.RISK,
      //               transactionIndex: state.pathParameters["tIndex"],
      //             ),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/risk',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => EuclidRootCubit(EuclidSelectedSection.RISK),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/settings',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => EuclidRootCubit(EuclidSelectedSection.SETTINGS),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/rules',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.RULES),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
    ],
  );

  final GoRouter _unAuthenticatedRouterMobile = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => LoginCubit(),
              child: HomeMobile(),
            ),
          );
        },
      ),
      GoRoute(
        path: '/Waitlist',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => LoginCubit(),
              child: MobileWaitlist(),
            ),
          );
        },
      ),
      // GoRoute(
      //   path: '/',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (context) => LoginCubit(),
      //         child: LoginView(),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/login',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (context) => LoginCubit(),
      //         child: LoginView(),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/request-demo',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //         key: state.pageKey, child: RequestDemoPage());
      //   },
      // ),
      // GoRoute(
      //   path: '/getting-started',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //         key: state.pageKey, child: GettingStartedPage());
      //   },
      // ),
    ],
  );

  final GoRouter _authenticatedTravellerRouterMobile = GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.DASHBOARD),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/test',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(key: state.pageKey, child: TestPage());
      //   },
      // ),
      // GoRoute(
      //   path: '/transactions',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => FiboRootCubit(
      //               FibonacciSelectedSection.TRANSACTIONS,
      //               transactionIndex: null,
      //             ),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/transactions/:tIndex',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => FiboRootCubit(
      //               FibonacciSelectedSection.TRANSACTIONS,
      //               transactionIndex: state.pathParameters["tIndex"],
      //             ),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/blacklist',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.BLACKLIST),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/settings',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.SETTINGS),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/rules',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.RULES),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/rules/:tIndex',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => FiboRootCubit(
      //               FibonacciSelectedSection.RULES,
      //               ruleIndex: state.pathParameters["tIndex"],
      //             ),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
    ],
  );

  final GoRouter _authenticatedUserRouterMobile = GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => EuclidRootCubit(EuclidSelectedSection.DASHBOARD),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/test',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(key: state.pageKey, child: TestPage());
      //   },
      // ),
      // GoRoute(
      //   path: '/portfolio',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => EuclidRootCubit(
      //               EuclidSelectedSection.PORTFOLIO,
      //               transactionIndex: null,
      //             ),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/risk',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         lazy: false,
      //         create:
      //             (_) => EuclidRootCubit(
      //               EuclidSelectedSection.RISK,
      //               transactionIndex: state.pathParameters["tIndex"],
      //             ),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/risk',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => EuclidRootCubit(EuclidSelectedSection.RISK),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/settings',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => EuclidRootCubit(EuclidSelectedSection.SETTINGS),
      //         child: EuclidRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/rules',
      //   pageBuilder: (BuildContext context, GoRouterState state) {
      //     return NoTransitionPage<void>(
      //       key: state.pageKey,
      //       child: BlocProvider(
      //         create: (_) => FiboRootCubit(FibonacciSelectedSection.RULES),
      //         child: FiboRootPage(key: state.pageKey),
      //       ),
      //     );
      //   },
      // ),
    ],
  );

  GoRouter get authenticatedUserRouter {
    return _authenticatedUserRouter;
  }

  GoRouter get authenticatedTravellerRouter {
    return _authenticatedTravellerRouter;
  }

  GoRouter get unAuthenticatedRouter {
    return _unAuthenticatedRouter;
  }

  GoRouter get authenticatedUserRouterMobile {
    return _authenticatedUserRouterMobile;
  }

  GoRouter get authenticatedTravellerRouterMobile {
    return _authenticatedTravellerRouterMobile;
  }

  GoRouter get unAuthenticatedRouterMobile {
    return _unAuthenticatedRouterMobile;
  }
}
