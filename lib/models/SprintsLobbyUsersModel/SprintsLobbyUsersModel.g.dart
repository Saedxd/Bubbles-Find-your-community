// GENERATED CODE - DO NOT MODIFY BY HAND

part of SprintsLobbyUsersModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SprintsLobbyUsersModel> _$sprintsLobbyUsersModelSerializer =
    new _$SprintsLobbyUsersModelSerializer();

class _$SprintsLobbyUsersModelSerializer
    implements StructuredSerializer<SprintsLobbyUsersModel> {
  @override
  final Iterable<Type> types = const [
    SprintsLobbyUsersModel,
    _$SprintsLobbyUsersModel
  ];
  @override
  final String wireName = 'SprintsLobbyUsersModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SprintsLobbyUsersModel object,
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
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList,
                const [const FullType(UsersInsideBubbleListModel)])));
    }
    return result;
  }

  @override
  SprintsLobbyUsersModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SprintsLobbyUsersModelBuilder();

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
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(UsersInsideBubbleListModel)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SprintsLobbyUsersModel extends SprintsLobbyUsersModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final String? error;
  @override
  final BuiltList<UsersInsideBubbleListModel>? users;

  factory _$SprintsLobbyUsersModel(
          [void Function(SprintsLobbyUsersModelBuilder)? updates]) =>
      (new SprintsLobbyUsersModelBuilder()..update(updates))._build();

  _$SprintsLobbyUsersModel._(
      {this.msg, this.statuscode, this.error, this.users})
      : super._();

  @override
  SprintsLobbyUsersModel rebuild(
          void Function(SprintsLobbyUsersModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SprintsLobbyUsersModelBuilder toBuilder() =>
      new SprintsLobbyUsersModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SprintsLobbyUsersModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        error == other.error &&
        users == other.users;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), error.hashCode),
        users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SprintsLobbyUsersModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('error', error)
          ..add('users', users))
        .toString();
  }
}

class SprintsLobbyUsersModelBuilder
    implements Builder<SprintsLobbyUsersModel, SprintsLobbyUsersModelBuilder> {
  _$SprintsLobbyUsersModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  ListBuilder<UsersInsideBubbleListModel>? _users;
  ListBuilder<UsersInsideBubbleListModel> get users =>
      _$this._users ??= new ListBuilder<UsersInsideBubbleListModel>();
  set users(ListBuilder<UsersInsideBubbleListModel>? users) =>
      _$this._users = users;

  SprintsLobbyUsersModelBuilder();

  SprintsLobbyUsersModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _error = $v.error;
      _users = $v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SprintsLobbyUsersModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SprintsLobbyUsersModel;
  }

  @override
  void update(void Function(SprintsLobbyUsersModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SprintsLobbyUsersModel build() => _build();

  _$SprintsLobbyUsersModel _build() {
    _$SprintsLobbyUsersModel _$result;
    try {
      _$result = _$v ??
          new _$SprintsLobbyUsersModel._(
              msg: msg,
              statuscode: statuscode,
              error: error,
              users: _users?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SprintsLobbyUsersModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
