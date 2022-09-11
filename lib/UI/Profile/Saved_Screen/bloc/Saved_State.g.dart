// GENERATED CODE - DO NOT MODIFY BY HAND

part of Saved_State;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SavedBubblesState extends SavedBubblesState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? ShapStatus;
  @override
  final bool? ShowHomePage;
  @override
  final bool? UnSaveIsloading;
  @override
  final GetBubblesModel? GetSavedBubbles;
  @override
  final SaveBubbleModel? SaveBubble;
  @override
  final List<BubbleData>? SavedBubbleList;

  factory _$SavedBubblesState(
          [void Function(SavedBubblesStateBuilder)? updates]) =>
      (new SavedBubblesStateBuilder()..update(updates))._build();

  _$SavedBubblesState._(
      {this.error,
      this.isLoading,
      this.success,
      this.ShapStatus,
      this.ShowHomePage,
      this.UnSaveIsloading,
      this.GetSavedBubbles,
      this.SaveBubble,
      this.SavedBubbleList})
      : super._();

  @override
  SavedBubblesState rebuild(void Function(SavedBubblesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SavedBubblesStateBuilder toBuilder() =>
      new SavedBubblesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SavedBubblesState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        ShapStatus == other.ShapStatus &&
        ShowHomePage == other.ShowHomePage &&
        UnSaveIsloading == other.UnSaveIsloading &&
        GetSavedBubbles == other.GetSavedBubbles &&
        SaveBubble == other.SaveBubble &&
        SavedBubbleList == other.SavedBubbleList;
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
                            ShapStatus.hashCode),
                        ShowHomePage.hashCode),
                    UnSaveIsloading.hashCode),
                GetSavedBubbles.hashCode),
            SaveBubble.hashCode),
        SavedBubbleList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SavedBubblesState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('ShapStatus', ShapStatus)
          ..add('ShowHomePage', ShowHomePage)
          ..add('UnSaveIsloading', UnSaveIsloading)
          ..add('GetSavedBubbles', GetSavedBubbles)
          ..add('SaveBubble', SaveBubble)
          ..add('SavedBubbleList', SavedBubbleList))
        .toString();
  }
}

class SavedBubblesStateBuilder
    implements Builder<SavedBubblesState, SavedBubblesStateBuilder> {
  _$SavedBubblesState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _ShapStatus;
  bool? get ShapStatus => _$this._ShapStatus;
  set ShapStatus(bool? ShapStatus) => _$this._ShapStatus = ShapStatus;

  bool? _ShowHomePage;
  bool? get ShowHomePage => _$this._ShowHomePage;
  set ShowHomePage(bool? ShowHomePage) => _$this._ShowHomePage = ShowHomePage;

  bool? _UnSaveIsloading;
  bool? get UnSaveIsloading => _$this._UnSaveIsloading;
  set UnSaveIsloading(bool? UnSaveIsloading) =>
      _$this._UnSaveIsloading = UnSaveIsloading;

  GetBubblesModelBuilder? _GetSavedBubbles;
  GetBubblesModelBuilder get GetSavedBubbles =>
      _$this._GetSavedBubbles ??= new GetBubblesModelBuilder();
  set GetSavedBubbles(GetBubblesModelBuilder? GetSavedBubbles) =>
      _$this._GetSavedBubbles = GetSavedBubbles;

  SaveBubbleModelBuilder? _SaveBubble;
  SaveBubbleModelBuilder get SaveBubble =>
      _$this._SaveBubble ??= new SaveBubbleModelBuilder();
  set SaveBubble(SaveBubbleModelBuilder? SaveBubble) =>
      _$this._SaveBubble = SaveBubble;

  List<BubbleData>? _SavedBubbleList;
  List<BubbleData>? get SavedBubbleList => _$this._SavedBubbleList;
  set SavedBubbleList(List<BubbleData>? SavedBubbleList) =>
      _$this._SavedBubbleList = SavedBubbleList;

  SavedBubblesStateBuilder();

  SavedBubblesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _ShapStatus = $v.ShapStatus;
      _ShowHomePage = $v.ShowHomePage;
      _UnSaveIsloading = $v.UnSaveIsloading;
      _GetSavedBubbles = $v.GetSavedBubbles?.toBuilder();
      _SaveBubble = $v.SaveBubble?.toBuilder();
      _SavedBubbleList = $v.SavedBubbleList;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SavedBubblesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SavedBubblesState;
  }

  @override
  void update(void Function(SavedBubblesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SavedBubblesState build() => _build();

  _$SavedBubblesState _build() {
    _$SavedBubblesState _$result;
    try {
      _$result = _$v ??
          new _$SavedBubblesState._(
              error: error,
              isLoading: isLoading,
              success: success,
              ShapStatus: ShapStatus,
              ShowHomePage: ShowHomePage,
              UnSaveIsloading: UnSaveIsloading,
              GetSavedBubbles: _GetSavedBubbles?.build(),
              SaveBubble: _SaveBubble?.build(),
              SavedBubbleList: SavedBubbleList);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'GetSavedBubbles';
        _GetSavedBubbles?.build();
        _$failedField = 'SaveBubble';
        _SaveBubble?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SavedBubblesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
