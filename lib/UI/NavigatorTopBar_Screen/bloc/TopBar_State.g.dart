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
      this.INDEX})
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
        INDEX == other.INDEX;
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
                        Index1.hashCode),
                    Index2.hashCode),
                Index3.hashCode),
            Index4.hashCode),
        INDEX.hashCode));
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
          ..add('INDEX', INDEX))
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
    final _$result = _$v ??
        new _$TopBarState._(
            error: error,
            isLoading: isLoading,
            success: success,
            Index1: Index1,
            Index2: Index2,
            Index3: Index3,
            Index4: Index4,
            INDEX: INDEX);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
