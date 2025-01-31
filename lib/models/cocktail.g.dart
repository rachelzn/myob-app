// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CocktailAdapter extends TypeAdapter<Cocktail> {
  @override
  final int typeId = 0;

  @override
  Cocktail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cocktail(
      id: fields[0] as String,
      name: fields[1] as String,
      imageUrl: fields[2] as String,
      category: fields[3] as String,
      glassType: fields[4] as String,
      instructions: fields[5] as String,
      ingredients: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Cocktail obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.glassType)
      ..writeByte(5)
      ..write(obj.instructions)
      ..writeByte(6)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CocktailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
