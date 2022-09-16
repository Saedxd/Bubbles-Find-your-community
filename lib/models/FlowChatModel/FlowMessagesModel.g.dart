// GENERATED CODE - DO NOT MODIFY BY HAND

part of FlowMessagesModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FlowMessagesModel> _$flowMessagesModelSerializer =
    new _$FlowMessagesModelSerializer();

class _$FlowMessagesModelSerializer
    implements StructuredSerializer<FlowMessagesModel> {
  @override
  final Iterable<Type> types = const [FlowMessagesModel, _$FlowMessagesModel];
  @override
  final String wireName = 'FlowMessagesModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, FlowMessagesModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sender_name;
    if (value != null) {
      result
        ..add('sender_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.CreatAt;
    if (value != null) {
      result
        ..add('CreatAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sender_background_color;
    if (value != null) {
      result
        ..add('sender_background_color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sender_image;
    if (value != null) {
      result
        ..add('sender_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_sender;
    if (value != null) {
      result
        ..add('is_sender')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  FlowMessagesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FlowMessagesModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_name':
          result.sender_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'CreatAt':
          result.CreatAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_background_color':
          result.sender_background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_image':
          result.sender_image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_sender':
          result.is_sender = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$FlowMessagesModel extends FlowMessagesModel {
  @override
  final String? type;
  @override
  final String? message;
  @override
  final String? sender_name;
  @override
  final String? CreatAt;
  @override
  final String? sender_background_color;
  @override
  final String? sender_image;
  @override
  final int? id;
  @override
  final bool? is_sender;
  @override
  final BuiltList<ReplieslISTModel>? replies;

  factory _$FlowMessagesModel(
          [void Function(FlowMessagesModelBuilder)? updates]) =>
      (new FlowMessagesModelBuilder()..update(updates))._build();

  _$FlowMessagesModel._(
      {this.type,
      this.message,
      this.sender_name,
      this.CreatAt,
      this.sender_background_color,
      this.sender_image,
      this.id,
      this.is_sender,
      this.replies})
      : super._();

  @override
  FlowMessagesModel rebuild(void Function(FlowMessagesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlowMessagesModelBuilder toBuilder() =>
      new FlowMessagesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlowMessagesModel &&
        type == other.type &&
        message == other.message &&
        sender_name == other.sender_name &&
        CreatAt == other.CreatAt &&
        sender_background_color == other.sender_background_color &&
        sender_image == other.sender_image &&
        id == other.id &&
        is_sender == other.is_sender &&
        replies == other.replies;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, type.hashCode), message.hashCode),
                                sender_name.hashCode),
                            CreatAt.hashCode),
                        sender_background_color.hashCode),
                    sender_image.hashCode),
                id.hashCode),
            is_sender.hashCode),
        replies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FlowMessagesModel')
          ..add('type', type)
          ..add('message', message)
          ..add('sender_name', sender_name)
          ..add('CreatAt', CreatAt)
          ..add('sender_background_color', sender_background_color)
          ..add('sender_image', sender_image)
          ..add('id', id)
          ..add('is_sender', is_sender)
          ..add('replies', replies))
        .toString();
  }
}

class FlowMessagesModelBuilder
    implements Builder<FlowMessagesModel, FlowMessagesModelBuilder> {
  _$FlowMessagesModel? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _sender_name;
  String? get sender_name => _$this._sender_name;
  set sender_name(String? sender_name) => _$this._sender_name = sender_name;

  String? _CreatAt;
  String? get CreatAt => _$this._CreatAt;
  set CreatAt(String? CreatAt) => _$this._CreatAt = CreatAt;

  String? _sender_background_color;
  String? get sender_background_color => _$this._sender_background_color;
  set sender_background_color(String? sender_background_color) =>
      _$this._sender_background_color = sender_background_color;

  String? _sender_image;
  String? get sender_image => _$this._sender_image;
  set sender_image(String? sender_image) => _$this._sender_image = sender_image;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  bool? _is_sender;
  bool? get is_sender => _$this._is_sender;
  set is_sender(bool? is_sender) => _$this._is_sender = is_sender;

  ListBuilder<ReplieslISTModel>? _replies;
  ListBuilder<ReplieslISTModel> get replies =>
      _$this._replies ??= new ListBuilder<ReplieslISTModel>();
  set replies(ListBuilder<ReplieslISTModel>? replies) =>
      _$this._replies = replies;

  FlowMessagesModelBuilder();

  FlowMessagesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _message = $v.message;
      _sender_name = $v.sender_name;
      _CreatAt = $v.CreatAt;
      _sender_background_color = $v.sender_background_color;
      _sender_image = $v.sender_image;
      _id = $v.id;
      _is_sender = $v.is_sender;
      _replies = $v.replies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FlowMessagesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FlowMessagesModel;
  }

  @override
  void update(void Function(FlowMessagesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FlowMessagesModel build() => _build();

  _$FlowMessagesModel _build() {
    _$FlowMessagesModel _$result;
    try {
      _$result = _$v ??
          new _$FlowMessagesModel._(
              type: type,
              message: message,
              sender_name: sender_name,
              CreatAt: CreatAt,
              sender_background_color: sender_background_color,
              sender_image: sender_image,
              id: id,
              is_sender: is_sender,
              replies: _replies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'replies';
        _replies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FlowMessagesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
