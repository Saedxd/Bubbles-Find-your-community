// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetFriendsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetFriendsModel> _$getFriendsModelSerializer =
    new _$GetFriendsModelSerializer();

class _$GetFriendsModelSerializer
    implements StructuredSerializer<GetFriendsModel> {
  @override
  final Iterable<Type> types = const [GetFriendsModel, _$GetFriendsModel];
  @override
  final String wireName = 'GetFriendsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetFriendsModel object,
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
    value = object.StatusCode;
    if (value != null) {
      result
        ..add('StatusCode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.friends;
    if (value != null) {
      result
        ..add('friends')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(FriendsListModel)])));
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
  GetFriendsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetFriendsModelBuilder();

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
        case 'StatusCode':
          result.StatusCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'friends':
          result.friends.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(FriendsListModel)]))!
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

class _$GetFriendsModel extends GetFriendsModel {
  @override
  final String? msg;
  @override
  final int? StatusCode;
  @override
  final BuiltList<FriendsListModel>? friends;
  @override
  final String? error;

  factory _$GetFriendsModel([void Function(GetFriendsModelBuilder)? updates]) =>
      (new GetFriendsModelBuilder()..update(updates))._build();

  _$GetFriendsModel._({this.msg, this.StatusCode, this.friends, this.error})
      : super._();

  @override
  GetFriendsModel rebuild(void Function(GetFriendsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetFriendsModelBuilder toBuilder() =>
      new GetFriendsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetFriendsModel &&
        msg == other.msg &&
        StatusCode == other.StatusCode &&
        friends == other.friends &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), StatusCode.hashCode), friends.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetFriendsModel')
          ..add('msg', msg)
          ..add('StatusCode', StatusCode)
          ..add('friends', friends)
          ..add('error', error))
        .toString();
  }
}

class GetFriendsModelBuilder
    implements Builder<GetFriendsModel, GetFriendsModelBuilder> {
  _$GetFriendsModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _StatusCode;
  int? get StatusCode => _$this._StatusCode;
  set StatusCode(int? StatusCode) => _$this._StatusCode = StatusCode;

  ListBuilder<FriendsListModel>? _friends;
  ListBuilder<FriendsListModel> get friends =>
      _$this._friends ??= new ListBuilder<FriendsListModel>();
  set friends(ListBuilder<FriendsListModel>? friends) =>
      _$this._friends = friends;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  GetFriendsModelBuilder();

  GetFriendsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _StatusCode = $v.StatusCode;
      _friends = $v.friends?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetFriendsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetFriendsModel;
  }

  @override
  void update(void Function(GetFriendsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetFriendsModel build() => _build();

  _$GetFriendsModel _build() {
    _$GetFriendsModel _$result;
    try {
      _$result = _$v ??
          new _$GetFriendsModel._(
              msg: msg,
              StatusCode: StatusCode,
              friends: _friends?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friends';
        _friends?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetFriendsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
