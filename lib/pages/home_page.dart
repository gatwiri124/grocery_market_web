import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../services/app_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            const _HeroSection(),
            const SizedBox(height: 48),
            const _TrustStrip(),
            const SizedBox(height: 64),
            const _ProblemSection(),
            const SizedBox(height: 64),
            const _SolutionSection(),
            const SizedBox(height: 64),
            const _HowItWorksSection(),
            const SizedBox(height: 64),
            const _FeatureHighlights(),
            const SizedBox(height: 64),
            const _AppPreviewSection(),
            const SizedBox(height: 64),
            const _FinalCTASection(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppConfig.instance.heroPromo,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                  child: Center(
                    child: Image.asset(
                      AppConfig.instance.logo,
                      width: 80,
                      height: 80,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.4),
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                isMobile ? 24 : 48,
                isMobile ? 16 : 32,
                isMobile ? 24 : 48,
                isMobile ? 24 : 48,
              ),
              child: Column(
                crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    'Fresh Grocees',
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Order fresh food from local markets and get it delivered to your doorstep via M-Pesa.',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      color: Colors.white.withValues(alpha: 0.9),
                      height: 1.5,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                    children: [
                      _StoreButton(
                        icon: Icons.play_arrow_rounded,
                        label: 'Google Play',
                        onTap: () => launchUrl(Uri.parse(AppConfig.instance.googlePlayUrl)),
                      ),
                      _StoreButton(
                        icon: Icons.download_rounded,
                        label: 'Download APK',
                        isPrimary: false,
                        onTap: () => launchUrl(Uri.parse(AppConfig.instance.apkUrl)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoreButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPrimary;
  final VoidCallback? onTap;

  const _StoreButton({
    required this.icon,
    required this.label,
    this.isPrimary = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: isPrimary ? AppTheme.primaryGreen : AppTheme.white,
          borderRadius: BorderRadius.circular(12),
          border: isPrimary ? null : Border.all(color: AppTheme.primaryGreen, width: 2),
          boxShadow: isPrimary ? [
            BoxShadow(
              color: AppTheme.primaryGreen.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ] : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isPrimary ? AppTheme.white : AppTheme.primaryGreen, size: 24),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isPrimary ? AppTheme.white : AppTheme.primaryGreen,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _FullScreenImageViewer extends StatelessWidget {
  final String imagePath;

  const _FullScreenImageViewer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _TrustStrip extends StatelessWidget {
  const _TrustStrip();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 480;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: isMobile
          ? const Wrap(
              spacing: 8,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _TrustItem(icon: Icons.verified_user, text: 'Verified local vendors'),
                _TrustItem(icon: Icons.account_balance_wallet, text: 'M-Pesa supported'),
                _TrustItem(icon: Icons.local_shipping, text: 'Fast delivery'),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _TrustItem(icon: Icons.verified_user, text: 'Verified local vendors'),
                _TrustItem(icon: Icons.account_balance_wallet, text: 'M-Pesa supported'),
                _TrustItem(icon: Icons.local_shipping, text: 'Fast delivery in Nairobi & beyond'),
              ],
            ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TrustItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppTheme.primaryGreen, size: 20),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.lightText,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ProblemSection extends StatelessWidget {
  const _ProblemSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      children: [
        Text(
          'The Problem',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        const SizedBox(height: 24),
        if (isMobile)
          Column(
            children: [
              _buildDescription(),
              const SizedBox(height: 24),
              _buildProblemImage(),
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildDescription()),
              const SizedBox(width: 48),
              Expanded(child: _buildProblemImage()),
            ],
          ),
      ],
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Long queues at the market, unreliable delivery times, and difficulty finding fresh produce when you need it. Traditional grocery shopping takes valuable time out of your busy day.',
            style: TextStyle(fontSize: 16, color: AppTheme.darkText, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildProblemImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        AppConfig.instance.problem,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: AppTheme.lightGreen.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Icon(Icons.error_outline, size: 60, color: Colors.white54),
            ),
          );
        },
      ),
    );
  }
}

class _SolutionSection extends StatelessWidget {
  const _SolutionSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      children: [
        Text(
          'The Solution',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        const SizedBox(height: 24),
        if (isMobile)
          Column(
            children: [
              _buildSolutionCard(AppConfig.instance.solution1, 'For Vendors & Sellers'),
              const SizedBox(height: 16),
              _buildSolutionCard(AppConfig.instance.solution2, 'For Buyers'),
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildSolutionCard(AppConfig.instance.solution1, 'For Vendors & Sellers')),
              const SizedBox(width: 24),
              Expanded(child: _buildSolutionCard(AppConfig.instance.solution2, 'For Buyers')),
            ],
          ),
      ],
    );
  }

  Widget _buildSolutionCard(String imagePath, String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    color: AppTheme.lightGreen.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.white54),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.darkText,
            ),
          ),
        ],
      ),
    );
  }
}

class _HowItWorksSection extends StatelessWidget {
  const _HowItWorksSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      children: [
        Text(
          'How It Works',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        const SizedBox(height: 32),
        isMobile
            ? Column(children: _buildSteps())
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildSteps().map((w) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: w))).toList(),
              ),
      ],
    );
  }

  static List<Widget> _buildSteps() {
    return [
      const _StepCard(
        number: '1',
        icon: Icons.search,
        title: 'Browse groceries',
        description: 'Explore fresh produce, dairy, grains, and more from local vendors.',
      ),
      const _StepCard(
        number: '2',
        icon: Icons.shopping_cart,
        title: 'Order via app',
        description: 'Add items to cart and place your order in just a few taps.',
      ),
      const _StepCard(
        number: '3',
        icon: Icons.payment,
        title: 'Pay with M-Pesa',
        description: 'Pay securely via M-Pesa and get fast delivery to your door.',
      ),
    ];
  }
}

class _StepCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;

  const _StepCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryGreen, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.lightText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureHighlights extends StatelessWidget {
  const _FeatureHighlights();

  @override
  Widget build(BuildContext context) {
    final features = [
      {'icon': Icons.eco, 'title': 'Fresh produce daily', 'desc': 'Sourced directly from local farms'},
      {'icon': Icons.attach_money, 'title': 'Affordable prices', 'desc': 'Compare and save on every order'},
      {'icon': Icons.store, 'title': 'Local Kenyan sellers', 'desc': 'Support your community'},
      {'icon': Icons.location_on, 'title': 'Fast delivery tracking', 'desc': 'Know exactly when it arrives'},
    ];

    return Column(
      children: [
        Text(
          'Why Choose Fresh Grocee?',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: features.map((f) => _FeatureCard(
            icon: f['icon'] as IconData,
            title: f['title'] as String,
            description: f['desc'] as String,
          )).toList(),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.white, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.lightText,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppPreviewSection extends StatelessWidget {
  const _AppPreviewSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    final images = AppConfig.instance.screenshots;

    return Column(
      children: [
        Text(
          'App Preview',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkText,
          ),
        ),
        const SizedBox(height: 24),
        isMobile
            ? Column(
                children: images.map((img) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _AppScreenshot(imagePath: img),
                )).toList(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: images.map((img) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: _AppScreenshot(imagePath: img, width: 180),
                  )).toList(),
                ),
              ),
      ],
    );
  }
}

class _AppScreenshot extends StatelessWidget {
  final String imagePath;
  final double? width;

  const _AppScreenshot({required this.imagePath, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFullScreenImage(context, imagePath),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            height: 300,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                width: width,
                color: AppTheme.lightGreen.withValues(alpha: 0.3),
                child: const Icon(Icons.image, color: Colors.white54, size: 50),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imagePath) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _FullScreenImageViewer(imagePath: imagePath),
      ),
    );
  }
}

class _FinalCTASection extends StatelessWidget {
  const _FinalCTASection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primaryGreen, AppTheme.darkGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withValues(alpha: 0.4),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Start shopping fresh today',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Download Fresh Grocee and get fresh groceries delivered to your door',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _StoreButton(
                icon: Icons.play_arrow_rounded,
                label: 'Google Play',
                onTap: () => launchUrl(Uri.parse(AppConfig.instance.googlePlayUrl)),
              ),
              _StoreButton(
                icon: Icons.download_rounded,
                label: 'Download APK',
                isPrimary: false,
                onTap: () => launchUrl(Uri.parse(AppConfig.instance.apkUrl)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
