// GENERATED CODE - DO NOT MODIFY BY HAND

part of FriendList_event;

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

class _$GetFreinds extends GetFreinds {
  factory _$GetFreinds([void Function(GetFreindsBuilder)? updates]) =>
      (new GetFreindsBuilder()..update(updates))._build();

  _$GetFreinds._() : super._();

  @override
  GetFreinds rebuild(void Function(GetFreindsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetFreindsBuilder toBuilder() => new GetFreindsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetFreinds;
  }

  @override
  int get hashCode {
    return 680793356;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetFreinds').toString();
  }
}

class GetFreindsBuilder implements Builder<GetFreinds, GetFreindsBuilder> {
  _$GetFreinds? _$v;

  GetFreindsBuilder();

  @override
  void replace(GetFreinds other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetFreinds;
  }

  @override
  void update(void Function(GetFreindsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetFreinds build() => _build();

  _$GetFreinds _build() {
    final _$result = _$v ?? new _$GetFreinds._();
    replace(_$result);
    return _$result;
  }
}

class _$RemoveFriend extends RemoveFriend {
  @override
  final int? friend_id;

  factory _$RemoveFriend([void Function(RemoveFriendBuilder)? updates]) =>
      (new RemoveFriendBuilder()..update(updates))._build();

  _$RemoveFriend._({this.friend_id}) : super._();

  @override
  RemoveFriend rebuild(void Function(RemoveFriendBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveFriendBuilder toBuilder() => new RemoveFriendBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveFriend && friend_id == other.friend_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, friend_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoveFriend')
          ..add('friend_id', friend_id))
        .toString();
  }
}

class RemoveFriendBuilder
    implements Builder<RemoveFriend, RemoveFriendBuilder> {
  _$RemoveFriend? _$v;

  int? _friend_id;
  int? get friend_id => _$this._friend_id;
  set friend_id(int? friend_id) => _$this._friend_id = friend_id;

  RemoveFriendBuilder();

  RemoveFriendBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _friend_id = $v.friend_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveFriend other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemoveFriend;
  }

  @override
  void update(void Function(RemoveFriendBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveFriend build() => _build();

  _$RemoveFriend _build() {
    final _$result = _$v ?? new _$RemoveFriend._(friend_id: friend_id);
    replace(_$result);
    return _$result;
  }
}

class _$IsRefresh extends IsRefresh {
  factory _$IsRefresh([void Function(IsRefreshBuilder)? updates]) =>
      (new IsRefreshBuilder()..update(updates))._build();

  _$IsRefresh._() : super._();

  @override
  IsRefresh rebuild(void Function(IsRefreshBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IsRefreshBuilder toBuilder() => new IsRefreshBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IsRefresh;
  }

  @override
  int get hashCode {
    return 453330599;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('IsRefresh').toString();
  }
}

class IsRefreshBuilder implements Builder<IsRefresh, IsRefreshBuilder> {
  _$IsRefresh? _$v;

  IsRefreshBuilder();

  @override
  void replace(IsRefresh other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IsRefresh;
  }

  @override
  void update(void Function(IsRefreshBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IsRefresh build() => _build();

  _$IsRefresh _build() {
    final _$result = _$v ?? new _$IsRefresh._();
    replace(_$result);
    return _$result;
  }
}

class _$RefreshState extends RefreshState {
  factory _$RefreshState([void Function(RefreshStateBuilder)? updates]) =>
      (new RefreshStateBuilder()..update(updates))._build();

  _$RefreshState._() : super._();

  @override
  RefreshState rebuild(void Function(RefreshStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshStateBuilder toBuilder() => new RefreshStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshState;
  }

  @override
  int get hashCode {
    return 708581181;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('RefreshState').toString();
  }
}

class RefreshStateBuilder
    implements Builder<RefreshState, RefreshStateBuilder> {
  _$RefreshState? _$v;

  RefreshStateBuilder();

  @override
  void replace(RefreshState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefreshState;
  }

  @override
  void update(void Function(RefreshStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshState build() => _build();

  _$RefreshState _build() {
    final _$result = _$v ?? new _$RefreshState._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
