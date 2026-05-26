import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
              'Terms of Use',
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
            _TermsSection(
              title: '1. Acceptance of Terms',
              content: 'By downloading or using Fresh Grocee, you agree to be bound by these Terms of Use. If you do not agree to these terms, please do not use our app or services.',
            ),
            _TermsSection(
              title: '2. Use License',
              content: 'Permission is granted to use Fresh Grocee for personal, non-commercial use only. This is a license, not a transfer of title. You may not modify, distribute, or sell the app.',
            ),
            _TermsSection(
              title: '3. User Accounts',
              content: 'You are responsible for maintaining the confidentiality of your account credentials. You agree to accept responsibility for all activities that occur under your account. Notify us immediately of any unauthorized use.',
            ),
            _TermsSection(
              title: '4. Ordering and Payments',
              content: 'All orders are subject to availability. Prices are subject to change without notice. Payment can be made via M-Pesa, credit/debit cards, or cash on delivery. By placing an order, you authorize us to charge the specified amount.',
            ),
            _TermsSection(
              title: '5. Delivery',
              content: 'Delivery times are estimates and not guaranteed. We strive to deliver within stated timeframes but cannot be held responsible for delays due to traffic, weather, or other circumstances beyond our control. Delivery areas subject to availability.',
            ),
            _TermsSection(
              title: '6. Returns and Refunds',
              content: 'We offer a satisfaction guarantee on all products. If you are not happy with the quality of your order, contact us within 24 hours for a refund or replacement. Perishable items may have different return policies.',
            ),
            _TermsSection(
              title: '7. Prohibited Use',
              content: 'You agree not to use the app for any unlawful purpose, to attempt to gain unauthorized access to our systems, to upload viruses or malicious code, or to interfere with the proper operation of the service.',
            ),
            _TermsSection(
              title: '8. Intellectual Property',
              content: 'All content, logos, and materials in Fresh Grocee are owned by us or our licensors. You may not copy, reproduce, or distribute any part of the app without our written permission.',
            ),
            _TermsSection(
              title: '9. Limitation of Liability',
              content: 'Fresh Grocee shall not be liable for any indirect, incidental, or consequential damages arising from the use of the app. Our total liability shall not exceed the amount paid for the specific order in question.',
            ),
            _TermsSection(
              title: '10. Changes to Terms',
              content: 'We reserve the right to modify these terms at any time. Your continued use of the app after changes constitutes acceptance of the new terms. We will notify users of material changes.',
            ),
            _TermsSection(
              title: '11. Governing Law',
              content: 'These terms shall be governed by and construed in accordance with the laws of Kenya. Any disputes arising from these terms shall be subject to the exclusive jurisdiction of Kenyan courts.',
            ),
            _TermsSection(
              title: '12. Contact',
              content: 'If you have any questions about these Terms of Use, please contact us at support@freshgrocee.co.ke',
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _TermsSection extends StatelessWidget {
  final String title;
  final String content;

  const _TermsSection({required this.title, required this.content});

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