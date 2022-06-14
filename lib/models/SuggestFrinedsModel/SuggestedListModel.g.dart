// GENERATED CODE - DO NOT MODIFY BY HAND

part of SuggestedListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SuggestedListModel> _$suggestedListModelSerializer =
    new _$SuggestedListModelSerializer();

class _$SuggestedListModelSerializer
    implements StructuredSerializer<SuggestedListModel> {
  @override
  final Iterable<Type> types = const [SuggestedListModel, _$SuggestedListModel];
  @override
  final String wireName = 'SuggestedListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SuggestedListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.serial;
    if (value != null) {
      result
        ..add('serial')
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
    value = object.serialnumber;
    if (value != null) {
      result
        ..add('serialnumber')
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
    return result;
  }

  @override
  SuggestedListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SuggestedListModelBuilder();

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
        case 'serial':
          result.serial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alias':
          result.alias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'serialnumber':
          result.serialnumber = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$SuggestedListModel extends SuggestedListModel {
  @override
  final int? id;
  @override
  final String? serial;
  @override
  final String? alias;
  @override
  final String? serialnumber;
  @override
  final String? background_color;
  @override
  final String? avatar;

  factory _$SuggestedListModel(
          [void Function(SuggestedListModelBuilder)? updates]) =>
      (new SuggestedListModelBuilder()..update(updates))._build();

  _$SuggestedListModel._(
      {this.id,
      this.serial,
      this.alias,
      this.serialnumber,
      this.background_color,
      this.avatar})
      : super._();

  @override
  SuggestedListModel rebuild(
          void Function(SuggestedListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuggestedListModelBuilder toBuilder() =>
      new SuggestedListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuggestedListModel &&
        id == other.id &&
        serial == other.serial &&
        alias == other.alias &&
        serialnumber == other.serialnumber &&
        background_color == other.background_color &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), serial.hashCode), alias.hashCode),
                serialnumber.hashCode),
            background_color.hashCode),
        avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SuggestedListModel')
          ..add('id', id)
          ..add('serial', serial)
          ..add('alias', alias)
          ..add('serialnumber', serialnumber)
          ..add('background_color', background_color)
          ..add('avatar', avatar))
        .toString();
  }
}

class SuggestedListModelBuilder
    implements Builder<SuggestedListModel, SuggestedListModelBuilder> {
  _$SuggestedListModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _serialnumber;
  String? get serialnumber => _$this._serialnumber;
  set serialnumber(String? serialnumber) => _$this._serialnumber = serialnumber;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  SuggestedListModelBuilder();

  SuggestedListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _serial = $v.serial;
      _alias = $v.alias;
      _serialnumber = $v.serialnumber;
      _background_color = $v.background_color;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuggestedListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SuggestedListModel;
  }

  @override
  void update(void Function(SuggestedListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SuggestedListModel build() => _build();

  _$SuggestedListModel _build() {
    final _$result = _$v ??
        new _$SuggestedListModel._(
            id: id,
            serial: serial,
            alias: alias,
            serialnumber: serialnumber,
            background_color: background_color,
            avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
