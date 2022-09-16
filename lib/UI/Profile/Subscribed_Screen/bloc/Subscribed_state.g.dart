// GENERATED CODE - DO NOT MODIFY BY HAND

part of Subscribed_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscribedState extends SubscribedState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;

  factory _$SubscribedState([void Function(SubscribedStateBuilder)? updates]) =>
      (new SubscribedStateBuilder()..update(updates))._build();

  _$SubscribedState._({this.error, this.isLoading, this.success}) : super._();

  @override
  SubscribedState rebuild(void Function(SubscribedStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscribedStateBuilder toBuilder() =>
      new SubscribedStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscribedState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, error.hashCode), isLoading.hashCode), success.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscribedState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success))
        .toString();
  }
}

class SubscribedStateBuilder
    implements Builder<SubscribedState, SubscribedStateBuilder> {
  _$SubscribedState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  SubscribedStateBuilder();

  SubscribedStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscribedState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscribedState;
  }

  @override
  void update(void Function(SubscribedStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscribedState build() => _build();

  _$SubscribedState _build() {
    final _$result = _$v ??
        new _$SubscribedState._(
            error: error, isLoading: isLoading, success: success);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
