// GENERATED CODE - DO NOT MODIFY BY HAND

part of TopBar_State;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TopBarState extends TopBarState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? Index1;
  @override
  final bool? Index2;
  @override
  final bool? Index3;
  @override
  final bool? Index4;
  @override
  final int? INDEX;
  @override
  final bool? GetprofileLoading;
  @override
  final bool? GetprofileSuccess;
  @override
  final GetFriendsModel? GetFriends;
  @override
  final ProfileDateModel? ProfileDate;
  @override
  final GetbadgeModel? Getbadge;

  factory _$TopBarState([void Function(TopBarStateBuilder)? updates]) =>
      (new TopBarStateBuilder()..update(updates))._build();

  _$TopBarState._(
      {this.error,
      this.isLoading,
      this.success,
      this.Index1,
      this.Index2,
      this.Index3,
      this.Index4,
      this.INDEX,
      this.GetprofileLoading,
      this.GetprofileSuccess,
      this.GetFriends,
      this.ProfileDate,
      this.Getbadge})
      : super._();

  @override
  TopBarState rebuild(void Function(TopBarStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopBarStateBuilder toBuilder() => new TopBarStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopBarState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        Index1 == other.Index1 &&
        Index2 == other.Index2 &&
        Index3 == other.Index3 &&
        Index4 == other.Index4 &&
        INDEX == other.INDEX &&
        GetprofileLoading == other.GetprofileLoading &&
        GetprofileSuccess == other.GetprofileSuccess &&
        GetFriends == other.GetFriends &&
        ProfileDate == other.ProfileDate &&
        Getbadge == other.Getbadge;
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
                                                $jc($jc(0, error.hashCode),
                                                    isLoading.hashCode),
                                                success.hashCode),
                                            Index1.hashCode),
                                        Index2.hashCode),
                                    Index3.hashCode),
                                Index4.hashCode),
                            INDEX.hashCode),
                        GetprofileLoading.hashCode),
                    GetprofileSuccess.hashCode),
                GetFriends.hashCode),
            ProfileDate.hashCode),
        Getbadge.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TopBarState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('Index1', Index1)
          ..add('Index2', Index2)
          ..add('Index3', Index3)
          ..add('Index4', Index4)
          ..add('INDEX', INDEX)
          ..add('GetprofileLoading', GetprofileLoading)
          ..add('GetprofileSuccess', GetprofileSuccess)
          ..add('GetFriends', GetFriends)
          ..add('ProfileDate', ProfileDate)
          ..add('Getbadge', Getbadge))
        .toString();
  }
}

class TopBarStateBuilder implements Builder<TopBarState, TopBarStateBuilder> {
  _$TopBarState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _Index1;
  bool? get Index1 => _$this._Index1;
  set Index1(bool? Index1) => _$this._Index1 = Index1;

  bool? _Index2;
  bool? get Index2 => _$this._Index2;
  set Index2(bool? Index2) => _$this._Index2 = Index2;

  bool? _Index3;
  bool? get Index3 => _$this._Index3;
  set Index3(bool? Index3) => _$this._Index3 = Index3;

  bool? _Index4;
  bool? get Index4 => _$this._Index4;
  set Index4(bool? Index4) => _$this._Index4 = Index4;

  int? _INDEX;
  int? get INDEX => _$this._INDEX;
  set INDEX(int? INDEX) => _$this._INDEX = INDEX;

  bool? _GetprofileLoading;
  bool? get GetprofileLoading => _$this._GetprofileLoading;
  set GetprofileLoading(bool? GetprofileLoading) =>
      _$this._GetprofileLoading = GetprofileLoading;

  bool? _GetprofileSuccess;
  bool? get GetprofileSuccess => _$this._GetprofileSuccess;
  set GetprofileSuccess(bool? GetprofileSuccess) =>
      _$this._GetprofileSuccess = GetprofileSuccess;

  GetFriendsModelBuilder? _GetFriends;
  GetFriendsModelBuilder get GetFriends =>
      _$this._GetFriends ??= new GetFriendsModelBuilder();
  set GetFriends(GetFriendsModelBuilder? GetFriends) =>
      _$this._GetFriends = GetFriends;

  ProfileDateModelBuilder? _ProfileDate;
  ProfileDateModelBuilder get ProfileDate =>
      _$this._ProfileDate ??= new ProfileDateModelBuilder();
  set ProfileDate(ProfileDateModelBuilder? ProfileDate) =>
      _$this._ProfileDate = ProfileDate;

  GetbadgeModelBuilder? _Getbadge;
  GetbadgeModelBuilder get Getbadge =>
      _$this._Getbadge ??= new GetbadgeModelBuilder();
  set Getbadge(GetbadgeModelBuilder? Getbadge) => _$this._Getbadge = Getbadge;

  TopBarStateBuilder();

  TopBarStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _Index1 = $v.Index1;
      _Index2 = $v.Index2;
      _Index3 = $v.Index3;
      _Index4 = $v.Index4;
      _INDEX = $v.INDEX;
      _GetprofileLoading = $v.GetprofileLoading;
      _GetprofileSuccess = $v.GetprofileSuccess;
      _GetFriends = $v.GetFriends?.toBuilder();
      _ProfileDate = $v.ProfileDate?.toBuilder();
      _Getbadge = $v.Getbadge?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopBarState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopBarState;
  }

  @override
  void update(void Function(TopBarStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopBarState build() => _build();

  _$TopBarState _build() {
    _$TopBarState _$result;
    try {
      _$result = _$v ??
          new _$TopBarState._(
              error: error,
              isLoading: isLoading,
              success: success,
              Index1: Index1,
              Index2: Index2,
              Index3: Index3,
              Index4: Index4,
              INDEX: INDEX,
              GetprofileLoading: GetprofileLoading,
              GetprofileSuccess: GetprofileSuccess,
              GetFriends: _GetFriends?.build(),
              ProfileDate: _ProfileDate?.build(),
              Getbadge: _Getbadge?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'GetFriends';
        _GetFriends?.build();
        _$failedField = 'ProfileDate';
        _ProfileDate?.build();
        _$failedField = 'Getbadge';
        _Getbadge?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TopBarState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
