// GENERATED CODE - DO NOT MODIFY BY HAND

part of FindFriends_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetContactList extends GetContactList {
  factory _$GetContactList([void Function(GetContactListBuilder)? updates]) =>
      (new GetContactListBuilder()..update(updates))._build();

  _$GetContactList._() : super._();

  @override
  GetContactList rebuild(void Function(GetContactListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetContactListBuilder toBuilder() =>
      new GetContactListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetContactList;
  }

  @override
  int get hashCode {
    return 32452569;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetContactList').toString();
  }
}

class GetContactListBuilder
    implements Builder<GetContactList, GetContactListBuilder> {
  _$GetContactList? _$v;

  GetContactListBuilder();

  @override
  void replace(GetContactList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetContactList;
  }

  @override
  void update(void Function(GetContactListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetContactList build() => _build();

  _$GetContactList _build() {
    final _$result = _$v ?? new _$GetContactList._();
    replace(_$result);
    return _$result;
  }
}

class _$AddFrined extends AddFrined {
  @override
  final String? serial;

  factory _$AddFrined([void Function(AddFrinedBuilder)? updates]) =>
      (new AddFrinedBuilder()..update(updates))._build();

  _$AddFrined._({this.serial}) : super._();

  @override
  AddFrined rebuild(void Function(AddFrinedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFrinedBuilder toBuilder() => new AddFrinedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFrined && serial == other.serial;
  }

  @override
  int get hashCode {
    return $jf($jc(0, serial.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddFrined')..add('serial', serial))
        .toString();
  }
}

class AddFrinedBuilder implements Builder<AddFrined, AddFrinedBuilder> {
  _$AddFrined? _$v;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  AddFrinedBuilder();

  AddFrinedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serial = $v.serial;
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
    final _$result = _$v ?? new _$AddFrined._(serial: serial);
    replace(_$result);
    return _$result;
  }
}

class _$OpenCopyMessage extends OpenCopyMessage {
  factory _$OpenCopyMessage([void Function(OpenCopyMessageBuilder)? updates]) =>
      (new OpenCopyMessageBuilder()..update(updates))._build();

  _$OpenCopyMessage._() : super._();

  @override
  OpenCopyMessage rebuild(void Function(OpenCopyMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenCopyMessageBuilder toBuilder() =>
      new OpenCopyMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenCopyMessage;
  }

  @override
  int get hashCode {
    return 918602519;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('OpenCopyMessage').toString();
  }
}

class OpenCopyMessageBuilder
    implements Builder<OpenCopyMessage, OpenCopyMessageBuilder> {
  _$OpenCopyMessage? _$v;

  OpenCopyMessageBuilder();

  @override
  void replace(OpenCopyMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenCopyMessage;
  }

  @override
  void update(void Function(OpenCopyMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenCopyMessage build() => _build();

  _$OpenCopyMessage _build() {
    final _$result = _$v ?? new _$OpenCopyMessage._();
    replace(_$result);
    return _$result;
  }
}

class _$CloseCopyMessage extends CloseCopyMessage {
  factory _$CloseCopyMessage(
          [void Function(CloseCopyMessageBuilder)? updates]) =>
      (new CloseCopyMessageBuilder()..update(updates))._build();

  _$CloseCopyMessage._() : super._();

  @override
  CloseCopyMessage rebuild(void Function(CloseCopyMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CloseCopyMessageBuilder toBuilder() =>
      new CloseCopyMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CloseCopyMessage;
  }

  @override
  int get hashCode {
    return 657581475;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('CloseCopyMessage').toString();
  }
}

class CloseCopyMessageBuilder
    implements Builder<CloseCopyMessage, CloseCopyMessageBuilder> {
  _$CloseCopyMessage? _$v;

  CloseCopyMessageBuilder();

  @override
  void replace(CloseCopyMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CloseCopyMessage;
  }

  @override
  void update(void Function(CloseCopyMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CloseCopyMessage build() => _build();

  _$CloseCopyMessage _build() {
    final _$result = _$v ?? new _$CloseCopyMessage._();
    replace(_$result);
    return _$result;
  }
}

class _$OpenContactMessage extends OpenContactMessage {
  factory _$OpenContactMessage(
          [void Function(OpenContactMessageBuilder)? updates]) =>
      (new OpenContactMessageBuilder()..update(updates))._build();

  _$OpenContactMessage._() : super._();

  @override
  OpenContactMessage rebuild(
          void Function(OpenContactMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenContactMessageBuilder toBuilder() =>
      new OpenContactMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenContactMessage;
  }

  @override
  int get hashCode {
    return 734906307;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('OpenContactMessage').toString();
  }
}

class OpenContactMessageBuilder
    implements Builder<OpenContactMessage, OpenContactMessageBuilder> {
  _$OpenContactMessage? _$v;

  OpenContactMessageBuilder();

  @override
  void replace(OpenContactMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenContactMessage;
  }

  @override
  void update(void Function(OpenContactMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenContactMessage build() => _build();

  _$OpenContactMessage _build() {
    final _$result = _$v ?? new _$OpenContactMessage._();
    replace(_$result);
    return _$result;
  }
}

class _$CloseContactMessage extends CloseContactMessage {
  factory _$CloseContactMessage(
          [void Function(CloseContactMessageBuilder)? updates]) =>
      (new CloseContactMessageBuilder()..update(updates))._build();

  _$CloseContactMessage._() : super._();

  @override
  CloseContactMessage rebuild(
          void Function(CloseContactMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CloseContactMessageBuilder toBuilder() =>
      new CloseContactMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CloseContactMessage;
  }

  @override
  int get hashCode {
    return 939806306;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('CloseContactMessage').toString();
  }
}

class CloseContactMessageBuilder
    implements Builder<CloseContactMessage, CloseContactMessageBuilder> {
  _$CloseContactMessage? _$v;

  CloseContactMessageBuilder();

  @override
  void replace(CloseContactMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CloseContactMessage;
  }

  @override
  void update(void Function(CloseContactMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CloseContactMessage build() => _build();

  _$CloseContactMessage _build() {
    final _$result = _$v ?? new _$CloseContactMessage._();
    replace(_$result);
    return _$result;
  }
}

class _$OpenCompletMessage extends OpenCompletMessage {
  factory _$OpenCompletMessage(
          [void Function(OpenCompletMessageBuilder)? updates]) =>
      (new OpenCompletMessageBuilder()..update(updates))._build();

  _$OpenCompletMessage._() : super._();

  @override
  OpenCompletMessage rebuild(
          void Function(OpenCompletMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenCompletMessageBuilder toBuilder() =>
      new OpenCompletMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenCompletMessage;
  }

  @override
  int get hashCode {
    return 261687369;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('OpenCompletMessage').toString();
  }
}

class OpenCompletMessageBuilder
    implements Builder<OpenCompletMessage, OpenCompletMessageBuilder> {
  _$OpenCompletMessage? _$v;

  OpenCompletMessageBuilder();

  @override
  void replace(OpenCompletMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenCompletMessage;
  }

  @override
  void update(void Function(OpenCompletMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenCompletMessage build() => _build();

  _$OpenCompletMessage _build() {
    final _$result = _$v ?? new _$OpenCompletMessage._();
    replace(_$result);
    return _$result;
  }
}

class _$CloseCompletMessage extends CloseCompletMessage {
  factory _$CloseCompletMessage(
          [void Function(CloseCompletMessageBuilder)? updates]) =>
      (new CloseCompletMessageBuilder()..update(updates))._build();

  _$CloseCompletMessage._() : super._();

  @override
  CloseCompletMessage rebuild(
          void Function(CloseCompletMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CloseCompletMessageBuilder toBuilder() =>
      new CloseCompletMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CloseCompletMessage;
  }

  @override
  int get hashCode {
    return 746131823;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('CloseCompletMessage').toString();
  }
}

class CloseCompletMessageBuilder
    implements Builder<CloseCompletMessage, CloseCompletMessageBuilder> {
  _$CloseCompletMessage? _$v;

  CloseCompletMessageBuilder();

  @override
  void replace(CloseCompletMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CloseCompletMessage;
  }

  @override
  void update(void Function(CloseCompletMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CloseCompletMessage build() => _build();

  _$CloseCompletMessage _build() {
    final _$result = _$v ?? new _$CloseCompletMessage._();
    replace(_$result);
    return _$result;
  }
}

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
    return newBuiltValueToStringHelper('ClearError').toString();
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

class _$GetProfile extends GetProfile {
  factory _$GetProfile([void Function(GetProfileBuilder)? updates]) =>
      (new GetProfileBuilder()..update(updates))._build();

  _$GetProfile._() : super._();

  @override
  GetProfile rebuild(void Function(GetProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetProfileBuilder toBuilder() => new GetProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetProfile;
  }

  @override
  int get hashCode {
    return 520564276;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetProfile').toString();
  }
}

class GetProfileBuilder implements Builder<GetProfile, GetProfileBuilder> {
  _$GetProfile? _$v;

  GetProfileBuilder();

  @override
  void replace(GetProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetProfile;
  }

  @override
  void update(void Function(GetProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetProfile build() => _build();

  _$GetProfile _build() {
    final _$result = _$v ?? new _$GetProfile._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
