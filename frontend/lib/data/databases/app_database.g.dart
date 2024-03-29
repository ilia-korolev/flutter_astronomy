// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks, lines_longer_than_80_chars

part of 'app_database.dart';

// ignore_for_file: type=lint
class $GalleryTable extends Gallery
    with TableInfo<$GalleryTable, GalleryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GalleryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumnWithTypeConverter<Date, int> date =
      GeneratedColumn<int>('date', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<Date>($GalleryTable.$converterdate);
  static const VerificationMeta _uriMeta = const VerificationMeta('uri');
  @override
  late final GeneratedColumnWithTypeConverter<Uri, String> uri =
      GeneratedColumn<String>('uri', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Uri>($GalleryTable.$converteruri);
  static const VerificationMeta _hdUriMeta = const VerificationMeta('hdUri');
  @override
  late final GeneratedColumnWithTypeConverter<Uri, String> hdUri =
      GeneratedColumn<String>('hd_uri', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Uri>($GalleryTable.$converterhdUri);
  static const VerificationMeta _copyrightMeta =
      const VerificationMeta('copyright');
  @override
  late final GeneratedColumn<String> copyright = GeneratedColumn<String>(
      'copyright', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<GalleryItemType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<GalleryItemType>($GalleryTable.$convertertype);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favorite" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [date, uri, hdUri, copyright, type, isFavorite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gallery';
  @override
  VerificationContext validateIntegrity(Insertable<GalleryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_dateMeta, const VerificationResult.success());
    context.handle(_uriMeta, const VerificationResult.success());
    context.handle(_hdUriMeta, const VerificationResult.success());
    if (data.containsKey('copyright')) {
      context.handle(_copyrightMeta,
          copyright.isAcceptableOrUnknown(data['copyright']!, _copyrightMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  GalleryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GalleryEntity(
      date: $GalleryTable.$converterdate.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}date'])!),
      uri: $GalleryTable.$converteruri.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uri'])!),
      hdUri: $GalleryTable.$converterhdUri.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hd_uri'])!),
      copyright: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}copyright']),
      type: $GalleryTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
    );
  }

  @override
  $GalleryTable createAlias(String alias) {
    return $GalleryTable(attachedDatabase, alias);
  }

  static TypeConverter<Date, int> $converterdate = const DateConverter();
  static TypeConverter<Uri, String> $converteruri = const _UriConverter();
  static TypeConverter<Uri, String> $converterhdUri = const _UriConverter();
  static JsonTypeConverter2<GalleryItemType, String, String> $convertertype =
      const EnumNameConverter<GalleryItemType>(GalleryItemType.values);
}

class GalleryEntity extends DataClass implements Insertable<GalleryEntity> {
  final Date date;
  final Uri uri;
  final Uri hdUri;
  final String? copyright;
  final GalleryItemType type;
  final bool isFavorite;
  const GalleryEntity(
      {required this.date,
      required this.uri,
      required this.hdUri,
      this.copyright,
      required this.type,
      required this.isFavorite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['date'] = Variable<int>($GalleryTable.$converterdate.toSql(date));
    }
    {
      map['uri'] = Variable<String>($GalleryTable.$converteruri.toSql(uri));
    }
    {
      map['hd_uri'] =
          Variable<String>($GalleryTable.$converterhdUri.toSql(hdUri));
    }
    if (!nullToAbsent || copyright != null) {
      map['copyright'] = Variable<String>(copyright);
    }
    {
      map['type'] = Variable<String>($GalleryTable.$convertertype.toSql(type));
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  GalleryCompanion toCompanion(bool nullToAbsent) {
    return GalleryCompanion(
      date: Value(date),
      uri: Value(uri),
      hdUri: Value(hdUri),
      copyright: copyright == null && nullToAbsent
          ? const Value.absent()
          : Value(copyright),
      type: Value(type),
      isFavorite: Value(isFavorite),
    );
  }

  factory GalleryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GalleryEntity(
      date: serializer.fromJson<Date>(json['date']),
      uri: serializer.fromJson<Uri>(json['uri']),
      hdUri: serializer.fromJson<Uri>(json['hdUri']),
      copyright: serializer.fromJson<String?>(json['copyright']),
      type: $GalleryTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<Date>(date),
      'uri': serializer.toJson<Uri>(uri),
      'hdUri': serializer.toJson<Uri>(hdUri),
      'copyright': serializer.toJson<String?>(copyright),
      'type':
          serializer.toJson<String>($GalleryTable.$convertertype.toJson(type)),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  GalleryEntity copyWith(
          {Date? date,
          Uri? uri,
          Uri? hdUri,
          Value<String?> copyright = const Value.absent(),
          GalleryItemType? type,
          bool? isFavorite}) =>
      GalleryEntity(
        date: date ?? this.date,
        uri: uri ?? this.uri,
        hdUri: hdUri ?? this.hdUri,
        copyright: copyright.present ? copyright.value : this.copyright,
        type: type ?? this.type,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('GalleryEntity(')
          ..write('date: $date, ')
          ..write('uri: $uri, ')
          ..write('hdUri: $hdUri, ')
          ..write('copyright: $copyright, ')
          ..write('type: $type, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(date, uri, hdUri, copyright, type, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GalleryEntity &&
          other.date == this.date &&
          other.uri == this.uri &&
          other.hdUri == this.hdUri &&
          other.copyright == this.copyright &&
          other.type == this.type &&
          other.isFavorite == this.isFavorite);
}

class GalleryCompanion extends UpdateCompanion<GalleryEntity> {
  final Value<Date> date;
  final Value<Uri> uri;
  final Value<Uri> hdUri;
  final Value<String?> copyright;
  final Value<GalleryItemType> type;
  final Value<bool> isFavorite;
  const GalleryCompanion({
    this.date = const Value.absent(),
    this.uri = const Value.absent(),
    this.hdUri = const Value.absent(),
    this.copyright = const Value.absent(),
    this.type = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  GalleryCompanion.insert({
    this.date = const Value.absent(),
    required Uri uri,
    required Uri hdUri,
    this.copyright = const Value.absent(),
    required GalleryItemType type,
    required bool isFavorite,
  })  : uri = Value(uri),
        hdUri = Value(hdUri),
        type = Value(type),
        isFavorite = Value(isFavorite);
  static Insertable<GalleryEntity> custom({
    Expression<int>? date,
    Expression<String>? uri,
    Expression<String>? hdUri,
    Expression<String>? copyright,
    Expression<String>? type,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (uri != null) 'uri': uri,
      if (hdUri != null) 'hd_uri': hdUri,
      if (copyright != null) 'copyright': copyright,
      if (type != null) 'type': type,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  GalleryCompanion copyWith(
      {Value<Date>? date,
      Value<Uri>? uri,
      Value<Uri>? hdUri,
      Value<String?>? copyright,
      Value<GalleryItemType>? type,
      Value<bool>? isFavorite}) {
    return GalleryCompanion(
      date: date ?? this.date,
      uri: uri ?? this.uri,
      hdUri: hdUri ?? this.hdUri,
      copyright: copyright ?? this.copyright,
      type: type ?? this.type,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] =
          Variable<int>($GalleryTable.$converterdate.toSql(date.value));
    }
    if (uri.present) {
      map['uri'] =
          Variable<String>($GalleryTable.$converteruri.toSql(uri.value));
    }
    if (hdUri.present) {
      map['hd_uri'] =
          Variable<String>($GalleryTable.$converterhdUri.toSql(hdUri.value));
    }
    if (copyright.present) {
      map['copyright'] = Variable<String>(copyright.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($GalleryTable.$convertertype.toSql(type.value));
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GalleryCompanion(')
          ..write('date: $date, ')
          ..write('uri: $uri, ')
          ..write('hdUri: $hdUri, ')
          ..write('copyright: $copyright, ')
          ..write('type: $type, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $GalleryTranslationsTable extends GalleryTranslations
    with TableInfo<$GalleryTranslationsTable, GalleryTranslationEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GalleryTranslationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumnWithTypeConverter<Date, int> date =
      GeneratedColumn<int>('date', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: true,
              defaultConstraints: GeneratedColumn.constraintIsAlways(
                  'REFERENCES gallery (date)'))
          .withConverter<Date>($GalleryTranslationsTable.$converterdate);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumnWithTypeConverter<ContentLanguage, String>
      language = GeneratedColumn<String>('language', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ContentLanguage>(
              $GalleryTranslationsTable.$converterlanguage);
  static const VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  @override
  late final GeneratedColumnWithTypeConverter<ContentLanguage, String>
      originalLanguage = GeneratedColumn<String>(
              'original_language', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ContentLanguage>(
              $GalleryTranslationsTable.$converteroriginalLanguage);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
      'explanation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [date, language, originalLanguage, title, explanation];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gallery_translations';
  @override
  VerificationContext validateIntegrity(
      Insertable<GalleryTranslationEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_dateMeta, const VerificationResult.success());
    context.handle(_languageMeta, const VerificationResult.success());
    context.handle(_originalLanguageMeta, const VerificationResult.success());
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date, language};
  @override
  GalleryTranslationEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GalleryTranslationEntity(
      date: $GalleryTranslationsTable.$converterdate.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}date'])!),
      language: $GalleryTranslationsTable.$converterlanguage.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}language'])!),
      originalLanguage: $GalleryTranslationsTable.$converteroriginalLanguage
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}original_language'])!),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      explanation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}explanation'])!,
    );
  }

  @override
  $GalleryTranslationsTable createAlias(String alias) {
    return $GalleryTranslationsTable(attachedDatabase, alias);
  }

  static TypeConverter<Date, int> $converterdate = const DateConverter();
  static JsonTypeConverter2<ContentLanguage, String, String>
      $converterlanguage =
      const EnumNameConverter<ContentLanguage>(ContentLanguage.values);
  static JsonTypeConverter2<ContentLanguage, String, String>
      $converteroriginalLanguage =
      const EnumNameConverter<ContentLanguage>(ContentLanguage.values);
}

class GalleryTranslationEntity extends DataClass
    implements Insertable<GalleryTranslationEntity> {
  final Date date;
  final ContentLanguage language;
  final ContentLanguage originalLanguage;
  final String title;
  final String explanation;
  const GalleryTranslationEntity(
      {required this.date,
      required this.language,
      required this.originalLanguage,
      required this.title,
      required this.explanation});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['date'] =
          Variable<int>($GalleryTranslationsTable.$converterdate.toSql(date));
    }
    {
      map['language'] = Variable<String>(
          $GalleryTranslationsTable.$converterlanguage.toSql(language));
    }
    {
      map['original_language'] = Variable<String>($GalleryTranslationsTable
          .$converteroriginalLanguage
          .toSql(originalLanguage));
    }
    map['title'] = Variable<String>(title);
    map['explanation'] = Variable<String>(explanation);
    return map;
  }

  GalleryTranslationsCompanion toCompanion(bool nullToAbsent) {
    return GalleryTranslationsCompanion(
      date: Value(date),
      language: Value(language),
      originalLanguage: Value(originalLanguage),
      title: Value(title),
      explanation: Value(explanation),
    );
  }

  factory GalleryTranslationEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GalleryTranslationEntity(
      date: serializer.fromJson<Date>(json['date']),
      language: $GalleryTranslationsTable.$converterlanguage
          .fromJson(serializer.fromJson<String>(json['language'])),
      originalLanguage: $GalleryTranslationsTable.$converteroriginalLanguage
          .fromJson(serializer.fromJson<String>(json['originalLanguage'])),
      title: serializer.fromJson<String>(json['title']),
      explanation: serializer.fromJson<String>(json['explanation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<Date>(date),
      'language': serializer.toJson<String>(
          $GalleryTranslationsTable.$converterlanguage.toJson(language)),
      'originalLanguage': serializer.toJson<String>($GalleryTranslationsTable
          .$converteroriginalLanguage
          .toJson(originalLanguage)),
      'title': serializer.toJson<String>(title),
      'explanation': serializer.toJson<String>(explanation),
    };
  }

  GalleryTranslationEntity copyWith(
          {Date? date,
          ContentLanguage? language,
          ContentLanguage? originalLanguage,
          String? title,
          String? explanation}) =>
      GalleryTranslationEntity(
        date: date ?? this.date,
        language: language ?? this.language,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        title: title ?? this.title,
        explanation: explanation ?? this.explanation,
      );
  @override
  String toString() {
    return (StringBuffer('GalleryTranslationEntity(')
          ..write('date: $date, ')
          ..write('language: $language, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('title: $title, ')
          ..write('explanation: $explanation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(date, language, originalLanguage, title, explanation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GalleryTranslationEntity &&
          other.date == this.date &&
          other.language == this.language &&
          other.originalLanguage == this.originalLanguage &&
          other.title == this.title &&
          other.explanation == this.explanation);
}

class GalleryTranslationsCompanion
    extends UpdateCompanion<GalleryTranslationEntity> {
  final Value<Date> date;
  final Value<ContentLanguage> language;
  final Value<ContentLanguage> originalLanguage;
  final Value<String> title;
  final Value<String> explanation;
  final Value<int> rowid;
  const GalleryTranslationsCompanion({
    this.date = const Value.absent(),
    this.language = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.title = const Value.absent(),
    this.explanation = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GalleryTranslationsCompanion.insert({
    required Date date,
    required ContentLanguage language,
    required ContentLanguage originalLanguage,
    required String title,
    required String explanation,
    this.rowid = const Value.absent(),
  })  : date = Value(date),
        language = Value(language),
        originalLanguage = Value(originalLanguage),
        title = Value(title),
        explanation = Value(explanation);
  static Insertable<GalleryTranslationEntity> custom({
    Expression<int>? date,
    Expression<String>? language,
    Expression<String>? originalLanguage,
    Expression<String>? title,
    Expression<String>? explanation,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (language != null) 'language': language,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (title != null) 'title': title,
      if (explanation != null) 'explanation': explanation,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GalleryTranslationsCompanion copyWith(
      {Value<Date>? date,
      Value<ContentLanguage>? language,
      Value<ContentLanguage>? originalLanguage,
      Value<String>? title,
      Value<String>? explanation,
      Value<int>? rowid}) {
    return GalleryTranslationsCompanion(
      date: date ?? this.date,
      language: language ?? this.language,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      title: title ?? this.title,
      explanation: explanation ?? this.explanation,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<int>(
          $GalleryTranslationsTable.$converterdate.toSql(date.value));
    }
    if (language.present) {
      map['language'] = Variable<String>(
          $GalleryTranslationsTable.$converterlanguage.toSql(language.value));
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String>($GalleryTranslationsTable
          .$converteroriginalLanguage
          .toSql(originalLanguage.value));
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GalleryTranslationsCompanion(')
          ..write('date: $date, ')
          ..write('language: $language, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('title: $title, ')
          ..write('explanation: $explanation, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NewsSourceEntitiesTable extends NewsSourceEntities
    with TableInfo<$NewsSourceEntitiesTable, NewsSourceEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsSourceEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uriMeta = const VerificationMeta('uri');
  @override
  late final GeneratedColumnWithTypeConverter<Uri, String> uri =
      GeneratedColumn<String>('uri', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Uri>($NewsSourceEntitiesTable.$converteruri);
  static const VerificationMeta _iconUriMeta =
      const VerificationMeta('iconUri');
  @override
  late final GeneratedColumnWithTypeConverter<Uri, String> iconUri =
      GeneratedColumn<String>('icon_uri', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Uri>($NewsSourceEntitiesTable.$convertericonUri);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumnWithTypeConverter<ContentLanguage, String>
      language = GeneratedColumn<String>('language', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ContentLanguage>(
              $NewsSourceEntitiesTable.$converterlanguage);
  static const VerificationMeta _isShownMeta =
      const VerificationMeta('isShown');
  @override
  late final GeneratedColumn<bool> isShown = GeneratedColumn<bool>(
      'is_shown', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_shown" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [uri, iconUri, language, isShown];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_source_entities';
  @override
  VerificationContext validateIntegrity(Insertable<NewsSourceEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_uriMeta, const VerificationResult.success());
    context.handle(_iconUriMeta, const VerificationResult.success());
    context.handle(_languageMeta, const VerificationResult.success());
    if (data.containsKey('is_shown')) {
      context.handle(_isShownMeta,
          isShown.isAcceptableOrUnknown(data['is_shown']!, _isShownMeta));
    } else if (isInserting) {
      context.missing(_isShownMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uri};
  @override
  NewsSourceEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsSourceEntity(
      uri: $NewsSourceEntitiesTable.$converteruri.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uri'])!),
      iconUri: $NewsSourceEntitiesTable.$convertericonUri.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}icon_uri'])!),
      language: $NewsSourceEntitiesTable.$converterlanguage.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}language'])!),
      isShown: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_shown'])!,
    );
  }

  @override
  $NewsSourceEntitiesTable createAlias(String alias) {
    return $NewsSourceEntitiesTable(attachedDatabase, alias);
  }

  static TypeConverter<Uri, String> $converteruri = const _UriConverter();
  static TypeConverter<Uri, String> $convertericonUri = const _UriConverter();
  static JsonTypeConverter2<ContentLanguage, String, String>
      $converterlanguage =
      const EnumNameConverter<ContentLanguage>(ContentLanguage.values);
}

class NewsSourceEntity extends DataClass
    implements Insertable<NewsSourceEntity> {
  final Uri uri;
  final Uri iconUri;
  final ContentLanguage language;
  final bool isShown;
  const NewsSourceEntity(
      {required this.uri,
      required this.iconUri,
      required this.language,
      required this.isShown});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['uri'] =
          Variable<String>($NewsSourceEntitiesTable.$converteruri.toSql(uri));
    }
    {
      map['icon_uri'] = Variable<String>(
          $NewsSourceEntitiesTable.$convertericonUri.toSql(iconUri));
    }
    {
      map['language'] = Variable<String>(
          $NewsSourceEntitiesTable.$converterlanguage.toSql(language));
    }
    map['is_shown'] = Variable<bool>(isShown);
    return map;
  }

  NewsSourceEntitiesCompanion toCompanion(bool nullToAbsent) {
    return NewsSourceEntitiesCompanion(
      uri: Value(uri),
      iconUri: Value(iconUri),
      language: Value(language),
      isShown: Value(isShown),
    );
  }

  factory NewsSourceEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsSourceEntity(
      uri: serializer.fromJson<Uri>(json['uri']),
      iconUri: serializer.fromJson<Uri>(json['iconUri']),
      language: $NewsSourceEntitiesTable.$converterlanguage
          .fromJson(serializer.fromJson<String>(json['language'])),
      isShown: serializer.fromJson<bool>(json['isShown']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uri': serializer.toJson<Uri>(uri),
      'iconUri': serializer.toJson<Uri>(iconUri),
      'language': serializer.toJson<String>(
          $NewsSourceEntitiesTable.$converterlanguage.toJson(language)),
      'isShown': serializer.toJson<bool>(isShown),
    };
  }

  NewsSourceEntity copyWith(
          {Uri? uri, Uri? iconUri, ContentLanguage? language, bool? isShown}) =>
      NewsSourceEntity(
        uri: uri ?? this.uri,
        iconUri: iconUri ?? this.iconUri,
        language: language ?? this.language,
        isShown: isShown ?? this.isShown,
      );
  @override
  String toString() {
    return (StringBuffer('NewsSourceEntity(')
          ..write('uri: $uri, ')
          ..write('iconUri: $iconUri, ')
          ..write('language: $language, ')
          ..write('isShown: $isShown')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uri, iconUri, language, isShown);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsSourceEntity &&
          other.uri == this.uri &&
          other.iconUri == this.iconUri &&
          other.language == this.language &&
          other.isShown == this.isShown);
}

class NewsSourceEntitiesCompanion extends UpdateCompanion<NewsSourceEntity> {
  final Value<Uri> uri;
  final Value<Uri> iconUri;
  final Value<ContentLanguage> language;
  final Value<bool> isShown;
  final Value<int> rowid;
  const NewsSourceEntitiesCompanion({
    this.uri = const Value.absent(),
    this.iconUri = const Value.absent(),
    this.language = const Value.absent(),
    this.isShown = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsSourceEntitiesCompanion.insert({
    required Uri uri,
    required Uri iconUri,
    required ContentLanguage language,
    required bool isShown,
    this.rowid = const Value.absent(),
  })  : uri = Value(uri),
        iconUri = Value(iconUri),
        language = Value(language),
        isShown = Value(isShown);
  static Insertable<NewsSourceEntity> custom({
    Expression<String>? uri,
    Expression<String>? iconUri,
    Expression<String>? language,
    Expression<bool>? isShown,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uri != null) 'uri': uri,
      if (iconUri != null) 'icon_uri': iconUri,
      if (language != null) 'language': language,
      if (isShown != null) 'is_shown': isShown,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsSourceEntitiesCompanion copyWith(
      {Value<Uri>? uri,
      Value<Uri>? iconUri,
      Value<ContentLanguage>? language,
      Value<bool>? isShown,
      Value<int>? rowid}) {
    return NewsSourceEntitiesCompanion(
      uri: uri ?? this.uri,
      iconUri: iconUri ?? this.iconUri,
      language: language ?? this.language,
      isShown: isShown ?? this.isShown,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uri.present) {
      map['uri'] = Variable<String>(
          $NewsSourceEntitiesTable.$converteruri.toSql(uri.value));
    }
    if (iconUri.present) {
      map['icon_uri'] = Variable<String>(
          $NewsSourceEntitiesTable.$convertericonUri.toSql(iconUri.value));
    }
    if (language.present) {
      map['language'] = Variable<String>(
          $NewsSourceEntitiesTable.$converterlanguage.toSql(language.value));
    }
    if (isShown.present) {
      map['is_shown'] = Variable<bool>(isShown.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsSourceEntitiesCompanion(')
          ..write('uri: $uri, ')
          ..write('iconUri: $iconUri, ')
          ..write('language: $language, ')
          ..write('isShown: $isShown, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $GalleryTable gallery = $GalleryTable(this);
  late final $GalleryTranslationsTable galleryTranslations =
      $GalleryTranslationsTable(this);
  late final $NewsSourceEntitiesTable newsSourceEntities =
      $NewsSourceEntitiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [gallery, galleryTranslations, newsSourceEntities];
}
