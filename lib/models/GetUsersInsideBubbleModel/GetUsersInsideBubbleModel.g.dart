// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetUsersInsideBubbleModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetUsersInsideBubbleModel> _$getUsersInsideBubbleModelSerializer =
    new _$GetUsersInsideBubbleModelSerializer();

class _$GetUsersInsideBubbleModelSerializer
    implements StructuredSerializer<GetUsersInsideBubbleModel> {
  @override
  final Iterable<Type> types = const [
    GetUsersInsideBubbleModel,
    _$GetUsersInsideBubbleModel
  ];
  @override
  final String wireName = 'GetUsersInsideBubbleModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetUsersInsideBubbleModel object,
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
            specifiedType: const FullType(BuiltList,
                const [const FullType(UsersInsideBubbleListModel)])));
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
  GetUsersInsideBubbleModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetUsersInsideBubbleModelBuilder();

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
              specifiedType: const FullType(BuiltList, const [
                const FullType(UsersInsideBubbleListModel)
              ]))! as BuiltList<Object?>);
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

class _$GetUsersInsideBubbleModel extends GetUsersInsideBubbleModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<UsersInsideBubbleListModel>? users;
  @override
  final String? error;

  factory _$GetUsersInsideBubbleModel(
          [void Function(GetUsersInsideBubbleModelBuilder)? updates]) =>
      (new GetUsersInsideBubbleModelBuilder()..update(updates))._build();

  _$GetUsersInsideBubbleModel._(
      {this.msg, this.statuscode, this.users, this.error})
      : super._();

  @override
  GetUsersInsideBubbleModel rebuild(
          void Function(GetUsersInsideBubbleModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUsersInsideBubbleModelBuilder toBuilder() =>
      new GetUsersInsideBubbleModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUsersInsideBubbleModel &&
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
    return (newBuiltValueToStringHelper(r'GetUsersInsideBubbleModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('users', users)
          ..add('error', error))
        .toString();
  }
}

class GetUsersInsideBubbleModelBuilder
    implements
        Builder<GetUsersInsideBubbleModel, GetUsersInsideBubbleModelBuilder> {
  _$GetUsersInsideBubbleModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<UsersInsideBubbleListModel>? _users;
  ListBuilder<UsersInsideBubbleListModel> get users =>
      _$this._users ??= new ListBuilder<UsersInsideBubbleListModel>();
  set users(ListBuilder<UsersInsideBubbleListModel>? users) =>
      _$this._users = users;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  GetUsersInsideBubbleModelBuilder();

  GetUsersInsideBubbleModelBuilder get _$this {
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
  void replace(GetUsersInsideBubbleModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUsersInsideBubbleModel;
  }

  @override
  void update(void Function(GetUsersInsideBubbleModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUsersInsideBubbleModel build() => _build();

  _$GetUsersInsideBubbleModel _build() {
    _$GetUsersInsideBubbleModel _$result;
    try {
      _$result = _$v ??
          new _$GetUsersInsideBubbleModel._(
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
            r'GetUsersInsideBubbleModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
