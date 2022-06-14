// GENERATED CODE - DO NOT MODIFY BY HAND

part of DataModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DateModel> _$dateModelSerializer = new _$DateModelSerializer();

class _$DateModelSerializer implements StructuredSerializer<DateModel> {
  @override
  final Iterable<Type> types = const [DateModel, _$DateModel];
  @override
  final String wireName = 'DateModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, DateModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.is_creator;
    if (value != null) {
      result
        ..add('is_creator')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.first_name;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updated_at;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
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
    value = object.alias;
    if (value != null) {
      result
        ..add('alias')
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
    value = object.fcm_token;
    if (value != null) {
      result
        ..add('fcm_token')
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
    value = object.is_notify;
    if (value != null) {
      result
        ..add('is_notify')
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
  DateModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DateModelBuilder();

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
        case 'is_verify':
          result.is_verify = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_creator':
          result.is_creator = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
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
        case 'alias':
          result.alias = serializers.deserialize(value,
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
        case 'fcm_token':
          result.fcm_token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_notify':
          result.is_notify = serializers.deserialize(value,
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

class _$DateModel extends DateModel {
  @override
  final int? id;
  @override
  final int? is_verify;
  @override
  final int? is_creator;
  @override
  final int? gender;
  @override
  final String? email;
  @override
  final String? last_name;
  @override
  final String? first_name;
  @override
  final String? updated_at;
  @override
  final String? created_at;
  @override
  final String? background_color;
  @override
  final String? birth_date;
  @override
  final String? bio;
  @override
  final String? alias;
  @override
  final String? serial;
  @override
  final String? image1;
  @override
  final String? image2;
  @override
  final String? fcm_token;
  @override
  final String? avatar;
  @override
  final int? is_notify;
  @override
  final int? points;

  factory _$DateModel([void Function(DateModelBuilder)? updates]) =>
      (new DateModelBuilder()..update(updates))._build();

  _$DateModel._(
      {this.id,
      this.is_verify,
      this.is_creator,
      this.gender,
      this.email,
      this.last_name,
      this.first_name,
      this.updated_at,
      this.created_at,
      this.background_color,
      this.birth_date,
      this.bio,
      this.alias,
      this.serial,
      this.image1,
      this.image2,
      this.fcm_token,
      this.avatar,
      this.is_notify,
      this.points})
      : super._();

  @override
  DateModel rebuild(void Function(DateModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DateModelBuilder toBuilder() => new DateModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateModel &&
        id == other.id &&
        is_verify == other.is_verify &&
        is_creator == other.is_creator &&
        gender == other.gender &&
        email == other.email &&
        last_name == other.last_name &&
        first_name == other.first_name &&
        updated_at == other.updated_at &&
        created_at == other.created_at &&
        background_color == other.background_color &&
        birth_date == other.birth_date &&
        bio == other.bio &&
        alias == other.alias &&
        serial == other.serial &&
        image1 == other.image1 &&
        image2 == other.image2 &&
        fcm_token == other.fcm_token &&
        avatar == other.avatar &&
        is_notify == other.is_notify &&
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
                                                                            $jc($jc(0, id.hashCode),
                                                                                is_verify.hashCode),
                                                                            is_creator.hashCode),
                                                                        gender.hashCode),
                                                                    email.hashCode),
                                                                last_name.hashCode),
                                                            first_name.hashCode),
                                                        updated_at.hashCode),
                                                    created_at.hashCode),
                                                background_color.hashCode),
                                            birth_date.hashCode),
                                        bio.hashCode),
                                    alias.hashCode),
                                serial.hashCode),
                            image1.hashCode),
                        image2.hashCode),
                    fcm_token.hashCode),
                avatar.hashCode),
            is_notify.hashCode),
        points.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DateModel')
          ..add('id', id)
          ..add('is_verify', is_verify)
          ..add('is_creator', is_creator)
          ..add('gender', gender)
          ..add('email', email)
          ..add('last_name', last_name)
          ..add('first_name', first_name)
          ..add('updated_at', updated_at)
          ..add('created_at', created_at)
          ..add('background_color', background_color)
          ..add('birth_date', birth_date)
          ..add('bio', bio)
          ..add('alias', alias)
          ..add('serial', serial)
          ..add('image1', image1)
          ..add('image2', image2)
          ..add('fcm_token', fcm_token)
          ..add('avatar', avatar)
          ..add('is_notify', is_notify)
          ..add('points', points))
        .toString();
  }
}

class DateModelBuilder implements Builder<DateModel, DateModelBuilder> {
  _$DateModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _is_verify;
  int? get is_verify => _$this._is_verify;
  set is_verify(int? is_verify) => _$this._is_verify = is_verify;

  int? _is_creator;
  int? get is_creator => _$this._is_creator;
  set is_creator(int? is_creator) => _$this._is_creator = is_creator;

  int? _gender;
  int? get gender => _$this._gender;
  set gender(int? gender) => _$this._gender = gender;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _updated_at;
  String? get updated_at => _$this._updated_at;
  set updated_at(String? updated_at) => _$this._updated_at = updated_at;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

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

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  String? _image1;
  String? get image1 => _$this._image1;
  set image1(String? image1) => _$this._image1 = image1;

  String? _image2;
  String? get image2 => _$this._image2;
  set image2(String? image2) => _$this._image2 = image2;

  String? _fcm_token;
  String? get fcm_token => _$this._fcm_token;
  set fcm_token(String? fcm_token) => _$this._fcm_token = fcm_token;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  int? _is_notify;
  int? get is_notify => _$this._is_notify;
  set is_notify(int? is_notify) => _$this._is_notify = is_notify;

  int? _points;
  int? get points => _$this._points;
  set points(int? points) => _$this._points = points;

  DateModelBuilder();

  DateModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _is_verify = $v.is_verify;
      _is_creator = $v.is_creator;
      _gender = $v.gender;
      _email = $v.email;
      _last_name = $v.last_name;
      _first_name = $v.first_name;
      _updated_at = $v.updated_at;
      _created_at = $v.created_at;
      _background_color = $v.background_color;
      _birth_date = $v.birth_date;
      _bio = $v.bio;
      _alias = $v.alias;
      _serial = $v.serial;
      _image1 = $v.image1;
      _image2 = $v.image2;
      _fcm_token = $v.fcm_token;
      _avatar = $v.avatar;
      _is_notify = $v.is_notify;
      _points = $v.points;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DateModel;
  }

  @override
  void update(void Function(DateModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DateModel build() => _build();

  _$DateModel _build() {
    final _$result = _$v ??
        new _$DateModel._(
            id: id,
            is_verify: is_verify,
            is_creator: is_creator,
            gender: gender,
            email: email,
            last_name: last_name,
            first_name: first_name,
            updated_at: updated_at,
            created_at: created_at,
            background_color: background_color,
            birth_date: birth_date,
            bio: bio,
            alias: alias,
            serial: serial,
            image1: image1,
            image2: image2,
            fcm_token: fcm_token,
            avatar: avatar,
            is_notify: is_notify,
            points: points);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
