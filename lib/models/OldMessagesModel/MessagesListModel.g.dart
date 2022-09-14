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
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.send_by;
    if (value != null) {
      result
        ..add('send_by')
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
    value = object.is_friend;
    if (value != null) {
      result
        ..add('is_friend')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.receiver_is_friend;
    if (value != null) {
      result
        ..add('receiver_is_friend')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.receiver_image;
    if (value != null) {
      result
        ..add('receiver_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiver_id;
    if (value != null) {
      result
        ..add('receiver_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.receiver_name;
    if (value != null) {
      result
        ..add('receiver_name')
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
    value = object.receiver_bio;
    if (value != null) {
      result
        ..add('receiver_bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiver_serial;
    if (value != null) {
      result
        ..add('receiver_serial')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiver_interests;
    if (value != null) {
      result
        ..add('receiver_interests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(InterestsListModel)])));
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
    value = object.sender_serial;
    if (value != null) {
      result
        ..add('sender_serial')
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
    value = object.sender_is_friend;
    if (value != null) {
      result
        ..add('sender_is_friend')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sender_id;
    if (value != null) {
      result
        ..add('sender_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sender_bio;
    if (value != null) {
      result
        ..add('sender_bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sender_interests;
    if (value != null) {
      result
        ..add('sender_interests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(InterestsListModel)])));
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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'send_by':
          result.send_by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'CreatAt':
          result.CreatAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_friend':
          result.is_friend = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'receiver_is_friend':
          result.receiver_is_friend = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'receiver_image':
          result.receiver_image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_id':
          result.receiver_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'receiver_name':
          result.receiver_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_background_color':
          result.receiver_background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_bio':
          result.receiver_bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_serial':
          result.receiver_serial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_interests':
          result.receiver_interests.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(InterestsListModel)]))!
              as BuiltList<Object?>);
          break;
        case 'sender_image':
          result.sender_image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_name':
          result.sender_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_serial':
          result.sender_serial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_background_color':
          result.sender_background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_is_friend':
          result.sender_is_friend = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sender_id':
          result.sender_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sender_bio':
          result.sender_bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_interests':
          result.sender_interests.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(InterestsListModel)]))!
              as BuiltList<Object?>);
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
  final String? type;
  @override
  final String? send_by;
  @override
  final String? CreatAt;
  @override
  final bool? is_friend;
  @override
  final bool? receiver_is_friend;
  @override
  final String? receiver_image;
  @override
  final int? receiver_id;
  @override
  final String? receiver_name;
  @override
  final String? receiver_background_color;
  @override
  final String? receiver_bio;
  @override
  final String? receiver_serial;
  @override
  final BuiltList<InterestsListModel>? receiver_interests;
  @override
  final String? sender_image;
  @override
  final String? sender_name;
  @override
  final String? sender_serial;
  @override
  final String? sender_background_color;
  @override
  final bool? sender_is_friend;
  @override
  final int? sender_id;
  @override
  final String? sender_bio;
  @override
  final BuiltList<InterestsListModel>? sender_interests;
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
      this.type,
      this.send_by,
      this.CreatAt,
      this.is_friend,
      this.receiver_is_friend,
      this.receiver_image,
      this.receiver_id,
      this.receiver_name,
      this.receiver_background_color,
      this.receiver_bio,
      this.receiver_serial,
      this.receiver_interests,
      this.sender_image,
      this.sender_name,
      this.sender_serial,
      this.sender_background_color,
      this.sender_is_friend,
      this.sender_id,
      this.sender_bio,
      this.sender_interests,
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
        type == other.type &&
        send_by == other.send_by &&
        CreatAt == other.CreatAt &&
        is_friend == other.is_friend &&
        receiver_is_friend == other.receiver_is_friend &&
        receiver_image == other.receiver_image &&
        receiver_id == other.receiver_id &&
        receiver_name == other.receiver_name &&
        receiver_background_color == other.receiver_background_color &&
        receiver_bio == other.receiver_bio &&
        receiver_serial == other.receiver_serial &&
        receiver_interests == other.receiver_interests &&
        sender_image == other.sender_image &&
        sender_name == other.sender_name &&
        sender_serial == other.sender_serial &&
        sender_background_color == other.sender_background_color &&
        sender_is_friend == other.sender_is_friend &&
        sender_id == other.sender_id &&
        sender_bio == other.sender_bio &&
        sender_interests == other.sender_interests &&
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
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc(0, me.hashCode), message.hashCode), sms_type.hashCode), id.hashCode), type.hashCode), send_by.hashCode),
                                                                                CreatAt.hashCode),
                                                                            is_friend.hashCode),
                                                                        receiver_is_friend.hashCode),
                                                                    receiver_image.hashCode),
                                                                receiver_id.hashCode),
                                                            receiver_name.hashCode),
                                                        receiver_background_color.hashCode),
                                                    receiver_bio.hashCode),
                                                receiver_serial.hashCode),
                                            receiver_interests.hashCode),
                                        sender_image.hashCode),
                                    sender_name.hashCode),
                                sender_serial.hashCode),
                            sender_background_color.hashCode),
                        sender_is_friend.hashCode),
                    sender_id.hashCode),
                sender_bio.hashCode),
            sender_interests.hashCode),
        replies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessagesListModel')
          ..add('me', me)
          ..add('message', message)
          ..add('sms_type', sms_type)
          ..add('id', id)
          ..add('type', type)
          ..add('send_by', send_by)
          ..add('CreatAt', CreatAt)
          ..add('is_friend', is_friend)
          ..add('receiver_is_friend', receiver_is_friend)
          ..add('receiver_image', receiver_image)
          ..add('receiver_id', receiver_id)
          ..add('receiver_name', receiver_name)
          ..add('receiver_background_color', receiver_background_color)
          ..add('receiver_bio', receiver_bio)
          ..add('receiver_serial', receiver_serial)
          ..add('receiver_interests', receiver_interests)
          ..add('sender_image', sender_image)
          ..add('sender_name', sender_name)
          ..add('sender_serial', sender_serial)
          ..add('sender_background_color', sender_background_color)
          ..add('sender_is_friend', sender_is_friend)
          ..add('sender_id', sender_id)
          ..add('sender_bio', sender_bio)
          ..add('sender_interests', sender_interests)
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

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _send_by;
  String? get send_by => _$this._send_by;
  set send_by(String? send_by) => _$this._send_by = send_by;

  String? _CreatAt;
  String? get CreatAt => _$this._CreatAt;
  set CreatAt(String? CreatAt) => _$this._CreatAt = CreatAt;

  bool? _is_friend;
  bool? get is_friend => _$this._is_friend;
  set is_friend(bool? is_friend) => _$this._is_friend = is_friend;

  bool? _receiver_is_friend;
  bool? get receiver_is_friend => _$this._receiver_is_friend;
  set receiver_is_friend(bool? receiver_is_friend) =>
      _$this._receiver_is_friend = receiver_is_friend;

  String? _receiver_image;
  String? get receiver_image => _$this._receiver_image;
  set receiver_image(String? receiver_image) =>
      _$this._receiver_image = receiver_image;

  int? _receiver_id;
  int? get receiver_id => _$this._receiver_id;
  set receiver_id(int? receiver_id) => _$this._receiver_id = receiver_id;

  String? _receiver_name;
  String? get receiver_name => _$this._receiver_name;
  set receiver_name(String? receiver_name) =>
      _$this._receiver_name = receiver_name;

  String? _receiver_background_color;
  String? get receiver_background_color => _$this._receiver_background_color;
  set receiver_background_color(String? receiver_background_color) =>
      _$this._receiver_background_color = receiver_background_color;

  String? _receiver_bio;
  String? get receiver_bio => _$this._receiver_bio;
  set receiver_bio(String? receiver_bio) => _$this._receiver_bio = receiver_bio;

  String? _receiver_serial;
  String? get receiver_serial => _$this._receiver_serial;
  set receiver_serial(String? receiver_serial) =>
      _$this._receiver_serial = receiver_serial;

  ListBuilder<InterestsListModel>? _receiver_interests;
  ListBuilder<InterestsListModel> get receiver_interests =>
      _$this._receiver_interests ??= new ListBuilder<InterestsListModel>();
  set receiver_interests(ListBuilder<InterestsListModel>? receiver_interests) =>
      _$this._receiver_interests = receiver_interests;

  String? _sender_image;
  String? get sender_image => _$this._sender_image;
  set sender_image(String? sender_image) => _$this._sender_image = sender_image;

  String? _sender_name;
  String? get sender_name => _$this._sender_name;
  set sender_name(String? sender_name) => _$this._sender_name = sender_name;

  String? _sender_serial;
  String? get sender_serial => _$this._sender_serial;
  set sender_serial(String? sender_serial) =>
      _$this._sender_serial = sender_serial;

  String? _sender_background_color;
  String? get sender_background_color => _$this._sender_background_color;
  set sender_background_color(String? sender_background_color) =>
      _$this._sender_background_color = sender_background_color;

  bool? _sender_is_friend;
  bool? get sender_is_friend => _$this._sender_is_friend;
  set sender_is_friend(bool? sender_is_friend) =>
      _$this._sender_is_friend = sender_is_friend;

  int? _sender_id;
  int? get sender_id => _$this._sender_id;
  set sender_id(int? sender_id) => _$this._sender_id = sender_id;

  String? _sender_bio;
  String? get sender_bio => _$this._sender_bio;
  set sender_bio(String? sender_bio) => _$this._sender_bio = sender_bio;

  ListBuilder<InterestsListModel>? _sender_interests;
  ListBuilder<InterestsListModel> get sender_interests =>
      _$this._sender_interests ??= new ListBuilder<InterestsListModel>();
  set sender_interests(ListBuilder<InterestsListModel>? sender_interests) =>
      _$this._sender_interests = sender_interests;

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
      _type = $v.type;
      _send_by = $v.send_by;
      _CreatAt = $v.CreatAt;
      _is_friend = $v.is_friend;
      _receiver_is_friend = $v.receiver_is_friend;
      _receiver_image = $v.receiver_image;
      _receiver_id = $v.receiver_id;
      _receiver_name = $v.receiver_name;
      _receiver_background_color = $v.receiver_background_color;
      _receiver_bio = $v.receiver_bio;
      _receiver_serial = $v.receiver_serial;
      _receiver_interests = $v.receiver_interests?.toBuilder();
      _sender_image = $v.sender_image;
      _sender_name = $v.sender_name;
      _sender_serial = $v.sender_serial;
      _sender_background_color = $v.sender_background_color;
      _sender_is_friend = $v.sender_is_friend;
      _sender_id = $v.sender_id;
      _sender_bio = $v.sender_bio;
      _sender_interests = $v.sender_interests?.toBuilder();
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
              type: type,
              send_by: send_by,
              CreatAt: CreatAt,
              is_friend: is_friend,
              receiver_is_friend: receiver_is_friend,
              receiver_image: receiver_image,
              receiver_id: receiver_id,
              receiver_name: receiver_name,
              receiver_background_color: receiver_background_color,
              receiver_bio: receiver_bio,
              receiver_serial: receiver_serial,
              receiver_interests: _receiver_interests?.build(),
              sender_image: sender_image,
              sender_name: sender_name,
              sender_serial: sender_serial,
              sender_background_color: sender_background_color,
              sender_is_friend: sender_is_friend,
              sender_id: sender_id,
              sender_bio: sender_bio,
              sender_interests: _sender_interests?.build(),
              replies: _replies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'receiver_interests';
        _receiver_interests?.build();

        _$failedField = 'sender_interests';
        _sender_interests?.build();
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
