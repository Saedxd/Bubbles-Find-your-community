// GENERATED CODE - DO NOT MODIFY BY HAND

part of ProfileDateModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileDateModel> _$profileDateModelSerializer =
    new _$ProfileDateModelSerializer();

class _$ProfileDateModelSerializer
    implements StructuredSerializer<ProfileDateModel> {
  @override
  final Iterable<Type> types = const [ProfileDateModel, _$ProfileDateModel];
  @override
  final String wireName = 'ProfileDateModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfileDateModel object,
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
            specifiedType: const FullType(UserProfileData)));
    }
    return result;
  }

  @override
  ProfileDateModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileDateModelBuilder();

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
                  specifiedType: const FullType(UserProfileData))!
              as UserProfileData);
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileDateModel extends ProfileDateModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final UserProfileData? user;

  factory _$ProfileDateModel(
          [void Function(ProfileDateModelBuilder)? updates]) =>
      (new ProfileDateModelBuilder()..update(updates))._build();

  _$ProfileDateModel._({this.msg, this.statuscode, this.user}) : super._();

  @override
  ProfileDateModel rebuild(void Function(ProfileDateModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileDateModelBuilder toBuilder() =>
      new ProfileDateModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileDateModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileDateModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('user', user))
        .toString();
  }
}

class ProfileDateModelBuilder
    implements Builder<ProfileDateModel, ProfileDateModelBuilder> {
  _$ProfileDateModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  UserProfileDataBuilder? _user;
  UserProfileDataBuilder get user =>
      _$this._user ??= new UserProfileDataBuilder();
  set user(UserProfileDataBuilder? user) => _$this._user = user;

  ProfileDateModelBuilder();

  ProfileDateModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileDateModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileDateModel;
  }

  @override
  void update(void Function(ProfileDateModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileDateModel build() => _build();

  _$ProfileDateModel _build() {
    _$ProfileDateModel _$result;
    try {
      _$result = _$v ??
          new _$ProfileDateModel._(
              msg: msg, statuscode: statuscode, user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProfileDateModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
