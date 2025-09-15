import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/core/services/url_launcher_service.dart';
import 'book_detail_view_model.dart';

class BookDetailScreen extends ConsumerStatefulWidget {
  final int bookId;

  const BookDetailScreen({super.key, required this.bookId});

  @override
  ConsumerState<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends ConsumerState<BookDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(bookDetailViewModelProvider.notifier)
          .fetchBookDetail(widget.bookId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookDetailViewModelProvider);
    final theme = Theme.of(context);

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Book Details'), centerTitle: true),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Book Details'), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to load book details',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  state.error!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(bookDetailViewModelProvider.notifier)
                      .fetchBookDetail(widget.bookId);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final book = state.book;
    if (book == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Book Details'), centerTitle: true),
        body: const Center(child: Text('No book data available')),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, book),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBookInfo(context, book),
                  const SizedBox(height: 24),
                  _buildSummary(context, book),
                  const SizedBox(height: 24),
                  _buildAuthors(context, book),
                  const SizedBox(height: 24),
                  _buildSubjects(context, book),
                  const SizedBox(height: 24),
                  _buildBookshelves(context, book),
                  const SizedBox(height: 24),
                  _buildMetadata(context, book),
                  const SizedBox(height: 24),
                  _buildDownloadFormats(context, book),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, BookEntity book) {
    final theme = Theme.of(context);

    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          book.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(0, 1),
                blurRadius: 3,
                color: Colors.black45,
              ),
            ],
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primaryContainer,
              ],
            ),
          ),
          child: Center(child: _buildBookCover(book, theme)),
        ),
      ),
    );
  }

  Widget _buildBookInfo(BuildContext context, BookEntity book) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Book Information',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoRow('ID', book.id.toString()),
            _buildInfoRow('Language', book.languages.join(', ').toUpperCase()),
            _buildInfoRow('Media Type', book.mediaType),
            _buildInfoRow('Copyright', book.copyright ? 'Yes' : 'No'),
            _buildInfoRow(
              'Downloads',
              '${book.downloadCount.toString()} times',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
          Expanded(child: Text(value, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildSummary(BuildContext context, BookEntity book) {
    final theme = Theme.of(context);

    if (book.summaries.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Summary',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              book.summaries.first,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthors(BuildContext context, BookEntity book) {
    final theme = Theme.of(context);

    if (book.authors.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person_outline, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  book.authors.length > 1 ? 'Authors' : 'Author',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...book.authors.map(
              (author) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Text(
                        author.name.isNotEmpty
                            ? author.name[0].toUpperCase()
                            : 'A',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            author.name,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (author.birthYear != null ||
                              author.deathYear != null)
                            Text(
                              '${author.birthYear ?? '?'} - ${author.deathYear ?? 'Present'}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.7,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjects(BuildContext context, BookEntity book) {
    final theme = Theme.of(context);

    if (book.subjects.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.category_outlined, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Subjects',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  book.subjects
                      .map(
                        (subject) => Chip(
                          label: Text(
                            subject,
                            style: theme.textTheme.bodySmall,
                          ),
                          backgroundColor: theme.colorScheme.secondaryContainer,
                          side: BorderSide.none,
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookshelves(BuildContext context, BookEntity book) {
    final theme = Theme.of(context);

    if (book.bookshelves.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.bookmarks_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Bookshelves',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  book.bookshelves
                      .map(
                        (shelf) => Chip(
                          label: Text(shelf, style: theme.textTheme.bodySmall),
                          backgroundColor: theme.colorScheme.tertiaryContainer,
                          side: BorderSide.none,
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetadata(BuildContext context, BookEntity book) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Statistics',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Downloads',
                    book.downloadCount.toString(),
                    Icons.download_outlined,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Formats',
                    book.formats.length.toString(),
                    Icons.file_copy_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: theme.colorScheme.primary),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadFormats(BuildContext context, BookEntity book) {
    final theme = Theme.of(context);

    if (book.formats.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.download_outlined, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Available Formats',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...book.formats.entries.map(
              (format) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(
                      _getFormatIcon(format.key),
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  title: Text(_getFormatName(format.key)),
                  subtitle: Text(format.key),
                  trailing: IconButton(
                    icon: const Icon(Icons.open_in_new),
                    onPressed:
                        () => ref
                            .read(urlLauncherServiceProvider)
                            .openUrl(format.value),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getFormatIcon(String mimeType) {
    if (mimeType.contains('epub')) return Icons.book;
    if (mimeType.contains('pdf')) return Icons.picture_as_pdf;
    if (mimeType.contains('text')) return Icons.text_snippet;
    if (mimeType.contains('html')) return Icons.web;
    if (mimeType.contains('image')) return Icons.image;
    return Icons.insert_drive_file;
  }

  String _getFormatName(String mimeType) {
    if (mimeType.contains('epub')) return 'EPUB';
    if (mimeType.contains('pdf')) return 'PDF';
    if (mimeType.contains('html')) return 'HTML';
    if (mimeType.contains('plain')) return 'Plain Text';
    if (mimeType.contains('mobipocket')) return 'Kindle';
    if (mimeType.contains('rdf')) return 'RDF Metadata';
    if (mimeType.contains('image')) return 'Cover Image';
    if (mimeType.contains('zip')) return 'Archive';
    return 'Unknown Format';
  }

  Widget _buildBookCover(BookEntity book, ThemeData theme) {
    final coverImageUrl = book.formats['image/jpeg'];

    if (coverImageUrl != null && coverImageUrl.isNotEmpty) {
      return Container(
        width: 120,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            coverImageUrl,
            width: 120,
            height: 160,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white70),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.book, size: 60, color: Colors.white70),
              );
            },
          ),
        ),
      );
    }

    return Container(
      width: 120,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.book, size: 60, color: Colors.white70),
    );
  }
}
