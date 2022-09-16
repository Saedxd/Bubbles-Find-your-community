// GENERATED CODE - DO NOT MODIFY BY HAND

part of UserProfileData;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserProfileData> _$userProfileDataSerializer =
    new _$UserProfileDataSerializer();

class _$UserProfileDataSerializer
    implements StructuredSerializer<UserProfileData> {
  @override
  final Iterable<Type> types = const [UserProfileData, _$UserProfileData];
  @override
  final String wireName = 'UserProfileData';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.birth_date;
    if (value != null) {
      result
        ..add('birth_date')
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
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
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
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_verify;
    if (value != null) {
      result
        ..add('is_verify')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_notify;
    if (value != null) {
      result
        ..add('is_notify')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_creator;
    if (value != null) {
      result
        ..add('is_creator')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lattitude;
    if (value != null) {
      result
        ..add('lattitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.langtitude;
    if (value != null) {
      result
        ..add('langtitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.interests;
    if (value != null) {
      result
        ..add('interests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(InterestsProfileModel)])));
    }
    value = object.is_register;
    if (value != null) {
      result
        ..add('is_register')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.daily_login;
    if (value != null) {
      result
        ..add('daily_login')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.added_user;
    if (value != null) {
      result
        ..add('added_user')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.invitation;
    if (value != null) {
      result
        ..add('invitation')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.visit_bubble;
    if (value != null) {
      result
        ..add('visit_bubble')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.points;
    if (value != null) {
      result
        ..add('points')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UserProfileData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserProfileDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'serial':
          result.serial = serializers.deserialize(value,
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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'background_color':
          result.background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birth_date':
          result.birth_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
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
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'serialnumber':
          result.serialnumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_verify':
          result.is_verify = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_notify':
          result.is_notify = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_creator':
          result.is_creator = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lattitude':
          result.lattitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'langtitude':
          result.langtitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'interests':
          result.interests.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(InterestsProfileModel)
              ]))! as BuiltList<Object?>);
          break;
        case 'is_register':
          result.is_register = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'daily_login':
          result.daily_login = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'added_user':
          result.added_user = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'invitation':
          result.invitation = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'visit_bubble':
          result.visit_bubble = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'points':
          result.points = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserProfileData extends UserProfileData {
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final String? serial;
  @override
  final String? alias;
  @override
  final String? avatar;
  @override
  final String? email;
  @override
  final String? background_color;
  @override
  final String? birth_date;
  @override
  final String? bio;
  @override
  final String? fcm_token;
  @override
  final String? avatar_social;
  @override
  final String? gender;
  @override
  final String? serialnumber;
  @override
  final int? id;
  @override
  final int? is_verify;
  @override
  final int? is_notify;
  @override
  final int? is_creator;
  @override
  final String? lattitude;
  @override
  final String? langtitude;
  @override
  final BuiltList<InterestsProfileModel>? interests;
  @override
  final int? is_register;
  @override
  final int? daily_login;
  @override
  final int? added_user;
  @override
  final int? invitation;
  @override
  final int? visit_bubble;
  @override
  final int? points;

  factory _$UserProfileData([void Function(UserProfileDataBuilder)? updates]) =>
      (new UserProfileDataBuilder()..update(updates))._build();

  _$UserProfileData._(
      {this.first_name,
      this.last_name,
      this.serial,
      this.alias,
      this.avatar,
      this.email,
      this.background_color,
      this.birth_date,
      this.bio,
      this.fcm_token,
      this.avatar_social,
      this.gender,
      this.serialnumber,
      this.id,
      this.is_verify,
      this.is_notify,
      this.is_creator,
      this.lattitude,
      this.langtitude,
      this.interests,
      this.is_register,
      this.daily_login,
      this.added_user,
      this.invitation,
      this.visit_bubble,
      this.points})
      : super._();

  @override
  UserProfileData rebuild(void Function(UserProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileDataBuilder toBuilder() =>
      new UserProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileData &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        serial == other.serial &&
        alias == other.alias &&
        avatar == other.avatar &&
        email == other.email &&
        background_color == other.background_color &&
        birth_date == other.birth_date &&
        bio == other.bio &&
        fcm_token == other.fcm_token &&
        avatar_social == other.avatar_social &&
        gender == other.gender &&
        serialnumber == other.serialnumber &&
        id == other.id &&
        is_verify == other.is_verify &&
        is_notify == other.is_notify &&
        is_creator == other.is_creator &&
        lattitude == other.lattitude &&
        langtitude == other.langtitude &&
        interests == other.interests &&
        is_register == other.is_register &&
        daily_login == other.daily_login &&
        added_user == other.added_user &&
        invitation == other.invitation &&
        visit_bubble == other.visit_bubble &&
        points == other.points;
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc(0, first_name.hashCode), last_name.hashCode), serial.hashCode), alias.hashCode), avatar.hashCode), email.hashCode), background_color.hashCode),
                                                                                birth_date.hashCode),
                                                                            bio.hashCode),
                                                                        fcm_token.hashCode),
                                                                    avatar_social.hashCode),
                                                                gender.hashCode),
                                                            serialnumber.hashCode),
                                                        id.hashCode),
                                                    is_verify.hashCode),
                                                is_notify.hashCode),
                                            is_creator.hashCode),
                                        lattitude.hashCode),
                                    langtitude.hashCode),
                                interests.hashCode),
                            is_register.hashCode),
                        daily_login.hashCode),
                    added_user.hashCode),
                invitation.hashCode),
            visit_bubble.hashCode),
        points.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProfileData')
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('serial', serial)
          ..add('alias', alias)
          ..add('avatar', avatar)
          ..add('email', email)
          ..add('background_color', background_color)
          ..add('birth_date', birth_date)
          ..add('bio', bio)
          ..add('fcm_token', fcm_token)
          ..add('avatar_social', avatar_social)
          ..add('gender', gender)
          ..add('serialnumber', serialnumber)
          ..add('id', id)
          ..add('is_verify', is_verify)
          ..add('is_notify', is_notify)
          ..add('is_creator', is_creator)
          ..add('lattitude', lattitude)
          ..add('langtitude', langtitude)
          ..add('interests', interests)
          ..add('is_register', is_register)
          ..add('daily_login', daily_login)
          ..add('added_user', added_user)
          ..add('invitation', invitation)
          ..add('visit_bubble', visit_bubble)
          ..add('points', points))
        .toString();
  }
}

class UserProfileDataBuilder
    implements Builder<UserProfileData, UserProfileDataBuilder> {
  _$UserProfileData? _$v;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _birth_date;
  String? get birth_date => _$this._birth_date;
  set birth_date(String? birth_date) => _$this._birth_date = birth_date;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _fcm_token;
  String? get fcm_token => _$this._fcm_token;
  set fcm_token(String? fcm_token) => _$this._fcm_token = fcm_token;

  String? _avatar_social;
  String? get avatar_social => _$this._avatar_social;
  set avatar_social(String? avatar_social) =>
      _$this._avatar_social = avatar_social;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _serialnumber;
  String? get serialnumber => _$this._serialnumber;
  set serialnumber(String? serialnumber) => _$this._serialnumber = serialnumber;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _is_verify;
  int? get is_verify => _$this._is_verify;
  set is_verify(int? is_verify) => _$this._is_verify = is_verify;

  int? _is_notify;
  int? get is_notify => _$this._is_notify;
  set is_notify(int? is_notify) => _$this._is_notify = is_notify;

  int? _is_creator;
  int? get is_creator => _$this._is_creator;
  set is_creator(int? is_creator) => _$this._is_creator = is_creator;

  String? _lattitude;
  String? get lattitude => _$this._lattitude;
  set lattitude(String? lattitude) => _$this._lattitude = lattitude;

  String? _langtitude;
  String? get langtitude => _$this._langtitude;
  set langtitude(String? langtitude) => _$this._langtitude = langtitude;

  ListBuilder<InterestsProfileModel>? _interests;
  ListBuilder<InterestsProfileModel> get interests =>
      _$this._interests ??= new ListBuilder<InterestsProfileModel>();
  set interests(ListBuilder<InterestsProfileModel>? interests) =>
      _$this._interests = interests;

  int? _is_register;
  int? get is_register => _$this._is_register;
  set is_register(int? is_register) => _$this._is_register = is_register;

  int? _daily_login;
  int? get daily_login => _$this._daily_login;
  set daily_login(int? daily_login) => _$this._daily_login = daily_login;

  int? _added_user;
  int? get added_user => _$this._added_user;
  set added_user(int? added_user) => _$this._added_user = added_user;

  int? _invitation;
  int? get invitation => _$this._invitation;
  set invitation(int? invitation) => _$this._invitation = invitation;

  int? _visit_bubble;
  int? get visit_bubble => _$this._visit_bubble;
  set visit_bubble(int? visit_bubble) => _$this._visit_bubble = visit_bubble;

  int? _points;
  int? get points => _$this._points;
  set points(int? points) => _$this._points = points;

  UserProfileDataBuilder();

  UserProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _serial = $v.serial;
      _alias = $v.alias;
      _avatar = $v.avatar;
      _email = $v.email;
      _background_color = $v.background_color;
      _birth_date = $v.birth_date;
      _bio = $v.bio;
      _fcm_token = $v.fcm_token;
      _avatar_social = $v.avatar_social;
      _gender = $v.gender;
      _serialnumber = $v.serialnumber;
      _id = $v.id;
      _is_verify = $v.is_verify;
      _is_notify = $v.is_notify;
      _is_creator = $v.is_creator;
      _lattitude = $v.lattitude;
      _langtitude = $v.langtitude;
      _interests = $v.interests?.toBuilder();
      _is_register = $v.is_register;
      _daily_login = $v.daily_login;
      _added_user = $v.added_user;
      _invitation = $v.invitation;
      _visit_bubble = $v.visit_bubble;
      _points = $v.points;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProfileData;
  }

  @override
  void update(void Function(UserProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProfileData build() => _build();

  _$UserProfileData _build() {
    _$UserProfileData _$result;
    try {
      _$result = _$v ??
          new _$UserProfileData._(
              first_name: first_name,
              last_name: last_name,
              serial: serial,
              alias: alias,
              avatar: avatar,
              email: email,
              background_color: background_color,
              birth_date: birth_date,
              bio: bio,
              fcm_token: fcm_token,
              avatar_social: avatar_social,
              gender: gender,
              serialnumber: serialnumber,
              id: id,
              is_verify: is_verify,
              is_notify: is_notify,
              is_creator: is_creator,
              lattitude: lattitude,
              langtitude: langtitude,
              interests: _interests?.build(),
              is_register: is_register,
              daily_login: daily_login,
              added_user: added_user,
              invitation: invitation,
              visit_bubble: visit_bubble,
              points: points);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'interests';
        _interests?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserProfileData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
