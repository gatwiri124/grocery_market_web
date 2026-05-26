import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../services/app_config.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: Column(
        children: [
          _StickyHeader(currentRoute: currentRoute),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: child,
              ),
            ),
          ),
          const _Footer(),
        ],
      ),
    );
  }
}

class _StickyHeader extends StatelessWidget {
  final String currentRoute;

  const _StickyHeader({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: _DesktopHeader(currentRoute: currentRoute),
        ),
      ),
    );
  }
}

class _DesktopHeader extends StatelessWidget {
  final String currentRoute;

  const _DesktopHeader({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Logo(),
          Row(
            children: [
              _NavLink(label: 'Home', route: '/', isActive: currentRoute == '/'),
              _NavLink(label: 'Download', route: '/download', isActive: currentRoute == '/download'),
              _NavLink(label: 'Privacy Policy', route: '/privacy', isActive: currentRoute == '/privacy'),
              _NavLink(label: 'Terms', route: '/terms', isActive: currentRoute == '/terms'),
              _NavLink(label: 'Contact', route: '/contact', isActive: currentRoute == '/contact'),
            ],
          ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/'),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AppConfig.instance.logo,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.shop,
                    color: AppTheme.white,
                    size: 24,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Fresh Grocee',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkText,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final String route;
  final bool isActive;

  const _NavLink({required this.label, required this.route, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            color: isActive ? AppTheme.primaryGreen : AppTheme.lightText,
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        color: AppTheme.darkText,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _FooterLink(label: 'Home', route: '/'),
                _FooterLink(label: 'Download', route: '/download'),
                _FooterLink(label: 'Privacy Policy', route: '/privacy'),
                _FooterLink(label: 'Terms', route: '/terms'),
                _FooterLink(label: 'Contact', route: '/contact'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '© 2024 Fresh Grocee. All rights reserved.',
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final String route;

  const _FooterLink({required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 14),
        ),
      ),
    );
  }
}