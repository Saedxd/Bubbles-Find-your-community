// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetGender;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AvatarListModel> _$avatarListModelSerializer =
    new _$AvatarListModelSerializer();

class _$AvatarListModelSerializer
    implements StructuredSerializer<AvatarListModel> {
  @override
  final Iterable<Type> types = const [AvatarListModel, _$AvatarListModel];
  @override
  final String wireName = 'AvatarListModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AvatarListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updated_at;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AvatarListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AvatarListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AvatarListModel extends AvatarListModel {
  @override
  final String? created_at;
  @override
  final String? updated_at;
  @override
  final int? id;
  @override
  final String? image;

  factory _$AvatarListModel([void Function(AvatarListModelBuilder)? updates]) =>
      (new AvatarListModelBuilder()..update(updates))._build();

  _$AvatarListModel._({this.created_at, this.updated_at, this.id, this.image})
      : super._();

  @override
  AvatarListModel rebuild(void Function(AvatarListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvatarListModelBuilder toBuilder() =>
      new AvatarListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AvatarListModel &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        id == other.id &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, created_at.hashCode), updated_at.hashCode), id.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AvatarListModel')
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('id', id)
          ..add('image', image))
        .toString();
  }
}

class AvatarListModelBuilder
    implements Builder<AvatarListModel, AvatarListModelBuilder> {
  _$AvatarListModel? _$v;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _updated_at;
  String? get updated_at => _$this._updated_at;
  set updated_at(String? updated_at) => _$this._updated_at = updated_at;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  AvatarListModelBuilder();

  AvatarListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _id = $v.id;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AvatarListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AvatarListModel;
  }

  @override
  void update(void Function(AvatarListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AvatarListModel build() => _build();

  _$AvatarListModel _build() {
    final _$result = _$v ??
        new _$AvatarListModel._(
            created_at: created_at,
            updated_at: updated_at,
            id: id,
            image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
