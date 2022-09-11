// GENERATED CODE - DO NOT MODIFY BY HAND

part of EventCategoryModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventCategoryModel> _$eventCategoryModelSerializer =
    new _$EventCategoryModelSerializer();

class _$EventCategoryModelSerializer
    implements StructuredSerializer<EventCategoryModel> {
  @override
  final Iterable<Type> types = const [EventCategoryModel, _$EventCategoryModel];
  @override
  final String wireName = 'EventCategoryModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EventCategoryModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  EventCategoryModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventCategoryModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$EventCategoryModel extends EventCategoryModel {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? image;

  factory _$EventCategoryModel(
          [void Function(EventCategoryModelBuilder)? updates]) =>
      (new EventCategoryModelBuilder()..update(updates))._build();

  _$EventCategoryModel._({this.id, this.name, this.type, this.image})
      : super._();

  @override
  EventCategoryModel rebuild(
          void Function(EventCategoryModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventCategoryModelBuilder toBuilder() =>
      new EventCategoryModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventCategoryModel &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), name.hashCode), type.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventCategoryModel')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('image', image))
        .toString();
  }
}

class EventCategoryModelBuilder
    implements Builder<EventCategoryModel, EventCategoryModelBuilder> {
  _$EventCategoryModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  EventCategoryModelBuilder();

  EventCategoryModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventCategoryModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventCategoryModel;
  }

  @override
  void update(void Function(EventCategoryModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventCategoryModel build() => _build();

  _$EventCategoryModel _build() {
    final _$result = _$v ??
        new _$EventCategoryModel._(
            id: id, name: name, type: type, image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
