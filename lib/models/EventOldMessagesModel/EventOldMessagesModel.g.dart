// GENERATED CODE - DO NOT MODIFY BY HAND

part of EventOldMessagesModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventOldMessagesModel> _$eventOldMessagesModelSerializer =
    new _$EventOldMessagesModelSerializer();

class _$EventOldMessagesModelSerializer
    implements StructuredSerializer<EventOldMessagesModel> {
  @override
  final Iterable<Type> types = const [
    EventOldMessagesModel,
    _$EventOldMessagesModel
  ];
  @override
  final String wireName = 'EventOldMessagesModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EventOldMessagesModel object,
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
    value = object.messages;
    if (value != null) {
      result
        ..add('messages')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(EventMessagesListModel)])));
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
  EventOldMessagesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventOldMessagesModelBuilder();

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
        case 'messages':
          result.messages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(EventMessagesListModel)
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

class _$EventOldMessagesModel extends EventOldMessagesModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<EventMessagesListModel>? messages;
  @override
  final String? error;

  factory _$EventOldMessagesModel(
          [void Function(EventOldMessagesModelBuilder)? updates]) =>
      (new EventOldMessagesModelBuilder()..update(updates))._build();

  _$EventOldMessagesModel._(
      {this.msg, this.statuscode, this.messages, this.error})
      : super._();

  @override
  EventOldMessagesModel rebuild(
          void Function(EventOldMessagesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventOldMessagesModelBuilder toBuilder() =>
      new EventOldMessagesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventOldMessagesModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        messages == other.messages &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), messages.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventOldMessagesModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('messages', messages)
          ..add('error', error))
        .toString();
  }
}

class EventOldMessagesModelBuilder
    implements Builder<EventOldMessagesModel, EventOldMessagesModelBuilder> {
  _$EventOldMessagesModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<EventMessagesListModel>? _messages;
  ListBuilder<EventMessagesListModel> get messages =>
      _$this._messages ??= new ListBuilder<EventMessagesListModel>();
  set messages(ListBuilder<EventMessagesListModel>? messages) =>
      _$this._messages = messages;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  EventOldMessagesModelBuilder();

  EventOldMessagesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _messages = $v.messages?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventOldMessagesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventOldMessagesModel;
  }

  @override
  void update(void Function(EventOldMessagesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventOldMessagesModel build() => _build();

  _$EventOldMessagesModel _build() {
    _$EventOldMessagesModel _$result;
    try {
      _$result = _$v ??
          new _$EventOldMessagesModel._(
              msg: msg,
              statuscode: statuscode,
              messages: _messages?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        _messages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventOldMessagesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
