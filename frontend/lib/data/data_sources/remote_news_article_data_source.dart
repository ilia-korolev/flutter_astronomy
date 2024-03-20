import 'package:astro_common/astro_common.dart';
import 'package:frontend/core/_export.dart';
import 'package:xml/xml.dart';

abstract interface class RemoteNewsArticleDataSource {
  const RemoteNewsArticleDataSource();

  Future<List<Article>> getNews({
    required NewsSource source,
  });
}

class RssNewsArticleDataSource implements RemoteNewsArticleDataSource {
  const RssNewsArticleDataSource({
    required HttpService httpService,
    required RssParser rssParser,
  })  : _httpService = httpService,
        _rssParser = rssParser;

  final HttpService _httpService;
  final RssParser _rssParser;

  @override
  Future<List<Article>> getNews({
    required NewsSource source,
  }) async {
    final response = await _httpService.get<dynamic>(source.uri.toString());

    final xmlDocument = XmlDocument.parse(response.data as String);

    return _rssParser.parse(xmlDocument: xmlDocument, source: source);
  }
}