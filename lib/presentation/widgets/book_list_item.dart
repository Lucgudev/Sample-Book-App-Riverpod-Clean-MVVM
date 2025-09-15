import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/core/router/app_navigator_impl.dart';
import 'package:sample_book_app/core/router/routes.dart';
import 'package:sample_book_app/l10n/app_localizations.dart';

class BookListItem extends ConsumerWidget {
  final BookEntity book;
  final bool showTopicInfo;

  const BookListItem({
    super.key,
    required this.book,
    this.showTopicInfo = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap:
            () => ref
                .read(appNavigatorProvider)
                .pushNamedWithResult(
                  Routes.bookScreen,
                  arguments: {'bookId': book.id, 'bookData': book},
                ),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              _buildBookCover(context),
              const SizedBox(width: 16),
              _buildBookInfo(context),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookCover(BuildContext context) {
    return Container(
      width: 60,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child:
          book.formats.containsKey('image/jpeg')
              ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  book.formats['image/jpeg']!,
                  width: 60,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.book,
                      size: 32,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Icon(
                      Icons.book,
                      size: 32,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    );
                  },
                ),
              )
              : Icon(
                Icons.book,
                size: 32,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
    );
  }

  Widget _buildBookInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            book.title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700, // Bold for emphasis
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            book.authors.isNotEmpty
                ? book.authors.map((author) => author.name).join(', ')
                : AppLocalizations.of(context).unknownAuthor,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showTopicInfo &&
              (book.subjects.isNotEmpty || book.bookshelves.isNotEmpty)) ...[
            const SizedBox(height: 4),
            Text(
              [...book.subjects, ...book.bookshelves].take(2).join(', '),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
