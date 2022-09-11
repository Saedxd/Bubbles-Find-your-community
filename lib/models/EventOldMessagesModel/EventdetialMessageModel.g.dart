// GENERATED CODE - DO NOT MODIFY BY HAND

part of EventdetialMessageModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventdetialMessageModel> _$eventdetialMessageModelSerializer =
    new _$EventdetialMessageModelSerializer();

class _$EventdetialMessageModelSerializer
    implements StructuredSerializer<EventdetialMessageModel> {
  @override
  final Iterable<Type> types = const [
    EventdetialMessageModel,
    _$EventdetialMessageModel
  ];
  @override
  final String wireName = 'EventdetialMessageModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EventdetialMessageModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.is_sender;
    if (value != null) {
      result
        ..add('is_sender')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.multi_choice;
    if (value != null) {
      result
        ..add('multi_choice')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.show_participants;
    if (value != null) {
      result
        ..add('show_participants')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answers;
    if (value != null) {
      result
        ..add('answers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(NewPollAnswersModel)])));
    }
    return result;
  }

  @override
  EventdetialMessageModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventdetialMessageModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_sender':
          result.is_sender = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'multi_choice':
          result.multi_choice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'show_participants':
          result.show_participants = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'answers':
          result.answers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(NewPollAnswersModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EventdetialMessageModel extends EventdetialMessageModel {
  @override
  final bool? is_sender;
  @override
  final int? id;
  @override
  final int? multi_choice;
  @override
  final int? show_participants;
  @override
  final String? message;
  @override
  final String? type;
  @override
  final String? sender_name;
  @override
  final String? CreatAt;
  @override
  final String? sender_background_color;
  @override
  final String? sender_image;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? image;
  @override
  final BuiltList<NewPollAnswersModel>? answers;

  factory _$EventdetialMessageModel(
          [void Function(EventdetialMessageModelBuilder)? updates]) =>
      (new EventdetialMessageModelBuilder()..update(updates))._build();

  _$EventdetialMessageModel._(
      {this.is_sender,
      this.id,
      this.multi_choice,
      this.show_participants,
      this.message,
      this.type,
      this.sender_name,
      this.CreatAt,
      this.sender_background_color,
      this.sender_image,
      this.title,
      this.content,
      this.image,
      this.answers})
      : super._();

  @override
  EventdetialMessageModel rebuild(
          void Function(EventdetialMessageModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventdetialMessageModelBuilder toBuilder() =>
      new EventdetialMessageModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventdetialMessageModel &&
        is_sender == other.is_sender &&
        id == other.id &&
        multi_choice == other.multi_choice &&
        show_participants == other.show_participants &&
        message == other.message &&
        type == other.type &&
        sender_name == other.sender_name &&
        CreatAt == other.CreatAt &&
        sender_background_color == other.sender_background_color &&
        sender_image == other.sender_image &&
        title == other.title &&
        content == other.content &&
        image == other.image &&
        answers == other.answers;
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
                                                        $jc(0,
                                                            is_sender.hashCode),
                                                        id.hashCode),
                                                    multi_choice.hashCode),
                                                show_participants.hashCode),
                                            message.hashCode),
                                        type.hashCode),
                                    sender_name.hashCode),
                                CreatAt.hashCode),
                            sender_background_color.hashCode),
                        sender_image.hashCode),
                    title.hashCode),
                content.hashCode),
            image.hashCode),
        answers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventdetialMessageModel')
          ..add('is_sender', is_sender)
          ..add('id', id)
          ..add('multi_choice', multi_choice)
          ..add('show_participants', show_participants)
          ..add('message', message)
          ..add('type', type)
          ..add('sender_name', sender_name)
          ..add('CreatAt', CreatAt)
          ..add('sender_background_color', sender_background_color)
          ..add('sender_image', sender_image)
          ..add('title', title)
          ..add('content', content)
          ..add('image', image)
          ..add('answers', answers))
        .toString();
  }
}

class EventdetialMessageModelBuilder
    implements
        Builder<EventdetialMessageModel, EventdetialMessageModelBuilder> {
  _$EventdetialMessageModel? _$v;

  bool? _is_sender;
  bool? get is_sender => _$this._is_sender;
  set is_sender(bool? is_sender) => _$this._is_sender = is_sender;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _multi_choice;
  int? get multi_choice => _$this._multi_choice;
  set multi_choice(int? multi_choice) => _$this._multi_choice = multi_choice;

  int? _show_participants;
  int? get show_participants => _$this._show_participants;
  set show_participants(int? show_participants) =>
      _$this._show_participants = show_participants;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

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

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<NewPollAnswersModel>? _answers;
  ListBuilder<NewPollAnswersModel> get answers =>
      _$this._answers ??= new ListBuilder<NewPollAnswersModel>();
  set answers(ListBuilder<NewPollAnswersModel>? answers) =>
      _$this._answers = answers;

  EventdetialMessageModelBuilder();

  EventdetialMessageModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _is_sender = $v.is_sender;
      _id = $v.id;
      _multi_choice = $v.multi_choice;
      _show_participants = $v.show_participants;
      _message = $v.message;
      _type = $v.type;
      _sender_name = $v.sender_name;
      _CreatAt = $v.CreatAt;
      _sender_background_color = $v.sender_background_color;
      _sender_image = $v.sender_image;
      _title = $v.title;
      _content = $v.content;
      _image = $v.image;
      _answers = $v.answers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventdetialMessageModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventdetialMessageModel;
  }

  @override
  void update(void Function(EventdetialMessageModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventdetialMessageModel build() => _build();

  _$EventdetialMessageModel _build() {
    _$EventdetialMessageModel _$result;
    try {
      _$result = _$v ??
          new _$EventdetialMessageModel._(
              is_sender: is_sender,
              id: id,
              multi_choice: multi_choice,
              show_participants: show_participants,
              message: message,
              type: type,
              sender_name: sender_name,
              CreatAt: CreatAt,
              sender_background_color: sender_background_color,
              sender_image: sender_image,
              title: title,
              content: content,
              image: image,
              answers: _answers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'answers';
        _answers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventdetialMessageModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
