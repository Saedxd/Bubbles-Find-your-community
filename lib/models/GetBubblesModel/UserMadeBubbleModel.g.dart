// GENERATED CODE - DO NOT MODIFY BY HAND

part of UserMadeBubbleModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserMadeBubbleModel> _$userMadeBubbleModelSerializer =
    new _$UserMadeBubbleModelSerializer();

class _$UserMadeBubbleModelSerializer
    implements StructuredSerializer<UserMadeBubbleModel> {
  @override
  final Iterable<Type> types = const [
    UserMadeBubbleModel,
    _$UserMadeBubbleModel
  ];
  @override
  final String wireName = 'UserMadeBubbleModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserMadeBubbleModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.first_name;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.last_name;
    if (value != null) {
      result
        ..add('last_name')
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
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
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
    value = object.fcm_token;
    if (value != null) {
      result
        ..add('fcm_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatar_social;
    if (value != null) {
      result
        ..add('avatar_social')
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
    value = object.image1;
    if (value != null) {
      result
        ..add('image1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image2;
    if (value != null) {
      result
        ..add('image2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserMadeBubbleModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserMadeBubbleModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'background_color':
          result.background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
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
        case 'fcm_token':
          result.fcm_token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar_social':
          result.avatar_social = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'serial':
          result.serial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image1':
          result.image1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image2':
          result.image2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserMadeBubbleModel extends UserMadeBubbleModel {
  @override
  final String? email;
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final String? background_color;
  @override
  final String? bio;
  @override
  final String? alias;
  @override
  final String? avatar;
  @override
  final String? fcm_token;
  @override
  final String? avatar_social;
  @override
  final String? serial;
  @override
  final String? image1;
  @override
  final String? image2;

  factory _$UserMadeBubbleModel(
          [void Function(UserMadeBubbleModelBuilder)? updates]) =>
      (new UserMadeBubbleModelBuilder()..update(updates))._build();

  _$UserMadeBubbleModel._(
      {this.email,
      this.first_name,
      this.last_name,
      this.background_color,
      this.bio,
      this.alias,
      this.avatar,
      this.fcm_token,
      this.avatar_social,
      this.serial,
      this.image1,
      this.image2})
      : super._();

  @override
  UserMadeBubbleModel rebuild(
          void Function(UserMadeBubbleModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserMadeBubbleModelBuilder toBuilder() =>
      new UserMadeBubbleModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserMadeBubbleModel &&
        email == other.email &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        background_color == other.background_color &&
        bio == other.bio &&
        alias == other.alias &&
        avatar == other.avatar &&
        fcm_token == other.fcm_token &&
        avatar_social == other.avatar_social &&
        serial == other.serial &&
        image1 == other.image1 &&
        image2 == other.image2;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, email.hashCode),
                                                first_name.hashCode),
                                            last_name.hashCode),
                                        background_color.hashCode),
                                    bio.hashCode),
                                alias.hashCode),
                            avatar.hashCode),
                        fcm_token.hashCode),
                    avatar_social.hashCode),
                serial.hashCode),
            image1.hashCode),
        image2.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserMadeBubbleModel')
          ..add('email', email)
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('background_color', background_color)
          ..add('bio', bio)
          ..add('alias', alias)
          ..add('avatar', avatar)
          ..add('fcm_token', fcm_token)
          ..add('avatar_social', avatar_social)
          ..add('serial', serial)
          ..add('image1', image1)
          ..add('image2', image2))
        .toString();
  }
}

class UserMadeBubbleModelBuilder
    implements Builder<UserMadeBubbleModel, UserMadeBubbleModelBuilder> {
  _$UserMadeBubbleModel? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _fcm_token;
  String? get fcm_token => _$this._fcm_token;
  set fcm_token(String? fcm_token) => _$this._fcm_token = fcm_token;

  String? _avatar_social;
  String? get avatar_social => _$this._avatar_social;
  set avatar_social(String? avatar_social) =>
      _$this._avatar_social = avatar_social;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  String? _image1;
  String? get image1 => _$this._image1;
  set image1(String? image1) => _$this._image1 = image1;

  String? _image2;
  String? get image2 => _$this._image2;
  set image2(String? image2) => _$this._image2 = image2;

  UserMadeBubbleModelBuilder();

  UserMadeBubbleModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _background_color = $v.background_color;
      _bio = $v.bio;
      _alias = $v.alias;
      _avatar = $v.avatar;
      _fcm_token = $v.fcm_token;
      _avatar_social = $v.avatar_social;
      _serial = $v.serial;
      _image1 = $v.image1;
      _image2 = $v.image2;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserMadeBubbleModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserMadeBubbleModel;
  }

  @override
  void update(void Function(UserMadeBubbleModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserMadeBubbleModel build() => _build();

  _$UserMadeBubbleModel _build() {
    final _$result = _$v ??
        new _$UserMadeBubbleModel._(
            email: email,
            first_name: first_name,
            last_name: last_name,
            background_color: background_color,
            bio: bio,
            alias: alias,
            avatar: avatar,
            fcm_token: fcm_token,
            avatar_social: avatar_social,
            serial: serial,
            image1: image1,
            image2: image2);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
