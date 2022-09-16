// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetWhoSavedBubblesModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetWhoSavedBubblesModel> _$getWhoSavedBubblesModelSerializer =
    new _$GetWhoSavedBubblesModelSerializer();

class _$GetWhoSavedBubblesModelSerializer
    implements StructuredSerializer<GetWhoSavedBubblesModel> {
  @override
  final Iterable<Type> types = const [
    GetWhoSavedBubblesModel,
    _$GetWhoSavedBubblesModel
  ];
  @override
  final String wireName = 'GetWhoSavedBubblesModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetWhoSavedBubblesModel object,
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
            specifiedType: const FullType(BuiltList,
                const [const FullType(UsersInsideBubbleListModel)])));
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
  GetWhoSavedBubblesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetWhoSavedBubblesModelBuilder();

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
              specifiedType: const FullType(BuiltList, const [
                const FullType(UsersInsideBubbleListModel)
              ]))! as BuiltList<Object?>);
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

class _$GetWhoSavedBubblesModel extends GetWhoSavedBubblesModel {
  @override
  final int? status;
  @override
  final BuiltList<UsersInsideBubbleListModel>? data;
  @override
  final String? error;

  factory _$GetWhoSavedBubblesModel(
          [void Function(GetWhoSavedBubblesModelBuilder)? updates]) =>
      (new GetWhoSavedBubblesModelBuilder()..update(updates))._build();

  _$GetWhoSavedBubblesModel._({this.status, this.data, this.error}) : super._();

  @override
  GetWhoSavedBubblesModel rebuild(
          void Function(GetWhoSavedBubblesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetWhoSavedBubblesModelBuilder toBuilder() =>
      new GetWhoSavedBubblesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetWhoSavedBubblesModel &&
        status == other.status &&
        data == other.data &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, status.hashCode), data.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetWhoSavedBubblesModel')
          ..add('status', status)
          ..add('data', data)
          ..add('error', error))
        .toString();
  }
}

class GetWhoSavedBubblesModelBuilder
    implements
        Builder<GetWhoSavedBubblesModel, GetWhoSavedBubblesModelBuilder> {
  _$GetWhoSavedBubblesModel? _$v;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  ListBuilder<UsersInsideBubbleListModel>? _data;
  ListBuilder<UsersInsideBubbleListModel> get data =>
      _$this._data ??= new ListBuilder<UsersInsideBubbleListModel>();
  set data(ListBuilder<UsersInsideBubbleListModel>? data) =>
      _$this._data = data;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  GetWhoSavedBubblesModelBuilder();

  GetWhoSavedBubblesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _data = $v.data?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetWhoSavedBubblesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetWhoSavedBubblesModel;
  }

  @override
  void update(void Function(GetWhoSavedBubblesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetWhoSavedBubblesModel build() => _build();

  _$GetWhoSavedBubblesModel _build() {
    _$GetWhoSavedBubblesModel _$result;
    try {
      _$result = _$v ??
          new _$GetWhoSavedBubblesModel._(
              status: status, data: _data?.build(), error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetWhoSavedBubblesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
