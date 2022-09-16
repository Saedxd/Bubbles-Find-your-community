// GENERATED CODE - DO NOT MODIFY BY HAND

part of Settings_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Logout extends Logout {
  factory _$Logout([void Function(LogoutBuilder)? updates]) =>
      (new LogoutBuilder()..update(updates))._build();

  _$Logout._() : super._();

  @override
  Logout rebuild(void Function(LogoutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogoutBuilder toBuilder() => new LogoutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Logout;
  }

  @override
  int get hashCode {
    return 676553867;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'Logout').toString();
  }
}

class LogoutBuilder implements Builder<Logout, LogoutBuilder> {
  _$Logout? _$v;

  LogoutBuilder();

  @override
  void replace(Logout other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Logout;
  }

  @override
  void update(void Function(LogoutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Logout build() => _build();

  _$Logout _build() {
    final _$result = _$v ?? new _$Logout._();
    replace(_$result);
    return _$result;
  }
}

class _$UserLeftBubble extends UserLeftBubble {
  @override
  final int? Bubble_id;

  factory _$UserLeftBubble([void Function(UserLeftBubbleBuilder)? updates]) =>
      (new UserLeftBubbleBuilder()..update(updates))._build();

  _$UserLeftBubble._({this.Bubble_id}) : super._();

  @override
  UserLeftBubble rebuild(void Function(UserLeftBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserLeftBubbleBuilder toBuilder() =>
      new UserLeftBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLeftBubble && Bubble_id == other.Bubble_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Bubble_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserLeftBubble')
          ..add('Bubble_id', Bubble_id))
        .toString();
  }
}

class UserLeftBubbleBuilder
    implements Builder<UserLeftBubble, UserLeftBubbleBuilder> {
  _$UserLeftBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  UserLeftBubbleBuilder();

  UserLeftBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserLeftBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserLeftBubble;
  }

  @override
  void update(void Function(UserLeftBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserLeftBubble build() => _build();

  _$UserLeftBubble _build() {
    final _$result = _$v ?? new _$UserLeftBubble._(Bubble_id: Bubble_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
