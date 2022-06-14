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
  final OldMessagesModel? OldMessages;

  factory _$DirectMessagesState(
          [void Function(DirectMessagesStateBuilder)? updates]) =>
      (new DirectMessagesStateBuilder()..update(updates))._build();

  _$DirectMessagesState._(
      {this.error, this.isLoading, this.success, this.OldMessages})
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
        OldMessages == other.OldMessages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, error.hashCode), isLoading.hashCode), success.hashCode),
        OldMessages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DirectMessagesState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('OldMessages', OldMessages))
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

  OldMessagesModelBuilder? _OldMessages;
  OldMessagesModelBuilder get OldMessages =>
      _$this._OldMessages ??= new OldMessagesModelBuilder();
  set OldMessages(OldMessagesModelBuilder? OldMessages) =>
      _$this._OldMessages = OldMessages;

  DirectMessagesStateBuilder();

  DirectMessagesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _OldMessages = $v.OldMessages?.toBuilder();
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
              OldMessages: _OldMessages?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'OldMessages';
        _OldMessages?.build();
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
