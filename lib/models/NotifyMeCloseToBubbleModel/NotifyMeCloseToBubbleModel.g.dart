// GENERATED CODE - DO NOT MODIFY BY HAND

part of NotifyMeCloseToBubbleModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotifyMeCloseToBubbleModel> _$notifyMeCloseToBubbleModelSerializer =
    new _$NotifyMeCloseToBubbleModelSerializer();

class _$NotifyMeCloseToBubbleModelSerializer
    implements StructuredSerializer<NotifyMeCloseToBubbleModel> {
  @override
  final Iterable<Type> types = const [
    NotifyMeCloseToBubbleModel,
    _$NotifyMeCloseToBubbleModel
  ];
  @override
  final String wireName = 'NotifyMeCloseToBubbleModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotifyMeCloseToBubbleModel object,
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
  NotifyMeCloseToBubbleModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotifyMeCloseToBubbleModelBuilder();

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
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotifyMeCloseToBubbleModel extends NotifyMeCloseToBubbleModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final String? error;

  factory _$NotifyMeCloseToBubbleModel(
          [void Function(NotifyMeCloseToBubbleModelBuilder)? updates]) =>
      (new NotifyMeCloseToBubbleModelBuilder()..update(updates))._build();

  _$NotifyMeCloseToBubbleModel._({this.msg, this.statuscode, this.error})
      : super._();

  @override
  NotifyMeCloseToBubbleModel rebuild(
          void Function(NotifyMeCloseToBubbleModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotifyMeCloseToBubbleModelBuilder toBuilder() =>
      new NotifyMeCloseToBubbleModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotifyMeCloseToBubbleModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotifyMeCloseToBubbleModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('error', error))
        .toString();
  }
}

class NotifyMeCloseToBubbleModelBuilder
    implements
        Builder<NotifyMeCloseToBubbleModel, NotifyMeCloseToBubbleModelBuilder> {
  _$NotifyMeCloseToBubbleModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  NotifyMeCloseToBubbleModelBuilder();

  NotifyMeCloseToBubbleModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotifyMeCloseToBubbleModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotifyMeCloseToBubbleModel;
  }

  @override
  void update(void Function(NotifyMeCloseToBubbleModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotifyMeCloseToBubbleModel build() => _build();

  _$NotifyMeCloseToBubbleModel _build() {
    final _$result = _$v ??
        new _$NotifyMeCloseToBubbleModel._(
            msg: msg, statuscode: statuscode, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
