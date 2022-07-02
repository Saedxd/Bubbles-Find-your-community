// GENERATED CODE - DO NOT MODIFY BY HAND

part of DirectMessages_State;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DirectMessagesState extends DirectMessagesState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? ChangeStateLoading;
  @override
  final bool? ChangeStateSuccess;
  @override
  final OldMessagesModel? OldMessages;
  @override
  final OldMessagesModel? DMListSearchResult;
  @override
  final List<DmlistData>? Dmlist;
  @override
  final List<DmlistData>? FilteredDmlist;

  factory _$DirectMessagesState(
          [void Function(DirectMessagesStateBuilder)? updates]) =>
      (new DirectMessagesStateBuilder()..update(updates))._build();

  _$DirectMessagesState._(
      {this.error,
      this.isLoading,
      this.success,
      this.ChangeStateLoading,
      this.ChangeStateSuccess,
      this.OldMessages,
      this.DMListSearchResult,
      this.Dmlist,
      this.FilteredDmlist})
      : super._();

  @override
  DirectMessagesState rebuild(
          void Function(DirectMessagesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectMessagesStateBuilder toBuilder() =>
      new DirectMessagesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectMessagesState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        ChangeStateLoading == other.ChangeStateLoading &&
        ChangeStateSuccess == other.ChangeStateSuccess &&
        OldMessages == other.OldMessages &&
        DMListSearchResult == other.DMListSearchResult &&
        Dmlist == other.Dmlist &&
        FilteredDmlist == other.FilteredDmlist;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                                success.hashCode),
                            ChangeStateLoading.hashCode),
                        ChangeStateSuccess.hashCode),
                    OldMessages.hashCode),
                DMListSearchResult.hashCode),
            Dmlist.hashCode),
        FilteredDmlist.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DirectMessagesState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('ChangeStateLoading', ChangeStateLoading)
          ..add('ChangeStateSuccess', ChangeStateSuccess)
          ..add('OldMessages', OldMessages)
          ..add('DMListSearchResult', DMListSearchResult)
          ..add('Dmlist', Dmlist)
          ..add('FilteredDmlist', FilteredDmlist))
        .toString();
  }
}

class DirectMessagesStateBuilder
    implements Builder<DirectMessagesState, DirectMessagesStateBuilder> {
  _$DirectMessagesState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _ChangeStateLoading;
  bool? get ChangeStateLoading => _$this._ChangeStateLoading;
  set ChangeStateLoading(bool? ChangeStateLoading) =>
      _$this._ChangeStateLoading = ChangeStateLoading;

  bool? _ChangeStateSuccess;
  bool? get ChangeStateSuccess => _$this._ChangeStateSuccess;
  set ChangeStateSuccess(bool? ChangeStateSuccess) =>
      _$this._ChangeStateSuccess = ChangeStateSuccess;

  OldMessagesModelBuilder? _OldMessages;
  OldMessagesModelBuilder get OldMessages =>
      _$this._OldMessages ??= new OldMessagesModelBuilder();
  set OldMessages(OldMessagesModelBuilder? OldMessages) =>
      _$this._OldMessages = OldMessages;

  OldMessagesModelBuilder? _DMListSearchResult;
  OldMessagesModelBuilder get DMListSearchResult =>
      _$this._DMListSearchResult ??= new OldMessagesModelBuilder();
  set DMListSearchResult(OldMessagesModelBuilder? DMListSearchResult) =>
      _$this._DMListSearchResult = DMListSearchResult;

  List<DmlistData>? _Dmlist;
  List<DmlistData>? get Dmlist => _$this._Dmlist;
  set Dmlist(List<DmlistData>? Dmlist) => _$this._Dmlist = Dmlist;

  List<DmlistData>? _FilteredDmlist;
  List<DmlistData>? get FilteredDmlist => _$this._FilteredDmlist;
  set FilteredDmlist(List<DmlistData>? FilteredDmlist) =>
      _$this._FilteredDmlist = FilteredDmlist;

  DirectMessagesStateBuilder();

  DirectMessagesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _ChangeStateLoading = $v.ChangeStateLoading;
      _ChangeStateSuccess = $v.ChangeStateSuccess;
      _OldMessages = $v.OldMessages?.toBuilder();
      _DMListSearchResult = $v.DMListSearchResult?.toBuilder();
      _Dmlist = $v.Dmlist;
      _FilteredDmlist = $v.FilteredDmlist;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DirectMessagesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectMessagesState;
  }

  @override
  void update(void Function(DirectMessagesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectMessagesState build() => _build();

  _$DirectMessagesState _build() {
    _$DirectMessagesState _$result;
    try {
      _$result = _$v ??
          new _$DirectMessagesState._(
              error: error,
              isLoading: isLoading,
              success: success,
              ChangeStateLoading: ChangeStateLoading,
              ChangeStateSuccess: ChangeStateSuccess,
              OldMessages: _OldMessages?.build(),
              DMListSearchResult: _DMListSearchResult?.build(),
              Dmlist: Dmlist,
              FilteredDmlist: FilteredDmlist);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'OldMessages';
        _OldMessages?.build();
        _$failedField = 'DMListSearchResult';
        _DMListSearchResult?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DirectMessagesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
