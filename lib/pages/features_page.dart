import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../services/app_config.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(
            'App Features',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Everything you need for a seamless grocery shopping experience',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          _buildFeatureSection(
            context,
            'Browse by Category',
            'Explore fresh produce, dairy, grains, and more. Find exactly what you need with our intuitive category system.',
            Icons.category,
            AppConfig.instance.screenshots.isNotEmpty ? AppConfig.instance.screenshots[0] : 'assets/images/Screen1.png',
            isImageFirst: true,
          ),
          const SizedBox(height: 48),
          _buildFeatureSection(
            context,
            'Compare Prices',
            'Compare prices across multiple vendors to get the best deals. Save money on every purchase.',
            Icons.compare_arrows,
            AppConfig.instance.screenshots.length > 1 ? AppConfig.instance.screenshots[1] : 'assets/images/Screen2.png',
            isImageFirst: false,
          ),
          const SizedBox(height: 48),
          _buildFeatureSection(
            context,
            'Track Your Order',
            'Real-time order tracking from preparation to delivery. Know exactly when your groceries will arrive.',
            Icons.location_on,
            AppConfig.instance.screenshots.length > 2 ? AppConfig.instance.screenshots[2] : 'assets/images/Screen3.png',
            isImageFirst: true,
          ),
          const SizedBox(height: 48),
          _buildFeatureSection(
            context,
            'Secure Payments',
            'Pay securely via M-Pesa, cards, or cash on delivery. Your transactions are always safe.',
            Icons.payment,
            AppConfig.instance.screenshots.length > 3 ? AppConfig.instance.screenshots[3] : 'assets/images/Screen4.png',
            isImageFirst: false,
          ),
          const SizedBox(height: 48),
          _buildFeatureSection(
            context,
            'Order History',
            'Reorder your favorite items with one tap. Never miss your preferred products again.',
            Icons.history,
            AppConfig.instance.screenshots.length > 4 ? AppConfig.instance.screenshots[4] : 'assets/images/Screen5.png',
            isImageFirst: true,
          ),
          const SizedBox(height: 48),
          _buildDownloadCTA(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildFeatureSection(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    String imagePath, {
    required bool isImageFirst,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isImageFirst) ...[
            _buildFeatureImage(imagePath),
            const SizedBox(height: 16),
            _buildFeatureContent(context, icon, title, description),
          ] else ...[
            _buildFeatureContent(context, icon, title, description),
            const SizedBox(height: 16),
            _buildFeatureImage(imagePath),
          ],
        ],
      );
    }

    if (isImageFirst) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildFeatureImage(imagePath)),
          const SizedBox(width: 24),
          Expanded(child: _buildFeatureContent(context, icon, title, description)),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildFeatureContent(context, icon, title, description)),
        const SizedBox(width: 24),
        Expanded(child: _buildFeatureImage(imagePath)),
      ],
    );
  }

  Widget _buildFeatureImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.secondaryGreen.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                AppConfig.instance.logo,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeatureContent(BuildContext context, IconData icon, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 32, color: AppTheme.primaryGreen),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildDownloadCTA(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Download Soko Fresh Today',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.white,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StoreButton(
                icon: Icons.phone_android,
                label: 'Google Play',
                onTap: () => launchUrl(Uri.parse(AppConfig.instance.googlePlayUrl)),
              ),
              const SizedBox(width: 16),
              _StoreButton(
                icon: Icons.apple,
                label: 'App Store',
                onTap: () => launchUrl(Uri.parse(AppConfig.instance.appStoreUrl)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StoreButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _StoreButton({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.darkText),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.darkText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}