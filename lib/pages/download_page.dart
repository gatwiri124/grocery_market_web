import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../services/app_config.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(
            'Download Soko Fresh',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Get the app on your device',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          _buildDownloadButtons(context),
          const SizedBox(height: 48),
          _buildInstallInstructions(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildDownloadButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () => launchUrl(Uri.parse(AppConfig.instance.googlePlayUrl)),
          icon: const Icon(Icons.android),
          label: const Text('Download from Google Play'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () => launchUrl(Uri.parse(AppConfig.instance.apkUrl)),
          icon: const Icon(Icons.file_download),
          label: const Text('Download APK File'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildInstallInstructions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Install Instructions',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        _InstructionStep(
          number: '1',
          title: 'Download the App',
          description: 'Click one of the download buttons above to get the app.',
        ),
        const SizedBox(height: 16),
        _InstructionStep(
          number: '2',
          title: 'Allow Installation',
          description: 'If prompted, go to Settings > Security and enable "Install from unknown sources".',
        ),
        const SizedBox(height: 16),
        _InstructionStep(
          number: '3',
          title: 'Install the APK',
          description: 'Open the downloaded file and follow the on-screen instructions to install.',
        ),
        const SizedBox(height: 16),
        _InstructionStep(
          number: '4',
          title: 'Create Account',
          description: 'Open the app, create your account, and start shopping!',
        ),
      ],
    );
  }
}

class _InstructionStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _InstructionStep({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: AppTheme.primaryGreen,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: AppTheme.white,
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
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}