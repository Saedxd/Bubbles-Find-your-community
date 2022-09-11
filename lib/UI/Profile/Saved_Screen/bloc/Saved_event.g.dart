// GENERATED CODE - DO NOT MODIFY BY HAND

part of Saved_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetSavedBubbles extends GetSavedBubbles {
  @override
  final int? User_id;

  factory _$GetSavedBubbles([void Function(GetSavedBubblesBuilder)? updates]) =>
      (new GetSavedBubblesBuilder()..update(updates))._build();

  _$GetSavedBubbles._({this.User_id}) : super._();

  @override
  GetSavedBubbles rebuild(void Function(GetSavedBubblesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSavedBubblesBuilder toBuilder() =>
      new GetSavedBubblesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSavedBubbles && User_id == other.User_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, User_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetSavedBubbles')
          ..add('User_id', User_id))
        .toString();
  }
}

class GetSavedBubblesBuilder
    implements Builder<GetSavedBubbles, GetSavedBubblesBuilder> {
  _$GetSavedBubbles? _$v;

  int? _User_id;
  int? get User_id => _$this._User_id;
  set User_id(int? User_id) => _$this._User_id = User_id;

  GetSavedBubblesBuilder();

  GetSavedBubblesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _User_id = $v.User_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetSavedBubbles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetSavedBubbles;
  }

  @override
  void update(void Function(GetSavedBubblesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetSavedBubbles build() => _build();

  _$GetSavedBubbles _build() {
    final _$result = _$v ?? new _$GetSavedBubbles._(User_id: User_id);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeShapStatus extends ChangeShapStatus {
  factory _$ChangeShapStatus(
          [void Function(ChangeShapStatusBuilder)? updates]) =>
      (new ChangeShapStatusBuilder()..update(updates))._build();

  _$ChangeShapStatus._() : super._();

  @override
  ChangeShapStatus rebuild(void Function(ChangeShapStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeShapStatusBuilder toBuilder() =>
      new ChangeShapStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeShapStatus;
  }

  @override
  int get hashCode {
    return 304080668;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ChangeShapStatus').toString();
  }
}

class ChangeShapStatusBuilder
    implements Builder<ChangeShapStatus, ChangeShapStatusBuilder> {
  _$ChangeShapStatus? _$v;

  ChangeShapStatusBuilder();

  @override
  void replace(ChangeShapStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeShapStatus;
  }

  @override
  void update(void Function(ChangeShapStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeShapStatus build() => _build();

  _$ChangeShapStatus _build() {
    final _$result = _$v ?? new _$ChangeShapStatus._();
    replace(_$result);
    return _$result;
  }
}

class _$UnSaveBubble extends UnSaveBubble {
  @override
  final int? Bubble_id;
  @override
  final int? index;

  factory _$UnSaveBubble([void Function(UnSaveBubbleBuilder)? updates]) =>
      (new UnSaveBubbleBuilder()..update(updates))._build();

  _$UnSaveBubble._({this.Bubble_id, this.index}) : super._();

  @override
  UnSaveBubble rebuild(void Function(UnSaveBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnSaveBubbleBuilder toBuilder() => new UnSaveBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnSaveBubble &&
        Bubble_id == other.Bubble_id &&
        index == other.index;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Bubble_id.hashCode), index.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnSaveBubble')
          ..add('Bubble_id', Bubble_id)
          ..add('index', index))
        .toString();
  }
}

class UnSaveBubbleBuilder
    implements Builder<UnSaveBubble, UnSaveBubbleBuilder> {
  _$UnSaveBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  UnSaveBubbleBuilder();

  UnSaveBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _index = $v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnSaveBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnSaveBubble;
  }

  @override
  void update(void Function(UnSaveBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnSaveBubble build() => _build();

  _$UnSaveBubble _build() {
    final _$result =
        _$v ?? new _$UnSaveBubble._(Bubble_id: Bubble_id, index: index);
    replace(_$result);
    return _$result;
  }
}

class _$ShowHomePage extends ShowHomePage {
  @override
  final bool? HomePageStatus;

  factory _$ShowHomePage([void Function(ShowHomePageBuilder)? updates]) =>
      (new ShowHomePageBuilder()..update(updates))._build();

  _$ShowHomePage._({this.HomePageStatus}) : super._();

  @override
  ShowHomePage rebuild(void Function(ShowHomePageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowHomePageBuilder toBuilder() => new ShowHomePageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowHomePage && HomePageStatus == other.HomePageStatus;
  }

  @override
  int get hashCode {
    return $jf($jc(0, HomePageStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShowHomePage')
          ..add('HomePageStatus', HomePageStatus))
        .toString();
  }
}

class ShowHomePageBuilder
    implements Builder<ShowHomePage, ShowHomePageBuilder> {
  _$ShowHomePage? _$v;

  bool? _HomePageStatus;
  bool? get HomePageStatus => _$this._HomePageStatus;
  set HomePageStatus(bool? HomePageStatus) =>
      _$this._HomePageStatus = HomePageStatus;

  ShowHomePageBuilder();

  ShowHomePageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _HomePageStatus = $v.HomePageStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowHomePage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShowHomePage;
  }

  @override
  void update(void Function(ShowHomePageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShowHomePage build() => _build();

  _$ShowHomePage _build() {
    final _$result =
        _$v ?? new _$ShowHomePage._(HomePageStatus: HomePageStatus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
