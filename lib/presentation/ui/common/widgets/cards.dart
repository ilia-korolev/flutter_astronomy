import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_astronomy/app/_export.dart';
import 'package:flutter_astronomy/domain/_export.dart';
import 'package:flutter_astronomy/presentation/ui/_export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

const _imageAspectRatio = 16 / 9;

class CompactArticleCard extends StatelessWidget {
  const CompactArticleCard({
    required this.article,
    required this.onCardPressed,
    required this.onSharePressed,
    super.key,
  });

  final Article article;
  final void Function(Article media) onCardPressed;
  final void Function(Article media) onSharePressed;

  @override
  Widget build(BuildContext context) {
    final thumbnailUri = article.thumbnail;

    return Center(
      child: _ArticleCardBase(
        article: article,
        onCardPressed: onCardPressed,
        onSharePressed: onSharePressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (thumbnailUri != null) ...[
              _Thumbnail(thumbnailUri: thumbnailUri),
            ],
            _ArticleInfo(
              article: article,
              isExpanded: false,
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedArticleCard extends StatelessWidget {
  const ExpandedArticleCard({
    required this.article,
    required this.onCardPressed,
    required this.onSharePressed,
    super.key,
  });

  final Article article;
  final void Function(Article media) onCardPressed;
  final void Function(Article media) onSharePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final thumbnailUri = article.thumbnail;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: theme.sizes.expandedArticleCardSize.width,
          maxHeight: theme.sizes.expandedArticleCardSize.height,
        ),
        child: _ArticleCardBase(
          article: article,
          onCardPressed: onCardPressed,
          onSharePressed: onSharePressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (thumbnailUri != null) ...[
                _Thumbnail(thumbnailUri: thumbnailUri),
              ],
              Expanded(
                child: _ArticleInfo(
                  article: article,
                  isExpanded: thumbnailUri != null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MediaCard extends StatefulWidget {
  const MediaCard({
    required this.media,
    required this.onCardPressed,
    required this.onSharePressed,
    required this.onFavoritePressed,
    super.key,
  });

  final Media media;
  final void Function(Media media) onCardPressed;
  final void Function(Media media) onSharePressed;
  final void Function(Media media) onFavoritePressed;

  @override
  State<MediaCard> createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lightTheme = GetIt.instance<Theming>().light;
    final isMobile = theme.platform == TargetPlatform.android ||
        theme.platform == TargetPlatform.iOS;

    return Column(
      children: [
        Stack(
          children: [
            _Thumbnail(thumbnailUri: widget.media.uri),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.all(theme.radiuses.large),
                  onTap: () => widget.onCardPressed(widget.media),
                ),
              ),
            ),
            if (isMobile || _isHovered)
              Positioned(
                right: theme.spacing.semiSmall,
                bottom: theme.spacing.semiSmall,
                child: Row(
                  children: [
                    SmallIconButton(
                      icon: FontAwesomeIcons.shareNodes,
                      onPressed: () => widget.onSharePressed(widget.media),
                      iconColor: lightTheme.colorScheme.onSurface,
                      backgroundColor: lightTheme.colorScheme.surface,
                    ),
                    SizedBox(width: theme.spacing.semiSmall),
                    SmallIconButton(
                      onPressed: () => widget.onFavoritePressed(widget.media),
                      icon: widget.media.isFavorite
                          ? FontAwesomeIcons.solidStar
                          : FontAwesomeIcons.star,
                      iconColor: lightTheme.colorScheme.onSurface,
                      backgroundColor: lightTheme.colorScheme.surface,
                    ),
                  ],
                ),
              ),
            Positioned.fill(
              child: MouseRegion(
                hitTestBehavior: HitTestBehavior.translucent,
                onEnter: (event) {
                  setState(() {
                    _isHovered = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    _isHovered = false;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: theme.spacing.small),
        Row(
          children: [
            Expanded(
              child: Text(
                widget.media.title,
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              widget.media.date.format('yMd'),
              style: theme.textTheme.labelSmall!.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({
    required this.thumbnailUri,
  });

  final Uri thumbnailUri;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: _imageAspectRatio,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(theme.radiuses.large),
        ),
        child: ImageContent(uri: thumbnailUri.toString()),
      ),
    );
  }
}

class _ArticleCardBase extends StatelessWidget {
  const _ArticleCardBase({
    required this.child,
    required this.article,
    required this.onCardPressed,
    required this.onSharePressed,
  });

  final Widget child;
  final Article article;
  final void Function(Article media) onCardPressed;
  final void Function(Article media) onSharePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.surfaceColors.surfaceContainer,
        borderRadius: BorderRadius.all(theme.radiuses.large),
      ),
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(theme.radiuses.large),
                onTap: () => onCardPressed(article),
              ),
            ),
          ),
          Positioned(
            right: theme.spacing.medium,
            bottom: theme.spacing.small,
            child: SmallIconButton(
              icon: FontAwesomeIcons.shareNodes,
              onPressed: () => onSharePressed(article),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArticleInfo extends StatelessWidget {
  const _ArticleInfo({
    required this.article,
    required this.isExpanded,
  });

  final Article article;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final iconSize = SmallIconButton.getSize(context: context);

    return Padding(
      padding: EdgeInsets.only(
        top: theme.spacing.medium,
        left: theme.spacing.medium,
        right: theme.spacing.medium,
        bottom: theme.spacing.small,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: theme.sizes.mediumIconSize,
                height: theme.sizes.mediumIconSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: article.source.favicon.toString(),
                ),
              ),
              SizedBox(width: theme.spacing.small),
              Text(
                article.source.name,
                style: theme.textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.outline,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          SizedBox(height: theme.spacing.small),
          Expanded(
            flex: isExpanded ? 1 : 0,
            child: Text(
              article.title,
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: iconSize,
            alignment: Alignment.centerLeft,
            child: Text(
              _formatDate(
                date: article.date,
                l10n: l10n,
              ),
              style: theme.textTheme.labelMedium!.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate({
    required DateTime date,
    required AppLocalizations l10n,
  }) {
    final now = DateTime.now().toUtc();
    final difference = now.difference(date);

    if (difference.inDays < 1 && difference.inHours >= 1) {
      return l10n.hoursAgo(difference.inHours);
    }

    if (difference.inHours < 1) {
      return l10n.minutesAgo(difference.inMinutes);
    }

    return DateFormat.yMd().format(date);
  }
}
