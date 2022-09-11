// GENERATED CODE - DO NOT MODIFY BY HAND

part of SeeAll_Event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GiveHimListOfBoolean extends GiveHimListOfBoolean {
  @override
  final List<bool>? List_Saved_Status;

  factory _$GiveHimListOfBoolean(
          [void Function(GiveHimListOfBooleanBuilder)? updates]) =>
      (new GiveHimListOfBooleanBuilder()..update(updates))._build();

  _$GiveHimListOfBoolean._({this.List_Saved_Status}) : super._();

  @override
  GiveHimListOfBoolean rebuild(
          void Function(GiveHimListOfBooleanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveHimListOfBooleanBuilder toBuilder() =>
      new GiveHimListOfBooleanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveHimListOfBoolean &&
        List_Saved_Status == other.List_Saved_Status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, List_Saved_Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GiveHimListOfBoolean')
          ..add('List_Saved_Status', List_Saved_Status))
        .toString();
  }
}

class GiveHimListOfBooleanBuilder
    implements Builder<GiveHimListOfBoolean, GiveHimListOfBooleanBuilder> {
  _$GiveHimListOfBoolean? _$v;

  List<bool>? _List_Saved_Status;
  List<bool>? get List_Saved_Status => _$this._List_Saved_Status;
  set List_Saved_Status(List<bool>? List_Saved_Status) =>
      _$this._List_Saved_Status = List_Saved_Status;

  GiveHimListOfBooleanBuilder();

  GiveHimListOfBooleanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _List_Saved_Status = $v.List_Saved_Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveHimListOfBoolean other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GiveHimListOfBoolean;
  }

  @override
  void update(void Function(GiveHimListOfBooleanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveHimListOfBoolean build() => _build();

  _$GiveHimListOfBoolean _build() {
    final _$result = _$v ??
        new _$GiveHimListOfBoolean._(List_Saved_Status: List_Saved_Status);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeToDetailUiState extends ChangeToDetailUiState {
  @override
  final BubbleData? Bubbledata;
  @override
  final bool? Status;

  factory _$ChangeToDetailUiState(
          [void Function(ChangeToDetailUiStateBuilder)? updates]) =>
      (new ChangeToDetailUiStateBuilder()..update(updates))._build();

  _$ChangeToDetailUiState._({this.Bubbledata, this.Status}) : super._();

  @override
  ChangeToDetailUiState rebuild(
          void Function(ChangeToDetailUiStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeToDetailUiStateBuilder toBuilder() =>
      new ChangeToDetailUiStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeToDetailUiState &&
        Bubbledata == other.Bubbledata &&
        Status == other.Status;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Bubbledata.hashCode), Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeToDetailUiState')
          ..add('Bubbledata', Bubbledata)
          ..add('Status', Status))
        .toString();
  }
}

class ChangeToDetailUiStateBuilder
    implements Builder<ChangeToDetailUiState, ChangeToDetailUiStateBuilder> {
  _$ChangeToDetailUiState? _$v;

  BubbleData? _Bubbledata;
  BubbleData? get Bubbledata => _$this._Bubbledata;
  set Bubbledata(BubbleData? Bubbledata) => _$this._Bubbledata = Bubbledata;

  bool? _Status;
  bool? get Status => _$this._Status;
  set Status(bool? Status) => _$this._Status = Status;

  ChangeToDetailUiStateBuilder();

  ChangeToDetailUiStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubbledata = $v.Bubbledata;
      _Status = $v.Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeToDetailUiState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeToDetailUiState;
  }

  @override
  void update(void Function(ChangeToDetailUiStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeToDetailUiState build() => _build();

  _$ChangeToDetailUiState _build() {
    final _$result = _$v ??
        new _$ChangeToDetailUiState._(Bubbledata: Bubbledata, Status: Status);
    replace(_$result);
    return _$result;
  }
}

class _$ToggleSaveBubbleEventScreen extends ToggleSaveBubbleEventScreen {
  @override
  final int? Bubble_id;
  @override
  final int? index;
  @override
  final String? List_type;
  @override
  final bool? Saved_Status;

  factory _$ToggleSaveBubbleEventScreen(
          [void Function(ToggleSaveBubbleEventScreenBuilder)? updates]) =>
      (new ToggleSaveBubbleEventScreenBuilder()..update(updates))._build();

  _$ToggleSaveBubbleEventScreen._(
      {this.Bubble_id, this.index, this.List_type, this.Saved_Status})
      : super._();

  @override
  ToggleSaveBubbleEventScreen rebuild(
          void Function(ToggleSaveBubbleEventScreenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToggleSaveBubbleEventScreenBuilder toBuilder() =>
      new ToggleSaveBubbleEventScreenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToggleSaveBubbleEventScreen &&
        Bubble_id == other.Bubble_id &&
        index == other.index &&
        List_type == other.List_type &&
        Saved_Status == other.Saved_Status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, Bubble_id.hashCode), index.hashCode),
            List_type.hashCode),
        Saved_Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ToggleSaveBubbleEventScreen')
          ..add('Bubble_id', Bubble_id)
          ..add('index', index)
          ..add('List_type', List_type)
          ..add('Saved_Status', Saved_Status))
        .toString();
  }
}

class ToggleSaveBubbleEventScreenBuilder
    implements
        Builder<ToggleSaveBubbleEventScreen,
            ToggleSaveBubbleEventScreenBuilder> {
  _$ToggleSaveBubbleEventScreen? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _List_type;
  String? get List_type => _$this._List_type;
  set List_type(String? List_type) => _$this._List_type = List_type;

  bool? _Saved_Status;
  bool? get Saved_Status => _$this._Saved_Status;
  set Saved_Status(bool? Saved_Status) => _$this._Saved_Status = Saved_Status;

  ToggleSaveBubbleEventScreenBuilder();

  ToggleSaveBubbleEventScreenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _index = $v.index;
      _List_type = $v.List_type;
      _Saved_Status = $v.Saved_Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ToggleSaveBubbleEventScreen other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ToggleSaveBubbleEventScreen;
  }

  @override
  void update(void Function(ToggleSaveBubbleEventScreenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToggleSaveBubbleEventScreen build() => _build();

  _$ToggleSaveBubbleEventScreen _build() {
    final _$result = _$v ??
        new _$ToggleSaveBubbleEventScreen._(
            Bubble_id: Bubble_id,
            index: index,
            List_type: List_type,
            Saved_Status: Saved_Status);
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
