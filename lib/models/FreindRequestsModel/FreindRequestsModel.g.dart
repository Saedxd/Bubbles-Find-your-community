// GENERATED CODE - DO NOT MODIFY BY HAND

part of FreindRequestsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FreindRequestsModel> _$freindRequestsModelSerializer =
    new _$FreindRequestsModelSerializer();

class _$FreindRequestsModelSerializer
    implements StructuredSerializer<FreindRequestsModel> {
  @override
  final Iterable<Type> types = const [
    FreindRequestsModel,
    _$FreindRequestsModel
  ];
  @override
  final String wireName = 'FreindRequestsModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FreindRequestsModel object,
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
                BuiltList, const [const FullType(UsersRequestsModel)])));
    }
    return result;
  }

  @override
  FreindRequestsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FreindRequestsModelBuilder();

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
                      BuiltList, const [const FullType(UsersRequestsModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$FreindRequestsModel extends FreindRequestsModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<UsersRequestsModel>? users;

  factory _$FreindRequestsModel(
          [void Function(FreindRequestsModelBuilder)? updates]) =>
      (new FreindRequestsModelBuilder()..update(updates))._build();

  _$FreindRequestsModel._({this.msg, this.statuscode, this.users}) : super._();

  @override
  FreindRequestsModel rebuild(
          void Function(FreindRequestsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FreindRequestsModelBuilder toBuilder() =>
      new FreindRequestsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FreindRequestsModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        users == other.users;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FreindRequestsModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('users', users))
        .toString();
  }
}

class FreindRequestsModelBuilder
    implements Builder<FreindRequestsModel, FreindRequestsModelBuilder> {
  _$FreindRequestsModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<UsersRequestsModel>? _users;
  ListBuilder<UsersRequestsModel> get users =>
      _$this._users ??= new ListBuilder<UsersRequestsModel>();
  set users(ListBuilder<UsersRequestsModel>? users) => _$this._users = users;

  FreindRequestsModelBuilder();

  FreindRequestsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _users = $v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FreindRequestsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FreindRequestsModel;
  }

  @override
  void update(void Function(FreindRequestsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FreindRequestsModel build() => _build();

  _$FreindRequestsModel _build() {
    _$FreindRequestsModel _$result;
    try {
      _$result = _$v ??
          new _$FreindRequestsModel._(
              msg: msg, statuscode: statuscode, users: _users?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FreindRequestsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
