import 'package:flutter/material.dart';
import 'package:sample_book_app/l10n/app_localizations.dart';

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String? subtitle;
  final VoidCallback? onRetry;
  final String? retryButtonText;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    this.subtitle,
    this.onRetry,
    this.retryButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context).oops,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle ?? AppLocalizations.of(context).noDataFound,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(
                retryButtonText ?? AppLocalizations.of(context).tryAgain,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ],
      ),
    );
  }
}