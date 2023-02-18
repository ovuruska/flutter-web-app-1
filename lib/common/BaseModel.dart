

abstract class BaseModel {

  final int id;

  BaseModel(this.id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BaseModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

}