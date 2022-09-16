// GENERATED CODE - DO NOT MODIFY BY HAND

part of FreindModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FreindModel> _$freindModelSerializer = new _$FreindModelSerializer();

class _$FreindModelSerializer implements StructuredSerializer<FreindModel> {
  @override
  final Iterable<Type> types = const [FreindModel, _$FreindModel];
  @override
  final String wireName = 'FreindModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, FreindModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.alias;
    if (value != null) {
      result
        ..add('alias')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.background_color;
    if (value != null) {
      result
        ..add('background_color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
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
  FreindModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FreindModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'alias':
          result.alias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'background_color':
          result.background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
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

class _$FreindModel extends FreindModel {
  @override
  final String? alias;
  @override
  final String? background_color;
  @override
  final String? avatar;
  @override
  final int? id;

  factory _$FreindModel([void Function(FreindModelBuilder)? updates]) =>
      (new FreindModelBuilder()..update(updates))._build();

  _$FreindModel._({this.alias, this.background_color, this.avatar, this.id})
      : super._();

  @override
  FreindModel rebuild(void Function(FreindModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FreindModelBuilder toBuilder() => new FreindModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FreindModel &&
        alias == other.alias &&
        background_color == other.background_color &&
        avatar == other.avatar &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, alias.hashCode), background_color.hashCode),
            avatar.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FreindModel')
          ..add('alias', alias)
          ..add('background_color', background_color)
          ..add('avatar', avatar)
          ..add('id', id))
        .toString();
  }
}

class FreindModelBuilder implements Builder<FreindModel, FreindModelBuilder> {
  _$FreindModel? _$v;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  FreindModelBuilder();

  FreindModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _alias = $v.alias;
      _background_color = $v.background_color;
      _avatar = $v.avatar;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FreindModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FreindModel;
  }

  @override
  void update(void Function(FreindModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FreindModel build() => _build();

  _$FreindModel _build() {
    final _$result = _$v ??
        new _$FreindModel._(
            alias: alias,
            background_color: background_color,
            avatar: avatar,
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
