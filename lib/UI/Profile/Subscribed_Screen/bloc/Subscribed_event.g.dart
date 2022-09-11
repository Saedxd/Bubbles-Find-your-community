// GENERATED CODE - DO NOT MODIFY BY HAND

part of Subscribed_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetContactList extends GetContactList {
  factory _$GetContactList([void Function(GetContactListBuilder)? updates]) =>
      (new GetContactListBuilder()..update(updates))._build();

  _$GetContactList._() : super._();

  @override
  GetContactList rebuild(void Function(GetContactListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetContactListBuilder toBuilder() =>
      new GetContactListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetContactList;
  }

  @override
  int get hashCode {
    return 32452569;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetContactList').toString();
  }
}

class GetContactListBuilder
    implements Builder<GetContactList, GetContactListBuilder> {
  _$GetContactList? _$v;

  GetContactListBuilder();

  @override
  void replace(GetContactList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetContactList;
  }

  @override
  void update(void Function(GetContactListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetContactList build() => _build();

  _$GetContactList _build() {
    final _$result = _$v ?? new _$GetContactList._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
