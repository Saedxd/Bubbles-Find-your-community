// GENERATED CODE - DO NOT MODIFY BY HAND

part of SuggestedFrineds_event;

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

class _$GetSuggestedFriends extends GetSuggestedFriends {
  factory _$GetSuggestedFriends(
          [void Function(GetSuggestedFriendsBuilder)? updates]) =>
      (new GetSuggestedFriendsBuilder()..update(updates))._build();

  _$GetSuggestedFriends._() : super._();

  @override
  GetSuggestedFriends rebuild(
          void Function(GetSuggestedFriendsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSuggestedFriendsBuilder toBuilder() =>
      new GetSuggestedFriendsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSuggestedFriends;
  }

  @override
  int get hashCode {
    return 1036011437;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetSuggestedFriends').toString();
  }
}

class GetSuggestedFriendsBuilder
    implements Builder<GetSuggestedFriends, GetSuggestedFriendsBuilder> {
  _$GetSuggestedFriends? _$v;

  GetSuggestedFriendsBuilder();

  @override
  void replace(GetSuggestedFriends other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetSuggestedFriends;
  }

  @override
  void update(void Function(GetSuggestedFriendsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetSuggestedFriends build() => _build();

  _$GetSuggestedFriends _build() {
    final _$result = _$v ?? new _$GetSuggestedFriends._();
    replace(_$result);
    return _$result;
  }
}

class _$AddFrined extends AddFrined {
  @override
  final String? serial;

  factory _$AddFrined([void Function(AddFrinedBuilder)? updates]) =>
      (new AddFrinedBuilder()..update(updates))._build();

  _$AddFrined._({this.serial}) : super._();

  @override
  AddFrined rebuild(void Function(AddFrinedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFrinedBuilder toBuilder() => new AddFrinedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFrined && serial == other.serial;
  }

  @override
  int get hashCode {
    return $jf($jc(0, serial.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddFrined')..add('serial', serial))
        .toString();
  }
}

class AddFrinedBuilder implements Builder<AddFrined, AddFrinedBuilder> {
  _$AddFrined? _$v;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  AddFrinedBuilder();

  AddFrinedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serial = $v.serial;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddFrined other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddFrined;
  }

  @override
  void update(void Function(AddFrinedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddFrined build() => _build();

  _$AddFrined _build() {
    final _$result = _$v ?? new _$AddFrined._(serial: serial);
    replace(_$result);
    return _$result;
  }
}

class _$DeleteFromList extends DeleteFromList {
  @override
  final int? index;

  factory _$DeleteFromList([void Function(DeleteFromListBuilder)? updates]) =>
      (new DeleteFromListBuilder()..update(updates))._build();

  _$DeleteFromList._({this.index}) : super._();

  @override
  DeleteFromList rebuild(void Function(DeleteFromListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteFromListBuilder toBuilder() =>
      new DeleteFromListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteFromList && index == other.index;
  }

  @override
  int get hashCode {
    return $jf($jc(0, index.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteFromList')..add('index', index))
        .toString();
  }
}

class DeleteFromListBuilder
    implements Builder<DeleteFromList, DeleteFromListBuilder> {
  _$DeleteFromList? _$v;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  DeleteFromListBuilder();

  DeleteFromListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _index = $v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteFromList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteFromList;
  }

  @override
  void update(void Function(DeleteFromListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteFromList build() => _build();

  _$DeleteFromList _build() {
    final _$result = _$v ?? new _$DeleteFromList._(index: index);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
