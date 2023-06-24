import 'package:pokedex/riverpod/models/metadata.dart';

abstract class MetadataRepository {
  Future<void> getColors();
  Future<void> getTypes();
  Future<MetadataO?> getMetadata();
}