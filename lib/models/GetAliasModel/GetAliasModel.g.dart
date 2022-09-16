// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetAliasModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetAliasModel> _$getAliasModelSerializer =
    new _$GetAliasModelSerializer();

class _$GetAliasModelSerializer implements StructuredSerializer<GetAliasModel> {
  @override
  final Iterable<Type> types = const [GetAliasModel, _$GetAliasModel];
  @override
  final String wireName = 'GetAliasModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetAliasModel object,
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
    value = object.friend;
    if (value != null) {
      result
        ..add('friend')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(FreindModel)));
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
  GetAliasModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetAliasModelBuilder();

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
        case 'friend':
          result.friend.replace(serializers.deserialize(value,
              specifiedType: const FullType(FreindModel))! as FreindModel);
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

class _$GetAliasModel extends GetAliasModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final FreindModel? friend;
  @override
  final String? error;

  factory _$GetAliasModel([void Function(GetAliasModelBuilder)? updates]) =>
      (new GetAliasModelBuilder()..update(updates))._build();

  _$GetAliasModel._({this.msg, this.statuscode, this.friend, this.error})
      : super._();

  @override
  GetAliasModel rebuild(void Function(GetAliasModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAliasModelBuilder toBuilder() => new GetAliasModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAliasModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        friend == other.friend &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), friend.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAliasModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('friend', friend)
          ..add('error', error))
        .toString();
  }
}

class GetAliasModelBuilder
    implements Builder<GetAliasModel, GetAliasModelBuilder> {
  _$GetAliasModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  FreindModelBuilder? _friend;
  FreindModelBuilder get friend => _$this._friend ??= new FreindModelBuilder();
  set friend(FreindModelBuilder? friend) => _$this._friend = friend;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  GetAliasModelBuilder();

  GetAliasModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _friend = $v.friend?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAliasModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAliasModel;
  }

  @override
  void update(void Function(GetAliasModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAliasModel build() => _build();

  _$GetAliasModel _build() {
    _$GetAliasModel _$result;
    try {
      _$result = _$v ??
          new _$GetAliasModel._(
              msg: msg,
              statuscode: statuscode,
              friend: _friend?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'friend';
        _friend?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetAliasModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
