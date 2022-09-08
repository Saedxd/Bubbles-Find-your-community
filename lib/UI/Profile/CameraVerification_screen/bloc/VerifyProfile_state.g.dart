// GENERATED CODE - DO NOT MODIFY BY HAND

part of VerifyProfile_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerifyProfileState extends VerifyProfileState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? Done;
  @override
  final VerifyProfileModel? VerifyProfile;

  factory _$VerifyProfileState(
          [void Function(VerifyProfileStateBuilder)? updates]) =>
      (new VerifyProfileStateBuilder()..update(updates))._build();

  _$VerifyProfileState._(
      {this.error, this.isLoading, this.success, this.Done, this.VerifyProfile})
      : super._();

  @override
  VerifyProfileState rebuild(
          void Function(VerifyProfileStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyProfileStateBuilder toBuilder() =>
      new VerifyProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyProfileState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        Done == other.Done &&
        VerifyProfile == other.VerifyProfile;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                success.hashCode),
            Done.hashCode),
        VerifyProfile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyProfileState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('Done', Done)
          ..add('VerifyProfile', VerifyProfile))
        .toString();
  }
}

class VerifyProfileStateBuilder
    implements Builder<VerifyProfileState, VerifyProfileStateBuilder> {
  _$VerifyProfileState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _Done;
  bool? get Done => _$this._Done;
  set Done(bool? Done) => _$this._Done = Done;

  VerifyProfileModelBuilder? _VerifyProfile;
  VerifyProfileModelBuilder get VerifyProfile =>
      _$this._VerifyProfile ??= new VerifyProfileModelBuilder();
  set VerifyProfile(VerifyProfileModelBuilder? VerifyProfile) =>
      _$this._VerifyProfile = VerifyProfile;

  VerifyProfileStateBuilder();

  VerifyProfileStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _Done = $v.Done;
      _VerifyProfile = $v.VerifyProfile?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyProfileState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerifyProfileState;
  }

  @override
  void update(void Function(VerifyProfileStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyProfileState build() => _build();

  _$VerifyProfileState _build() {
    _$VerifyProfileState _$result;
    try {
      _$result = _$v ??
          new _$VerifyProfileState._(
              error: error,
              isLoading: isLoading,
              success: success,
              Done: Done,
              VerifyProfile: _VerifyProfile?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'VerifyProfile';
        _VerifyProfile?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VerifyProfileState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
