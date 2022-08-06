// GENERATED CODE - DO NOT MODIFY BY HAND

part of SignUp_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignUpState extends SignUpState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? UpdateSocialProfileSuccess;
  @override
  final bool? ChangeSelectedd;
  @override
  final int? UserDataINDEX;
  @override
  final int? UpdateProfileINDEX;
  @override
  final UserData? data;
  @override
  final GetAvatarsModel? GetAvatar;
  @override
  final GetGenderModel? GetGender;
  @override
  final GetInterestsModel? GetInterests;
  @override
  final GetSubGender? GetSubGenders;
  @override
  final UpdateProfile? UpdateSocialProfile;
  @override
  final CheckMailModel? Checkemail;

  factory _$SignUpState([void Function(SignUpStateBuilder)? updates]) =>
      (new SignUpStateBuilder()..update(updates))._build();

  _$SignUpState._(
      {this.error,
      this.isLoading,
      this.success,
      this.UpdateSocialProfileSuccess,
      this.ChangeSelectedd,
      this.UserDataINDEX,
      this.UpdateProfileINDEX,
      this.data,
      this.GetAvatar,
      this.GetGender,
      this.GetInterests,
      this.GetSubGenders,
      this.UpdateSocialProfile,
      this.Checkemail})
      : super._();

  @override
  SignUpState rebuild(void Function(SignUpStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpStateBuilder toBuilder() => new SignUpStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        UpdateSocialProfileSuccess == other.UpdateSocialProfileSuccess &&
        ChangeSelectedd == other.ChangeSelectedd &&
        UserDataINDEX == other.UserDataINDEX &&
        UpdateProfileINDEX == other.UpdateProfileINDEX &&
        data == other.data &&
        GetAvatar == other.GetAvatar &&
        GetGender == other.GetGender &&
        GetInterests == other.GetInterests &&
        GetSubGenders == other.GetSubGenders &&
        UpdateSocialProfile == other.UpdateSocialProfile &&
        Checkemail == other.Checkemail;
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
                                                    $jc($jc(0, error.hashCode),
                                                        isLoading.hashCode),
                                                    success.hashCode),
                                                UpdateSocialProfileSuccess
                                                    .hashCode),
                                            ChangeSelectedd.hashCode),
                                        UserDataINDEX.hashCode),
                                    UpdateProfileINDEX.hashCode),
                                data.hashCode),
                            GetAvatar.hashCode),
                        GetGender.hashCode),
                    GetInterests.hashCode),
                GetSubGenders.hashCode),
            UpdateSocialProfile.hashCode),
        Checkemail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignUpState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('UpdateSocialProfileSuccess', UpdateSocialProfileSuccess)
          ..add('ChangeSelectedd', ChangeSelectedd)
          ..add('UserDataINDEX', UserDataINDEX)
          ..add('UpdateProfileINDEX', UpdateProfileINDEX)
          ..add('data', data)
          ..add('GetAvatar', GetAvatar)
          ..add('GetGender', GetGender)
          ..add('GetInterests', GetInterests)
          ..add('GetSubGenders', GetSubGenders)
          ..add('UpdateSocialProfile', UpdateSocialProfile)
          ..add('Checkemail', Checkemail))
        .toString();
  }
}

class SignUpStateBuilder implements Builder<SignUpState, SignUpStateBuilder> {
  _$SignUpState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _UpdateSocialProfileSuccess;
  bool? get UpdateSocialProfileSuccess => _$this._UpdateSocialProfileSuccess;
  set UpdateSocialProfileSuccess(bool? UpdateSocialProfileSuccess) =>
      _$this._UpdateSocialProfileSuccess = UpdateSocialProfileSuccess;

  bool? _ChangeSelectedd;
  bool? get ChangeSelectedd => _$this._ChangeSelectedd;
  set ChangeSelectedd(bool? ChangeSelectedd) =>
      _$this._ChangeSelectedd = ChangeSelectedd;

  int? _UserDataINDEX;
  int? get UserDataINDEX => _$this._UserDataINDEX;
  set UserDataINDEX(int? UserDataINDEX) =>
      _$this._UserDataINDEX = UserDataINDEX;

  int? _UpdateProfileINDEX;
  int? get UpdateProfileINDEX => _$this._UpdateProfileINDEX;
  set UpdateProfileINDEX(int? UpdateProfileINDEX) =>
      _$this._UpdateProfileINDEX = UpdateProfileINDEX;

  UserDataBuilder? _data;
  UserDataBuilder get data => _$this._data ??= new UserDataBuilder();
  set data(UserDataBuilder? data) => _$this._data = data;

  GetAvatarsModelBuilder? _GetAvatar;
  GetAvatarsModelBuilder get GetAvatar =>
      _$this._GetAvatar ??= new GetAvatarsModelBuilder();
  set GetAvatar(GetAvatarsModelBuilder? GetAvatar) =>
      _$this._GetAvatar = GetAvatar;

  GetGenderModelBuilder? _GetGender;
  GetGenderModelBuilder get GetGender =>
      _$this._GetGender ??= new GetGenderModelBuilder();
  set GetGender(GetGenderModelBuilder? GetGender) =>
      _$this._GetGender = GetGender;

  GetInterestsModelBuilder? _GetInterests;
  GetInterestsModelBuilder get GetInterests =>
      _$this._GetInterests ??= new GetInterestsModelBuilder();
  set GetInterests(GetInterestsModelBuilder? GetInterests) =>
      _$this._GetInterests = GetInterests;

  GetSubGenderBuilder? _GetSubGenders;
  GetSubGenderBuilder get GetSubGenders =>
      _$this._GetSubGenders ??= new GetSubGenderBuilder();
  set GetSubGenders(GetSubGenderBuilder? GetSubGenders) =>
      _$this._GetSubGenders = GetSubGenders;

  UpdateProfileBuilder? _UpdateSocialProfile;
  UpdateProfileBuilder get UpdateSocialProfile =>
      _$this._UpdateSocialProfile ??= new UpdateProfileBuilder();
  set UpdateSocialProfile(UpdateProfileBuilder? UpdateSocialProfile) =>
      _$this._UpdateSocialProfile = UpdateSocialProfile;

  CheckMailModelBuilder? _Checkemail;
  CheckMailModelBuilder get Checkemail =>
      _$this._Checkemail ??= new CheckMailModelBuilder();
  set Checkemail(CheckMailModelBuilder? Checkemail) =>
      _$this._Checkemail = Checkemail;

  SignUpStateBuilder();

  SignUpStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _UpdateSocialProfileSuccess = $v.UpdateSocialProfileSuccess;
      _ChangeSelectedd = $v.ChangeSelectedd;
      _UserDataINDEX = $v.UserDataINDEX;
      _UpdateProfileINDEX = $v.UpdateProfileINDEX;
      _data = $v.data?.toBuilder();
      _GetAvatar = $v.GetAvatar?.toBuilder();
      _GetGender = $v.GetGender?.toBuilder();
      _GetInterests = $v.GetInterests?.toBuilder();
      _GetSubGenders = $v.GetSubGenders?.toBuilder();
      _UpdateSocialProfile = $v.UpdateSocialProfile?.toBuilder();
      _Checkemail = $v.Checkemail?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignUpState;
  }

  @override
  void update(void Function(SignUpStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignUpState build() => _build();

  _$SignUpState _build() {
    _$SignUpState _$result;
    try {
      _$result = _$v ??
          new _$SignUpState._(
              error: error,
              isLoading: isLoading,
              success: success,
              UpdateSocialProfileSuccess: UpdateSocialProfileSuccess,
              ChangeSelectedd: ChangeSelectedd,
              UserDataINDEX: UserDataINDEX,
              UpdateProfileINDEX: UpdateProfileINDEX,
              data: _data?.build(),
              GetAvatar: _GetAvatar?.build(),
              GetGender: _GetGender?.build(),
              GetInterests: _GetInterests?.build(),
              GetSubGenders: _GetSubGenders?.build(),
              UpdateSocialProfile: _UpdateSocialProfile?.build(),
              Checkemail: _Checkemail?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'GetAvatar';
        _GetAvatar?.build();
        _$failedField = 'GetGender';
        _GetGender?.build();
        _$failedField = 'GetInterests';
        _GetInterests?.build();
        _$failedField = 'GetSubGenders';
        _GetSubGenders?.build();
        _$failedField = 'UpdateSocialProfile';
        _UpdateSocialProfile?.build();
        _$failedField = 'Checkemail';
        _Checkemail?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SignUpState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
