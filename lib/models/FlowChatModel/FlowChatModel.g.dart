// GENERATED CODE - DO NOT MODIFY BY HAND

part of FlowChatModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FlowChatModel> _$flowChatModelSerializer =
    new _$FlowChatModelSerializer();

class _$FlowChatModelSerializer implements StructuredSerializer<FlowChatModel> {
  @override
  final Iterable<Type> types = const [FlowChatModel, _$FlowChatModel];
  @override
  final String wireName = 'FlowChatModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, FlowChatModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.messages;
    if (value != null) {
      result
        ..add('messages')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(FlowMessagesModel)])));
    }
    return result;
  }

  @override
  FlowChatModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FlowChatModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'messages':
          result.messages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(FlowMessagesModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$FlowChatModel extends FlowChatModel {
  @override
  final String? error;
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<FlowMessagesModel>? messages;

  factory _$FlowChatModel([void Function(FlowChatModelBuilder)? updates]) =>
      (new FlowChatModelBuilder()..update(updates))._build();

  _$FlowChatModel._({this.error, this.msg, this.statuscode, this.messages})
      : super._();

  @override
  FlowChatModel rebuild(void Function(FlowChatModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlowChatModelBuilder toBuilder() => new FlowChatModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlowChatModel &&
        error == other.error &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        messages == other.messages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, error.hashCode), msg.hashCode), statuscode.hashCode),
        messages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FlowChatModel')
          ..add('error', error)
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('messages', messages))
        .toString();
  }
}

class FlowChatModelBuilder
    implements Builder<FlowChatModel, FlowChatModelBuilder> {
  _$FlowChatModel? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<FlowMessagesModel>? _messages;
  ListBuilder<FlowMessagesModel> get messages =>
      _$this._messages ??= new ListBuilder<FlowMessagesModel>();
  set messages(ListBuilder<FlowMessagesModel>? messages) =>
      _$this._messages = messages;

  FlowChatModelBuilder();

  FlowChatModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _messages = $v.messages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FlowChatModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FlowChatModel;
  }

  @override
  void update(void Function(FlowChatModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FlowChatModel build() => _build();

  _$FlowChatModel _build() {
    _$FlowChatModel _$result;
    try {
      _$result = _$v ??
          new _$FlowChatModel._(
              error: error,
              msg: msg,
              statuscode: statuscode,
              messages: _messages?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        _messages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FlowChatModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
