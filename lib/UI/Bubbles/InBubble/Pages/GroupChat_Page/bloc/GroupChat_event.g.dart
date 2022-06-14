// GENERATED CODE - DO NOT MODIFY BY HAND

part of GroupChat_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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
    return newBuiltValueToStringHelper('ClearError').toString();
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

class _$KetbaordStatus extends KetbaordStatus {
  @override
  final bool? status;

  factory _$KetbaordStatus([void Function(KetbaordStatusBuilder)? updates]) =>
      (new KetbaordStatusBuilder()..update(updates))._build();

  _$KetbaordStatus._({this.status}) : super._();

  @override
  KetbaordStatus rebuild(void Function(KetbaordStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KetbaordStatusBuilder toBuilder() =>
      new KetbaordStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KetbaordStatus && status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KetbaordStatus')
          ..add('status', status))
        .toString();
  }
}

class KetbaordStatusBuilder
    implements Builder<KetbaordStatus, KetbaordStatusBuilder> {
  _$KetbaordStatus? _$v;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  KetbaordStatusBuilder();

  KetbaordStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KetbaordStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KetbaordStatus;
  }

  @override
  void update(void Function(KetbaordStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KetbaordStatus build() => _build();

  _$KetbaordStatus _build() {
    final _$result = _$v ?? new _$KetbaordStatus._(status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
