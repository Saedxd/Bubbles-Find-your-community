// GENERATED CODE - DO NOT MODIFY BY HAND

part of DirectMessages_event;

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

class _$GetLastMessageWithAllUsers extends GetLastMessageWithAllUsers {
  factory _$GetLastMessageWithAllUsers(
          [void Function(GetLastMessageWithAllUsersBuilder)? updates]) =>
      (new GetLastMessageWithAllUsersBuilder()..update(updates))._build();

  _$GetLastMessageWithAllUsers._() : super._();

  @override
  GetLastMessageWithAllUsers rebuild(
          void Function(GetLastMessageWithAllUsersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetLastMessageWithAllUsersBuilder toBuilder() =>
      new GetLastMessageWithAllUsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetLastMessageWithAllUsers;
  }

  @override
  int get hashCode {
    return 385228200;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetLastMessageWithAllUsers').toString();
  }
}

class GetLastMessageWithAllUsersBuilder
    implements
        Builder<GetLastMessageWithAllUsers, GetLastMessageWithAllUsersBuilder> {
  _$GetLastMessageWithAllUsers? _$v;

  GetLastMessageWithAllUsersBuilder();

  @override
  void replace(GetLastMessageWithAllUsers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetLastMessageWithAllUsers;
  }

  @override
  void update(void Function(GetLastMessageWithAllUsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetLastMessageWithAllUsers build() => _build();

  _$GetLastMessageWithAllUsers _build() {
    final _$result = _$v ?? new _$GetLastMessageWithAllUsers._();
    replace(_$result);
    return _$result;
  }
}

class _$RefreshPage extends RefreshPage {
  factory _$RefreshPage([void Function(RefreshPageBuilder)? updates]) =>
      (new RefreshPageBuilder()..update(updates))._build();

  _$RefreshPage._() : super._();

  @override
  RefreshPage rebuild(void Function(RefreshPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshPageBuilder toBuilder() => new RefreshPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshPage;
  }

  @override
  int get hashCode {
    return 829402971;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('RefreshPage').toString();
  }
}

class RefreshPageBuilder implements Builder<RefreshPage, RefreshPageBuilder> {
  _$RefreshPage? _$v;

  RefreshPageBuilder();

  @override
  void replace(RefreshPage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefreshPage;
  }

  @override
  void update(void Function(RefreshPageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshPage build() => _build();

  _$RefreshPage _build() {
    final _$result = _$v ?? new _$RefreshPage._();
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

class _$SearchDMlist extends SearchDMlist {
  @override
  final String? Keyword;

  factory _$SearchDMlist([void Function(SearchDMlistBuilder)? updates]) =>
      (new SearchDMlistBuilder()..update(updates))._build();

  _$SearchDMlist._({this.Keyword}) : super._();

  @override
  SearchDMlist rebuild(void Function(SearchDMlistBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchDMlistBuilder toBuilder() => new SearchDMlistBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchDMlist && Keyword == other.Keyword;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Keyword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchDMlist')
          ..add('Keyword', Keyword))
        .toString();
  }
}

class SearchDMlistBuilder
    implements Builder<SearchDMlist, SearchDMlistBuilder> {
  _$SearchDMlist? _$v;

  String? _Keyword;
  String? get Keyword => _$this._Keyword;
  set Keyword(String? Keyword) => _$this._Keyword = Keyword;

  SearchDMlistBuilder();

  SearchDMlistBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Keyword = $v.Keyword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchDMlist other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchDMlist;
  }

  @override
  void update(void Function(SearchDMlistBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchDMlist build() => _build();

  _$SearchDMlist _build() {
    final _$result = _$v ?? new _$SearchDMlist._(Keyword: Keyword);
    replace(_$result);
    return _$result;
  }
}

class _$DeleteFromList extends DeleteFromList {
  @override
  final int? index;
  @override
  final int? receiver_id;

  factory _$DeleteFromList([void Function(DeleteFromListBuilder)? updates]) =>
      (new DeleteFromListBuilder()..update(updates))._build();

  _$DeleteFromList._({this.index, this.receiver_id}) : super._();

  @override
  DeleteFromList rebuild(void Function(DeleteFromListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteFromListBuilder toBuilder() =>
      new DeleteFromListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteFromList &&
        index == other.index &&
        receiver_id == other.receiver_id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, index.hashCode), receiver_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeleteFromList')
          ..add('index', index)
          ..add('receiver_id', receiver_id))
        .toString();
  }
}

class DeleteFromListBuilder
    implements Builder<DeleteFromList, DeleteFromListBuilder> {
  _$DeleteFromList? _$v;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  int? _receiver_id;
  int? get receiver_id => _$this._receiver_id;
  set receiver_id(int? receiver_id) => _$this._receiver_id = receiver_id;

  DeleteFromListBuilder();

  DeleteFromListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _index = $v.index;
      _receiver_id = $v.receiver_id;
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
    final _$result =
        _$v ?? new _$DeleteFromList._(index: index, receiver_id: receiver_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
