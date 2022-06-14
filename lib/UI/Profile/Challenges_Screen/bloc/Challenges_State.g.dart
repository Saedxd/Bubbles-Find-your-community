// GENERATED CODE - DO NOT MODIFY BY HAND

part of Challenges_State;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChallengesState extends ChallengesState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? GetPointsisLoading;
  @override
  final bool? GetPointsSuccess;
  @override
  final GetChallengesModel? GetChallenges;
  @override
  final GetPointsModel? GetPoints;

  factory _$ChallengesState([void Function(ChallengesStateBuilder)? updates]) =>
      (new ChallengesStateBuilder()..update(updates))._build();

  _$ChallengesState._(
      {this.error,
      this.isLoading,
      this.success,
      this.GetPointsisLoading,
      this.GetPointsSuccess,
      this.GetChallenges,
      this.GetPoints})
      : super._();

  @override
  ChallengesState rebuild(void Function(ChallengesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChallengesStateBuilder toBuilder() =>
      new ChallengesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChallengesState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        GetPointsisLoading == other.GetPointsisLoading &&
        GetPointsSuccess == other.GetPointsSuccess &&
        GetChallenges == other.GetChallenges &&
        GetPoints == other.GetPoints;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                        success.hashCode),
                    GetPointsisLoading.hashCode),
                GetPointsSuccess.hashCode),
            GetChallenges.hashCode),
        GetPoints.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChallengesState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('GetPointsisLoading', GetPointsisLoading)
          ..add('GetPointsSuccess', GetPointsSuccess)
          ..add('GetChallenges', GetChallenges)
          ..add('GetPoints', GetPoints))
        .toString();
  }
}

class ChallengesStateBuilder
    implements Builder<ChallengesState, ChallengesStateBuilder> {
  _$ChallengesState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _GetPointsisLoading;
  bool? get GetPointsisLoading => _$this._GetPointsisLoading;
  set GetPointsisLoading(bool? GetPointsisLoading) =>
      _$this._GetPointsisLoading = GetPointsisLoading;

  bool? _GetPointsSuccess;
  bool? get GetPointsSuccess => _$this._GetPointsSuccess;
  set GetPointsSuccess(bool? GetPointsSuccess) =>
      _$this._GetPointsSuccess = GetPointsSuccess;

  GetChallengesModelBuilder? _GetChallenges;
  GetChallengesModelBuilder get GetChallenges =>
      _$this._GetChallenges ??= new GetChallengesModelBuilder();
  set GetChallenges(GetChallengesModelBuilder? GetChallenges) =>
      _$this._GetChallenges = GetChallenges;

  GetPointsModelBuilder? _GetPoints;
  GetPointsModelBuilder get GetPoints =>
      _$this._GetPoints ??= new GetPointsModelBuilder();
  set GetPoints(GetPointsModelBuilder? GetPoints) =>
      _$this._GetPoints = GetPoints;

  ChallengesStateBuilder();

  ChallengesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _GetPointsisLoading = $v.GetPointsisLoading;
      _GetPointsSuccess = $v.GetPointsSuccess;
      _GetChallenges = $v.GetChallenges?.toBuilder();
      _GetPoints = $v.GetPoints?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChallengesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChallengesState;
  }

  @override
  void update(void Function(ChallengesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChallengesState build() => _build();

  _$ChallengesState _build() {
    _$ChallengesState _$result;
    try {
      _$result = _$v ??
          new _$ChallengesState._(
              error: error,
              isLoading: isLoading,
              success: success,
              GetPointsisLoading: GetPointsisLoading,
              GetPointsSuccess: GetPointsSuccess,
              GetChallenges: _GetChallenges?.build(),
              GetPoints: _GetPoints?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'GetChallenges';
        _GetChallenges?.build();
        _$failedField = 'GetPoints';
        _GetPoints?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChallengesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
