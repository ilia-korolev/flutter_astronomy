import 'package:astro_common/astro_common.dart';
import 'package:drift/drift.dart';
import 'package:frontend/data/_export.dart';
import 'connection/_export.dart' as impl;

part 'app_database.g.dart';

@DataClassName('GalleryEntity')
class Gallery extends Table {
  IntColumn get date => integer().map(const DateConverter())();
  TextColumn get uri => text().map(const _UriConverter())();
  TextColumn get hdUri => text().map(const _UriConverter())();
  TextColumn get copyright => text().nullable()();
  TextColumn get type => textEnum<GalleryItemType>()();
  BoolColumn get isFavorite => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {date};
}

@DataClassName('GalleryTranslationEntity')
class GalleryTranslations extends Table {
  IntColumn get date =>
      integer().map(const DateConverter()).references(Gallery, #date)();
  TextColumn get language => textEnum<ContentLanguage>()();
  TextColumn get originalLanguage => textEnum<ContentLanguage>()();
  TextColumn get title => text()();
  TextColumn get explanation => text()();

  @override
  Set<Column<Object>>? get primaryKey => {date, language};
}

@DataClassName('NewsSourceEntity')
class NewsSourceEntities extends Table {
  TextColumn get uri => text().map(const _UriConverter())();
  TextColumn get iconUri => text().map(const _UriConverter())();
  TextColumn get language => textEnum<ContentLanguage>()();
  BoolColumn get isShown => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {uri};
}

@DriftDatabase(
  tables: [
    Gallery,
    GalleryTranslations,
    NewsSourceEntities,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

class _UriConverter extends TypeConverter<Uri, String> {
  const _UriConverter();

  @override
  Uri fromSql(String fromDb) => Uri.parse(fromDb);

  @override
  String toSql(Uri value) => value.toString();
}
