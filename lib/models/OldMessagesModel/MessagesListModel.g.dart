// GENERATED CODE - DO NOT MODIFY BY HAND

part of MessagesListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessagesListModel> _$messagesListModelSerializer =
    new _$MessagesListModelSerializer();

class _$MessagesListModelSerializer
    implements StructuredSerializer<MessagesListModel> {
  @override
  final Iterable<Type> types = const [MessagesListModel, _$MessagesListModel];
  @override
  final String wireName = 'MessagesListModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MessagesListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.me;
    if (value != null) {
      result
        ..add('me')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sms_type;
    if (value != null) {
      result
        ..add('sms_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.receiver_image;
    if (value != null) {
      result
        ..add('receiver_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiver_name;
    if (value != null) {
      result
        ..add('receiver_name')
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
    value = object.sender_name;
    if (value != null) {
      result
        ..add('sender_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
    value = object.receiver_background_color;
    if (value != null) {
      result
        ..add('receiver_background_color')
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
    value = object.receiver_id;
    if (value != null) {
      result
        ..add('receiver_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  MessagesListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessagesListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'me':
          result.me = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sms_type':
          result.sms_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'receiver_image':
          result.receiver_image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_name':
          result.receiver_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_image':
          result.sender_image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_name':
          result.sender_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'CreatAt':
          result.CreatAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_background_color':
          result.receiver_background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_background_color':
          result.sender_background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_id':
          result.receiver_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$MessagesListModel extends MessagesListModel {
  @override
  final int? me;
  @override
  final String? message;
  @override
  final String? sms_type;
  @override
  final int? id;
  @override
  final String? receiver_image;
  @override
  final String? receiver_name;
  @override
  final String? sender_image;
  @override
  final String? sender_name;
  @override
  final String? type;
  @override
  final String? CreatAt;
  @override
  final String? receiver_background_color;
  @override
  final String? sender_background_color;
  @override
  final int? receiver_id;
  @override
  final BuiltList<ReplieslISTModel>? replies;

  factory _$MessagesListModel(
          [void Function(MessagesListModelBuilder)? updates]) =>
      (new MessagesListModelBuilder()..update(updates))._build();

  _$MessagesListModel._(
      {this.me,
      this.message,
      this.sms_type,
      this.id,
      this.receiver_image,
      this.receiver_name,
      this.sender_image,
      this.sender_name,
      this.type,
      this.CreatAt,
      this.receiver_background_color,
      this.sender_background_color,
      this.receiver_id,
      this.replies})
      : super._();

  @override
  MessagesListModel rebuild(void Function(MessagesListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesListModelBuilder toBuilder() =>
      new MessagesListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagesListModel &&
        me == other.me &&
        message == other.message &&
        sms_type == other.sms_type &&
        id == other.id &&
        receiver_image == other.receiver_image &&
        receiver_name == other.receiver_name &&
        sender_image == other.sender_image &&
        sender_name == other.sender_name &&
        type == other.type &&
        CreatAt == other.CreatAt &&
        receiver_background_color == other.receiver_background_color &&
        sender_background_color == other.sender_background_color &&
        receiver_id == other.receiver_id &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, me.hashCode),
                                                        message.hashCode),
                                                    sms_type.hashCode),
                                                id.hashCode),
                                            receiver_image.hashCode),
                                        receiver_name.hashCode),
                                    sender_image.hashCode),
                                sender_name.hashCode),
                            type.hashCode),
                        CreatAt.hashCode),
                    receiver_background_color.hashCode),
                sender_background_color.hashCode),
            receiver_id.hashCode),
        replies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessagesListModel')
          ..add('me', me)
          ..add('message', message)
          ..add('sms_type', sms_type)
          ..add('id', id)
          ..add('receiver_image', receiver_image)
          ..add('receiver_name', receiver_name)
          ..add('sender_image', sender_image)
          ..add('sender_name', sender_name)
          ..add('type', type)
          ..add('CreatAt', CreatAt)
          ..add('receiver_background_color', receiver_background_color)
          ..add('sender_background_color', sender_background_color)
          ..add('receiver_id', receiver_id)
          ..add('replies', replies))
        .toString();
  }
}

class MessagesListModelBuilder
    implements Builder<MessagesListModel, MessagesListModelBuilder> {
  _$MessagesListModel? _$v;

  int? _me;
  int? get me => _$this._me;
  set me(int? me) => _$this._me = me;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _sms_type;
  String? get sms_type => _$this._sms_type;
  set sms_type(String? sms_type) => _$this._sms_type = sms_type;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _receiver_image;
  String? get receiver_image => _$this._receiver_image;
  set receiver_image(String? receiver_image) =>
      _$this._receiver_image = receiver_image;

  String? _receiver_name;
  String? get receiver_name => _$this._receiver_name;
  set receiver_name(String? receiver_name) =>
      _$this._receiver_name = receiver_name;

  String? _sender_image;
  String? get sender_image => _$this._sender_image;
  set sender_image(String? sender_image) => _$this._sender_image = sender_image;

  String? _sender_name;
  String? get sender_name => _$this._sender_name;
  set sender_name(String? sender_name) => _$this._sender_name = sender_name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _CreatAt;
  String? get CreatAt => _$this._CreatAt;
  set CreatAt(String? CreatAt) => _$this._CreatAt = CreatAt;

  String? _receiver_background_color;
  String? get receiver_background_color => _$this._receiver_background_color;
  set receiver_background_color(String? receiver_background_color) =>
      _$this._receiver_background_color = receiver_background_color;

  String? _sender_background_color;
  String? get sender_background_color => _$this._sender_background_color;
  set sender_background_color(String? sender_background_color) =>
      _$this._sender_background_color = sender_background_color;

  int? _receiver_id;
  int? get receiver_id => _$this._receiver_id;
  set receiver_id(int? receiver_id) => _$this._receiver_id = receiver_id;

  ListBuilder<ReplieslISTModel>? _replies;
  ListBuilder<ReplieslISTModel> get replies =>
      _$this._replies ??= new ListBuilder<ReplieslISTModel>();
  set replies(ListBuilder<ReplieslISTModel>? replies) =>
      _$this._replies = replies;

  MessagesListModelBuilder();

  MessagesListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _me = $v.me;
      _message = $v.message;
      _sms_type = $v.sms_type;
      _id = $v.id;
      _receiver_image = $v.receiver_image;
      _receiver_name = $v.receiver_name;
      _sender_image = $v.sender_image;
      _sender_name = $v.sender_name;
      _type = $v.type;
      _CreatAt = $v.CreatAt;
      _receiver_background_color = $v.receiver_background_color;
      _sender_background_color = $v.sender_background_color;
      _receiver_id = $v.receiver_id;
      _replies = $v.replies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagesListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessagesListModel;
  }

  @override
  void update(void Function(MessagesListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessagesListModel build() => _build();

  _$MessagesListModel _build() {
    _$MessagesListModel _$result;
    try {
      _$result = _$v ??
          new _$MessagesListModel._(
              me: me,
              message: message,
              sms_type: sms_type,
              id: id,
              receiver_image: receiver_image,
              receiver_name: receiver_name,
              sender_image: sender_image,
              sender_name: sender_name,
              type: type,
              CreatAt: CreatAt,
              receiver_background_color: receiver_background_color,
              sender_background_color: sender_background_color,
              receiver_id: receiver_id,
              replies: _replies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'replies';
        _replies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MessagesListModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
