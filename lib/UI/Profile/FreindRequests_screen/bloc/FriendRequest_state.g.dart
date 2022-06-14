// GENERATED CODE - DO NOT MODIFY BY HAND

part of FriendRequest_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FreindRequestState extends FreindRequestState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final FreindRequestsModel? FreindRequests;
  @override
  final DenyFriendRequestModel? DenyFriendRequest;
  @override
  final AceeptRequestModel? AceeptRequest;

  factory _$FreindRequestState(
          [void Function(FreindRequestStateBuilder)? updates]) =>
      (new FreindRequestStateBuilder()..update(updates))._build();

  _$FreindRequestState._(
      {this.error,
      this.isLoading,
      this.success,
      this.FreindRequests,
      this.DenyFriendRequest,
      this.AceeptRequest})
      : super._();

  @override
  FreindRequestState rebuild(
          void Function(FreindRequestStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FreindRequestStateBuilder toBuilder() =>
      new FreindRequestStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FreindRequestState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        FreindRequests == other.FreindRequests &&
        DenyFriendRequest == other.DenyFriendRequest &&
        AceeptRequest == other.AceeptRequest;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                    success.hashCode),
                FreindRequests.hashCode),
            DenyFriendRequest.hashCode),
        AceeptRequest.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FreindRequestState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('FreindRequests', FreindRequests)
          ..add('DenyFriendRequest', DenyFriendRequest)
          ..add('AceeptRequest', AceeptRequest))
        .toString();
  }
}

class FreindRequestStateBuilder
    implements Builder<FreindRequestState, FreindRequestStateBuilder> {
  _$FreindRequestState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

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

  FreindRequestStateBuilder();

  FreindRequestStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _FreindRequests = $v.FreindRequests?.toBuilder();
      _DenyFriendRequest = $v.DenyFriendRequest?.toBuilder();
      _AceeptRequest = $v.AceeptRequest?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FreindRequestState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FreindRequestState;
  }

  @override
  void update(void Function(FreindRequestStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FreindRequestState build() => _build();

  _$FreindRequestState _build() {
    _$FreindRequestState _$result;
    try {
      _$result = _$v ??
          new _$FreindRequestState._(
              error: error,
              isLoading: isLoading,
              success: success,
              FreindRequests: _FreindRequests?.build(),
              DenyFriendRequest: _DenyFriendRequest?.build(),
              AceeptRequest: _AceeptRequest?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'FreindRequests';
        _FreindRequests?.build();
        _$failedField = 'DenyFriendRequest';
        _DenyFriendRequest?.build();
        _$failedField = 'AceeptRequest';
        _AceeptRequest?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FreindRequestState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
