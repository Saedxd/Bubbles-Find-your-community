// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetnotifcationsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetnotifcationsModel> _$getnotifcationsModelSerializer =
    new _$GetnotifcationsModelSerializer();

class _$GetnotifcationsModelSerializer
    implements StructuredSerializer<GetnotifcationsModel> {
  @override
  final Iterable<Type> types = const [
    GetnotifcationsModel,
    _$GetnotifcationsModel
  ];
  @override
  final String wireName = 'GetnotifcationsModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetnotifcationsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.msg;
    if (value != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statuscode;
    if (value != null) {
      result
        ..add('statuscode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.notifications;
    if (value != null) {
      result
        ..add('notifications')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(NotificationsListModel)])));
    }
    return result;
  }

  @override
  GetnotifcationsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetnotifcationsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'notifications':
          result.notifications.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(NotificationsListModel)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetnotifcationsModel extends GetnotifcationsModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<NotificationsListModel>? notifications;

  factory _$GetnotifcationsModel(
          [void Function(GetnotifcationsModelBuilder)? updates]) =>
      (new GetnotifcationsModelBuilder()..update(updates))._build();

  _$GetnotifcationsModel._({this.msg, this.statuscode, this.notifications})
      : super._();

  @override
  GetnotifcationsModel rebuild(
          void Function(GetnotifcationsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetnotifcationsModelBuilder toBuilder() =>
      new GetnotifcationsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetnotifcationsModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        notifications == other.notifications;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, msg.hashCode), statuscode.hashCode),
        notifications.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetnotifcationsModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('notifications', notifications))
        .toString();
  }
}

class GetnotifcationsModelBuilder
    implements Builder<GetnotifcationsModel, GetnotifcationsModelBuilder> {
  _$GetnotifcationsModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<NotificationsListModel>? _notifications;
  ListBuilder<NotificationsListModel> get notifications =>
      _$this._notifications ??= new ListBuilder<NotificationsListModel>();
  set notifications(ListBuilder<NotificationsListModel>? notifications) =>
      _$this._notifications = notifications;

  GetnotifcationsModelBuilder();

  GetnotifcationsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _notifications = $v.notifications?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetnotifcationsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetnotifcationsModel;
  }

  @override
  void update(void Function(GetnotifcationsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetnotifcationsModel build() => _build();

  _$GetnotifcationsModel _build() {
    _$GetnotifcationsModel _$result;
    try {
      _$result = _$v ??
          new _$GetnotifcationsModel._(
              msg: msg,
              statuscode: statuscode,
              notifications: _notifications?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notifications';
        _notifications?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetnotifcationsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
