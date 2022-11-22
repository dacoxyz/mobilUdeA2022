// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_site.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalSiteAdapter extends TypeAdapter<LocalSite> {
  @override
  final int typeId = 0;

  @override
  LocalSite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalSite()
      ..id = fields[0] as String?
      ..name = fields[1] as String?
      ..description= fields[2] as String?
      ..otrainfo = fields[3] as String?
      ..ciudad= fields[4] as String?
      ..rating = fields[5] as String?
      ..latitud=fields[6] as String?
      ..longitud=fields[7] as String?
      ..urlPicture = fields[8] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalSite obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.otrainfo)
      ..writeByte(4)
      ..write(obj.ciudad)
      ..writeByte(5)
      ..write(obj.rating.toString())
      ..writeByte(6)
      ..write(obj.latitud.toString())
      ..writeByte(7)
      ..write(obj.longitud.toString())
      ..writeByte(8)
      ..write(obj.urlPicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LocalSiteAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}