// GENERATED CODE - DO NOT MODIFY BY HAND

part of FindFriends_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FindFriendsState extends FindFriendsState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final bool? AddFreindSuccess;
  @override
  final bool? CopyMessageOpened;
  @override
  final bool? FreindAddlOADING;
  @override
  final bool? ISCopyMessage;
  @override
  final bool? IsContactLoadedd;
  @override
  final bool? IsCompletMessage;
  @override
  final List<Contact> contacts;
  @override
  final ProfileDateModel? ProfileDate;
  @override
  final AddNewFriendModel? AddNewFriend;

  factory _$FindFriendsState(
          [void Function(FindFriendsStateBuilder)? updates]) =>
      (new FindFriendsStateBuilder()..update(updates))._build();

  _$FindFriendsState._(
      {this.error,
      this.isLoading,
      this.success,
      this.AddFreindSuccess,
      this.CopyMessageOpened,
      this.FreindAddlOADING,
      this.ISCopyMessage,
      this.IsContactLoadedd,
      this.IsCompletMessage,
      required this.contacts,
      this.ProfileDate,
      this.AddNewFriend})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        contacts, 'FindFriendsState', 'contacts');
  }

  @override
  FindFriendsState rebuild(void Function(FindFriendsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FindFriendsStateBuilder toBuilder() =>
      new FindFriendsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FindFriendsState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        AddFreindSuccess == other.AddFreindSuccess &&
        CopyMessageOpened == other.CopyMessageOpened &&
        FreindAddlOADING == other.FreindAddlOADING &&
        ISCopyMessage == other.ISCopyMessage &&
        IsContactLoadedd == other.IsContactLoadedd &&
        IsCompletMessage == other.IsCompletMessage &&
        contacts == other.contacts &&
        ProfileDate == other.ProfileDate &&
        AddNewFriend == other.AddNewFriend;
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
                                            $jc($jc(0, error.hashCode),
                                                isLoading.hashCode),
                                            success.hashCode),
                                        AddFreindSuccess.hashCode),
                                    CopyMessageOpened.hashCode),
                                FreindAddlOADING.hashCode),
                            ISCopyMessage.hashCode),
                        IsContactLoadedd.hashCode),
                    IsCompletMessage.hashCode),
                contacts.hashCode),
            ProfileDate.hashCode),
        AddNewFriend.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FindFriendsState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('AddFreindSuccess', AddFreindSuccess)
          ..add('CopyMessageOpened', CopyMessageOpened)
          ..add('FreindAddlOADING', FreindAddlOADING)
          ..add('ISCopyMessage', ISCopyMessage)
          ..add('IsContactLoadedd', IsContactLoadedd)
          ..add('IsCompletMessage', IsCompletMessage)
          ..add('contacts', contacts)
          ..add('ProfileDate', ProfileDate)
          ..add('AddNewFriend', AddNewFriend))
        .toString();
  }
}

class FindFriendsStateBuilder
    implements Builder<FindFriendsState, FindFriendsStateBuilder> {
  _$FindFriendsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _AddFreindSuccess;
  bool? get AddFreindSuccess => _$this._AddFreindSuccess;
  set AddFreindSuccess(bool? AddFreindSuccess) =>
      _$this._AddFreindSuccess = AddFreindSuccess;

  bool? _CopyMessageOpened;
  bool? get CopyMessageOpened => _$this._CopyMessageOpened;
  set CopyMessageOpened(bool? CopyMessageOpened) =>
      _$this._CopyMessageOpened = CopyMessageOpened;

  bool? _FreindAddlOADING;
  bool? get FreindAddlOADING => _$this._FreindAddlOADING;
  set FreindAddlOADING(bool? FreindAddlOADING) =>
      _$this._FreindAddlOADING = FreindAddlOADING;

  bool? _ISCopyMessage;
  bool? get ISCopyMessage => _$this._ISCopyMessage;
  set ISCopyMessage(bool? ISCopyMessage) =>
      _$this._ISCopyMessage = ISCopyMessage;

  bool? _IsContactLoadedd;
  bool? get IsContactLoadedd => _$this._IsContactLoadedd;
  set IsContactLoadedd(bool? IsContactLoadedd) =>
      _$this._IsContactLoadedd = IsContactLoadedd;

  bool? _IsCompletMessage;
  bool? get IsCompletMessage => _$this._IsCompletMessage;
  set IsCompletMessage(bool? IsCompletMessage) =>
      _$this._IsCompletMessage = IsCompletMessage;

  List<Contact>? _contacts;
  List<Contact>? get contacts => _$this._contacts;
  set contacts(List<Contact>? contacts) => _$this._contacts = contacts;

  ProfileDateModelBuilder? _ProfileDate;
  ProfileDateModelBuilder get ProfileDate =>
      _$this._ProfileDate ??= new ProfileDateModelBuilder();
  set ProfileDate(ProfileDateModelBuilder? ProfileDate) =>
      _$this._ProfileDate = ProfileDate;

  AddNewFriendModelBuilder? _AddNewFriend;
  AddNewFriendModelBuilder get AddNewFriend =>
      _$this._AddNewFriend ??= new AddNewFriendModelBuilder();
  set AddNewFriend(AddNewFriendModelBuilder? AddNewFriend) =>
      _$this._AddNewFriend = AddNewFriend;

  FindFriendsStateBuilder();

  FindFriendsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _AddFreindSuccess = $v.AddFreindSuccess;
      _CopyMessageOpened = $v.CopyMessageOpened;
      _FreindAddlOADING = $v.FreindAddlOADING;
      _ISCopyMessage = $v.ISCopyMessage;
      _IsContactLoadedd = $v.IsContactLoadedd;
      _IsCompletMessage = $v.IsCompletMessage;
      _contacts = $v.contacts;
      _ProfileDate = $v.ProfileDate?.toBuilder();
      _AddNewFriend = $v.AddNewFriend?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FindFriendsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FindFriendsState;
  }

  @override
  void update(void Function(FindFriendsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FindFriendsState build() => _build();

  _$FindFriendsState _build() {
    _$FindFriendsState _$result;
    try {
      _$result = _$v ??
          new _$FindFriendsState._(
              error: error,
              isLoading: isLoading,
              success: success,
              AddFreindSuccess: AddFreindSuccess,
              CopyMessageOpened: CopyMessageOpened,
              FreindAddlOADING: FreindAddlOADING,
              ISCopyMessage: ISCopyMessage,
              IsContactLoadedd: IsContactLoadedd,
              IsCompletMessage: IsCompletMessage,
              contacts: BuiltValueNullFieldError.checkNotNull(
                  contacts, 'FindFriendsState', 'contacts'),
              ProfileDate: _ProfileDate?.build(),
              AddNewFriend: _AddNewFriend?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ProfileDate';
        _ProfileDate?.build();
        _$failedField = 'AddNewFriend';
        _AddNewFriend?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FindFriendsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
