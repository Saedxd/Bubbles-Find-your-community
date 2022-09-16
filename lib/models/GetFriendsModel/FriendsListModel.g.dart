// GENERATED CODE - DO NOT MODIFY BY HAND

part of FriendsListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FriendsListModel> _$friendsListModelSerializer =
    new _$FriendsListModelSerializer();

class _$FriendsListModelSerializer
    implements StructuredSerializer<FriendsListModel> {
  @override
  final Iterable<Type> types = const [FriendsListModel, _$FriendsListModel];
  @override
  final String wireName = 'FriendsListModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, FriendsListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.me_id;
    if (value != null) {
      result
        ..add('me_id')
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
    return result;
  }

  @override
  FriendsListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FriendsListModelBuilder();

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
        case 'me_id':
          result.me_id = serializers.deserialize(value,
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
        case 'serial':
          result.serial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'serialnumber':
          result.serialnumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$FriendsListModel extends FriendsListModel {
  @override
  final int? id;
  @override
  final int? me_id;
  @override
  final String? background_color;
  @override
  final String? alias;
  @override
  final String? avatar;
  @override
  final String? serial;
  @override
  final String? serialnumber;

  factory _$FriendsListModel(
          [void Function(FriendsListModelBuilder)? updates]) =>
      (new FriendsListModelBuilder()..update(updates))._build();

  _$FriendsListModel._(
      {this.id,
      this.me_id,
      this.background_color,
      this.alias,
      this.avatar,
      this.serial,
      this.serialnumber})
      : super._();

  @override
  FriendsListModel rebuild(void Function(FriendsListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendsListModelBuilder toBuilder() =>
      new FriendsListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FriendsListModel &&
        id == other.id &&
        me_id == other.me_id &&
        background_color == other.background_color &&
        alias == other.alias &&
        avatar == other.avatar &&
        serial == other.serial &&
        serialnumber == other.serialnumber;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), me_id.hashCode),
                        background_color.hashCode),
                    alias.hashCode),
                avatar.hashCode),
            serial.hashCode),
        serialnumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FriendsListModel')
          ..add('id', id)
          ..add('me_id', me_id)
          ..add('background_color', background_color)
          ..add('alias', alias)
          ..add('avatar', avatar)
          ..add('serial', serial)
          ..add('serialnumber', serialnumber))
        .toString();
  }
}

class FriendsListModelBuilder
    implements Builder<FriendsListModel, FriendsListModelBuilder> {
  _$FriendsListModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _me_id;
  int? get me_id => _$this._me_id;
  set me_id(int? me_id) => _$this._me_id = me_id;

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

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  String? _serialnumber;
  String? get serialnumber => _$this._serialnumber;
  set serialnumber(String? serialnumber) => _$this._serialnumber = serialnumber;

  FriendsListModelBuilder();

  FriendsListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _me_id = $v.me_id;
      _background_color = $v.background_color;
      _alias = $v.alias;
      _avatar = $v.avatar;
      _serial = $v.serial;
      _serialnumber = $v.serialnumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FriendsListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FriendsListModel;
  }

  @override
  void update(void Function(FriendsListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FriendsListModel build() => _build();

  _$FriendsListModel _build() {
    final _$result = _$v ??
        new _$FriendsListModel._(
            id: id,
            me_id: me_id,
            background_color: background_color,
            alias: alias,
            avatar: avatar,
            serial: serial,
            serialnumber: serialnumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
