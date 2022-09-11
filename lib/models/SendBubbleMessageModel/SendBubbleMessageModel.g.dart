// GENERATED CODE - DO NOT MODIFY BY HAND

part of SendBubbleMessageModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SendBubbleMessageModel> _$sendBubbleMessageModelSerializer =
    new _$SendBubbleMessageModelSerializer();

class _$SendBubbleMessageModelSerializer
    implements StructuredSerializer<SendBubbleMessageModel> {
  @override
  final Iterable<Type> types = const [
    SendBubbleMessageModel,
    _$SendBubbleMessageModel
  ];
  @override
  final String wireName = 'SendBubbleMessageModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SendBubbleMessageModel object,
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
    value = object.sub_message_id;
    if (value != null) {
      result
        ..add('sub_message_id')
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
  SendBubbleMessageModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SendBubbleMessageModelBuilder();

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
        case 'sub_message_id':
          result.sub_message_id = serializers.deserialize(value,
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

class _$SendBubbleMessageModel extends SendBubbleMessageModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final int? message_id;
  @override
  final int? sub_message_id;
  @override
  final String? error;

  factory _$SendBubbleMessageModel(
          [void Function(SendBubbleMessageModelBuilder)? updates]) =>
      (new SendBubbleMessageModelBuilder()..update(updates))._build();

  _$SendBubbleMessageModel._(
      {this.msg,
      this.statuscode,
      this.message_id,
      this.sub_message_id,
      this.error})
      : super._();

  @override
  SendBubbleMessageModel rebuild(
          void Function(SendBubbleMessageModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendBubbleMessageModelBuilder toBuilder() =>
      new SendBubbleMessageModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendBubbleMessageModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        message_id == other.message_id &&
        sub_message_id == other.sub_message_id &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, msg.hashCode), statuscode.hashCode),
                message_id.hashCode),
            sub_message_id.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendBubbleMessageModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('message_id', message_id)
          ..add('sub_message_id', sub_message_id)
          ..add('error', error))
        .toString();
  }
}

class SendBubbleMessageModelBuilder
    implements Builder<SendBubbleMessageModel, SendBubbleMessageModelBuilder> {
  _$SendBubbleMessageModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  int? _message_id;
  int? get message_id => _$this._message_id;
  set message_id(int? message_id) => _$this._message_id = message_id;

  int? _sub_message_id;
  int? get sub_message_id => _$this._sub_message_id;
  set sub_message_id(int? sub_message_id) =>
      _$this._sub_message_id = sub_message_id;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  SendBubbleMessageModelBuilder();

  SendBubbleMessageModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _message_id = $v.message_id;
      _sub_message_id = $v.sub_message_id;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendBubbleMessageModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendBubbleMessageModel;
  }

  @override
  void update(void Function(SendBubbleMessageModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendBubbleMessageModel build() => _build();

  _$SendBubbleMessageModel _build() {
    final _$result = _$v ??
        new _$SendBubbleMessageModel._(
            msg: msg,
            statuscode: statuscode,
            message_id: message_id,
            sub_message_id: sub_message_id,
            error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
