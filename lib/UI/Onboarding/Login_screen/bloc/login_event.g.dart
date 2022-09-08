// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostLOgin extends PostLOgin {
  @override
  final String? Email;
  @override
  final String? password;
  @override
  final String? fcmToken;

  factory _$PostLOgin([void Function(PostLOginBuilder)? updates]) =>
      (new PostLOginBuilder()..update(updates))._build();

  _$PostLOgin._({this.Email, this.password, this.fcmToken}) : super._();

  @override
  PostLOgin rebuild(void Function(PostLOginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostLOginBuilder toBuilder() => new PostLOginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostLOgin &&
        Email == other.Email &&
        password == other.password &&
        fcmToken == other.fcmToken;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, Email.hashCode), password.hashCode), fcmToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostLOgin')
          ..add('Email', Email)
          ..add('password', password)
          ..add('fcmToken', fcmToken))
        .toString();
  }
}

class PostLOginBuilder implements Builder<PostLOgin, PostLOginBuilder> {
  _$PostLOgin? _$v;

  String? _Email;
  String? get Email => _$this._Email;
  set Email(String? Email) => _$this._Email = Email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  PostLOginBuilder();

  PostLOginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Email = $v.Email;
      _password = $v.password;
      _fcmToken = $v.fcmToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostLOgin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostLOgin;
  }

  @override
  void update(void Function(PostLOginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostLOgin build() => _build();

  _$PostLOgin _build() {
    final _$result = _$v ??
        new _$PostLOgin._(Email: Email, password: password, fcmToken: fcmToken);
    replace(_$result);
    return _$result;
  }
}

class _$LoginSocial extends LoginSocial {
  @override
  final String? fcmToken;
  @override
  final String? Token;

  factory _$LoginSocial([void Function(LoginSocialBuilder)? updates]) =>
      (new LoginSocialBuilder()..update(updates))._build();

  _$LoginSocial._({this.fcmToken, this.Token}) : super._();

  @override
  LoginSocial rebuild(void Function(LoginSocialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginSocialBuilder toBuilder() => new LoginSocialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginSocial &&
        fcmToken == other.fcmToken &&
        Token == other.Token;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, fcmToken.hashCode), Token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginSocial')
          ..add('fcmToken', fcmToken)
          ..add('Token', Token))
        .toString();
  }
}

class LoginSocialBuilder implements Builder<LoginSocial, LoginSocialBuilder> {
  _$LoginSocial? _$v;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  String? _Token;
  String? get Token => _$this._Token;
  set Token(String? Token) => _$this._Token = Token;

  LoginSocialBuilder();

  LoginSocialBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fcmToken = $v.fcmToken;
      _Token = $v.Token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginSocial other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginSocial;
  }

  @override
  void update(void Function(LoginSocialBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginSocial build() => _build();

  _$LoginSocial _build() {
    final _$result =
        _$v ?? new _$LoginSocial._(fcmToken: fcmToken, Token: Token);
    replace(_$result);
    return _$result;
  }
}

class _$LoginGoogle extends LoginGoogle {
  @override
  final String? Email;
  @override
  final String? name;
  @override
  final String? fcmToken;
  @override
  final String? avatar;

  factory _$LoginGoogle([void Function(LoginGoogleBuilder)? updates]) =>
      (new LoginGoogleBuilder()..update(updates))._build();

  _$LoginGoogle._({this.Email, this.name, this.fcmToken, this.avatar})
      : super._();

  @override
  LoginGoogle rebuild(void Function(LoginGoogleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginGoogleBuilder toBuilder() => new LoginGoogleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginGoogle &&
        Email == other.Email &&
        name == other.name &&
        fcmToken == other.fcmToken &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, Email.hashCode), name.hashCode), fcmToken.hashCode),
        avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginGoogle')
          ..add('Email', Email)
          ..add('name', name)
          ..add('fcmToken', fcmToken)
          ..add('avatar', avatar))
        .toString();
  }
}

class LoginGoogleBuilder implements Builder<LoginGoogle, LoginGoogleBuilder> {
  _$LoginGoogle? _$v;

  String? _Email;
  String? get Email => _$this._Email;
  set Email(String? Email) => _$this._Email = Email;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  LoginGoogleBuilder();

  LoginGoogleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Email = $v.Email;
      _name = $v.name;
      _fcmToken = $v.fcmToken;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginGoogle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginGoogle;
  }

  @override
  void update(void Function(LoginGoogleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginGoogle build() => _build();

  _$LoginGoogle _build() {
    final _$result = _$v ??
        new _$LoginGoogle._(
            Email: Email, name: name, fcmToken: fcmToken, avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
    replace(_$result);
    return _$result;
  }
}

class _$SetPermission extends SetPermission {
  @override
  final int? is_notify;

  factory _$SetPermission([void Function(SetPermissionBuilder)? updates]) =>
      (new SetPermissionBuilder()..update(updates))._build();

  _$SetPermission._({this.is_notify}) : super._();

  @override
  SetPermission rebuild(void Function(SetPermissionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetPermissionBuilder toBuilder() => new SetPermissionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetPermission && is_notify == other.is_notify;
  }

  @override
  int get hashCode {
    return $jf($jc(0, is_notify.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetPermission')
          ..add('is_notify', is_notify))
        .toString();
  }
}

class SetPermissionBuilder
    implements Builder<SetPermission, SetPermissionBuilder> {
  _$SetPermission? _$v;

  int? _is_notify;
  int? get is_notify => _$this._is_notify;
  set is_notify(int? is_notify) => _$this._is_notify = is_notify;

  SetPermissionBuilder();

  SetPermissionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _is_notify = $v.is_notify;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetPermission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetPermission;
  }

  @override
  void update(void Function(SetPermissionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetPermission build() => _build();

  _$SetPermission _build() {
    final _$result = _$v ?? new _$SetPermission._(is_notify: is_notify);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
