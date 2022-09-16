// GENERATED CODE - DO NOT MODIFY BY HAND

part of SuggestFriendsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SuggestFriendsModel> _$suggestFriendsModelSerializer =
    new _$SuggestFriendsModelSerializer();

class _$SuggestFriendsModelSerializer
    implements StructuredSerializer<SuggestFriendsModel> {
  @override
  final Iterable<Type> types = const [
    SuggestFriendsModel,
    _$SuggestFriendsModel
  ];
  @override
  final String wireName = 'SuggestFriendsModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SuggestFriendsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.msg;
    if (value != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statuscode;
    if (value != null) {
      result
        ..add('statuscode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SuggestedListModel)])));
    }
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SuggestFriendsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SuggestFriendsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SuggestedListModel)]))!
              as BuiltList<Object?>);
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SuggestFriendsModel extends SuggestFriendsModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<SuggestedListModel>? users;
  @override
  final String? error;

  factory _$SuggestFriendsModel(
          [void Function(SuggestFriendsModelBuilder)? updates]) =>
      (new SuggestFriendsModelBuilder()..update(updates))._build();

  _$SuggestFriendsModel._({this.msg, this.statuscode, this.users, this.error})
      : super._();

  @override
  SuggestFriendsModel rebuild(
          void Function(SuggestFriendsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuggestFriendsModelBuilder toBuilder() =>
      new SuggestFriendsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuggestFriendsModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        users == other.users &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), users.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SuggestFriendsModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('users', users)
          ..add('error', error))
        .toString();
  }
}

class SuggestFriendsModelBuilder
    implements Builder<SuggestFriendsModel, SuggestFriendsModelBuilder> {
  _$SuggestFriendsModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<SuggestedListModel>? _users;
  ListBuilder<SuggestedListModel> get users =>
      _$this._users ??= new ListBuilder<SuggestedListModel>();
  set users(ListBuilder<SuggestedListModel>? users) => _$this._users = users;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  SuggestFriendsModelBuilder();

  SuggestFriendsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _users = $v.users?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuggestFriendsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SuggestFriendsModel;
  }

  @override
  void update(void Function(SuggestFriendsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SuggestFriendsModel build() => _build();

  _$SuggestFriendsModel _build() {
    _$SuggestFriendsModel _$result;
    try {
      _$result = _$v ??
          new _$SuggestFriendsModel._(
              msg: msg,
              statuscode: statuscode,
              users: _users?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SuggestFriendsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
