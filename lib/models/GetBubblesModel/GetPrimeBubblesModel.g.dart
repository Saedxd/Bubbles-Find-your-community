// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetPrimeBubblesModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetPrimeBubblesModel> _$getPrimeBubblesModelSerializer =
    new _$GetPrimeBubblesModelSerializer();

class _$GetPrimeBubblesModelSerializer
    implements StructuredSerializer<GetPrimeBubblesModel> {
  @override
  final Iterable<Type> types = const [
    GetPrimeBubblesModel,
    _$GetPrimeBubblesModel
  ];
  @override
  final String wireName = 'GetPrimeBubblesModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetPrimeBubblesModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
            specifiedType: const FullType(
                BuiltList, const [const FullType(DataPrimeBubbles)])));
    }
    return result;
  }

  @override
  GetPrimeBubblesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetPrimeBubblesModelBuilder();

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

class _$GetPrimeBubblesModel extends GetPrimeBubblesModel {
  @override
  final int? status;
  @override
  final BuiltList<DataPrimeBubbles>? data;

  factory _$GetPrimeBubblesModel(
          [void Function(GetPrimeBubblesModelBuilder)? updates]) =>
      (new GetPrimeBubblesModelBuilder()..update(updates))._build();

  _$GetPrimeBubblesModel._({this.status, this.data}) : super._();

  @override
  GetPrimeBubblesModel rebuild(
          void Function(GetPrimeBubblesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetPrimeBubblesModelBuilder toBuilder() =>
      new GetPrimeBubblesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetPrimeBubblesModel &&
        status == other.status &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, status.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetPrimeBubblesModel')
          ..add('status', status)
          ..add('data', data))
        .toString();
  }
}

class GetPrimeBubblesModelBuilder
    implements Builder<GetPrimeBubblesModel, GetPrimeBubblesModelBuilder> {
  _$GetPrimeBubblesModel? _$v;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  ListBuilder<DataPrimeBubbles>? _data;
  ListBuilder<DataPrimeBubbles> get data =>
      _$this._data ??= new ListBuilder<DataPrimeBubbles>();
  set data(ListBuilder<DataPrimeBubbles>? data) => _$this._data = data;

  GetPrimeBubblesModelBuilder();

  GetPrimeBubblesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetPrimeBubblesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetPrimeBubblesModel;
  }

  @override
  void update(void Function(GetPrimeBubblesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetPrimeBubblesModel build() => _build();

  _$GetPrimeBubblesModel _build() {
    _$GetPrimeBubblesModel _$result;
    try {
      _$result = _$v ??
          new _$GetPrimeBubblesModel._(status: status, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetPrimeBubblesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
