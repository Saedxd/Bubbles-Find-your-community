// GENERATED CODE - DO NOT MODIFY BY HAND

part of PrimePlanEvent;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GiveMeifItsSaved extends GiveMeifItsSaved {
  @override
  final bool? is_saved;

  factory _$GiveMeifItsSaved(
          [void Function(GiveMeifItsSavedBuilder)? updates]) =>
      (new GiveMeifItsSavedBuilder()..update(updates))._build();

  _$GiveMeifItsSaved._({this.is_saved}) : super._();

  @override
  GiveMeifItsSaved rebuild(void Function(GiveMeifItsSavedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveMeifItsSavedBuilder toBuilder() =>
      new GiveMeifItsSavedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveMeifItsSaved && is_saved == other.is_saved;
  }

  @override
  int get hashCode {
    return $jf($jc(0, is_saved.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GiveMeifItsSaved')
          ..add('is_saved', is_saved))
        .toString();
  }
}

class GiveMeifItsSavedBuilder
    implements Builder<GiveMeifItsSaved, GiveMeifItsSavedBuilder> {
  _$GiveMeifItsSaved? _$v;

  bool? _is_saved;
  bool? get is_saved => _$this._is_saved;
  set is_saved(bool? is_saved) => _$this._is_saved = is_saved;

  GiveMeifItsSavedBuilder();

  GiveMeifItsSavedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _is_saved = $v.is_saved;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveMeifItsSaved other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GiveMeifItsSaved;
  }

  @override
  void update(void Function(GiveMeifItsSavedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveMeifItsSaved build() => _build();

  _$GiveMeifItsSaved _build() {
    final _$result = _$v ?? new _$GiveMeifItsSaved._(is_saved: is_saved);
    replace(_$result);
    return _$result;
  }
}

class _$GetProfile extends GetProfile {
  factory _$GetProfile([void Function(GetProfileBuilder)? updates]) =>
      (new GetProfileBuilder()..update(updates))._build();

  _$GetProfile._() : super._();

  @override
  GetProfile rebuild(void Function(GetProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetProfileBuilder toBuilder() => new GetProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetProfile;
  }

  @override
  int get hashCode {
    return 520564276;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetProfile').toString();
  }
}

class GetProfileBuilder implements Builder<GetProfile, GetProfileBuilder> {
  _$GetProfile? _$v;

  GetProfileBuilder();

  @override
  void replace(GetProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetProfile;
  }

  @override
  void update(void Function(GetProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetProfile build() => _build();

  _$GetProfile _build() {
    final _$result = _$v ?? new _$GetProfile._();
    replace(_$result);
    return _$result;
  }
}

class _$ToggleSaveBubble extends ToggleSaveBubble {
  @override
  final int? Bubble_id;
  @override
  final int? index;

  factory _$ToggleSaveBubble(
          [void Function(ToggleSaveBubbleBuilder)? updates]) =>
      (new ToggleSaveBubbleBuilder()..update(updates))._build();

  _$ToggleSaveBubble._({this.Bubble_id, this.index}) : super._();

  @override
  ToggleSaveBubble rebuild(void Function(ToggleSaveBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToggleSaveBubbleBuilder toBuilder() =>
      new ToggleSaveBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToggleSaveBubble &&
        Bubble_id == other.Bubble_id &&
        index == other.index;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Bubble_id.hashCode), index.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ToggleSaveBubble')
          ..add('Bubble_id', Bubble_id)
          ..add('index', index))
        .toString();
  }
}

class ToggleSaveBubbleBuilder
    implements Builder<ToggleSaveBubble, ToggleSaveBubbleBuilder> {
  _$ToggleSaveBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  ToggleSaveBubbleBuilder();

  ToggleSaveBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _index = $v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ToggleSaveBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ToggleSaveBubble;
  }

  @override
  void update(void Function(ToggleSaveBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToggleSaveBubble build() => _build();

  _$ToggleSaveBubble _build() {
    final _$result =
        _$v ?? new _$ToggleSaveBubble._(Bubble_id: Bubble_id, index: index);
    replace(_$result);
    return _$result;
  }
}

class _$GetWhoSavedBubble extends GetWhoSavedBubble {
  @override
  final int? Bubble_id;
  @override
  final bool? is_saved;

  factory _$GetWhoSavedBubble(
          [void Function(GetWhoSavedBubbleBuilder)? updates]) =>
      (new GetWhoSavedBubbleBuilder()..update(updates))._build();

  _$GetWhoSavedBubble._({this.Bubble_id, this.is_saved}) : super._();

  @override
  GetWhoSavedBubble rebuild(void Function(GetWhoSavedBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetWhoSavedBubbleBuilder toBuilder() =>
      new GetWhoSavedBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetWhoSavedBubble &&
        Bubble_id == other.Bubble_id &&
        is_saved == other.is_saved;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Bubble_id.hashCode), is_saved.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetWhoSavedBubble')
          ..add('Bubble_id', Bubble_id)
          ..add('is_saved', is_saved))
        .toString();
  }
}

class GetWhoSavedBubbleBuilder
    implements Builder<GetWhoSavedBubble, GetWhoSavedBubbleBuilder> {
  _$GetWhoSavedBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  bool? _is_saved;
  bool? get is_saved => _$this._is_saved;
  set is_saved(bool? is_saved) => _$this._is_saved = is_saved;

  GetWhoSavedBubbleBuilder();

  GetWhoSavedBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _is_saved = $v.is_saved;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetWhoSavedBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetWhoSavedBubble;
  }

  @override
  void update(void Function(GetWhoSavedBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetWhoSavedBubble build() => _build();

  _$GetWhoSavedBubble _build() {
    final _$result = _$v ??
        new _$GetWhoSavedBubble._(Bubble_id: Bubble_id, is_saved: is_saved);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
