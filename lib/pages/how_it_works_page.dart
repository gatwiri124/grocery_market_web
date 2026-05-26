import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/app_config.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(
            'How It Works',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Get fresh groceries in 4 simple steps',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          _buildSteps(context),
          const SizedBox(height: 48),
          _buildImageSection(context),
          const SizedBox(height: 48),
          _buildFAQSection(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSteps(BuildContext context) {
    final steps = [
      _StepData(
        number: '1',
        title: 'Browse & Select',
        description:
            'Open the app and browse through categories or search for specific items. Add your desired products to the cart.',
        icon: Icons.search,
      ),
      _StepData(
        number: '2',
        title: 'Checkout',
        description:
            'Review your cart, apply any available discounts, and choose your preferred payment method (M-Pesa, card, or cash).',
        icon: Icons.shopping_cart,
      ),
      _StepData(
        number: '3',
        title: 'Order Confirmation',
        description:
            'Receive instant confirmation with estimated delivery time. Track your order status in real-time.',
        icon: Icons.check_circle,
      ),
      _StepData(
        number: '4',
        title: 'Delivery',
        description:
            'Your fresh groceries are delivered to your doorstep. Enjoy quality produce from local markets!',
        icon: Icons.local_shipping,
      ),
    ];

    return Column(
      children: steps.map((step) => _StepCard(step: step)).toList(),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'Shop from Local Markets',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        Image.asset(
          AppConfig.instance.heroPromo,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.store,
                  size: 80,
                  color: Colors.white54,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        const Text(
          'We partner with local markets and farmers across Kenya to bring you the freshest produce directly to your home.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.lightText,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildFAQSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'Frequently Asked Questions',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        _FAQItem(
          question: 'What areas do you deliver to?',
          answer:
              'We currently deliver to Nairobi, Mombasa, Kisumu, and surrounding areas. Check our app for delivery availability in your area.',
        ),
        _FAQItem(
          question: 'How long does delivery take?',
          answer:
              'Standard delivery takes 2-4 hours. Express delivery is available for orders placed before 10 AM.',
        ),
        _FAQItem(
          question: 'What is your return policy?',
          answer:
              'We offer a 100% satisfaction guarantee. If you\'re not happy with the quality of your produce, contact us within 24 hours for a refund or replacement.',
        ),
        _FAQItem(
          question: 'How can I pay?',
          answer:
              'We accept M-Pesa, credit/debit cards, and cash on delivery. All transactions are secure and encrypted.',
        ),
      ],
    );
  }
}

class _StepData {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  _StepData({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });
}

class _StepCard extends StatelessWidget {
  final _StepData step;

  const _StepCard({required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: AppTheme.primaryGreen,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step.number,
                style: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      step.icon,
                      color: AppTheme.primaryGreen,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      step.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  step.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQItem({required this.question, required this.answer});

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.darkText,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppTheme.lightText,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.answer,
                style: const TextStyle(color: AppTheme.lightText),
              ),
            ),
        ],
      ),
    );
  }
}