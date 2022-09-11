// GENERATED CODE - DO NOT MODIFY BY HAND

part of Sprints_Event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetOldMessages extends GetOldMessages {
  @override
  final int? receiver_id;
  @override
  final String? send_by;
  @override
  final String? timezone;

  factory _$GetOldMessages([void Function(GetOldMessagesBuilder)? updates]) =>
      (new GetOldMessagesBuilder()..update(updates))._build();

  _$GetOldMessages._({this.receiver_id, this.send_by, this.timezone})
      : super._();

  @override
  GetOldMessages rebuild(void Function(GetOldMessagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOldMessagesBuilder toBuilder() =>
      new GetOldMessagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOldMessages &&
        receiver_id == other.receiver_id &&
        send_by == other.send_by &&
        timezone == other.timezone;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, receiver_id.hashCode), send_by.hashCode),
        timezone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetOldMessages')
          ..add('receiver_id', receiver_id)
          ..add('send_by', send_by)
          ..add('timezone', timezone))
        .toString();
  }
}

class GetOldMessagesBuilder
    implements Builder<GetOldMessages, GetOldMessagesBuilder> {
  _$GetOldMessages? _$v;

  int? _receiver_id;
  int? get receiver_id => _$this._receiver_id;
  set receiver_id(int? receiver_id) => _$this._receiver_id = receiver_id;

  String? _send_by;
  String? get send_by => _$this._send_by;
  set send_by(String? send_by) => _$this._send_by = send_by;

  String? _timezone;
  String? get timezone => _$this._timezone;
  set timezone(String? timezone) => _$this._timezone = timezone;

  GetOldMessagesBuilder();

  GetOldMessagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _receiver_id = $v.receiver_id;
      _send_by = $v.send_by;
      _timezone = $v.timezone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetOldMessages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOldMessages;
  }

  @override
  void update(void Function(GetOldMessagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOldMessages build() => _build();

  _$GetOldMessages _build() {
    final _$result = _$v ??
        new _$GetOldMessages._(
            receiver_id: receiver_id, send_by: send_by, timezone: timezone);
    replace(_$result);
    return _$result;
  }
}

class _$Done extends Done {
  @override
  final bool? Donee;

  factory _$Done([void Function(DoneBuilder)? updates]) =>
      (new DoneBuilder()..update(updates))._build();

  _$Done._({this.Donee}) : super._();

  @override
  Done rebuild(void Function(DoneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoneBuilder toBuilder() => new DoneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Done && Donee == other.Donee;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Donee.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Done')..add('Donee', Donee))
        .toString();
  }
}

class DoneBuilder implements Builder<Done, DoneBuilder> {
  _$Done? _$v;

  bool? _Donee;
  bool? get Donee => _$this._Donee;
  set Donee(bool? Donee) => _$this._Donee = Donee;

  DoneBuilder();

  DoneBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Donee = $v.Donee;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Done other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Done;
  }

  @override
  void update(void Function(DoneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Done build() => _build();

  _$Done _build() {
    final _$result = _$v ?? new _$Done._(Donee: Donee);
    replace(_$result);
    return _$result;
  }
}

class _$GetAlias extends GetAlias {
  @override
  final int? HIS_ID;
  @override
  final int? My_ID;

  factory _$GetAlias([void Function(GetAliasBuilder)? updates]) =>
      (new GetAliasBuilder()..update(updates))._build();

  _$GetAlias._({this.HIS_ID, this.My_ID}) : super._();

  @override
  GetAlias rebuild(void Function(GetAliasBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAliasBuilder toBuilder() => new GetAliasBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAlias && HIS_ID == other.HIS_ID && My_ID == other.My_ID;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, HIS_ID.hashCode), My_ID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAlias')
          ..add('HIS_ID', HIS_ID)
          ..add('My_ID', My_ID))
        .toString();
  }
}

class GetAliasBuilder implements Builder<GetAlias, GetAliasBuilder> {
  _$GetAlias? _$v;

  int? _HIS_ID;
  int? get HIS_ID => _$this._HIS_ID;
  set HIS_ID(int? HIS_ID) => _$this._HIS_ID = HIS_ID;

  int? _My_ID;
  int? get My_ID => _$this._My_ID;
  set My_ID(int? My_ID) => _$this._My_ID = My_ID;

  GetAliasBuilder();

  GetAliasBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _HIS_ID = $v.HIS_ID;
      _My_ID = $v.My_ID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAlias other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAlias;
  }

  @override
  void update(void Function(GetAliasBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAlias build() => _build();

  _$GetAlias _build() {
    final _$result = _$v ?? new _$GetAlias._(HIS_ID: HIS_ID, My_ID: My_ID);
    replace(_$result);
    return _$result;
  }
}

class _$SendMessage extends SendMessage {
  @override
  final int? receiver_id;
  @override
  final String? message;
  @override
  final String? Type;
  @override
  final String? send_by;

  factory _$SendMessage([void Function(SendMessageBuilder)? updates]) =>
      (new SendMessageBuilder()..update(updates))._build();

  _$SendMessage._({this.receiver_id, this.message, this.Type, this.send_by})
      : super._();

  @override
  SendMessage rebuild(void Function(SendMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendMessageBuilder toBuilder() => new SendMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendMessage &&
        receiver_id == other.receiver_id &&
        message == other.message &&
        Type == other.Type &&
        send_by == other.send_by;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, receiver_id.hashCode), message.hashCode), Type.hashCode),
        send_by.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendMessage')
          ..add('receiver_id', receiver_id)
          ..add('message', message)
          ..add('Type', Type)
          ..add('send_by', send_by))
        .toString();
  }
}

class SendMessageBuilder implements Builder<SendMessage, SendMessageBuilder> {
  _$SendMessage? _$v;

  int? _receiver_id;
  int? get receiver_id => _$this._receiver_id;
  set receiver_id(int? receiver_id) => _$this._receiver_id = receiver_id;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _Type;
  String? get Type => _$this._Type;
  set Type(String? Type) => _$this._Type = Type;

  String? _send_by;
  String? get send_by => _$this._send_by;
  set send_by(String? send_by) => _$this._send_by = send_by;

  SendMessageBuilder();

  SendMessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _receiver_id = $v.receiver_id;
      _message = $v.message;
      _Type = $v.Type;
      _send_by = $v.send_by;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendMessage;
  }

  @override
  void update(void Function(SendMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendMessage build() => _build();

  _$SendMessage _build() {
    final _$result = _$v ??
        new _$SendMessage._(
            receiver_id: receiver_id,
            message: message,
            Type: Type,
            send_by: send_by);
    replace(_$result);
    return _$result;
  }
}

class _$ShowReplyWidget extends ShowReplyWidget {
  @override
  final String? AvatarPathForRepliedTo;
  @override
  final String? ColorForRepliedTo;
  @override
  final String? RepliedToMessage;
  @override
  final String? AliasForRepliedTo;
  @override
  final bool? Isreply;
  @override
  final String? Model_Type;
  @override
  final String? MessageDirection_Type;
  @override
  final Uint8List? Image1;
  @override
  final File? File_image;
  @override
  final String? Image_type;

  factory _$ShowReplyWidget([void Function(ShowReplyWidgetBuilder)? updates]) =>
      (new ShowReplyWidgetBuilder()..update(updates))._build();

  _$ShowReplyWidget._(
      {this.AvatarPathForRepliedTo,
      this.ColorForRepliedTo,
      this.RepliedToMessage,
      this.AliasForRepliedTo,
      this.Isreply,
      this.Model_Type,
      this.MessageDirection_Type,
      this.Image1,
      this.File_image,
      this.Image_type})
      : super._();

  @override
  ShowReplyWidget rebuild(void Function(ShowReplyWidgetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowReplyWidgetBuilder toBuilder() =>
      new ShowReplyWidgetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowReplyWidget &&
        AvatarPathForRepliedTo == other.AvatarPathForRepliedTo &&
        ColorForRepliedTo == other.ColorForRepliedTo &&
        RepliedToMessage == other.RepliedToMessage &&
        AliasForRepliedTo == other.AliasForRepliedTo &&
        Isreply == other.Isreply &&
        Model_Type == other.Model_Type &&
        MessageDirection_Type == other.MessageDirection_Type &&
        Image1 == other.Image1 &&
        File_image == other.File_image &&
        Image_type == other.Image_type;
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
                                    $jc($jc(0, AvatarPathForRepliedTo.hashCode),
                                        ColorForRepliedTo.hashCode),
                                    RepliedToMessage.hashCode),
                                AliasForRepliedTo.hashCode),
                            Isreply.hashCode),
                        Model_Type.hashCode),
                    MessageDirection_Type.hashCode),
                Image1.hashCode),
            File_image.hashCode),
        Image_type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShowReplyWidget')
          ..add('AvatarPathForRepliedTo', AvatarPathForRepliedTo)
          ..add('ColorForRepliedTo', ColorForRepliedTo)
          ..add('RepliedToMessage', RepliedToMessage)
          ..add('AliasForRepliedTo', AliasForRepliedTo)
          ..add('Isreply', Isreply)
          ..add('Model_Type', Model_Type)
          ..add('MessageDirection_Type', MessageDirection_Type)
          ..add('Image1', Image1)
          ..add('File_image', File_image)
          ..add('Image_type', Image_type))
        .toString();
  }
}

class ShowReplyWidgetBuilder
    implements Builder<ShowReplyWidget, ShowReplyWidgetBuilder> {
  _$ShowReplyWidget? _$v;

  String? _AvatarPathForRepliedTo;
  String? get AvatarPathForRepliedTo => _$this._AvatarPathForRepliedTo;
  set AvatarPathForRepliedTo(String? AvatarPathForRepliedTo) =>
      _$this._AvatarPathForRepliedTo = AvatarPathForRepliedTo;

  String? _ColorForRepliedTo;
  String? get ColorForRepliedTo => _$this._ColorForRepliedTo;
  set ColorForRepliedTo(String? ColorForRepliedTo) =>
      _$this._ColorForRepliedTo = ColorForRepliedTo;

  String? _RepliedToMessage;
  String? get RepliedToMessage => _$this._RepliedToMessage;
  set RepliedToMessage(String? RepliedToMessage) =>
      _$this._RepliedToMessage = RepliedToMessage;

  String? _AliasForRepliedTo;
  String? get AliasForRepliedTo => _$this._AliasForRepliedTo;
  set AliasForRepliedTo(String? AliasForRepliedTo) =>
      _$this._AliasForRepliedTo = AliasForRepliedTo;

  bool? _Isreply;
  bool? get Isreply => _$this._Isreply;
  set Isreply(bool? Isreply) => _$this._Isreply = Isreply;

  String? _Model_Type;
  String? get Model_Type => _$this._Model_Type;
  set Model_Type(String? Model_Type) => _$this._Model_Type = Model_Type;

  String? _MessageDirection_Type;
  String? get MessageDirection_Type => _$this._MessageDirection_Type;
  set MessageDirection_Type(String? MessageDirection_Type) =>
      _$this._MessageDirection_Type = MessageDirection_Type;

  Uint8List? _Image1;
  Uint8List? get Image1 => _$this._Image1;
  set Image1(Uint8List? Image1) => _$this._Image1 = Image1;

  File? _File_image;
  File? get File_image => _$this._File_image;
  set File_image(File? File_image) => _$this._File_image = File_image;

  String? _Image_type;
  String? get Image_type => _$this._Image_type;
  set Image_type(String? Image_type) => _$this._Image_type = Image_type;

  ShowReplyWidgetBuilder();

  ShowReplyWidgetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _AvatarPathForRepliedTo = $v.AvatarPathForRepliedTo;
      _ColorForRepliedTo = $v.ColorForRepliedTo;
      _RepliedToMessage = $v.RepliedToMessage;
      _AliasForRepliedTo = $v.AliasForRepliedTo;
      _Isreply = $v.Isreply;
      _Model_Type = $v.Model_Type;
      _MessageDirection_Type = $v.MessageDirection_Type;
      _Image1 = $v.Image1;
      _File_image = $v.File_image;
      _Image_type = $v.Image_type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowReplyWidget other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShowReplyWidget;
  }

  @override
  void update(void Function(ShowReplyWidgetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShowReplyWidget build() => _build();

  _$ShowReplyWidget _build() {
    final _$result = _$v ??
        new _$ShowReplyWidget._(
            AvatarPathForRepliedTo: AvatarPathForRepliedTo,
            ColorForRepliedTo: ColorForRepliedTo,
            RepliedToMessage: RepliedToMessage,
            AliasForRepliedTo: AliasForRepliedTo,
            Isreply: Isreply,
            Model_Type: Model_Type,
            MessageDirection_Type: MessageDirection_Type,
            Image1: Image1,
            File_image: File_image,
            Image_type: Image_type);
    replace(_$result);
    return _$result;
  }
}

class _$SendStatus extends SendStatus {
  @override
  final bool? Status;

  factory _$SendStatus([void Function(SendStatusBuilder)? updates]) =>
      (new SendStatusBuilder()..update(updates))._build();

  _$SendStatus._({this.Status}) : super._();

  @override
  SendStatus rebuild(void Function(SendStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendStatusBuilder toBuilder() => new SendStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendStatus && Status == other.Status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendStatus')..add('Status', Status))
        .toString();
  }
}

class SendStatusBuilder implements Builder<SendStatus, SendStatusBuilder> {
  _$SendStatus? _$v;

  bool? _Status;
  bool? get Status => _$this._Status;
  set Status(bool? Status) => _$this._Status = Status;

  SendStatusBuilder();

  SendStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Status = $v.Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendStatus;
  }

  @override
  void update(void Function(SendStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendStatus build() => _build();

  _$SendStatus _build() {
    final _$result = _$v ?? new _$SendStatus._(Status: Status);
    replace(_$result);
    return _$result;
  }
}

class _$addReply extends addReply {
  @override
  final String? comment;
  @override
  final int? message_id;
  @override
  final int? DestinationUser_id;
  @override
  final String? Message;
  @override
  final String? Model_Type;
  @override
  final String? MessageDirection_Type;
  @override
  final File? File_file;
  @override
  final Uint8List? Uint8;

  factory _$addReply([void Function(addReplyBuilder)? updates]) =>
      (new addReplyBuilder()..update(updates))._build();

  _$addReply._(
      {this.comment,
      this.message_id,
      this.DestinationUser_id,
      this.Message,
      this.Model_Type,
      this.MessageDirection_Type,
      this.File_file,
      this.Uint8})
      : super._();

  @override
  addReply rebuild(void Function(addReplyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  addReplyBuilder toBuilder() => new addReplyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is addReply &&
        comment == other.comment &&
        message_id == other.message_id &&
        DestinationUser_id == other.DestinationUser_id &&
        Message == other.Message &&
        Model_Type == other.Model_Type &&
        MessageDirection_Type == other.MessageDirection_Type &&
        File_file == other.File_file &&
        Uint8 == other.Uint8;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, comment.hashCode), message_id.hashCode),
                            DestinationUser_id.hashCode),
                        Message.hashCode),
                    Model_Type.hashCode),
                MessageDirection_Type.hashCode),
            File_file.hashCode),
        Uint8.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'addReply')
          ..add('comment', comment)
          ..add('message_id', message_id)
          ..add('DestinationUser_id', DestinationUser_id)
          ..add('Message', Message)
          ..add('Model_Type', Model_Type)
          ..add('MessageDirection_Type', MessageDirection_Type)
          ..add('File_file', File_file)
          ..add('Uint8', Uint8))
        .toString();
  }
}

class addReplyBuilder implements Builder<addReply, addReplyBuilder> {
  _$addReply? _$v;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  int? _message_id;
  int? get message_id => _$this._message_id;
  set message_id(int? message_id) => _$this._message_id = message_id;

  int? _DestinationUser_id;
  int? get DestinationUser_id => _$this._DestinationUser_id;
  set DestinationUser_id(int? DestinationUser_id) =>
      _$this._DestinationUser_id = DestinationUser_id;

  String? _Message;
  String? get Message => _$this._Message;
  set Message(String? Message) => _$this._Message = Message;

  String? _Model_Type;
  String? get Model_Type => _$this._Model_Type;
  set Model_Type(String? Model_Type) => _$this._Model_Type = Model_Type;

  String? _MessageDirection_Type;
  String? get MessageDirection_Type => _$this._MessageDirection_Type;
  set MessageDirection_Type(String? MessageDirection_Type) =>
      _$this._MessageDirection_Type = MessageDirection_Type;

  File? _File_file;
  File? get File_file => _$this._File_file;
  set File_file(File? File_file) => _$this._File_file = File_file;

  Uint8List? _Uint8;
  Uint8List? get Uint8 => _$this._Uint8;
  set Uint8(Uint8List? Uint8) => _$this._Uint8 = Uint8;

  addReplyBuilder();

  addReplyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comment = $v.comment;
      _message_id = $v.message_id;
      _DestinationUser_id = $v.DestinationUser_id;
      _Message = $v.Message;
      _Model_Type = $v.Model_Type;
      _MessageDirection_Type = $v.MessageDirection_Type;
      _File_file = $v.File_file;
      _Uint8 = $v.Uint8;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(addReply other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$addReply;
  }

  @override
  void update(void Function(addReplyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  addReply build() => _build();

  _$addReply _build() {
    final _$result = _$v ??
        new _$addReply._(
            comment: comment,
            message_id: message_id,
            DestinationUser_id: DestinationUser_id,
            Message: Message,
            Model_Type: Model_Type,
            MessageDirection_Type: MessageDirection_Type,
            File_file: File_file,
            Uint8: Uint8);
    replace(_$result);
    return _$result;
  }
}

class _$AddModel extends AddModel {
  @override
  final SprintsChat? message;

  factory _$AddModel([void Function(AddModelBuilder)? updates]) =>
      (new AddModelBuilder()..update(updates))._build();

  _$AddModel._({this.message}) : super._();

  @override
  AddModel rebuild(void Function(AddModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddModelBuilder toBuilder() => new AddModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddModel && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddModel')..add('message', message))
        .toString();
  }
}

class AddModelBuilder implements Builder<AddModel, AddModelBuilder> {
  _$AddModel? _$v;

  SprintsChat? _message;
  SprintsChat? get message => _$this._message;
  set message(SprintsChat? message) => _$this._message = message;

  AddModelBuilder();

  AddModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddModel;
  }

  @override
  void update(void Function(AddModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddModel build() => _build();

  _$AddModel _build() {
    final _$result = _$v ?? new _$AddModel._(message: message);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeTypingStatus extends ChangeTypingStatus {
  @override
  final bool? ChangeStatus;

  factory _$ChangeTypingStatus(
          [void Function(ChangeTypingStatusBuilder)? updates]) =>
      (new ChangeTypingStatusBuilder()..update(updates))._build();

  _$ChangeTypingStatus._({this.ChangeStatus}) : super._();

  @override
  ChangeTypingStatus rebuild(
          void Function(ChangeTypingStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeTypingStatusBuilder toBuilder() =>
      new ChangeTypingStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeTypingStatus && ChangeStatus == other.ChangeStatus;
  }

  @override
  int get hashCode {
    return $jf($jc(0, ChangeStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeTypingStatus')
          ..add('ChangeStatus', ChangeStatus))
        .toString();
  }
}

class ChangeTypingStatusBuilder
    implements Builder<ChangeTypingStatus, ChangeTypingStatusBuilder> {
  _$ChangeTypingStatus? _$v;

  bool? _ChangeStatus;
  bool? get ChangeStatus => _$this._ChangeStatus;
  set ChangeStatus(bool? ChangeStatus) => _$this._ChangeStatus = ChangeStatus;

  ChangeTypingStatusBuilder();

  ChangeTypingStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ChangeStatus = $v.ChangeStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeTypingStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeTypingStatus;
  }

  @override
  void update(void Function(ChangeTypingStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeTypingStatus build() => _build();

  _$ChangeTypingStatus _build() {
    final _$result =
        _$v ?? new _$ChangeTypingStatus._(ChangeStatus: ChangeStatus);
    replace(_$result);
    return _$result;
  }
}

class _$GetUsersInsideBubble extends GetUsersInsideBubble {
  @override
  final int? Bubble_id;
  @override
  final int? MY_id;

  factory _$GetUsersInsideBubble(
          [void Function(GetUsersInsideBubbleBuilder)? updates]) =>
      (new GetUsersInsideBubbleBuilder()..update(updates))._build();

  _$GetUsersInsideBubble._({this.Bubble_id, this.MY_id}) : super._();

  @override
  GetUsersInsideBubble rebuild(
          void Function(GetUsersInsideBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUsersInsideBubbleBuilder toBuilder() =>
      new GetUsersInsideBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUsersInsideBubble &&
        Bubble_id == other.Bubble_id &&
        MY_id == other.MY_id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Bubble_id.hashCode), MY_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetUsersInsideBubble')
          ..add('Bubble_id', Bubble_id)
          ..add('MY_id', MY_id))
        .toString();
  }
}

class GetUsersInsideBubbleBuilder
    implements Builder<GetUsersInsideBubble, GetUsersInsideBubbleBuilder> {
  _$GetUsersInsideBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  int? _MY_id;
  int? get MY_id => _$this._MY_id;
  set MY_id(int? MY_id) => _$this._MY_id = MY_id;

  GetUsersInsideBubbleBuilder();

  GetUsersInsideBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _MY_id = $v.MY_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetUsersInsideBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUsersInsideBubble;
  }

  @override
  void update(void Function(GetUsersInsideBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUsersInsideBubble build() => _build();

  _$GetUsersInsideBubble _build() {
    final _$result =
        _$v ?? new _$GetUsersInsideBubble._(Bubble_id: Bubble_id, MY_id: MY_id);
    replace(_$result);
    return _$result;
  }
}

class _$Get_MYAlias extends Get_MYAlias {
  @override
  final int? My_ID;

  factory _$Get_MYAlias([void Function(Get_MYAliasBuilder)? updates]) =>
      (new Get_MYAliasBuilder()..update(updates))._build();

  _$Get_MYAlias._({this.My_ID}) : super._();

  @override
  Get_MYAlias rebuild(void Function(Get_MYAliasBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Get_MYAliasBuilder toBuilder() => new Get_MYAliasBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Get_MYAlias && My_ID == other.My_ID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, My_ID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Get_MYAlias')..add('My_ID', My_ID))
        .toString();
  }
}

class Get_MYAliasBuilder implements Builder<Get_MYAlias, Get_MYAliasBuilder> {
  _$Get_MYAlias? _$v;

  int? _My_ID;
  int? get My_ID => _$this._My_ID;
  set My_ID(int? My_ID) => _$this._My_ID = My_ID;

  Get_MYAliasBuilder();

  Get_MYAliasBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _My_ID = $v.My_ID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Get_MYAlias other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Get_MYAlias;
  }

  @override
  void update(void Function(Get_MYAliasBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Get_MYAlias build() => _build();

  _$Get_MYAlias _build() {
    final _$result = _$v ?? new _$Get_MYAlias._(My_ID: My_ID);
    replace(_$result);
    return _$result;
  }
}

class _$KetbaordStatus extends KetbaordStatus {
  @override
  final bool? status;

  factory _$KetbaordStatus([void Function(KetbaordStatusBuilder)? updates]) =>
      (new KetbaordStatusBuilder()..update(updates))._build();

  _$KetbaordStatus._({this.status}) : super._();

  @override
  KetbaordStatus rebuild(void Function(KetbaordStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KetbaordStatusBuilder toBuilder() =>
      new KetbaordStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KetbaordStatus && status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'KetbaordStatus')
          ..add('status', status))
        .toString();
  }
}

class KetbaordStatusBuilder
    implements Builder<KetbaordStatus, KetbaordStatusBuilder> {
  _$KetbaordStatus? _$v;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  KetbaordStatusBuilder();

  KetbaordStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KetbaordStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KetbaordStatus;
  }

  @override
  void update(void Function(KetbaordStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KetbaordStatus build() => _build();

  _$KetbaordStatus _build() {
    final _$result = _$v ?? new _$KetbaordStatus._(status: status);
    replace(_$result);
    return _$result;
  }
}

class _$ShowFloatingActionButton extends ShowFloatingActionButton {
  @override
  final bool? status;

  factory _$ShowFloatingActionButton(
          [void Function(ShowFloatingActionButtonBuilder)? updates]) =>
      (new ShowFloatingActionButtonBuilder()..update(updates))._build();

  _$ShowFloatingActionButton._({this.status}) : super._();

  @override
  ShowFloatingActionButton rebuild(
          void Function(ShowFloatingActionButtonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowFloatingActionButtonBuilder toBuilder() =>
      new ShowFloatingActionButtonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowFloatingActionButton && status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShowFloatingActionButton')
          ..add('status', status))
        .toString();
  }
}

class ShowFloatingActionButtonBuilder
    implements
        Builder<ShowFloatingActionButton, ShowFloatingActionButtonBuilder> {
  _$ShowFloatingActionButton? _$v;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  ShowFloatingActionButtonBuilder();

  ShowFloatingActionButtonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowFloatingActionButton other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShowFloatingActionButton;
  }

  @override
  void update(void Function(ShowFloatingActionButtonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShowFloatingActionButton build() => _build();

  _$ShowFloatingActionButton _build() {
    final _$result = _$v ?? new _$ShowFloatingActionButton._(status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
