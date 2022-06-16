// GENERATED CODE - DO NOT MODIFY BY HAND

part of Chat_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatState extends ChatState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? Done;
  @override
  final bool? AliasISLoading;
  @override
  final bool? AliasISsuccess;
  @override
  final GetAliasModel? GetAlias;
  @override
  final OldMessagesModel? OldMessages;
  @override
  final PostMessagesModel? PostMessages;
  @override
  final AddreplyModel? Addreply;
  @override
  final bool? MYAliasISLoading;
  @override
  final bool? MYAliasISsuccess;
  @override
  final GetAliasModel? GetAliasMinee;
  @override
  final String? AvatarPathForRepliedTo;
  @override
  final int? ColorForRepliedTo;
  @override
  final String? RepliedToMessage;
  @override
  final String? AliasForRepliedTo;
  @override
  final bool? Isreply;
  @override
  final bool? Status;

  factory _$ChatState([void Function(ChatStateBuilder)? updates]) =>
      (new ChatStateBuilder()..update(updates))._build();

  _$ChatState._(
      {this.error,
      this.isLoading,
      this.success,
      this.Done,
      this.AliasISLoading,
      this.AliasISsuccess,
      this.GetAlias,
      this.OldMessages,
      this.PostMessages,
      this.Addreply,
      this.MYAliasISLoading,
      this.MYAliasISsuccess,
      this.GetAliasMinee,
      this.AvatarPathForRepliedTo,
      this.ColorForRepliedTo,
      this.RepliedToMessage,
      this.AliasForRepliedTo,
      this.Isreply,
      this.Status})
      : super._();

  @override
  ChatState rebuild(void Function(ChatStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatStateBuilder toBuilder() => new ChatStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        Done == other.Done &&
        AliasISLoading == other.AliasISLoading &&
        AliasISsuccess == other.AliasISsuccess &&
        GetAlias == other.GetAlias &&
        OldMessages == other.OldMessages &&
        PostMessages == other.PostMessages &&
        Addreply == other.Addreply &&
        MYAliasISLoading == other.MYAliasISLoading &&
        MYAliasISsuccess == other.MYAliasISsuccess &&
        GetAliasMinee == other.GetAliasMinee &&
        AvatarPathForRepliedTo == other.AvatarPathForRepliedTo &&
        ColorForRepliedTo == other.ColorForRepliedTo &&
        RepliedToMessage == other.RepliedToMessage &&
        AliasForRepliedTo == other.AliasForRepliedTo &&
        Isreply == other.Isreply &&
        Status == other.Status;
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
                                                                            $jc(
                                                                                0,
                                                                                error
                                                                                    .hashCode),
                                                                            isLoading
                                                                                .hashCode),
                                                                        success
                                                                            .hashCode),
                                                                    Done
                                                                        .hashCode),
                                                                AliasISLoading
                                                                    .hashCode),
                                                            AliasISsuccess
                                                                .hashCode),
                                                        GetAlias.hashCode),
                                                    OldMessages.hashCode),
                                                PostMessages.hashCode),
                                            Addreply.hashCode),
                                        MYAliasISLoading.hashCode),
                                    MYAliasISsuccess.hashCode),
                                GetAliasMinee.hashCode),
                            AvatarPathForRepliedTo.hashCode),
                        ColorForRepliedTo.hashCode),
                    RepliedToMessage.hashCode),
                AliasForRepliedTo.hashCode),
            Isreply.hashCode),
        Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('Done', Done)
          ..add('AliasISLoading', AliasISLoading)
          ..add('AliasISsuccess', AliasISsuccess)
          ..add('GetAlias', GetAlias)
          ..add('OldMessages', OldMessages)
          ..add('PostMessages', PostMessages)
          ..add('Addreply', Addreply)
          ..add('MYAliasISLoading', MYAliasISLoading)
          ..add('MYAliasISsuccess', MYAliasISsuccess)
          ..add('GetAliasMinee', GetAliasMinee)
          ..add('AvatarPathForRepliedTo', AvatarPathForRepliedTo)
          ..add('ColorForRepliedTo', ColorForRepliedTo)
          ..add('RepliedToMessage', RepliedToMessage)
          ..add('AliasForRepliedTo', AliasForRepliedTo)
          ..add('Isreply', Isreply)
          ..add('Status', Status))
        .toString();
  }
}

class ChatStateBuilder implements Builder<ChatState, ChatStateBuilder> {
  _$ChatState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _Done;
  bool? get Done => _$this._Done;
  set Done(bool? Done) => _$this._Done = Done;

  bool? _AliasISLoading;
  bool? get AliasISLoading => _$this._AliasISLoading;
  set AliasISLoading(bool? AliasISLoading) =>
      _$this._AliasISLoading = AliasISLoading;

  bool? _AliasISsuccess;
  bool? get AliasISsuccess => _$this._AliasISsuccess;
  set AliasISsuccess(bool? AliasISsuccess) =>
      _$this._AliasISsuccess = AliasISsuccess;

  GetAliasModelBuilder? _GetAlias;
  GetAliasModelBuilder get GetAlias =>
      _$this._GetAlias ??= new GetAliasModelBuilder();
  set GetAlias(GetAliasModelBuilder? GetAlias) => _$this._GetAlias = GetAlias;

  OldMessagesModelBuilder? _OldMessages;
  OldMessagesModelBuilder get OldMessages =>
      _$this._OldMessages ??= new OldMessagesModelBuilder();
  set OldMessages(OldMessagesModelBuilder? OldMessages) =>
      _$this._OldMessages = OldMessages;

  PostMessagesModelBuilder? _PostMessages;
  PostMessagesModelBuilder get PostMessages =>
      _$this._PostMessages ??= new PostMessagesModelBuilder();
  set PostMessages(PostMessagesModelBuilder? PostMessages) =>
      _$this._PostMessages = PostMessages;

  AddreplyModelBuilder? _Addreply;
  AddreplyModelBuilder get Addreply =>
      _$this._Addreply ??= new AddreplyModelBuilder();
  set Addreply(AddreplyModelBuilder? Addreply) => _$this._Addreply = Addreply;

  bool? _MYAliasISLoading;
  bool? get MYAliasISLoading => _$this._MYAliasISLoading;
  set MYAliasISLoading(bool? MYAliasISLoading) =>
      _$this._MYAliasISLoading = MYAliasISLoading;

  bool? _MYAliasISsuccess;
  bool? get MYAliasISsuccess => _$this._MYAliasISsuccess;
  set MYAliasISsuccess(bool? MYAliasISsuccess) =>
      _$this._MYAliasISsuccess = MYAliasISsuccess;

  GetAliasModelBuilder? _GetAliasMinee;
  GetAliasModelBuilder get GetAliasMinee =>
      _$this._GetAliasMinee ??= new GetAliasModelBuilder();
  set GetAliasMinee(GetAliasModelBuilder? GetAliasMinee) =>
      _$this._GetAliasMinee = GetAliasMinee;

  String? _AvatarPathForRepliedTo;
  String? get AvatarPathForRepliedTo => _$this._AvatarPathForRepliedTo;
  set AvatarPathForRepliedTo(String? AvatarPathForRepliedTo) =>
      _$this._AvatarPathForRepliedTo = AvatarPathForRepliedTo;

  int? _ColorForRepliedTo;
  int? get ColorForRepliedTo => _$this._ColorForRepliedTo;
  set ColorForRepliedTo(int? ColorForRepliedTo) =>
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

  bool? _Status;
  bool? get Status => _$this._Status;
  set Status(bool? Status) => _$this._Status = Status;

  ChatStateBuilder();

  ChatStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _Done = $v.Done;
      _AliasISLoading = $v.AliasISLoading;
      _AliasISsuccess = $v.AliasISsuccess;
      _GetAlias = $v.GetAlias?.toBuilder();
      _OldMessages = $v.OldMessages?.toBuilder();
      _PostMessages = $v.PostMessages?.toBuilder();
      _Addreply = $v.Addreply?.toBuilder();
      _MYAliasISLoading = $v.MYAliasISLoading;
      _MYAliasISsuccess = $v.MYAliasISsuccess;
      _GetAliasMinee = $v.GetAliasMinee?.toBuilder();
      _AvatarPathForRepliedTo = $v.AvatarPathForRepliedTo;
      _ColorForRepliedTo = $v.ColorForRepliedTo;
      _RepliedToMessage = $v.RepliedToMessage;
      _AliasForRepliedTo = $v.AliasForRepliedTo;
      _Isreply = $v.Isreply;
      _Status = $v.Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatState;
  }

  @override
  void update(void Function(ChatStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatState build() => _build();

  _$ChatState _build() {
    _$ChatState _$result;
    try {
      _$result = _$v ??
          new _$ChatState._(
              error: error,
              isLoading: isLoading,
              success: success,
              Done: Done,
              AliasISLoading: AliasISLoading,
              AliasISsuccess: AliasISsuccess,
              GetAlias: _GetAlias?.build(),
              OldMessages: _OldMessages?.build(),
              PostMessages: _PostMessages?.build(),
              Addreply: _Addreply?.build(),
              MYAliasISLoading: MYAliasISLoading,
              MYAliasISsuccess: MYAliasISsuccess,
              GetAliasMinee: _GetAliasMinee?.build(),
              AvatarPathForRepliedTo: AvatarPathForRepliedTo,
              ColorForRepliedTo: ColorForRepliedTo,
              RepliedToMessage: RepliedToMessage,
              AliasForRepliedTo: AliasForRepliedTo,
              Isreply: Isreply,
              Status: Status);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'GetAlias';
        _GetAlias?.build();
        _$failedField = 'OldMessages';
        _OldMessages?.build();
        _$failedField = 'PostMessages';
        _PostMessages?.build();
        _$failedField = 'Addreply';
        _Addreply?.build();

        _$failedField = 'GetAliasMinee';
        _GetAliasMinee?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
