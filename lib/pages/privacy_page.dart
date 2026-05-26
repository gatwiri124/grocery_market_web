import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Last updated: 2024',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.lightText,
              ),
            ),
            const SizedBox(height: 32),
            _PolicySection(
              title: '1. Information We Collect',
              content: 'We collect information you provide when creating an account, placing orders, and contacting us. This includes your name, phone number, email address, delivery location, and payment information. We also collect usage data to improve our services.',
            ),
            _PolicySection(
              title: '2. How We Use Your Information',
              content: 'Your information is used to provide and improve our services, process orders and payments, communicate with you about your deliveries, and send promotional materials with your consent. We may also use aggregated data for analytics purposes.',
            ),
            _PolicySection(
              title: '3. Data Storage and Security',
              content: 'We implement appropriate security measures to protect your personal data. Your information is stored on secure servers with encryption. We follow industry best practices to ensure your data remains safe.',
            ),
            _PolicySection(
              title: '4. Sharing Your Information',
              content: 'We do not sell your personal information. We may share your data with delivery partners to fulfill your orders, payment processors for transactions, and service providers who assist our operations. All third parties are bound by confidentiality obligations.',
            ),
            _PolicySection(
              title: '5. Cookies and Tracking',
              content: 'Our app uses cookies and similar tracking technologies to enhance user experience. You can manage cookie preferences through your device settings, though disabling cookies may affect some app features.',
            ),
            _PolicySection(
              title: '6. Your Rights',
              content: 'You have the right to access, update, or delete your personal information. You can manage your account settings or contact us to exercise these rights. We will respond to your requests within a reasonable timeframe.',
            ),
            _PolicySection(
              title: "7. Children's Privacy",
              content: "Our services are not intended for children under 18 years of age. We do not knowingly collect personal information from children. If we become aware of any such data, we will delete it immediately.",
            ),
            _PolicySection(
              title: '8. Changes to This Policy',
              content: 'We may update this privacy policy from time to time. We will notify you of any material changes by posting the new policy on this page and updating the "Last updated" date.',
            ),
            _PolicySection(
              title: '9. Contact Us',
              content: 'If you have any questions about this Privacy Policy or need to exercise your rights, please contact us at support@freshgrocee.co.ke',
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _PolicySection extends StatelessWidget {
  final String title;
  final String content;

  const _PolicySection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            content,
            style: const TextStyle(
              fontSize: 15,
              color: AppTheme.lightText,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}