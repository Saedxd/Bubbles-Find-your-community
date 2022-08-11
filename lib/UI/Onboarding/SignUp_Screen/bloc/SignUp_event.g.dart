// GENERATED CODE - DO NOT MODIFY BY HAND

part of SignUp_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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
    return newBuiltValueToStringHelper('ClearError').toString();
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

class _$PostSignUp extends PostSignUp {
  @override
  final String? Email;
  @override
  final String? password;
  @override
  final String? fcmToken;
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final int? Genter;
  @override
  final String? background_color;
  @override
  final String? bio;
  @override
  final String? birth_date;
  @override
  final List<int>? interests;
  @override
  final int? avatarID;
  @override
  final String? alias;

  factory _$PostSignUp([void Function(PostSignUpBuilder)? updates]) =>
      (new PostSignUpBuilder()..update(updates))._build();

  _$PostSignUp._(
      {this.Email,
      this.password,
      this.fcmToken,
      this.first_name,
      this.last_name,
      this.Genter,
      this.background_color,
      this.bio,
      this.birth_date,
      this.interests,
      this.avatarID,
      this.alias})
      : super._();

  @override
  PostSignUp rebuild(void Function(PostSignUpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostSignUpBuilder toBuilder() => new PostSignUpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostSignUp &&
        Email == other.Email &&
        password == other.password &&
        fcmToken == other.fcmToken &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        Genter == other.Genter &&
        background_color == other.background_color &&
        bio == other.bio &&
        birth_date == other.birth_date &&
        interests == other.interests &&
        avatarID == other.avatarID &&
        alias == other.alias;
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
                                            $jc($jc(0, Email.hashCode),
                                                password.hashCode),
                                            fcmToken.hashCode),
                                        first_name.hashCode),
                                    last_name.hashCode),
                                Genter.hashCode),
                            background_color.hashCode),
                        bio.hashCode),
                    birth_date.hashCode),
                interests.hashCode),
            avatarID.hashCode),
        alias.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostSignUp')
          ..add('Email', Email)
          ..add('password', password)
          ..add('fcmToken', fcmToken)
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('Genter', Genter)
          ..add('background_color', background_color)
          ..add('bio', bio)
          ..add('birth_date', birth_date)
          ..add('interests', interests)
          ..add('avatarID', avatarID)
          ..add('alias', alias))
        .toString();
  }
}

class PostSignUpBuilder implements Builder<PostSignUp, PostSignUpBuilder> {
  _$PostSignUp? _$v;

  String? _Email;
  String? get Email => _$this._Email;
  set Email(String? Email) => _$this._Email = Email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  int? _Genter;
  int? get Genter => _$this._Genter;
  set Genter(int? Genter) => _$this._Genter = Genter;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _birth_date;
  String? get birth_date => _$this._birth_date;
  set birth_date(String? birth_date) => _$this._birth_date = birth_date;

  List<int>? _interests;
  List<int>? get interests => _$this._interests;
  set interests(List<int>? interests) => _$this._interests = interests;

  int? _avatarID;
  int? get avatarID => _$this._avatarID;
  set avatarID(int? avatarID) => _$this._avatarID = avatarID;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  PostSignUpBuilder();

  PostSignUpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Email = $v.Email;
      _password = $v.password;
      _fcmToken = $v.fcmToken;
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _Genter = $v.Genter;
      _background_color = $v.background_color;
      _bio = $v.bio;
      _birth_date = $v.birth_date;
      _interests = $v.interests;
      _avatarID = $v.avatarID;
      _alias = $v.alias;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostSignUp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostSignUp;
  }

  @override
  void update(void Function(PostSignUpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostSignUp build() => _build();

  _$PostSignUp _build() {
    final _$result = _$v ??
        new _$PostSignUp._(
            Email: Email,
            password: password,
            fcmToken: fcmToken,
            first_name: first_name,
            last_name: last_name,
            Genter: Genter,
            background_color: background_color,
            bio: bio,
            birth_date: birth_date,
            interests: interests,
            avatarID: avatarID,
            alias: alias);
    replace(_$result);
    return _$result;
  }
}

class _$SocialUpdateProfile extends SocialUpdateProfile {
  @override
  final String? fcmToken;
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final int? Genter;
  @override
  final String? background_color;
  @override
  final String? bio;
  @override
  final String? birth_date;
  @override
  final List<int>? interests;
  @override
  final int? avatarid;
  @override
  final String? alias;

  factory _$SocialUpdateProfile(
          [void Function(SocialUpdateProfileBuilder)? updates]) =>
      (new SocialUpdateProfileBuilder()..update(updates))._build();

  _$SocialUpdateProfile._(
      {this.fcmToken,
      this.first_name,
      this.last_name,
      this.Genter,
      this.background_color,
      this.bio,
      this.birth_date,
      this.interests,
      this.avatarid,
      this.alias})
      : super._();

  @override
  SocialUpdateProfile rebuild(
          void Function(SocialUpdateProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocialUpdateProfileBuilder toBuilder() =>
      new SocialUpdateProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocialUpdateProfile &&
        fcmToken == other.fcmToken &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        Genter == other.Genter &&
        background_color == other.background_color &&
        bio == other.bio &&
        birth_date == other.birth_date &&
        interests == other.interests &&
        avatarid == other.avatarid &&
        alias == other.alias;
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
                                    $jc($jc(0, fcmToken.hashCode),
                                        first_name.hashCode),
                                    last_name.hashCode),
                                Genter.hashCode),
                            background_color.hashCode),
                        bio.hashCode),
                    birth_date.hashCode),
                interests.hashCode),
            avatarid.hashCode),
        alias.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SocialUpdateProfile')
          ..add('fcmToken', fcmToken)
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('Genter', Genter)
          ..add('background_color', background_color)
          ..add('bio', bio)
          ..add('birth_date', birth_date)
          ..add('interests', interests)
          ..add('avatarid', avatarid)
          ..add('alias', alias))
        .toString();
  }
}

class SocialUpdateProfileBuilder
    implements Builder<SocialUpdateProfile, SocialUpdateProfileBuilder> {
  _$SocialUpdateProfile? _$v;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  int? _Genter;
  int? get Genter => _$this._Genter;
  set Genter(int? Genter) => _$this._Genter = Genter;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _birth_date;
  String? get birth_date => _$this._birth_date;
  set birth_date(String? birth_date) => _$this._birth_date = birth_date;

  List<int>? _interests;
  List<int>? get interests => _$this._interests;
  set interests(List<int>? interests) => _$this._interests = interests;

  int? _avatarid;
  int? get avatarid => _$this._avatarid;
  set avatarid(int? avatarid) => _$this._avatarid = avatarid;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  SocialUpdateProfileBuilder();

  SocialUpdateProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fcmToken = $v.fcmToken;
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _Genter = $v.Genter;
      _background_color = $v.background_color;
      _bio = $v.bio;
      _birth_date = $v.birth_date;
      _interests = $v.interests;
      _avatarid = $v.avatarid;
      _alias = $v.alias;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocialUpdateProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SocialUpdateProfile;
  }

  @override
  void update(void Function(SocialUpdateProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SocialUpdateProfile build() => _build();

  _$SocialUpdateProfile _build() {
    final _$result = _$v ??
        new _$SocialUpdateProfile._(
            fcmToken: fcmToken,
            first_name: first_name,
            last_name: last_name,
            Genter: Genter,
            background_color: background_color,
            bio: bio,
            birth_date: birth_date,
            interests: interests,
            avatarid: avatarid,
            alias: alias);
    replace(_$result);
    return _$result;
  }
}

class _$GetGender extends GetGender {
  factory _$GetGender([void Function(GetGenderBuilder)? updates]) =>
      (new GetGenderBuilder()..update(updates))._build();

  _$GetGender._() : super._();

  @override
  GetGender rebuild(void Function(GetGenderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetGenderBuilder toBuilder() => new GetGenderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetGender;
  }

  @override
  int get hashCode {
    return 723127659;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetGender').toString();
  }
}

class GetGenderBuilder implements Builder<GetGender, GetGenderBuilder> {
  _$GetGender? _$v;

  GetGenderBuilder();

  @override
  void replace(GetGender other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetGender;
  }

  @override
  void update(void Function(GetGenderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetGender build() => _build();

  _$GetGender _build() {
    final _$result = _$v ?? new _$GetGender._();
    replace(_$result);
    return _$result;
  }
}

class _$ChangePickedColor extends ChangePickedColor {
  @override
  final String? PickedColor;

  factory _$ChangePickedColor(
          [void Function(ChangePickedColorBuilder)? updates]) =>
      (new ChangePickedColorBuilder()..update(updates))._build();

  _$ChangePickedColor._({this.PickedColor}) : super._();

  @override
  ChangePickedColor rebuild(void Function(ChangePickedColorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangePickedColorBuilder toBuilder() =>
      new ChangePickedColorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangePickedColor && PickedColor == other.PickedColor;
  }

  @override
  int get hashCode {
    return $jf($jc(0, PickedColor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangePickedColor')
          ..add('PickedColor', PickedColor))
        .toString();
  }
}

class ChangePickedColorBuilder
    implements Builder<ChangePickedColor, ChangePickedColorBuilder> {
  _$ChangePickedColor? _$v;

  String? _PickedColor;
  String? get PickedColor => _$this._PickedColor;
  set PickedColor(String? PickedColor) => _$this._PickedColor = PickedColor;

  ChangePickedColorBuilder();

  ChangePickedColorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _PickedColor = $v.PickedColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangePickedColor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangePickedColor;
  }

  @override
  void update(void Function(ChangePickedColorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangePickedColor build() => _build();

  _$ChangePickedColor _build() {
    final _$result = _$v ?? new _$ChangePickedColor._(PickedColor: PickedColor);
    replace(_$result);
    return _$result;
  }
}

class _$GetInterests extends GetInterests {
  factory _$GetInterests([void Function(GetInterestsBuilder)? updates]) =>
      (new GetInterestsBuilder()..update(updates))._build();

  _$GetInterests._() : super._();

  @override
  GetInterests rebuild(void Function(GetInterestsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetInterestsBuilder toBuilder() => new GetInterestsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetInterests;
  }

  @override
  int get hashCode {
    return 506979885;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetInterests').toString();
  }
}

class GetInterestsBuilder
    implements Builder<GetInterests, GetInterestsBuilder> {
  _$GetInterests? _$v;

  GetInterestsBuilder();

  @override
  void replace(GetInterests other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetInterests;
  }

  @override
  void update(void Function(GetInterestsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetInterests build() => _build();

  _$GetInterests _build() {
    final _$result = _$v ?? new _$GetInterests._();
    replace(_$result);
    return _$result;
  }
}

class _$GetSubGenders extends GetSubGenders {
  factory _$GetSubGenders([void Function(GetSubGendersBuilder)? updates]) =>
      (new GetSubGendersBuilder()..update(updates))._build();

  _$GetSubGenders._() : super._();

  @override
  GetSubGenders rebuild(void Function(GetSubGendersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSubGendersBuilder toBuilder() => new GetSubGendersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSubGenders;
  }

  @override
  int get hashCode {
    return 732568350;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetSubGenders').toString();
  }
}

class GetSubGendersBuilder
    implements Builder<GetSubGenders, GetSubGendersBuilder> {
  _$GetSubGenders? _$v;

  GetSubGendersBuilder();

  @override
  void replace(GetSubGenders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetSubGenders;
  }

  @override
  void update(void Function(GetSubGendersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetSubGenders build() => _build();

  _$GetSubGenders _build() {
    final _$result = _$v ?? new _$GetSubGenders._();
    replace(_$result);
    return _$result;
  }
}

class _$GetAvatars extends GetAvatars {
  factory _$GetAvatars([void Function(GetAvatarsBuilder)? updates]) =>
      (new GetAvatarsBuilder()..update(updates))._build();

  _$GetAvatars._() : super._();

  @override
  GetAvatars rebuild(void Function(GetAvatarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAvatarsBuilder toBuilder() => new GetAvatarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAvatars;
  }

  @override
  int get hashCode {
    return 72848492;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetAvatars').toString();
  }
}

class GetAvatarsBuilder implements Builder<GetAvatars, GetAvatarsBuilder> {
  _$GetAvatars? _$v;

  GetAvatarsBuilder();

  @override
  void replace(GetAvatars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAvatars;
  }

  @override
  void update(void Function(GetAvatarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAvatars build() => _build();

  _$GetAvatars _build() {
    final _$result = _$v ?? new _$GetAvatars._();
    replace(_$result);
    return _$result;
  }
}

class _$CheckEmails extends CheckEmails {
  @override
  final String? Email;

  factory _$CheckEmails([void Function(CheckEmailsBuilder)? updates]) =>
      (new CheckEmailsBuilder()..update(updates))._build();

  _$CheckEmails._({this.Email}) : super._();

  @override
  CheckEmails rebuild(void Function(CheckEmailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckEmailsBuilder toBuilder() => new CheckEmailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckEmails && Email == other.Email;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CheckEmails')..add('Email', Email))
        .toString();
  }
}

class CheckEmailsBuilder implements Builder<CheckEmails, CheckEmailsBuilder> {
  _$CheckEmails? _$v;

  String? _Email;
  String? get Email => _$this._Email;
  set Email(String? Email) => _$this._Email = Email;

  CheckEmailsBuilder();

  CheckEmailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Email = $v.Email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckEmails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckEmails;
  }

  @override
  void update(void Function(CheckEmailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckEmails build() => _build();

  _$CheckEmails _build() {
    final _$result = _$v ?? new _$CheckEmails._(Email: Email);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeSelected extends ChangeSelected {
  factory _$ChangeSelected([void Function(ChangeSelectedBuilder)? updates]) =>
      (new ChangeSelectedBuilder()..update(updates))._build();

  _$ChangeSelected._() : super._();

  @override
  ChangeSelected rebuild(void Function(ChangeSelectedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeSelectedBuilder toBuilder() =>
      new ChangeSelectedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeSelected;
  }

  @override
  int get hashCode {
    return 573215349;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ChangeSelected').toString();
  }
}

class ChangeSelectedBuilder
    implements Builder<ChangeSelected, ChangeSelectedBuilder> {
  _$ChangeSelected? _$v;

  ChangeSelectedBuilder();

  @override
  void replace(ChangeSelected other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeSelected;
  }

  @override
  void update(void Function(ChangeSelectedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeSelected build() => _build();

  _$ChangeSelected _build() {
    final _$result = _$v ?? new _$ChangeSelected._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
