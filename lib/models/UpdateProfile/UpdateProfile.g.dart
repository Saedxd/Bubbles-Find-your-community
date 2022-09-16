// GENERATED CODE - DO NOT MODIFY BY HAND

part of UpdateProfile;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateProfile> _$updateProfileSerializer =
    new _$UpdateProfileSerializer();

class _$UpdateProfileSerializer implements StructuredSerializer<UpdateProfile> {
  @override
  final Iterable<Type> types = const [UpdateProfile, _$UpdateProfile];
  @override
  final String wireName = 'UpdateProfile';

  @override
  Iterable<Object?> serialize(Serializers serializers, UpdateProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.msg;
    if (value != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statuscode;
    if (value != null) {
      result
        ..add('statuscode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserModel)));
    }
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UpdateProfile deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpdateProfileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UpdateProfile extends UpdateProfile {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final UserModel? user;
  @override
  final String? error;

  factory _$UpdateProfile([void Function(UpdateProfileBuilder)? updates]) =>
      (new UpdateProfileBuilder()..update(updates))._build();

  _$UpdateProfile._({this.msg, this.statuscode, this.user, this.error})
      : super._();

  @override
  UpdateProfile rebuild(void Function(UpdateProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateProfileBuilder toBuilder() => new UpdateProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateProfile &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        user == other.user &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), user.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateProfile')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('user', user)
          ..add('error', error))
        .toString();
  }
}

class UpdateProfileBuilder
    implements Builder<UpdateProfile, UpdateProfileBuilder> {
  _$UpdateProfile? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  UpdateProfileBuilder();

  UpdateProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _user = $v.user?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateProfile;
  }

  @override
  void update(void Function(UpdateProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProfile build() => _build();

  _$UpdateProfile _build() {
    _$UpdateProfile _$result;
    try {
      _$result = _$v ??
          new _$UpdateProfile._(
              msg: msg,
              statuscode: statuscode,
              user: _user?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateProfile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
