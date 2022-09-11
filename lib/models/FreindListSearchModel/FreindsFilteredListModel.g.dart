// GENERATED CODE - DO NOT MODIFY BY HAND

part of FreindsFilteredListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FreindsFilteredListModel> _$freindsFilteredListModelSerializer =
    new _$FreindsFilteredListModelSerializer();

class _$FreindsFilteredListModelSerializer
    implements StructuredSerializer<FreindsFilteredListModel> {
  @override
  final Iterable<Type> types = const [
    FreindsFilteredListModel,
    _$FreindsFilteredListModel
  ];
  @override
  final String wireName = 'FreindsFilteredListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FreindsFilteredListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.background_color;
    if (value != null) {
      result
        ..add('background_color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alias;
    if (value != null) {
      result
        ..add('alias')
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
    return result;
  }

  @override
  FreindsFilteredListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FreindsFilteredListModelBuilder();

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
        case 'background_color':
          result.background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alias':
          result.alias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$FreindsFilteredListModel extends FreindsFilteredListModel {
  @override
  final int? id;
  @override
  final String? background_color;
  @override
  final String? alias;
  @override
  final String? avatar;

  factory _$FreindsFilteredListModel(
          [void Function(FreindsFilteredListModelBuilder)? updates]) =>
      (new FreindsFilteredListModelBuilder()..update(updates))._build();

  _$FreindsFilteredListModel._(
      {this.id, this.background_color, this.alias, this.avatar})
      : super._();

  @override
  FreindsFilteredListModel rebuild(
          void Function(FreindsFilteredListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FreindsFilteredListModelBuilder toBuilder() =>
      new FreindsFilteredListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FreindsFilteredListModel &&
        id == other.id &&
        background_color == other.background_color &&
        alias == other.alias &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), background_color.hashCode),
            alias.hashCode),
        avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FreindsFilteredListModel')
          ..add('id', id)
          ..add('background_color', background_color)
          ..add('alias', alias)
          ..add('avatar', avatar))
        .toString();
  }
}

class FreindsFilteredListModelBuilder
    implements
        Builder<FreindsFilteredListModel, FreindsFilteredListModelBuilder> {
  _$FreindsFilteredListModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  FreindsFilteredListModelBuilder();

  FreindsFilteredListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _background_color = $v.background_color;
      _alias = $v.alias;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FreindsFilteredListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FreindsFilteredListModel;
  }

  @override
  void update(void Function(FreindsFilteredListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FreindsFilteredListModel build() => _build();

  _$FreindsFilteredListModel _build() {
    final _$result = _$v ??
        new _$FreindsFilteredListModel._(
            id: id,
            background_color: background_color,
            alias: alias,
            avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
