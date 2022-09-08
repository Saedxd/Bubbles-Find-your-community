// GENERATED CODE - DO NOT MODIFY BY HAND

part of GroupChat_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
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
  final int? main_type;
  @override
  final String? message;
  @override
  final String? type;
  @override
  final int? bubble_id;
  @override
  final int? IndexOfMessageList;

  factory _$SendMessage([void Function(SendMessageBuilder)? updates]) =>
      (new SendMessageBuilder()..update(updates))._build();

  _$SendMessage._(
      {this.main_type,
      this.message,
      this.type,
      this.bubble_id,
      this.IndexOfMessageList})
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
        main_type == other.main_type &&
        message == other.message &&
        type == other.type &&
        bubble_id == other.bubble_id &&
        IndexOfMessageList == other.IndexOfMessageList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, main_type.hashCode), message.hashCode),
                type.hashCode),
            bubble_id.hashCode),
        IndexOfMessageList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendMessage')
          ..add('main_type', main_type)
          ..add('message', message)
          ..add('type', type)
          ..add('bubble_id', bubble_id)
          ..add('IndexOfMessageList', IndexOfMessageList))
        .toString();
  }
}

class SendMessageBuilder implements Builder<SendMessage, SendMessageBuilder> {
  _$SendMessage? _$v;

  int? _main_type;
  int? get main_type => _$this._main_type;
  set main_type(int? main_type) => _$this._main_type = main_type;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _bubble_id;
  int? get bubble_id => _$this._bubble_id;
  set bubble_id(int? bubble_id) => _$this._bubble_id = bubble_id;

  int? _IndexOfMessageList;
  int? get IndexOfMessageList => _$this._IndexOfMessageList;
  set IndexOfMessageList(int? IndexOfMessageList) =>
      _$this._IndexOfMessageList = IndexOfMessageList;

  SendMessageBuilder();

  SendMessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _main_type = $v.main_type;
      _message = $v.message;
      _type = $v.type;
      _bubble_id = $v.bubble_id;
      _IndexOfMessageList = $v.IndexOfMessageList;
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
            main_type: main_type,
            message: message,
            type: type,
            bubble_id: bubble_id,
            IndexOfMessageList: IndexOfMessageList);
    replace(_$result);
    return _$result;
  }
}

class _$addReply extends addReply {
  @override
  final String? comment;
  @override
  final String? Message;
  @override
  final String? RepliedToAlias;
  @override
  final String? RepliedToAvatar;
  @override
  final String? RepliedToColor;
  @override
  final int? message_id;
  @override
  final int? Bubble_id;
  @override
  final String? type;
  @override
  final bool? is_Nodejs;
  @override
  final bool? is_backend;
  @override
  final File? File_file;
  @override
  final Uint8List? Uint8;

  factory _$addReply([void Function(addReplyBuilder)? updates]) =>
      (new addReplyBuilder()..update(updates))._build();

  _$addReply._(
      {this.comment,
      this.Message,
      this.RepliedToAlias,
      this.RepliedToAvatar,
      this.RepliedToColor,
      this.message_id,
      this.Bubble_id,
      this.type,
      this.is_Nodejs,
      this.is_backend,
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
        Message == other.Message &&
        RepliedToAlias == other.RepliedToAlias &&
        RepliedToAvatar == other.RepliedToAvatar &&
        RepliedToColor == other.RepliedToColor &&
        message_id == other.message_id &&
        Bubble_id == other.Bubble_id &&
        type == other.type &&
        is_Nodejs == other.is_Nodejs &&
        is_backend == other.is_backend &&
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
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, comment.hashCode),
                                                Message.hashCode),
                                            RepliedToAlias.hashCode),
                                        RepliedToAvatar.hashCode),
                                    RepliedToColor.hashCode),
                                message_id.hashCode),
                            Bubble_id.hashCode),
                        type.hashCode),
                    is_Nodejs.hashCode),
                is_backend.hashCode),
            File_file.hashCode),
        Uint8.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'addReply')
          ..add('comment', comment)
          ..add('Message', Message)
          ..add('RepliedToAlias', RepliedToAlias)
          ..add('RepliedToAvatar', RepliedToAvatar)
          ..add('RepliedToColor', RepliedToColor)
          ..add('message_id', message_id)
          ..add('Bubble_id', Bubble_id)
          ..add('type', type)
          ..add('is_Nodejs', is_Nodejs)
          ..add('is_backend', is_backend)
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

  String? _Message;
  String? get Message => _$this._Message;
  set Message(String? Message) => _$this._Message = Message;

  String? _RepliedToAlias;
  String? get RepliedToAlias => _$this._RepliedToAlias;
  set RepliedToAlias(String? RepliedToAlias) =>
      _$this._RepliedToAlias = RepliedToAlias;

  String? _RepliedToAvatar;
  String? get RepliedToAvatar => _$this._RepliedToAvatar;
  set RepliedToAvatar(String? RepliedToAvatar) =>
      _$this._RepliedToAvatar = RepliedToAvatar;

  String? _RepliedToColor;
  String? get RepliedToColor => _$this._RepliedToColor;
  set RepliedToColor(String? RepliedToColor) =>
      _$this._RepliedToColor = RepliedToColor;

  int? _message_id;
  int? get message_id => _$this._message_id;
  set message_id(int? message_id) => _$this._message_id = message_id;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _is_Nodejs;
  bool? get is_Nodejs => _$this._is_Nodejs;
  set is_Nodejs(bool? is_Nodejs) => _$this._is_Nodejs = is_Nodejs;

  bool? _is_backend;
  bool? get is_backend => _$this._is_backend;
  set is_backend(bool? is_backend) => _$this._is_backend = is_backend;

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
      _Message = $v.Message;
      _RepliedToAlias = $v.RepliedToAlias;
      _RepliedToAvatar = $v.RepliedToAvatar;
      _RepliedToColor = $v.RepliedToColor;
      _message_id = $v.message_id;
      _Bubble_id = $v.Bubble_id;
      _type = $v.type;
      _is_Nodejs = $v.is_Nodejs;
      _is_backend = $v.is_backend;
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
            Message: Message,
            RepliedToAlias: RepliedToAlias,
            RepliedToAvatar: RepliedToAvatar,
            RepliedToColor: RepliedToColor,
            message_id: message_id,
            Bubble_id: Bubble_id,
            type: type,
            is_Nodejs: is_Nodejs,
            is_backend: is_backend,
            File_file: File_file,
            Uint8: Uint8);
    replace(_$result);
    return _$result;
  }
}

class _$AddModel extends AddModel {
  @override
  final GroupChatMessage? message;

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

  GroupChatMessage? _message;
  GroupChatMessage? get message => _$this._message;
  set message(GroupChatMessage? message) => _$this._message = message;

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
  final String? Type;
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
      this.Type,
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
        Type == other.Type &&
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
                                $jc($jc(0, AvatarPathForRepliedTo.hashCode),
                                    ColorForRepliedTo.hashCode),
                                RepliedToMessage.hashCode),
                            AliasForRepliedTo.hashCode),
                        Isreply.hashCode),
                    Type.hashCode),
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
          ..add('Type', Type)
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

  String? _Type;
  String? get Type => _$this._Type;
  set Type(String? Type) => _$this._Type = Type;

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
      _Type = $v.Type;
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
            Type: Type,
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

class _$DescriptionLength extends DescriptionLength {
  @override
  final int? DescriptionLengthh;

  factory _$DescriptionLength(
          [void Function(DescriptionLengthBuilder)? updates]) =>
      (new DescriptionLengthBuilder()..update(updates))._build();

  _$DescriptionLength._({this.DescriptionLengthh}) : super._();

  @override
  DescriptionLength rebuild(void Function(DescriptionLengthBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DescriptionLengthBuilder toBuilder() =>
      new DescriptionLengthBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DescriptionLength &&
        DescriptionLengthh == other.DescriptionLengthh;
  }

  @override
  int get hashCode {
    return $jf($jc(0, DescriptionLengthh.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DescriptionLength')
          ..add('DescriptionLengthh', DescriptionLengthh))
        .toString();
  }
}

class DescriptionLengthBuilder
    implements Builder<DescriptionLength, DescriptionLengthBuilder> {
  _$DescriptionLength? _$v;

  int? _DescriptionLengthh;
  int? get DescriptionLengthh => _$this._DescriptionLengthh;
  set DescriptionLengthh(int? DescriptionLengthh) =>
      _$this._DescriptionLengthh = DescriptionLengthh;

  DescriptionLengthBuilder();

  DescriptionLengthBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _DescriptionLengthh = $v.DescriptionLengthh;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DescriptionLength other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DescriptionLength;
  }

  @override
  void update(void Function(DescriptionLengthBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DescriptionLength build() => _build();

  _$DescriptionLength _build() {
    final _$result = _$v ??
        new _$DescriptionLength._(DescriptionLengthh: DescriptionLengthh);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeCheckboxStatus1 extends ChangeCheckboxStatus1 {
  @override
  final bool? CheckboxStatus1;

  factory _$ChangeCheckboxStatus1(
          [void Function(ChangeCheckboxStatus1Builder)? updates]) =>
      (new ChangeCheckboxStatus1Builder()..update(updates))._build();

  _$ChangeCheckboxStatus1._({this.CheckboxStatus1}) : super._();

  @override
  ChangeCheckboxStatus1 rebuild(
          void Function(ChangeCheckboxStatus1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeCheckboxStatus1Builder toBuilder() =>
      new ChangeCheckboxStatus1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeCheckboxStatus1 &&
        CheckboxStatus1 == other.CheckboxStatus1;
  }

  @override
  int get hashCode {
    return $jf($jc(0, CheckboxStatus1.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeCheckboxStatus1')
          ..add('CheckboxStatus1', CheckboxStatus1))
        .toString();
  }
}

class ChangeCheckboxStatus1Builder
    implements Builder<ChangeCheckboxStatus1, ChangeCheckboxStatus1Builder> {
  _$ChangeCheckboxStatus1? _$v;

  bool? _CheckboxStatus1;
  bool? get CheckboxStatus1 => _$this._CheckboxStatus1;
  set CheckboxStatus1(bool? CheckboxStatus1) =>
      _$this._CheckboxStatus1 = CheckboxStatus1;

  ChangeCheckboxStatus1Builder();

  ChangeCheckboxStatus1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _CheckboxStatus1 = $v.CheckboxStatus1;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeCheckboxStatus1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeCheckboxStatus1;
  }

  @override
  void update(void Function(ChangeCheckboxStatus1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeCheckboxStatus1 build() => _build();

  _$ChangeCheckboxStatus1 _build() {
    final _$result =
        _$v ?? new _$ChangeCheckboxStatus1._(CheckboxStatus1: CheckboxStatus1);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeCheckboxStatus2 extends ChangeCheckboxStatus2 {
  @override
  final bool? CheckboxStatus2;

  factory _$ChangeCheckboxStatus2(
          [void Function(ChangeCheckboxStatus2Builder)? updates]) =>
      (new ChangeCheckboxStatus2Builder()..update(updates))._build();

  _$ChangeCheckboxStatus2._({this.CheckboxStatus2}) : super._();

  @override
  ChangeCheckboxStatus2 rebuild(
          void Function(ChangeCheckboxStatus2Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeCheckboxStatus2Builder toBuilder() =>
      new ChangeCheckboxStatus2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeCheckboxStatus2 &&
        CheckboxStatus2 == other.CheckboxStatus2;
  }

  @override
  int get hashCode {
    return $jf($jc(0, CheckboxStatus2.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeCheckboxStatus2')
          ..add('CheckboxStatus2', CheckboxStatus2))
        .toString();
  }
}

class ChangeCheckboxStatus2Builder
    implements Builder<ChangeCheckboxStatus2, ChangeCheckboxStatus2Builder> {
  _$ChangeCheckboxStatus2? _$v;

  bool? _CheckboxStatus2;
  bool? get CheckboxStatus2 => _$this._CheckboxStatus2;
  set CheckboxStatus2(bool? CheckboxStatus2) =>
      _$this._CheckboxStatus2 = CheckboxStatus2;

  ChangeCheckboxStatus2Builder();

  ChangeCheckboxStatus2Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _CheckboxStatus2 = $v.CheckboxStatus2;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeCheckboxStatus2 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeCheckboxStatus2;
  }

  @override
  void update(void Function(ChangeCheckboxStatus2Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeCheckboxStatus2 build() => _build();

  _$ChangeCheckboxStatus2 _build() {
    final _$result =
        _$v ?? new _$ChangeCheckboxStatus2._(CheckboxStatus2: CheckboxStatus2);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeTextfieldSum extends ChangeTextfieldSum {
  @override
  final int? num;

  factory _$ChangeTextfieldSum(
          [void Function(ChangeTextfieldSumBuilder)? updates]) =>
      (new ChangeTextfieldSumBuilder()..update(updates))._build();

  _$ChangeTextfieldSum._({this.num}) : super._();

  @override
  ChangeTextfieldSum rebuild(
          void Function(ChangeTextfieldSumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeTextfieldSumBuilder toBuilder() =>
      new ChangeTextfieldSumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeTextfieldSum && num == other.num;
  }

  @override
  int get hashCode {
    return $jf($jc(0, num.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeTextfieldSum')..add('num', num))
        .toString();
  }
}

class ChangeTextfieldSumBuilder
    implements Builder<ChangeTextfieldSum, ChangeTextfieldSumBuilder> {
  _$ChangeTextfieldSum? _$v;

  int? _num;
  int? get num => _$this._num;
  set num(int? num) => _$this._num = num;

  ChangeTextfieldSumBuilder();

  ChangeTextfieldSumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _num = $v.num;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeTextfieldSum other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeTextfieldSum;
  }

  @override
  void update(void Function(ChangeTextfieldSumBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeTextfieldSum build() => _build();

  _$ChangeTextfieldSum _build() {
    final _$result = _$v ?? new _$ChangeTextfieldSum._(num: num);
    replace(_$result);
    return _$result;
  }
}

class _$MakeTextFieldSumToNormal extends MakeTextFieldSumToNormal {
  factory _$MakeTextFieldSumToNormal(
          [void Function(MakeTextFieldSumToNormalBuilder)? updates]) =>
      (new MakeTextFieldSumToNormalBuilder()..update(updates))._build();

  _$MakeTextFieldSumToNormal._() : super._();

  @override
  MakeTextFieldSumToNormal rebuild(
          void Function(MakeTextFieldSumToNormalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MakeTextFieldSumToNormalBuilder toBuilder() =>
      new MakeTextFieldSumToNormalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MakeTextFieldSumToNormal;
  }

  @override
  int get hashCode {
    return 654763716;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'MakeTextFieldSumToNormal').toString();
  }
}

class MakeTextFieldSumToNormalBuilder
    implements
        Builder<MakeTextFieldSumToNormal, MakeTextFieldSumToNormalBuilder> {
  _$MakeTextFieldSumToNormal? _$v;

  MakeTextFieldSumToNormalBuilder();

  @override
  void replace(MakeTextFieldSumToNormal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MakeTextFieldSumToNormal;
  }

  @override
  void update(void Function(MakeTextFieldSumToNormalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MakeTextFieldSumToNormal build() => _build();

  _$MakeTextFieldSumToNormal _build() {
    final _$result = _$v ?? new _$MakeTextFieldSumToNormal._();
    replace(_$result);
    return _$result;
  }
}

class _$GetOldMessages extends GetOldMessages {
  @override
  final int? bubble_id;
  @override
  final String? Time_Zone;

  factory _$GetOldMessages([void Function(GetOldMessagesBuilder)? updates]) =>
      (new GetOldMessagesBuilder()..update(updates))._build();

  _$GetOldMessages._({this.bubble_id, this.Time_Zone}) : super._();

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
        bubble_id == other.bubble_id &&
        Time_Zone == other.Time_Zone;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, bubble_id.hashCode), Time_Zone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetOldMessages')
          ..add('bubble_id', bubble_id)
          ..add('Time_Zone', Time_Zone))
        .toString();
  }
}

class GetOldMessagesBuilder
    implements Builder<GetOldMessages, GetOldMessagesBuilder> {
  _$GetOldMessages? _$v;

  int? _bubble_id;
  int? get bubble_id => _$this._bubble_id;
  set bubble_id(int? bubble_id) => _$this._bubble_id = bubble_id;

  String? _Time_Zone;
  String? get Time_Zone => _$this._Time_Zone;
  set Time_Zone(String? Time_Zone) => _$this._Time_Zone = Time_Zone;

  GetOldMessagesBuilder();

  GetOldMessagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bubble_id = $v.bubble_id;
      _Time_Zone = $v.Time_Zone;
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
        new _$GetOldMessages._(bubble_id: bubble_id, Time_Zone: Time_Zone);
    replace(_$result);
    return _$result;
  }
}

class _$GetAliasForInsideUser extends GetAliasForInsideUser {
  @override
  final int? User_id;

  factory _$GetAliasForInsideUser(
          [void Function(GetAliasForInsideUserBuilder)? updates]) =>
      (new GetAliasForInsideUserBuilder()..update(updates))._build();

  _$GetAliasForInsideUser._({this.User_id}) : super._();

  @override
  GetAliasForInsideUser rebuild(
          void Function(GetAliasForInsideUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAliasForInsideUserBuilder toBuilder() =>
      new GetAliasForInsideUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAliasForInsideUser && User_id == other.User_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, User_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAliasForInsideUser')
          ..add('User_id', User_id))
        .toString();
  }
}

class GetAliasForInsideUserBuilder
    implements Builder<GetAliasForInsideUser, GetAliasForInsideUserBuilder> {
  _$GetAliasForInsideUser? _$v;

  int? _User_id;
  int? get User_id => _$this._User_id;
  set User_id(int? User_id) => _$this._User_id = User_id;

  GetAliasForInsideUserBuilder();

  GetAliasForInsideUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _User_id = $v.User_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAliasForInsideUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAliasForInsideUser;
  }

  @override
  void update(void Function(GetAliasForInsideUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAliasForInsideUser build() => _build();

  _$GetAliasForInsideUser _build() {
    final _$result = _$v ?? new _$GetAliasForInsideUser._(User_id: User_id);
    replace(_$result);
    return _$result;
  }
}

class _$AddUserDataToList extends AddUserDataToList {
  @override
  final FrinedsData? user;

  factory _$AddUserDataToList(
          [void Function(AddUserDataToListBuilder)? updates]) =>
      (new AddUserDataToListBuilder()..update(updates))._build();

  _$AddUserDataToList._({this.user}) : super._();

  @override
  AddUserDataToList rebuild(void Function(AddUserDataToListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddUserDataToListBuilder toBuilder() =>
      new AddUserDataToListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddUserDataToList && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddUserDataToList')
          ..add('user', user))
        .toString();
  }
}

class AddUserDataToListBuilder
    implements Builder<AddUserDataToList, AddUserDataToListBuilder> {
  _$AddUserDataToList? _$v;

  FrinedsData? _user;
  FrinedsData? get user => _$this._user;
  set user(FrinedsData? user) => _$this._user = user;

  AddUserDataToListBuilder();

  AddUserDataToListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddUserDataToList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddUserDataToList;
  }

  @override
  void update(void Function(AddUserDataToListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddUserDataToList build() => _build();

  _$AddUserDataToList _build() {
    final _$result = _$v ?? new _$AddUserDataToList._(user: user);
    replace(_$result);
    return _$result;
  }
}

class _$GetUsersInsideBubble extends GetUsersInsideBubble {
  @override
  final int? Bubble_id;

  factory _$GetUsersInsideBubble(
          [void Function(GetUsersInsideBubbleBuilder)? updates]) =>
      (new GetUsersInsideBubbleBuilder()..update(updates))._build();

  _$GetUsersInsideBubble._({this.Bubble_id}) : super._();

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
    return other is GetUsersInsideBubble && Bubble_id == other.Bubble_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Bubble_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetUsersInsideBubble')
          ..add('Bubble_id', Bubble_id))
        .toString();
  }
}

class GetUsersInsideBubbleBuilder
    implements Builder<GetUsersInsideBubble, GetUsersInsideBubbleBuilder> {
  _$GetUsersInsideBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  GetUsersInsideBubbleBuilder();

  GetUsersInsideBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
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
    final _$result = _$v ?? new _$GetUsersInsideBubble._(Bubble_id: Bubble_id);
    replace(_$result);
    return _$result;
  }
}

class _$SearchInsideBubbleUser extends SearchInsideBubbleUser {
  @override
  final String? Keyword;

  factory _$SearchInsideBubbleUser(
          [void Function(SearchInsideBubbleUserBuilder)? updates]) =>
      (new SearchInsideBubbleUserBuilder()..update(updates))._build();

  _$SearchInsideBubbleUser._({this.Keyword}) : super._();

  @override
  SearchInsideBubbleUser rebuild(
          void Function(SearchInsideBubbleUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchInsideBubbleUserBuilder toBuilder() =>
      new SearchInsideBubbleUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchInsideBubbleUser && Keyword == other.Keyword;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Keyword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchInsideBubbleUser')
          ..add('Keyword', Keyword))
        .toString();
  }
}

class SearchInsideBubbleUserBuilder
    implements Builder<SearchInsideBubbleUser, SearchInsideBubbleUserBuilder> {
  _$SearchInsideBubbleUser? _$v;

  String? _Keyword;
  String? get Keyword => _$this._Keyword;
  set Keyword(String? Keyword) => _$this._Keyword = Keyword;

  SearchInsideBubbleUserBuilder();

  SearchInsideBubbleUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Keyword = $v.Keyword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchInsideBubbleUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchInsideBubbleUser;
  }

  @override
  void update(void Function(SearchInsideBubbleUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchInsideBubbleUser build() => _build();

  _$SearchInsideBubbleUser _build() {
    final _$result = _$v ?? new _$SearchInsideBubbleUser._(Keyword: Keyword);
    replace(_$result);
    return _$result;
  }
}

class _$AddFrined extends AddFrined {
  @override
  final String? serial;
  @override
  final int? index;

  factory _$AddFrined([void Function(AddFrinedBuilder)? updates]) =>
      (new AddFrinedBuilder()..update(updates))._build();

  _$AddFrined._({this.serial, this.index}) : super._();

  @override
  AddFrined rebuild(void Function(AddFrinedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFrinedBuilder toBuilder() => new AddFrinedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFrined && serial == other.serial && index == other.index;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, serial.hashCode), index.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddFrined')
          ..add('serial', serial)
          ..add('index', index))
        .toString();
  }
}

class AddFrinedBuilder implements Builder<AddFrined, AddFrinedBuilder> {
  _$AddFrined? _$v;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  AddFrinedBuilder();

  AddFrinedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serial = $v.serial;
      _index = $v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddFrined other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddFrined;
  }

  @override
  void update(void Function(AddFrinedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddFrined build() => _build();

  _$AddFrined _build() {
    final _$result = _$v ?? new _$AddFrined._(serial: serial, index: index);
    replace(_$result);
    return _$result;
  }
}

class _$RemoveFriend extends RemoveFriend {
  @override
  final int? friend_id;
  @override
  final int? index;

  factory _$RemoveFriend([void Function(RemoveFriendBuilder)? updates]) =>
      (new RemoveFriendBuilder()..update(updates))._build();

  _$RemoveFriend._({this.friend_id, this.index}) : super._();

  @override
  RemoveFriend rebuild(void Function(RemoveFriendBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveFriendBuilder toBuilder() => new RemoveFriendBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveFriend &&
        friend_id == other.friend_id &&
        index == other.index;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, friend_id.hashCode), index.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RemoveFriend')
          ..add('friend_id', friend_id)
          ..add('index', index))
        .toString();
  }
}

class RemoveFriendBuilder
    implements Builder<RemoveFriend, RemoveFriendBuilder> {
  _$RemoveFriend? _$v;

  int? _friend_id;
  int? get friend_id => _$this._friend_id;
  set friend_id(int? friend_id) => _$this._friend_id = friend_id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  RemoveFriendBuilder();

  RemoveFriendBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _friend_id = $v.friend_id;
      _index = $v.index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveFriend other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemoveFriend;
  }

  @override
  void update(void Function(RemoveFriendBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveFriend build() => _build();

  _$RemoveFriend _build() {
    final _$result =
        _$v ?? new _$RemoveFriend._(friend_id: friend_id, index: index);
    replace(_$result);
    return _$result;
  }
}

class _$SendTopicFlow extends SendTopicFlow {
  @override
  final String? Title;
  @override
  final String? Content;
  @override
  final int? Bubble_id;
  @override
  final FlowData? Flow;

  factory _$SendTopicFlow([void Function(SendTopicFlowBuilder)? updates]) =>
      (new SendTopicFlowBuilder()..update(updates))._build();

  _$SendTopicFlow._({this.Title, this.Content, this.Bubble_id, this.Flow})
      : super._();

  @override
  SendTopicFlow rebuild(void Function(SendTopicFlowBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendTopicFlowBuilder toBuilder() => new SendTopicFlowBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendTopicFlow &&
        Title == other.Title &&
        Content == other.Content &&
        Bubble_id == other.Bubble_id &&
        Flow == other.Flow;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, Title.hashCode), Content.hashCode), Bubble_id.hashCode),
        Flow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendTopicFlow')
          ..add('Title', Title)
          ..add('Content', Content)
          ..add('Bubble_id', Bubble_id)
          ..add('Flow', Flow))
        .toString();
  }
}

class SendTopicFlowBuilder
    implements Builder<SendTopicFlow, SendTopicFlowBuilder> {
  _$SendTopicFlow? _$v;

  String? _Title;
  String? get Title => _$this._Title;
  set Title(String? Title) => _$this._Title = Title;

  String? _Content;
  String? get Content => _$this._Content;
  set Content(String? Content) => _$this._Content = Content;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  FlowData? _Flow;
  FlowData? get Flow => _$this._Flow;
  set Flow(FlowData? Flow) => _$this._Flow = Flow;

  SendTopicFlowBuilder();

  SendTopicFlowBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Title = $v.Title;
      _Content = $v.Content;
      _Bubble_id = $v.Bubble_id;
      _Flow = $v.Flow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendTopicFlow other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendTopicFlow;
  }

  @override
  void update(void Function(SendTopicFlowBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendTopicFlow build() => _build();

  _$SendTopicFlow _build() {
    final _$result = _$v ??
        new _$SendTopicFlow._(
            Title: Title, Content: Content, Bubble_id: Bubble_id, Flow: Flow);
    replace(_$result);
    return _$result;
  }
}

class _$SendFootPrintFlow extends SendFootPrintFlow {
  @override
  final String? title;
  @override
  final String? image;
  @override
  final FlowData? Flow;
  @override
  final int? Bubble_id;

  factory _$SendFootPrintFlow(
          [void Function(SendFootPrintFlowBuilder)? updates]) =>
      (new SendFootPrintFlowBuilder()..update(updates))._build();

  _$SendFootPrintFlow._({this.title, this.image, this.Flow, this.Bubble_id})
      : super._();

  @override
  SendFootPrintFlow rebuild(void Function(SendFootPrintFlowBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendFootPrintFlowBuilder toBuilder() =>
      new SendFootPrintFlowBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendFootPrintFlow &&
        title == other.title &&
        image == other.image &&
        Flow == other.Flow &&
        Bubble_id == other.Bubble_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), image.hashCode), Flow.hashCode),
        Bubble_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendFootPrintFlow')
          ..add('title', title)
          ..add('image', image)
          ..add('Flow', Flow)
          ..add('Bubble_id', Bubble_id))
        .toString();
  }
}

class SendFootPrintFlowBuilder
    implements Builder<SendFootPrintFlow, SendFootPrintFlowBuilder> {
  _$SendFootPrintFlow? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  FlowData? _Flow;
  FlowData? get Flow => _$this._Flow;
  set Flow(FlowData? Flow) => _$this._Flow = Flow;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  SendFootPrintFlowBuilder();

  SendFootPrintFlowBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _image = $v.image;
      _Flow = $v.Flow;
      _Bubble_id = $v.Bubble_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendFootPrintFlow other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendFootPrintFlow;
  }

  @override
  void update(void Function(SendFootPrintFlowBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendFootPrintFlow build() => _build();

  _$SendFootPrintFlow _build() {
    final _$result = _$v ??
        new _$SendFootPrintFlow._(
            title: title, image: image, Flow: Flow, Bubble_id: Bubble_id);
    replace(_$result);
    return _$result;
  }
}

class _$SendMediaDumpFlow extends SendMediaDumpFlow {
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? image_type;
  @override
  final int? Bubble_id;
  @override
  final FlowData? Flow;

  factory _$SendMediaDumpFlow(
          [void Function(SendMediaDumpFlowBuilder)? updates]) =>
      (new SendMediaDumpFlowBuilder()..update(updates))._build();

  _$SendMediaDumpFlow._(
      {this.title, this.image, this.image_type, this.Bubble_id, this.Flow})
      : super._();

  @override
  SendMediaDumpFlow rebuild(void Function(SendMediaDumpFlowBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendMediaDumpFlowBuilder toBuilder() =>
      new SendMediaDumpFlowBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendMediaDumpFlow &&
        title == other.title &&
        image == other.image &&
        image_type == other.image_type &&
        Bubble_id == other.Bubble_id &&
        Flow == other.Flow;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, title.hashCode), image.hashCode),
                image_type.hashCode),
            Bubble_id.hashCode),
        Flow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendMediaDumpFlow')
          ..add('title', title)
          ..add('image', image)
          ..add('image_type', image_type)
          ..add('Bubble_id', Bubble_id)
          ..add('Flow', Flow))
        .toString();
  }
}

class SendMediaDumpFlowBuilder
    implements Builder<SendMediaDumpFlow, SendMediaDumpFlowBuilder> {
  _$SendMediaDumpFlow? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _image_type;
  String? get image_type => _$this._image_type;
  set image_type(String? image_type) => _$this._image_type = image_type;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  FlowData? _Flow;
  FlowData? get Flow => _$this._Flow;
  set Flow(FlowData? Flow) => _$this._Flow = Flow;

  SendMediaDumpFlowBuilder();

  SendMediaDumpFlowBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _image = $v.image;
      _image_type = $v.image_type;
      _Bubble_id = $v.Bubble_id;
      _Flow = $v.Flow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendMediaDumpFlow other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendMediaDumpFlow;
  }

  @override
  void update(void Function(SendMediaDumpFlowBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendMediaDumpFlow build() => _build();

  _$SendMediaDumpFlow _build() {
    final _$result = _$v ??
        new _$SendMediaDumpFlow._(
            title: title,
            image: image,
            image_type: image_type,
            Bubble_id: Bubble_id,
            Flow: Flow);
    replace(_$result);
    return _$result;
  }
}

class _$SendPollFloww extends SendPollFloww {
  @override
  final String? Question;
  @override
  final int? bubble_id;
  @override
  final List<String>? answers;
  @override
  final FlowData? Flow;

  factory _$SendPollFloww([void Function(SendPollFlowwBuilder)? updates]) =>
      (new SendPollFlowwBuilder()..update(updates))._build();

  _$SendPollFloww._({this.Question, this.bubble_id, this.answers, this.Flow})
      : super._();

  @override
  SendPollFloww rebuild(void Function(SendPollFlowwBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendPollFlowwBuilder toBuilder() => new SendPollFlowwBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendPollFloww &&
        Question == other.Question &&
        bubble_id == other.bubble_id &&
        answers == other.answers &&
        Flow == other.Flow;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, Question.hashCode), bubble_id.hashCode),
            answers.hashCode),
        Flow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendPollFloww')
          ..add('Question', Question)
          ..add('bubble_id', bubble_id)
          ..add('answers', answers)
          ..add('Flow', Flow))
        .toString();
  }
}

class SendPollFlowwBuilder
    implements Builder<SendPollFloww, SendPollFlowwBuilder> {
  _$SendPollFloww? _$v;

  String? _Question;
  String? get Question => _$this._Question;
  set Question(String? Question) => _$this._Question = Question;

  int? _bubble_id;
  int? get bubble_id => _$this._bubble_id;
  set bubble_id(int? bubble_id) => _$this._bubble_id = bubble_id;

  List<String>? _answers;
  List<String>? get answers => _$this._answers;
  set answers(List<String>? answers) => _$this._answers = answers;

  FlowData? _Flow;
  FlowData? get Flow => _$this._Flow;
  set Flow(FlowData? Flow) => _$this._Flow = Flow;

  SendPollFlowwBuilder();

  SendPollFlowwBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Question = $v.Question;
      _bubble_id = $v.bubble_id;
      _answers = $v.answers;
      _Flow = $v.Flow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendPollFloww other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendPollFloww;
  }

  @override
  void update(void Function(SendPollFlowwBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendPollFloww build() => _build();

  _$SendPollFloww _build() {
    final _$result = _$v ??
        new _$SendPollFloww._(
            Question: Question,
            bubble_id: bubble_id,
            answers: answers,
            Flow: Flow);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeFlowOptionsStatus extends ChangeFlowOptionsStatus {
  @override
  final bool? status;

  factory _$ChangeFlowOptionsStatus(
          [void Function(ChangeFlowOptionsStatusBuilder)? updates]) =>
      (new ChangeFlowOptionsStatusBuilder()..update(updates))._build();

  _$ChangeFlowOptionsStatus._({this.status}) : super._();

  @override
  ChangeFlowOptionsStatus rebuild(
          void Function(ChangeFlowOptionsStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeFlowOptionsStatusBuilder toBuilder() =>
      new ChangeFlowOptionsStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeFlowOptionsStatus && status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeFlowOptionsStatus')
          ..add('status', status))
        .toString();
  }
}

class ChangeFlowOptionsStatusBuilder
    implements
        Builder<ChangeFlowOptionsStatus, ChangeFlowOptionsStatusBuilder> {
  _$ChangeFlowOptionsStatus? _$v;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  ChangeFlowOptionsStatusBuilder();

  ChangeFlowOptionsStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeFlowOptionsStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeFlowOptionsStatus;
  }

  @override
  void update(void Function(ChangeFlowOptionsStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeFlowOptionsStatus build() => _build();

  _$ChangeFlowOptionsStatus _build() {
    final _$result = _$v ?? new _$ChangeFlowOptionsStatus._(status: status);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeMediaImageTaken extends ChangeMediaImageTaken {
  @override
  final bool? status;

  factory _$ChangeMediaImageTaken(
          [void Function(ChangeMediaImageTakenBuilder)? updates]) =>
      (new ChangeMediaImageTakenBuilder()..update(updates))._build();

  _$ChangeMediaImageTaken._({this.status}) : super._();

  @override
  ChangeMediaImageTaken rebuild(
          void Function(ChangeMediaImageTakenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeMediaImageTakenBuilder toBuilder() =>
      new ChangeMediaImageTakenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeMediaImageTaken && status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeMediaImageTaken')
          ..add('status', status))
        .toString();
  }
}

class ChangeMediaImageTakenBuilder
    implements Builder<ChangeMediaImageTaken, ChangeMediaImageTakenBuilder> {
  _$ChangeMediaImageTaken? _$v;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  ChangeMediaImageTakenBuilder();

  ChangeMediaImageTakenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeMediaImageTaken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeMediaImageTaken;
  }

  @override
  void update(void Function(ChangeMediaImageTakenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeMediaImageTaken build() => _build();

  _$ChangeMediaImageTaken _build() {
    final _$result = _$v ?? new _$ChangeMediaImageTaken._(status: status);
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

class _$AddFlowModel extends AddFlowModel {
  @override
  final FlowData? Flow;

  factory _$AddFlowModel([void Function(AddFlowModelBuilder)? updates]) =>
      (new AddFlowModelBuilder()..update(updates))._build();

  _$AddFlowModel._({this.Flow}) : super._();

  @override
  AddFlowModel rebuild(void Function(AddFlowModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFlowModelBuilder toBuilder() => new AddFlowModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFlowModel && Flow == other.Flow;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Flow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddFlowModel')..add('Flow', Flow))
        .toString();
  }
}

class AddFlowModelBuilder
    implements Builder<AddFlowModel, AddFlowModelBuilder> {
  _$AddFlowModel? _$v;

  FlowData? _Flow;
  FlowData? get Flow => _$this._Flow;
  set Flow(FlowData? Flow) => _$this._Flow = Flow;

  AddFlowModelBuilder();

  AddFlowModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Flow = $v.Flow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddFlowModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddFlowModel;
  }

  @override
  void update(void Function(AddFlowModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddFlowModel build() => _build();

  _$AddFlowModel _build() {
    final _$result = _$v ?? new _$AddFlowModel._(Flow: Flow);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
