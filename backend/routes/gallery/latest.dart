import 'dart:io';

import 'package:astro_backend/_export.dart';
import 'package:astro_common/astro_common.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  try {
    final queryParams = context.request.uri.queryParameters;
    final languageName = queryParams['language'];

    if (languageName == null) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'language must be provided',
      );
    }

    final languageIsSupported =
        ContentLanguage.values.any((l) => l.name == languageName);

    if (!languageIsSupported) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'The language is not supported: "$languageName"',
      );
    }

    final requestDto = AstroBackendGalleryLatestRequestDto.fromJson(
      queryParams,
    );

    final galleryRepository = await context.read<Future<GalleryRepository>>();

    final latest = await galleryRepository.getLatestItem(
      language: requestDto.language,
    );

    return Response.json(body: latest.toJson());
  } on NasaApodException catch (e) {
    return Response(
      statusCode: e.statusCode,
      body: e.message,
    );
  }
}
