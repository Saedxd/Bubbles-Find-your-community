// GENERATED CODE - DO NOT MODIFY BY HAND

part of OldMessagesModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OldMessagesModel> _$oldMessagesModelSerializer =
    new _$OldMessagesModelSerializer();

class _$OldMessagesModelSerializer
    implements StructuredSerializer<OldMessagesModel> {
  @override
  final Iterable<Type> types = const [OldMessagesModel, _$OldMessagesModel];
  @override
  final String wireName = 'OldMessagesModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, OldMessagesModel object,
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
                BuiltList, const [const FullType(MessagesListModel)])));
    }
    return result;
  }

  @override
  OldMessagesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OldMessagesModelBuilder();

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
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MessagesListModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$OldMessagesModel extends OldMessagesModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<MessagesListModel>? messages;

  factory _$OldMessagesModel(
          [void Function(OldMessagesModelBuilder)? updates]) =>
      (new OldMessagesModelBuilder()..update(updates))._build();

  _$OldMessagesModel._({this.msg, this.statuscode, this.messages}) : super._();

  @override
  OldMessagesModel rebuild(void Function(OldMessagesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OldMessagesModelBuilder toBuilder() =>
      new OldMessagesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OldMessagesModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        messages == other.messages;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), messages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OldMessagesModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('messages', messages))
        .toString();
  }
}

class OldMessagesModelBuilder
    implements Builder<OldMessagesModel, OldMessagesModelBuilder> {
  _$OldMessagesModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<MessagesListModel>? _messages;
  ListBuilder<MessagesListModel> get messages =>
      _$this._messages ??= new ListBuilder<MessagesListModel>();
  set messages(ListBuilder<MessagesListModel>? messages) =>
      _$this._messages = messages;

  OldMessagesModelBuilder();

  OldMessagesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _messages = $v.messages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OldMessagesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OldMessagesModel;
  }

  @override
  void update(void Function(OldMessagesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OldMessagesModel build() => _build();

  _$OldMessagesModel _build() {
    _$OldMessagesModel _$result;
    try {
      _$result = _$v ??
          new _$OldMessagesModel._(
              msg: msg, statuscode: statuscode, messages: _messages?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        _messages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OldMessagesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
