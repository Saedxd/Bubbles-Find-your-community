// GENERATED CODE - DO NOT MODIFY BY HAND

part of SuggestedFrineds_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SuggestedFreindsState extends SuggestedFreindsState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? AddFreindSuccess;
  @override
  final bool? FreindAddlOADING;
  @override
  final AddNewFriendModel? AddNewFriend;
  @override
  final SuggestFriendsModel? SuggestFriends;
  @override
  final List<Data>? ListOFSUggested;

  factory _$SuggestedFreindsState(
          [void Function(SuggestedFreindsStateBuilder)? updates]) =>
      (new SuggestedFreindsStateBuilder()..update(updates))._build();

  _$SuggestedFreindsState._(
      {this.error,
      this.isLoading,
      this.success,
      this.AddFreindSuccess,
      this.FreindAddlOADING,
      this.AddNewFriend,
      this.SuggestFriends,
      this.ListOFSUggested})
      : super._();

  @override
  SuggestedFreindsState rebuild(
          void Function(SuggestedFreindsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuggestedFreindsStateBuilder toBuilder() =>
      new SuggestedFreindsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuggestedFreindsState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        AddFreindSuccess == other.AddFreindSuccess &&
        FreindAddlOADING == other.FreindAddlOADING &&
        AddNewFriend == other.AddNewFriend &&
        SuggestFriends == other.SuggestFriends &&
        ListOFSUggested == other.ListOFSUggested;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                            success.hashCode),
                        AddFreindSuccess.hashCode),
                    FreindAddlOADING.hashCode),
                AddNewFriend.hashCode),
            SuggestFriends.hashCode),
        ListOFSUggested.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SuggestedFreindsState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('AddFreindSuccess', AddFreindSuccess)
          ..add('FreindAddlOADING', FreindAddlOADING)
          ..add('AddNewFriend', AddNewFriend)
          ..add('SuggestFriends', SuggestFriends)
          ..add('ListOFSUggested', ListOFSUggested))
        .toString();
  }
}

class SuggestedFreindsStateBuilder
    implements Builder<SuggestedFreindsState, SuggestedFreindsStateBuilder> {
  _$SuggestedFreindsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _AddFreindSuccess;
  bool? get AddFreindSuccess => _$this._AddFreindSuccess;
  set AddFreindSuccess(bool? AddFreindSuccess) =>
      _$this._AddFreindSuccess = AddFreindSuccess;

  bool? _FreindAddlOADING;
  bool? get FreindAddlOADING => _$this._FreindAddlOADING;
  set FreindAddlOADING(bool? FreindAddlOADING) =>
      _$this._FreindAddlOADING = FreindAddlOADING;

  AddNewFriendModelBuilder? _AddNewFriend;
  AddNewFriendModelBuilder get AddNewFriend =>
      _$this._AddNewFriend ??= new AddNewFriendModelBuilder();
  set AddNewFriend(AddNewFriendModelBuilder? AddNewFriend) =>
      _$this._AddNewFriend = AddNewFriend;

  SuggestFriendsModelBuilder? _SuggestFriends;
  SuggestFriendsModelBuilder get SuggestFriends =>
      _$this._SuggestFriends ??= new SuggestFriendsModelBuilder();
  set SuggestFriends(SuggestFriendsModelBuilder? SuggestFriends) =>
      _$this._SuggestFriends = SuggestFriends;

  List<Data>? _ListOFSUggested;
  List<Data>? get ListOFSUggested => _$this._ListOFSUggested;
  set ListOFSUggested(List<Data>? ListOFSUggested) =>
      _$this._ListOFSUggested = ListOFSUggested;

  SuggestedFreindsStateBuilder();

  SuggestedFreindsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _AddFreindSuccess = $v.AddFreindSuccess;
      _FreindAddlOADING = $v.FreindAddlOADING;
      _AddNewFriend = $v.AddNewFriend?.toBuilder();
      _SuggestFriends = $v.SuggestFriends?.toBuilder();
      _ListOFSUggested = $v.ListOFSUggested;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuggestedFreindsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SuggestedFreindsState;
  }

  @override
  void update(void Function(SuggestedFreindsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SuggestedFreindsState build() => _build();

  _$SuggestedFreindsState _build() {
    _$SuggestedFreindsState _$result;
    try {
      _$result = _$v ??
          new _$SuggestedFreindsState._(
              error: error,
              isLoading: isLoading,
              success: success,
              AddFreindSuccess: AddFreindSuccess,
              FreindAddlOADING: FreindAddlOADING,
              AddNewFriend: _AddNewFriend?.build(),
              SuggestFriends: _SuggestFriends?.build(),
              ListOFSUggested: ListOFSUggested);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'AddNewFriend';
        _AddNewFriend?.build();
        _$failedField = 'SuggestFriends';
        _SuggestFriends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SuggestedFreindsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
