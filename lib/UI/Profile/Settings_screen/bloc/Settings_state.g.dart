// GENERATED CODE - DO NOT MODIFY BY HAND

part of Settings_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingsState extends SettingsState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? LOgedOUT;
  @override
  final bool? ISloadingLogout;
  @override
  final LogoutModel? Logout;

  factory _$SettingsState([void Function(SettingsStateBuilder)? updates]) =>
      (new SettingsStateBuilder()..update(updates))._build();

  _$SettingsState._(
      {this.error,
      this.isLoading,
      this.success,
      this.LOgedOUT,
      this.ISloadingLogout,
      this.Logout})
      : super._();

  @override
  SettingsState rebuild(void Function(SettingsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsStateBuilder toBuilder() => new SettingsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        LOgedOUT == other.LOgedOUT &&
        ISloadingLogout == other.ISloadingLogout &&
        Logout == other.Logout;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                    success.hashCode),
                LOgedOUT.hashCode),
            ISloadingLogout.hashCode),
        Logout.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SettingsState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('LOgedOUT', LOgedOUT)
          ..add('ISloadingLogout', ISloadingLogout)
          ..add('Logout', Logout))
        .toString();
  }
}

class SettingsStateBuilder
    implements Builder<SettingsState, SettingsStateBuilder> {
  _$SettingsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _LOgedOUT;
  bool? get LOgedOUT => _$this._LOgedOUT;
  set LOgedOUT(bool? LOgedOUT) => _$this._LOgedOUT = LOgedOUT;

  bool? _ISloadingLogout;
  bool? get ISloadingLogout => _$this._ISloadingLogout;
  set ISloadingLogout(bool? ISloadingLogout) =>
      _$this._ISloadingLogout = ISloadingLogout;

  LogoutModelBuilder? _Logout;
  LogoutModelBuilder get Logout => _$this._Logout ??= new LogoutModelBuilder();
  set Logout(LogoutModelBuilder? Logout) => _$this._Logout = Logout;

  SettingsStateBuilder();

  SettingsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _LOgedOUT = $v.LOgedOUT;
      _ISloadingLogout = $v.ISloadingLogout;
      _Logout = $v.Logout?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SettingsState;
  }

  @override
  void update(void Function(SettingsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SettingsState build() => _build();

  _$SettingsState _build() {
    _$SettingsState _$result;
    try {
      _$result = _$v ??
          new _$SettingsState._(
              error: error,
              isLoading: isLoading,
              success: success,
              LOgedOUT: LOgedOUT,
              ISloadingLogout: ISloadingLogout,
              Logout: _Logout?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'Logout';
        _Logout?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SettingsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
