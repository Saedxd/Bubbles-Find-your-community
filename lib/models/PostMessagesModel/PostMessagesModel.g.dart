// GENERATED CODE - DO NOT MODIFY BY HAND

part of PostMessagesModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostMessagesModel> _$postMessagesModelSerializer =
    new _$PostMessagesModelSerializer();

class _$PostMessagesModelSerializer
    implements StructuredSerializer<PostMessagesModel> {
  @override
  final Iterable<Type> types = const [PostMessagesModel, _$PostMessagesModel];
  @override
  final String wireName = 'PostMessagesModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostMessagesModel object,
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
    value = object.message_id;
    if (value != null) {
      result
        ..add('message_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.statuscode;
    if (value != null) {
      result
        ..add('statuscode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PostMessagesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostMessagesModelBuilder();

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
        case 'message_id':
          result.message_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostMessagesModel extends PostMessagesModel {
  @override
  final String? msg;
  @override
  final int? message_id;
  @override
  final int? statuscode;
  @override
  final String? error;

  factory _$PostMessagesModel(
          [void Function(PostMessagesModelBuilder)? updates]) =>
      (new PostMessagesModelBuilder()..update(updates))._build();

  _$PostMessagesModel._(
      {this.msg, this.message_id, this.statuscode, this.error})
      : super._();

  @override
  PostMessagesModel rebuild(void Function(PostMessagesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostMessagesModelBuilder toBuilder() =>
      new PostMessagesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostMessagesModel &&
        msg == other.msg &&
        message_id == other.message_id &&
        statuscode == other.statuscode &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), message_id.hashCode),
            statuscode.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostMessagesModel')
          ..add('msg', msg)
          ..add('message_id', message_id)
          ..add('statuscode', statuscode)
          ..add('error', error))
        .toString();
  }
}

class PostMessagesModelBuilder
    implements Builder<PostMessagesModel, PostMessagesModelBuilder> {
  _$PostMessagesModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _message_id;
  int? get message_id => _$this._message_id;
  set message_id(int? message_id) => _$this._message_id = message_id;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  PostMessagesModelBuilder();

  PostMessagesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _message_id = $v.message_id;
      _statuscode = $v.statuscode;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostMessagesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostMessagesModel;
  }

  @override
  void update(void Function(PostMessagesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostMessagesModel build() => _build();

  _$PostMessagesModel _build() {
    final _$result = _$v ??
        new _$PostMessagesModel._(
            msg: msg,
            message_id: message_id,
            statuscode: statuscode,
            error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
