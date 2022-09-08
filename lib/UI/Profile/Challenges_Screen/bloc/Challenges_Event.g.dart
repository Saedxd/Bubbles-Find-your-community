// GENERATED CODE - DO NOT MODIFY BY HAND

part of Challenges_Event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetChallenges extends GetChallenges {
  factory _$GetChallenges([void Function(GetChallengesBuilder)? updates]) =>
      (new GetChallengesBuilder()..update(updates))._build();

  _$GetChallenges._() : super._();

  @override
  GetChallenges rebuild(void Function(GetChallengesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetChallengesBuilder toBuilder() => new GetChallengesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetChallenges;
  }

  @override
  int get hashCode {
    return 430167073;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetChallenges').toString();
  }
}

class GetChallengesBuilder
    implements Builder<GetChallenges, GetChallengesBuilder> {
  _$GetChallenges? _$v;

  GetChallengesBuilder();

  @override
  void replace(GetChallenges other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetChallenges;
  }

  @override
  void update(void Function(GetChallengesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetChallenges build() => _build();

  _$GetChallenges _build() {
    final _$result = _$v ?? new _$GetChallenges._();
    replace(_$result);
    return _$result;
  }
}

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
    replace(_$result);
    return _$result;
  }
}

class _$GetPoints extends GetPoints {
  @override
  final int? ChallengeId;

  factory _$GetPoints([void Function(GetPointsBuilder)? updates]) =>
      (new GetPointsBuilder()..update(updates))._build();

  _$GetPoints._({this.ChallengeId}) : super._();

  @override
  GetPoints rebuild(void Function(GetPointsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetPointsBuilder toBuilder() => new GetPointsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetPoints && ChallengeId == other.ChallengeId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, ChallengeId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetPoints')
          ..add('ChallengeId', ChallengeId))
        .toString();
  }
}

class GetPointsBuilder implements Builder<GetPoints, GetPointsBuilder> {
  _$GetPoints? _$v;

  int? _ChallengeId;
  int? get ChallengeId => _$this._ChallengeId;
  set ChallengeId(int? ChallengeId) => _$this._ChallengeId = ChallengeId;

  GetPointsBuilder();

  GetPointsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ChallengeId = $v.ChallengeId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetPoints other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetPoints;
  }

  @override
  void update(void Function(GetPointsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetPoints build() => _build();

  _$GetPoints _build() {
    final _$result = _$v ?? new _$GetPoints._(ChallengeId: ChallengeId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
