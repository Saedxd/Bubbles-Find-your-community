// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$loginState extends loginState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final UserData? data;
  @override
  final PermissionsModel? Permissions;

  factory _$loginState([void Function(loginStateBuilder)? updates]) =>
      (new loginStateBuilder()..update(updates))._build();

  _$loginState._(
      {this.error, this.isLoading, this.success, this.data, this.Permissions})
      : super._();

  @override
  loginState rebuild(void Function(loginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  loginStateBuilder toBuilder() => new loginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is loginState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        data == other.data &&
        Permissions == other.Permissions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                success.hashCode),
            data.hashCode),
        Permissions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('loginState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('data', data)
          ..add('Permissions', Permissions))
        .toString();
  }
}

class loginStateBuilder implements Builder<loginState, loginStateBuilder> {
  _$loginState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UserDataBuilder? _data;
  UserDataBuilder get data => _$this._data ??= new UserDataBuilder();
  set data(UserDataBuilder? data) => _$this._data = data;

  PermissionsModelBuilder? _Permissions;
  PermissionsModelBuilder get Permissions =>
      _$this._Permissions ??= new PermissionsModelBuilder();
  set Permissions(PermissionsModelBuilder? Permissions) =>
      _$this._Permissions = Permissions;

  loginStateBuilder();

  loginStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _data = $v.data?.toBuilder();
      _Permissions = $v.Permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(loginState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$loginState;
  }

  @override
  void update(void Function(loginStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  loginState build() => _build();

  _$loginState _build() {
    _$loginState _$result;
    try {
      _$result = _$v ??
          new _$loginState._(
              error: error,
              isLoading: isLoading,
              success: success,
              data: _data?.build(),
              Permissions: _Permissions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'Permissions';
        _Permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'loginState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
