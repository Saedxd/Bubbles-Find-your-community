// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetBubblesModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetBubblesModel> _$getBubblesModelSerializer =
    new _$GetBubblesModelSerializer();

class _$GetBubblesModelSerializer
    implements StructuredSerializer<GetBubblesModel> {
  @override
  final Iterable<Type> types = const [GetBubblesModel, _$GetBubblesModel];
  @override
  final String wireName = 'GetBubblesModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetBubblesModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DataPrimeBubbles)])));
    }
    return result;
  }

  @override
  GetBubblesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetBubblesModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DataPrimeBubbles)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetBubblesModel extends GetBubblesModel {
  @override
  final int? status;
  @override
  final String? error;
  @override
  final BuiltList<DataPrimeBubbles>? data;

  factory _$GetBubblesModel([void Function(GetBubblesModelBuilder)? updates]) =>
      (new GetBubblesModelBuilder()..update(updates))._build();

  _$GetBubblesModel._({this.status, this.error, this.data}) : super._();

  @override
  GetBubblesModel rebuild(void Function(GetBubblesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetBubblesModelBuilder toBuilder() =>
      new GetBubblesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetBubblesModel &&
        status == other.status &&
        error == other.error &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, status.hashCode), error.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetBubblesModel')
          ..add('status', status)
          ..add('error', error)
          ..add('data', data))
        .toString();
  }
}

class GetBubblesModelBuilder
    implements Builder<GetBubblesModel, GetBubblesModelBuilder> {
  _$GetBubblesModel? _$v;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  ListBuilder<DataPrimeBubbles>? _data;
  ListBuilder<DataPrimeBubbles> get data =>
      _$this._data ??= new ListBuilder<DataPrimeBubbles>();
  set data(ListBuilder<DataPrimeBubbles>? data) => _$this._data = data;

  GetBubblesModelBuilder();

  GetBubblesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _error = $v.error;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetBubblesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetBubblesModel;
  }

  @override
  void update(void Function(GetBubblesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetBubblesModel build() => _build();

  _$GetBubblesModel _build() {
    _$GetBubblesModel _$result;
    try {
      _$result = _$v ??
          new _$GetBubblesModel._(
              status: status, error: error, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetBubblesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
