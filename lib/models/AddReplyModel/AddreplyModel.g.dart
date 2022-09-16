// GENERATED CODE - DO NOT MODIFY BY HAND

part of AddreplyModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddreplyModel> _$addreplyModelSerializer =
    new _$AddreplyModelSerializer();

class _$AddreplyModelSerializer implements StructuredSerializer<AddreplyModel> {
  @override
  final Iterable<Type> types = const [AddreplyModel, _$AddreplyModel];
  @override
  final String wireName = 'AddreplyModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddreplyModel object,
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
    value = object.message_id;
    if (value != null) {
      result
        ..add('message_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  AddreplyModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddreplyModelBuilder();

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
        case 'message_id':
          result.message_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$AddreplyModel extends AddreplyModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final int? message_id;
  @override
  final String? error;

  factory _$AddreplyModel([void Function(AddreplyModelBuilder)? updates]) =>
      (new AddreplyModelBuilder()..update(updates))._build();

  _$AddreplyModel._({this.msg, this.statuscode, this.message_id, this.error})
      : super._();

  @override
  AddreplyModel rebuild(void Function(AddreplyModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddreplyModelBuilder toBuilder() => new AddreplyModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddreplyModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        message_id == other.message_id &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode),
            message_id.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddreplyModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('message_id', message_id)
          ..add('error', error))
        .toString();
  }
}

class AddreplyModelBuilder
    implements Builder<AddreplyModel, AddreplyModelBuilder> {
  _$AddreplyModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  int? _message_id;
  int? get message_id => _$this._message_id;
  set message_id(int? message_id) => _$this._message_id = message_id;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  AddreplyModelBuilder();

  AddreplyModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _message_id = $v.message_id;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddreplyModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddreplyModel;
  }

  @override
  void update(void Function(AddreplyModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddreplyModel build() => _build();

  _$AddreplyModel _build() {
    final _$result = _$v ??
        new _$AddreplyModel._(
            msg: msg,
            statuscode: statuscode,
            message_id: message_id,
            error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
