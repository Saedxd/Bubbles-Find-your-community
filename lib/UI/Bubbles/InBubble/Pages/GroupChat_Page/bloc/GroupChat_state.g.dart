// GENERATED CODE - DO NOT MODIFY BY HAND

part of GroupChat_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GroupChatState extends GroupChatState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? KetbaordStatuss;

  factory _$GroupChatState([void Function(GroupChatStateBuilder)? updates]) =>
      (new GroupChatStateBuilder()..update(updates))._build();

  _$GroupChatState._(
      {this.error, this.isLoading, this.success, this.KetbaordStatuss})
      : super._();

  @override
  GroupChatState rebuild(void Function(GroupChatStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupChatStateBuilder toBuilder() =>
      new GroupChatStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupChatState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        KetbaordStatuss == other.KetbaordStatuss;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, error.hashCode), isLoading.hashCode), success.hashCode),
        KetbaordStatuss.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupChatState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('KetbaordStatuss', KetbaordStatuss))
        .toString();
  }
}

class GroupChatStateBuilder
    implements Builder<GroupChatState, GroupChatStateBuilder> {
  _$GroupChatState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _KetbaordStatuss;
  bool? get KetbaordStatuss => _$this._KetbaordStatuss;
  set KetbaordStatuss(bool? KetbaordStatuss) =>
      _$this._KetbaordStatuss = KetbaordStatuss;

  GroupChatStateBuilder();

  GroupChatStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _KetbaordStatuss = $v.KetbaordStatuss;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupChatState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupChatState;
  }

  @override
  void update(void Function(GroupChatStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GroupChatState build() => _build();

  _$GroupChatState _build() {
    final _$result = _$v ??
        new _$GroupChatState._(
            error: error,
            isLoading: isLoading,
            success: success,
            KetbaordStatuss: KetbaordStatuss);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
