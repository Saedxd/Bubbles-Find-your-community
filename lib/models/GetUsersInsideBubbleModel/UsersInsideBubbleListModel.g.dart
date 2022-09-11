// GENERATED CODE - DO NOT MODIFY BY HAND

part of UsersInsideBubbleListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersInsideBubbleListModel> _$usersInsideBubbleListModelSerializer =
    new _$UsersInsideBubbleListModelSerializer();

class _$UsersInsideBubbleListModelSerializer
    implements StructuredSerializer<UsersInsideBubbleListModel> {
  @override
  final Iterable<Type> types = const [
    UsersInsideBubbleListModel,
    _$UsersInsideBubbleListModel
  ];
  @override
  final String wireName = 'UsersInsideBubbleListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UsersInsideBubbleListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.me_id;
    if (value != null) {
      result
        ..add('me_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
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
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_friend;
    if (value != null) {
      result
        ..add('is_friend')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  UsersInsideBubbleListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersInsideBubbleListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'me_id':
          result.me_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
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
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_friend':
          result.is_friend = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersInsideBubbleListModel extends UsersInsideBubbleListModel {
  @override
  final int? me_id;
  @override
  final int? id;
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
  final String? bio;
  @override
  final bool? is_friend;

  factory _$UsersInsideBubbleListModel(
          [void Function(UsersInsideBubbleListModelBuilder)? updates]) =>
      (new UsersInsideBubbleListModelBuilder()..update(updates))._build();

  _$UsersInsideBubbleListModel._(
      {this.me_id,
      this.id,
      this.serial,
      this.serialnumber,
      this.alias,
      this.background_color,
      this.avatar,
      this.bio,
      this.is_friend})
      : super._();

  @override
  UsersInsideBubbleListModel rebuild(
          void Function(UsersInsideBubbleListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersInsideBubbleListModelBuilder toBuilder() =>
      new UsersInsideBubbleListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersInsideBubbleListModel &&
        me_id == other.me_id &&
        id == other.id &&
        serial == other.serial &&
        serialnumber == other.serialnumber &&
        alias == other.alias &&
        background_color == other.background_color &&
        avatar == other.avatar &&
        bio == other.bio &&
        is_friend == other.is_friend;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, me_id.hashCode), id.hashCode),
                                serial.hashCode),
                            serialnumber.hashCode),
                        alias.hashCode),
                    background_color.hashCode),
                avatar.hashCode),
            bio.hashCode),
        is_friend.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersInsideBubbleListModel')
          ..add('me_id', me_id)
          ..add('id', id)
          ..add('serial', serial)
          ..add('serialnumber', serialnumber)
          ..add('alias', alias)
          ..add('background_color', background_color)
          ..add('avatar', avatar)
          ..add('bio', bio)
          ..add('is_friend', is_friend))
        .toString();
  }
}

class UsersInsideBubbleListModelBuilder
    implements
        Builder<UsersInsideBubbleListModel, UsersInsideBubbleListModelBuilder> {
  _$UsersInsideBubbleListModel? _$v;

  int? _me_id;
  int? get me_id => _$this._me_id;
  set me_id(int? me_id) => _$this._me_id = me_id;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  bool? _is_friend;
  bool? get is_friend => _$this._is_friend;
  set is_friend(bool? is_friend) => _$this._is_friend = is_friend;

  UsersInsideBubbleListModelBuilder();

  UsersInsideBubbleListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _me_id = $v.me_id;
      _id = $v.id;
      _serial = $v.serial;
      _serialnumber = $v.serialnumber;
      _alias = $v.alias;
      _background_color = $v.background_color;
      _avatar = $v.avatar;
      _bio = $v.bio;
      _is_friend = $v.is_friend;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersInsideBubbleListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersInsideBubbleListModel;
  }

  @override
  void update(void Function(UsersInsideBubbleListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersInsideBubbleListModel build() => _build();

  _$UsersInsideBubbleListModel _build() {
    final _$result = _$v ??
        new _$UsersInsideBubbleListModel._(
            me_id: me_id,
            id: id,
            serial: serial,
            serialnumber: serialnumber,
            alias: alias,
            background_color: background_color,
            avatar: avatar,
            bio: bio,
            is_friend: is_friend);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
