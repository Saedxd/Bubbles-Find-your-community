// GENERATED CODE - DO NOT MODIFY BY HAND

part of CateogoryList;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CateogoryList> _$cateogoryListSerializer =
    new _$CateogoryListSerializer();

class _$CateogoryListSerializer implements StructuredSerializer<CateogoryList> {
  @override
  final Iterable<Type> types = const [CateogoryList, _$CateogoryList];
  @override
  final String wireName = 'CateogoryList';

  @override
  Iterable<Object?> serialize(Serializers serializers, CateogoryList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CateogoryList deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CateogoryListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$CateogoryList extends CateogoryList {
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? image;
  @override
  final int? id;

  factory _$CateogoryList([void Function(CateogoryListBuilder)? updates]) =>
      (new CateogoryListBuilder()..update(updates))._build();

  _$CateogoryList._({this.name, this.type, this.image, this.id}) : super._();

  @override
  CateogoryList rebuild(void Function(CateogoryListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CateogoryListBuilder toBuilder() => new CateogoryListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CateogoryList &&
        name == other.name &&
        type == other.type &&
        image == other.image &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), type.hashCode), image.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CateogoryList')
          ..add('name', name)
          ..add('type', type)
          ..add('image', image)
          ..add('id', id))
        .toString();
  }
}

class CateogoryListBuilder
    implements Builder<CateogoryList, CateogoryListBuilder> {
  _$CateogoryList? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  CateogoryListBuilder();

  CateogoryListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _image = $v.image;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CateogoryList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CateogoryList;
  }

  @override
  void update(void Function(CateogoryListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CateogoryList build() => _build();

  _$CateogoryList _build() {
    final _$result = _$v ??
        new _$CateogoryList._(name: name, type: type, image: image, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
