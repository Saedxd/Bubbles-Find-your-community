// GENERATED CODE - DO NOT MODIFY BY HAND

part of UsersRequestsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRequestsModel> _$usersRequestsModelSerializer =
    new _$UsersRequestsModelSerializer();

class _$UsersRequestsModelSerializer
    implements StructuredSerializer<UsersRequestsModel> {
  @override
  final Iterable<Type> types = const [UsersRequestsModel, _$UsersRequestsModel];
  @override
  final String wireName = 'UsersRequestsModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UsersRequestsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.serial;
    if (value != null) {
      result
        ..add('serial')
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
  UsersRequestsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRequestsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'serial':
          result.serial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'serialnumber':
          result.serialnumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
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

class _$UsersRequestsModel extends UsersRequestsModel {
  @override
  final String? serial;
  @override
  final String? serialnumber;
  @override
  final String? alias;
  @override
  final String? background_color;
  @override
  final String? avatar;
  @override
  final int? id;

  factory _$UsersRequestsModel(
          [void Function(UsersRequestsModelBuilder)? updates]) =>
      (new UsersRequestsModelBuilder()..update(updates))._build();

  _$UsersRequestsModel._(
      {this.serial,
      this.serialnumber,
      this.alias,
      this.background_color,
      this.avatar,
      this.id})
      : super._();

  @override
  UsersRequestsModel rebuild(
          void Function(UsersRequestsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRequestsModelBuilder toBuilder() =>
      new UsersRequestsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRequestsModel &&
        serial == other.serial &&
        serialnumber == other.serialnumber &&
        alias == other.alias &&
        background_color == other.background_color &&
        avatar == other.avatar &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, serial.hashCode), serialnumber.hashCode),
                    alias.hashCode),
                background_color.hashCode),
            avatar.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRequestsModel')
          ..add('serial', serial)
          ..add('serialnumber', serialnumber)
          ..add('alias', alias)
          ..add('background_color', background_color)
          ..add('avatar', avatar)
          ..add('id', id))
        .toString();
  }
}

class UsersRequestsModelBuilder
    implements Builder<UsersRequestsModel, UsersRequestsModelBuilder> {
  _$UsersRequestsModel? _$v;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  String? _serialnumber;
  String? get serialnumber => _$this._serialnumber;
  set serialnumber(String? serialnumber) => _$this._serialnumber = serialnumber;

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

  UsersRequestsModelBuilder();

  UsersRequestsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serial = $v.serial;
      _serialnumber = $v.serialnumber;
      _alias = $v.alias;
      _background_color = $v.background_color;
      _avatar = $v.avatar;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRequestsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRequestsModel;
  }

  @override
  void update(void Function(UsersRequestsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRequestsModel build() => _build();

  _$UsersRequestsModel _build() {
    final _$result = _$v ??
        new _$UsersRequestsModel._(
            serial: serial,
            serialnumber: serialnumber,
            alias: alias,
            background_color: background_color,
            avatar: avatar,
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
