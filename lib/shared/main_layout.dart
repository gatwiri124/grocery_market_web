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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      drawer: isMobile ? _Drawer(currentRoute: currentRoute) : null,
      body: Column(
        children: [
          _Header(currentRoute: currentRoute, isMobile: isMobile),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
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

class _Header extends StatelessWidget {
  final String currentRoute;
  final bool isMobile;

  const _Header({required this.currentRoute, required this.isMobile});

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: isMobile ? _buildMobileHeader(context) : _buildDesktopHeader(context),
        ),
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Logo(),
        IconButton(
          icon: const Icon(Icons.menu, color: AppTheme.darkText),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ],
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
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

class _Drawer extends StatelessWidget {
  final String currentRoute;

  const _Drawer({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(color: AppTheme.primaryGreen),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 24,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            child: Row(
              children: [
                Image.asset(
                  AppConfig.instance.logo,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.shop, color: Colors.white, size: 24),
                    );
                  },
                ),
                const SizedBox(width: 12),
                const Text(
                  'Fresh Grocee',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _DrawerItem(
            icon: Icons.home,
            label: 'Home',
            route: '/',
            isActive: currentRoute == '/',
          ),
          _DrawerItem(
            icon: Icons.download,
            label: 'Download',
            route: '/download',
            isActive: currentRoute == '/download',
          ),
          _DrawerItem(
            icon: Icons.privacy_tip,
            label: 'Privacy Policy',
            route: '/privacy',
            isActive: currentRoute == '/privacy',
          ),
          _DrawerItem(
            icon: Icons.description,
            label: 'Terms',
            route: '/terms',
            isActive: currentRoute == '/terms',
          ),
          _DrawerItem(
            icon: Icons.contact_mail,
            label: 'Contact',
            route: '/contact',
            isActive: currentRoute == '/contact',
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final bool isActive;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isActive ? AppTheme.primaryGreen : AppTheme.lightText),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? AppTheme.primaryGreen : AppTheme.darkText,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          fontSize: 16,
        ),
      ),
      selected: isActive,
      selectedTileColor: AppTheme.primaryGreen.withValues(alpha: 0.05),
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
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
              fontSize: 20,
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: AppTheme.darkText,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 12,
              children: [
                _FooterLink(label: 'Home', route: '/'),
                _FooterLink(label: 'Download', route: '/download'),
                _FooterLink(label: 'Privacy Policy', route: '/privacy'),
                _FooterLink(label: 'Terms', route: '/terms'),
                _FooterLink(label: 'Contact', route: '/contact'),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '© 2024 Fresh Grocee. All rights reserved.',
              style: TextStyle(color: Colors.white54, fontSize: 13),
              textAlign: TextAlign.center,
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
    return GestureDetector(
      onTap: () => context.go(route),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white54, fontSize: 13),
      ),
    );
  }
}
