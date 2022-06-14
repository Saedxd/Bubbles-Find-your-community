// GENERATED CODE - DO NOT MODIFY BY HAND

part of NotificationsListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationsListModel> _$notificationsListModelSerializer =
    new _$NotificationsListModelSerializer();

class _$NotificationsListModelSerializer
    implements StructuredSerializer<NotificationsListModel> {
  @override
  final Iterable<Type> types = const [
    NotificationsListModel,
    _$NotificationsListModel
  ];
  @override
  final String wireName = 'NotificationsListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationsListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.body;
    if (value != null) {
      result
        ..add('body')
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
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.background_color;
    if (value != null) {
      result
        ..add('background_color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user_id;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  NotificationsListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationsListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'background_color':
          result.background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsListModel extends NotificationsListModel {
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? type;
  @override
  final String? created_at;
  @override
  final String? background_color;
  @override
  final String? avatar;
  @override
  final int? user_id;

  factory _$NotificationsListModel(
          [void Function(NotificationsListModelBuilder)? updates]) =>
      (new NotificationsListModelBuilder()..update(updates))._build();

  _$NotificationsListModel._(
      {this.title,
      this.body,
      this.type,
      this.created_at,
      this.background_color,
      this.avatar,
      this.user_id})
      : super._();

  @override
  NotificationsListModel rebuild(
          void Function(NotificationsListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsListModelBuilder toBuilder() =>
      new NotificationsListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsListModel &&
        title == other.title &&
        body == other.body &&
        type == other.type &&
        created_at == other.created_at &&
        background_color == other.background_color &&
        avatar == other.avatar &&
        user_id == other.user_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, title.hashCode), body.hashCode),
                        type.hashCode),
                    created_at.hashCode),
                background_color.hashCode),
            avatar.hashCode),
        user_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotificationsListModel')
          ..add('title', title)
          ..add('body', body)
          ..add('type', type)
          ..add('created_at', created_at)
          ..add('background_color', background_color)
          ..add('avatar', avatar)
          ..add('user_id', user_id))
        .toString();
  }
}

class NotificationsListModelBuilder
    implements Builder<NotificationsListModel, NotificationsListModelBuilder> {
  _$NotificationsListModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  int? _user_id;
  int? get user_id => _$this._user_id;
  set user_id(int? user_id) => _$this._user_id = user_id;

  NotificationsListModelBuilder();

  NotificationsListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _body = $v.body;
      _type = $v.type;
      _created_at = $v.created_at;
      _background_color = $v.background_color;
      _avatar = $v.avatar;
      _user_id = $v.user_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationsListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsListModel;
  }

  @override
  void update(void Function(NotificationsListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsListModel build() => _build();

  _$NotificationsListModel _build() {
    final _$result = _$v ??
        new _$NotificationsListModel._(
            title: title,
            body: body,
            type: type,
            created_at: created_at,
            background_color: background_color,
            avatar: avatar,
            user_id: user_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
