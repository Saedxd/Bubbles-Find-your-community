// GENERATED CODE - DO NOT MODIFY BY HAND

part of CreateBubbleModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateBubbleModel> _$createBubbleModelSerializer =
    new _$CreateBubbleModelSerializer();

class _$CreateBubbleModelSerializer
    implements StructuredSerializer<CreateBubbleModel> {
  @override
  final Iterable<Type> types = const [CreateBubbleModel, _$CreateBubbleModel];
  @override
  final String wireName = 'CreateBubbleModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CreateBubbleModel object,
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
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DataPrimeBubbles)));
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
  CreateBubbleModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreateBubbleModelBuilder();

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
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DataPrimeBubbles))!
              as DataPrimeBubbles);
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

class _$CreateBubbleModel extends CreateBubbleModel {
  @override
  final String? message;
  @override
  final int? status;
  @override
  final DataPrimeBubbles? data;
  @override
  final String? error;

  factory _$CreateBubbleModel(
          [void Function(CreateBubbleModelBuilder)? updates]) =>
      (new CreateBubbleModelBuilder()..update(updates))._build();

  _$CreateBubbleModel._({this.message, this.status, this.data, this.error})
      : super._();

  @override
  CreateBubbleModel rebuild(void Function(CreateBubbleModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateBubbleModelBuilder toBuilder() =>
      new CreateBubbleModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateBubbleModel &&
        message == other.message &&
        status == other.status &&
        data == other.data &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, message.hashCode), status.hashCode), data.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateBubbleModel')
          ..add('message', message)
          ..add('status', status)
          ..add('data', data)
          ..add('error', error))
        .toString();
  }
}

class CreateBubbleModelBuilder
    implements Builder<CreateBubbleModel, CreateBubbleModelBuilder> {
  _$CreateBubbleModel? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  DataPrimeBubblesBuilder? _data;
  DataPrimeBubblesBuilder get data =>
      _$this._data ??= new DataPrimeBubblesBuilder();
  set data(DataPrimeBubblesBuilder? data) => _$this._data = data;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  CreateBubbleModelBuilder();

  CreateBubbleModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _status = $v.status;
      _data = $v.data?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateBubbleModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateBubbleModel;
  }

  @override
  void update(void Function(CreateBubbleModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateBubbleModel build() => _build();

  _$CreateBubbleModel _build() {
    _$CreateBubbleModel _$result;
    try {
      _$result = _$v ??
          new _$CreateBubbleModel._(
              message: message,
              status: status,
              data: _data?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateBubbleModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
