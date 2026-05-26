import 'package:go_router/go_router.dart';
import '../shared/main_layout.dart';
import '../pages/home_page.dart';
import '../pages/privacy_page.dart';
import '../pages/terms_page.dart';
import '../pages/contact_page.dart';
import '../pages/download_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: '/privacy',
          name: 'privacy',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PrivacyPage(),
          ),
        ),
        GoRoute(
          path: '/terms',
          name: 'terms',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TermsPage(),
          ),
        ),
        GoRoute(
          path: '/contact',
          name: 'contact',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ContactPage(),
          ),
        ),
        GoRoute(
          path: '/download',
          name: 'download',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DownloadPage(),
          ),
        ),
      ],
    ),
  ],
);