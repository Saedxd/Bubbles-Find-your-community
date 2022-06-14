// GENERATED CODE - DO NOT MODIFY BY HAND

part of FriendRequest_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Toggle extends Toggle {
  factory _$Toggle([void Function(ToggleBuilder)? updates]) =>
      (new ToggleBuilder()..update(updates))._build();

  _$Toggle._() : super._();

  @override
  Toggle rebuild(void Function(ToggleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToggleBuilder toBuilder() => new ToggleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Toggle;
  }

  @override
  int get hashCode {
    return 570250658;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Toggle').toString();
  }
}

class ToggleBuilder implements Builder<Toggle, ToggleBuilder> {
  _$Toggle? _$v;

  ToggleBuilder();

  @override
  void replace(Toggle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Toggle;
  }

  @override
  void update(void Function(ToggleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Toggle build() => _build();

  _$Toggle _build() {
    final _$result = _$v ?? new _$Toggle._();
    replace(_$result);
    return _$result;
  }
}

class _$FreindsRequests extends FreindsRequests {
  factory _$FreindsRequests([void Function(FreindsRequestsBuilder)? updates]) =>
      (new FreindsRequestsBuilder()..update(updates))._build();

  _$FreindsRequests._() : super._();

  @override
  FreindsRequests rebuild(void Function(FreindsRequestsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FreindsRequestsBuilder toBuilder() =>
      new FreindsRequestsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FreindsRequests;
  }

  @override
  int get hashCode {
    return 884359643;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('FreindsRequests').toString();
  }
}

class FreindsRequestsBuilder
    implements Builder<FreindsRequests, FreindsRequestsBuilder> {
  _$FreindsRequests? _$v;

  FreindsRequestsBuilder();

  @override
  void replace(FreindsRequests other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FreindsRequests;
  }

  @override
  void update(void Function(FreindsRequestsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FreindsRequests build() => _build();

  _$FreindsRequests _build() {
    final _$result = _$v ?? new _$FreindsRequests._();
    replace(_$result);
    return _$result;
  }
}

class _$AceeptRequest extends AceeptRequest {
  @override
  final int? friend_id;

  factory _$AceeptRequest([void Function(AceeptRequestBuilder)? updates]) =>
      (new AceeptRequestBuilder()..update(updates))._build();

  _$AceeptRequest._({this.friend_id}) : super._();

  @override
  AceeptRequest rebuild(void Function(AceeptRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AceeptRequestBuilder toBuilder() => new AceeptRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AceeptRequest && friend_id == other.friend_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, friend_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AceeptRequest')
          ..add('friend_id', friend_id))
        .toString();
  }
}

class AceeptRequestBuilder
    implements Builder<AceeptRequest, AceeptRequestBuilder> {
  _$AceeptRequest? _$v;

  int? _friend_id;
  int? get friend_id => _$this._friend_id;
  set friend_id(int? friend_id) => _$this._friend_id = friend_id;

  AceeptRequestBuilder();

  AceeptRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _friend_id = $v.friend_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AceeptRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AceeptRequest;
  }

  @override
  void update(void Function(AceeptRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AceeptRequest build() => _build();

  _$AceeptRequest _build() {
    final _$result = _$v ?? new _$AceeptRequest._(friend_id: friend_id);
    replace(_$result);
    return _$result;
  }
}

class _$DenyRequest extends DenyRequest {
  @override
  final int? friend_id;

  factory _$DenyRequest([void Function(DenyRequestBuilder)? updates]) =>
      (new DenyRequestBuilder()..update(updates))._build();

  _$DenyRequest._({this.friend_id}) : super._();

  @override
  DenyRequest rebuild(void Function(DenyRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DenyRequestBuilder toBuilder() => new DenyRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DenyRequest && friend_id == other.friend_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, friend_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DenyRequest')
          ..add('friend_id', friend_id))
        .toString();
  }
}

class DenyRequestBuilder implements Builder<DenyRequest, DenyRequestBuilder> {
  _$DenyRequest? _$v;

  int? _friend_id;
  int? get friend_id => _$this._friend_id;
  set friend_id(int? friend_id) => _$this._friend_id = friend_id;

  DenyRequestBuilder();

  DenyRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _friend_id = $v.friend_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DenyRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DenyRequest;
  }

  @override
  void update(void Function(DenyRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DenyRequest build() => _build();

  _$DenyRequest _build() {
    final _$result = _$v ?? new _$DenyRequest._(friend_id: friend_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
