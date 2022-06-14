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

  factory _$CreateBubbleModel(
          [void Function(CreateBubbleModelBuilder)? updates]) =>
      (new CreateBubbleModelBuilder()..update(updates))._build();

  _$CreateBubbleModel._({this.message, this.status}) : super._();

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
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreateBubbleModel')
          ..add('message', message)
          ..add('status', status))
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

  CreateBubbleModelBuilder();

  CreateBubbleModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _status = $v.status;
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
    final _$result =
        _$v ?? new _$CreateBubbleModel._(message: message, status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
