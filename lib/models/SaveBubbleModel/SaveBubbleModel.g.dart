// GENERATED CODE - DO NOT MODIFY BY HAND

part of SaveBubbleModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SaveBubbleModel> _$saveBubbleModelSerializer =
    new _$SaveBubbleModelSerializer();

class _$SaveBubbleModelSerializer
    implements StructuredSerializer<SaveBubbleModel> {
  @override
  final Iterable<Type> types = const [SaveBubbleModel, _$SaveBubbleModel];
  @override
  final String wireName = 'SaveBubbleModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SaveBubbleModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
  SaveBubbleModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SaveBubbleModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$SaveBubbleModel extends SaveBubbleModel {
  @override
  final String? message;
  @override
  final int? status;
  @override
  final String? error;

  factory _$SaveBubbleModel([void Function(SaveBubbleModelBuilder)? updates]) =>
      (new SaveBubbleModelBuilder()..update(updates))._build();

  _$SaveBubbleModel._({this.message, this.status, this.error}) : super._();

  @override
  SaveBubbleModel rebuild(void Function(SaveBubbleModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveBubbleModelBuilder toBuilder() =>
      new SaveBubbleModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveBubbleModel &&
        message == other.message &&
        status == other.status &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, message.hashCode), status.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SaveBubbleModel')
          ..add('message', message)
          ..add('status', status)
          ..add('error', error))
        .toString();
  }
}

class SaveBubbleModelBuilder
    implements Builder<SaveBubbleModel, SaveBubbleModelBuilder> {
  _$SaveBubbleModel? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  SaveBubbleModelBuilder();

  SaveBubbleModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _status = $v.status;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SaveBubbleModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SaveBubbleModel;
  }

  @override
  void update(void Function(SaveBubbleModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SaveBubbleModel build() => _build();

  _$SaveBubbleModel _build() {
    final _$result = _$v ??
        new _$SaveBubbleModel._(message: message, status: status, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
