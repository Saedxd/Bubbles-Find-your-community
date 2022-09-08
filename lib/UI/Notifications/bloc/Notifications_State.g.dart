// GENERATED CODE - DO NOT MODIFY BY HAND

part of Notifications_State;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationsState extends NotificationsState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final GetnotifcationsModel? Getnotifcations;
  @override
  final ClearBadgeModel? ClearBadge;
  @override
  final GetbadgeModel? Getbadge;

  factory _$NotificationsState(
          [void Function(NotificationsStateBuilder)? updates]) =>
      (new NotificationsStateBuilder()..update(updates))._build();

  _$NotificationsState._(
      {this.error,
      this.isLoading,
      this.success,
      this.Getnotifcations,
      this.ClearBadge,
      this.Getbadge})
      : super._();

  @override
  NotificationsState rebuild(
          void Function(NotificationsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsStateBuilder toBuilder() =>
      new NotificationsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        Getnotifcations == other.Getnotifcations &&
        ClearBadge == other.ClearBadge &&
        Getbadge == other.Getbadge;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                    success.hashCode),
                Getnotifcations.hashCode),
            ClearBadge.hashCode),
        Getbadge.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('Getnotifcations', Getnotifcations)
          ..add('ClearBadge', ClearBadge)
          ..add('Getbadge', Getbadge))
        .toString();
  }
}

class NotificationsStateBuilder
    implements Builder<NotificationsState, NotificationsStateBuilder> {
  _$NotificationsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  GetnotifcationsModelBuilder? _Getnotifcations;
  GetnotifcationsModelBuilder get Getnotifcations =>
      _$this._Getnotifcations ??= new GetnotifcationsModelBuilder();
  set Getnotifcations(GetnotifcationsModelBuilder? Getnotifcations) =>
      _$this._Getnotifcations = Getnotifcations;

  ClearBadgeModelBuilder? _ClearBadge;
  ClearBadgeModelBuilder get ClearBadge =>
      _$this._ClearBadge ??= new ClearBadgeModelBuilder();
  set ClearBadge(ClearBadgeModelBuilder? ClearBadge) =>
      _$this._ClearBadge = ClearBadge;

  GetbadgeModelBuilder? _Getbadge;
  GetbadgeModelBuilder get Getbadge =>
      _$this._Getbadge ??= new GetbadgeModelBuilder();
  set Getbadge(GetbadgeModelBuilder? Getbadge) => _$this._Getbadge = Getbadge;

  NotificationsStateBuilder();

  NotificationsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _Getnotifcations = $v.Getnotifcations?.toBuilder();
      _ClearBadge = $v.ClearBadge?.toBuilder();
      _Getbadge = $v.Getbadge?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsState;
  }

  @override
  void update(void Function(NotificationsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsState build() => _build();

  _$NotificationsState _build() {
    _$NotificationsState _$result;
    try {
      _$result = _$v ??
          new _$NotificationsState._(
              error: error,
              isLoading: isLoading,
              success: success,
              Getnotifcations: _Getnotifcations?.build(),
              ClearBadge: _ClearBadge?.build(),
              Getbadge: _Getbadge?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'Getnotifcations';
        _Getnotifcations?.build();
        _$failedField = 'ClearBadge';
        _ClearBadge?.build();
        _$failedField = 'Getbadge';
        _Getbadge?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
