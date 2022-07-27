// GENERATED CODE - DO NOT MODIFY BY HAND

part of FriendList_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FriendListState extends FriendListState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? IsRefresh;
  @override
  final bool? ChangeStateLoading;
  @override
  final bool? ChangeStateSuccess;
  @override
  final GetFriendsModel? GetFriends;
  @override
  final RemoveFriendModel? RemoveFriend;
  @override
  final List<FrinedsData>? FrinedList;
  @override
  final List<FrinedsData>? FrinedRequestsList;
  @override
  final FreindRequestsModel? FreindRequests;
  @override
  final DenyFriendRequestModel? DenyFriendRequest;
  @override
  final AceeptRequestModel? AceeptRequest;

  factory _$FriendListState([void Function(FriendListStateBuilder)? updates]) =>
      (new FriendListStateBuilder()..update(updates))._build();

  _$FriendListState._(
      {this.error,
      this.isLoading,
      this.success,
      this.IsRefresh,
      this.ChangeStateLoading,
      this.ChangeStateSuccess,
      this.GetFriends,
      this.RemoveFriend,
      this.FrinedList,
      this.FrinedRequestsList,
      this.FreindRequests,
      this.DenyFriendRequest,
      this.AceeptRequest})
      : super._();

  @override
  FriendListState rebuild(void Function(FriendListStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendListStateBuilder toBuilder() =>
      new FriendListStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FriendListState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        IsRefresh == other.IsRefresh &&
        ChangeStateLoading == other.ChangeStateLoading &&
        ChangeStateSuccess == other.ChangeStateSuccess &&
        GetFriends == other.GetFriends &&
        RemoveFriend == other.RemoveFriend &&
        FrinedList == other.FrinedList &&
        FrinedRequestsList == other.FrinedRequestsList &&
        FreindRequests == other.FreindRequests &&
        DenyFriendRequest == other.DenyFriendRequest &&
        AceeptRequest == other.AceeptRequest;
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
                                            IsRefresh.hashCode),
                                        ChangeStateLoading.hashCode),
                                    ChangeStateSuccess.hashCode),
                                GetFriends.hashCode),
                            RemoveFriend.hashCode),
                        FrinedList.hashCode),
                    FrinedRequestsList.hashCode),
                FreindRequests.hashCode),
            DenyFriendRequest.hashCode),
        AceeptRequest.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FriendListState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('IsRefresh', IsRefresh)
          ..add('ChangeStateLoading', ChangeStateLoading)
          ..add('ChangeStateSuccess', ChangeStateSuccess)
          ..add('GetFriends', GetFriends)
          ..add('RemoveFriend', RemoveFriend)
          ..add('FrinedList', FrinedList)
          ..add('FrinedRequestsList', FrinedRequestsList)
          ..add('FreindRequests', FreindRequests)
          ..add('DenyFriendRequest', DenyFriendRequest)
          ..add('AceeptRequest', AceeptRequest))
        .toString();
  }
}

class FriendListStateBuilder
    implements Builder<FriendListState, FriendListStateBuilder> {
  _$FriendListState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _IsRefresh;
  bool? get IsRefresh => _$this._IsRefresh;
  set IsRefresh(bool? IsRefresh) => _$this._IsRefresh = IsRefresh;

  bool? _ChangeStateLoading;
  bool? get ChangeStateLoading => _$this._ChangeStateLoading;
  set ChangeStateLoading(bool? ChangeStateLoading) =>
      _$this._ChangeStateLoading = ChangeStateLoading;

  bool? _ChangeStateSuccess;
  bool? get ChangeStateSuccess => _$this._ChangeStateSuccess;
  set ChangeStateSuccess(bool? ChangeStateSuccess) =>
      _$this._ChangeStateSuccess = ChangeStateSuccess;

  GetFriendsModelBuilder? _GetFriends;
  GetFriendsModelBuilder get GetFriends =>
      _$this._GetFriends ??= new GetFriendsModelBuilder();
  set GetFriends(GetFriendsModelBuilder? GetFriends) =>
      _$this._GetFriends = GetFriends;

  RemoveFriendModelBuilder? _RemoveFriend;
  RemoveFriendModelBuilder get RemoveFriend =>
      _$this._RemoveFriend ??= new RemoveFriendModelBuilder();
  set RemoveFriend(RemoveFriendModelBuilder? RemoveFriend) =>
      _$this._RemoveFriend = RemoveFriend;

  List<FrinedsData>? _FrinedList;
  List<FrinedsData>? get FrinedList => _$this._FrinedList;
  set FrinedList(List<FrinedsData>? FrinedList) =>
      _$this._FrinedList = FrinedList;

  List<FrinedsData>? _FrinedRequestsList;
  List<FrinedsData>? get FrinedRequestsList => _$this._FrinedRequestsList;
  set FrinedRequestsList(List<FrinedsData>? FrinedRequestsList) =>
      _$this._FrinedRequestsList = FrinedRequestsList;

  FreindRequestsModelBuilder? _FreindRequests;
  FreindRequestsModelBuilder get FreindRequests =>
      _$this._FreindRequests ??= new FreindRequestsModelBuilder();
  set FreindRequests(FreindRequestsModelBuilder? FreindRequests) =>
      _$this._FreindRequests = FreindRequests;

  DenyFriendRequestModelBuilder? _DenyFriendRequest;
  DenyFriendRequestModelBuilder get DenyFriendRequest =>
      _$this._DenyFriendRequest ??= new DenyFriendRequestModelBuilder();
  set DenyFriendRequest(DenyFriendRequestModelBuilder? DenyFriendRequest) =>
      _$this._DenyFriendRequest = DenyFriendRequest;

  AceeptRequestModelBuilder? _AceeptRequest;
  AceeptRequestModelBuilder get AceeptRequest =>
      _$this._AceeptRequest ??= new AceeptRequestModelBuilder();
  set AceeptRequest(AceeptRequestModelBuilder? AceeptRequest) =>
      _$this._AceeptRequest = AceeptRequest;

  FriendListStateBuilder();

  FriendListStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _IsRefresh = $v.IsRefresh;
      _ChangeStateLoading = $v.ChangeStateLoading;
      _ChangeStateSuccess = $v.ChangeStateSuccess;
      _GetFriends = $v.GetFriends?.toBuilder();
      _RemoveFriend = $v.RemoveFriend?.toBuilder();
      _FrinedList = $v.FrinedList;
      _FrinedRequestsList = $v.FrinedRequestsList;
      _FreindRequests = $v.FreindRequests?.toBuilder();
      _DenyFriendRequest = $v.DenyFriendRequest?.toBuilder();
      _AceeptRequest = $v.AceeptRequest?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FriendListState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FriendListState;
  }

  @override
  void update(void Function(FriendListStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FriendListState build() => _build();

  _$FriendListState _build() {
    _$FriendListState _$result;
    try {
      _$result = _$v ??
          new _$FriendListState._(
              error: error,
              isLoading: isLoading,
              success: success,
              IsRefresh: IsRefresh,
              ChangeStateLoading: ChangeStateLoading,
              ChangeStateSuccess: ChangeStateSuccess,
              GetFriends: _GetFriends?.build(),
              RemoveFriend: _RemoveFriend?.build(),
              FrinedList: FrinedList,
              FrinedRequestsList: FrinedRequestsList,
              FreindRequests: _FreindRequests?.build(),
              DenyFriendRequest: _DenyFriendRequest?.build(),
              AceeptRequest: _AceeptRequest?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'GetFriends';
        _GetFriends?.build();
        _$failedField = 'RemoveFriend';
        _RemoveFriend?.build();

        _$failedField = 'FreindRequests';
        _FreindRequests?.build();
        _$failedField = 'DenyFriendRequest';
        _DenyFriendRequest?.build();
        _$failedField = 'AceeptRequest';
        _AceeptRequest?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FriendListState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
