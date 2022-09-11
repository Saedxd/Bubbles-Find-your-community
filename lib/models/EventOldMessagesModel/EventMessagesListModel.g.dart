// GENERATED CODE - DO NOT MODIFY BY HAND

part of EventMessagesListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventMessagesListModel> _$eventMessagesListModelSerializer =
    new _$EventMessagesListModelSerializer();

class _$EventMessagesListModelSerializer
    implements StructuredSerializer<EventMessagesListModel> {
  @override
  final Iterable<Type> types = const [
    EventMessagesListModel,
    _$EventMessagesListModel
  ];
  @override
  final String wireName = 'EventMessagesListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EventMessagesListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EventdetialMessageModel)));
    }
    value = object.replies;
    if (value != null) {
      result
        ..add('replies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ReplieslISTModel)])));
    }
    return result;
  }

  @override
  EventMessagesListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventMessagesListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'message':
          result.message.replace(serializers.deserialize(value,
                  specifiedType: const FullType(EventdetialMessageModel))!
              as EventdetialMessageModel);
          break;
        case 'replies':
          result.replies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ReplieslISTModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EventMessagesListModel extends EventMessagesListModel {
  @override
  final int? type;
  @override
  final int? id;
  @override
  final EventdetialMessageModel? message;
  @override
  final BuiltList<ReplieslISTModel>? replies;

  factory _$EventMessagesListModel(
          [void Function(EventMessagesListModelBuilder)? updates]) =>
      (new EventMessagesListModelBuilder()..update(updates))._build();

  _$EventMessagesListModel._({this.type, this.id, this.message, this.replies})
      : super._();

  @override
  EventMessagesListModel rebuild(
          void Function(EventMessagesListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventMessagesListModelBuilder toBuilder() =>
      new EventMessagesListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventMessagesListModel &&
        type == other.type &&
        id == other.id &&
        message == other.message &&
        replies == other.replies;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, type.hashCode), id.hashCode), message.hashCode),
        replies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventMessagesListModel')
          ..add('type', type)
          ..add('id', id)
          ..add('message', message)
          ..add('replies', replies))
        .toString();
  }
}

class EventMessagesListModelBuilder
    implements Builder<EventMessagesListModel, EventMessagesListModelBuilder> {
  _$EventMessagesListModel? _$v;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  EventdetialMessageModelBuilder? _message;
  EventdetialMessageModelBuilder get message =>
      _$this._message ??= new EventdetialMessageModelBuilder();
  set message(EventdetialMessageModelBuilder? message) =>
      _$this._message = message;

  ListBuilder<ReplieslISTModel>? _replies;
  ListBuilder<ReplieslISTModel> get replies =>
      _$this._replies ??= new ListBuilder<ReplieslISTModel>();
  set replies(ListBuilder<ReplieslISTModel>? replies) =>
      _$this._replies = replies;

  EventMessagesListModelBuilder();

  EventMessagesListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _message = $v.message?.toBuilder();
      _replies = $v.replies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventMessagesListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventMessagesListModel;
  }

  @override
  void update(void Function(EventMessagesListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventMessagesListModel build() => _build();

  _$EventMessagesListModel _build() {
    _$EventMessagesListModel _$result;
    try {
      _$result = _$v ??
          new _$EventMessagesListModel._(
              type: type,
              id: id,
              message: _message?.build(),
              replies: _replies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'message';
        _message?.build();
        _$failedField = 'replies';
        _replies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventMessagesListModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
