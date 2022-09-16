// GENERATED CODE - DO NOT MODIFY BY HAND

part of QrScreen_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QrScreenState extends QrScreenState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? FreindAdded;
  @override
  final AddFreindBarCodeModel? AddFreindBarCode;

  factory _$QrScreenState([void Function(QrScreenStateBuilder)? updates]) =>
      (new QrScreenStateBuilder()..update(updates))._build();

  _$QrScreenState._(
      {this.error,
      this.isLoading,
      this.success,
      this.FreindAdded,
      this.AddFreindBarCode})
      : super._();

  @override
  QrScreenState rebuild(void Function(QrScreenStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QrScreenStateBuilder toBuilder() => new QrScreenStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QrScreenState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        FreindAdded == other.FreindAdded &&
        AddFreindBarCode == other.AddFreindBarCode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                success.hashCode),
            FreindAdded.hashCode),
        AddFreindBarCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QrScreenState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('FreindAdded', FreindAdded)
          ..add('AddFreindBarCode', AddFreindBarCode))
        .toString();
  }
}

class QrScreenStateBuilder
    implements Builder<QrScreenState, QrScreenStateBuilder> {
  _$QrScreenState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _FreindAdded;
  bool? get FreindAdded => _$this._FreindAdded;
  set FreindAdded(bool? FreindAdded) => _$this._FreindAdded = FreindAdded;

  AddFreindBarCodeModelBuilder? _AddFreindBarCode;
  AddFreindBarCodeModelBuilder get AddFreindBarCode =>
      _$this._AddFreindBarCode ??= new AddFreindBarCodeModelBuilder();
  set AddFreindBarCode(AddFreindBarCodeModelBuilder? AddFreindBarCode) =>
      _$this._AddFreindBarCode = AddFreindBarCode;

  QrScreenStateBuilder();

  QrScreenStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _FreindAdded = $v.FreindAdded;
      _AddFreindBarCode = $v.AddFreindBarCode?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QrScreenState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QrScreenState;
  }

  @override
  void update(void Function(QrScreenStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QrScreenState build() => _build();

  _$QrScreenState _build() {
    _$QrScreenState _$result;
    try {
      _$result = _$v ??
          new _$QrScreenState._(
              error: error,
              isLoading: isLoading,
              success: success,
              FreindAdded: FreindAdded,
              AddFreindBarCode: _AddFreindBarCode?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'AddFreindBarCode';
        _AddFreindBarCode?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QrScreenState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
