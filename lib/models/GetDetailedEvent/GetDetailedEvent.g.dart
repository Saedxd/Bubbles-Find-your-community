// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetDetailedEvent;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetDetailedEvent> _$getDetailedEventSerializer =
    new _$GetDetailedEventSerializer();

class _$GetDetailedEventSerializer
    implements StructuredSerializer<GetDetailedEvent> {
  @override
  final Iterable<Type> types = const [GetDetailedEvent, _$GetDetailedEvent];
  @override
  final String wireName = 'GetDetailedEvent';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetDetailedEvent object,
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
  GetDetailedEvent deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetDetailedEventBuilder();

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

class _$GetDetailedEvent extends GetDetailedEvent {
  @override
  final int? status;
  @override
  final DataPrimeBubbles? data;
  @override
  final String? error;

  factory _$GetDetailedEvent(
          [void Function(GetDetailedEventBuilder)? updates]) =>
      (new GetDetailedEventBuilder()..update(updates))._build();

  _$GetDetailedEvent._({this.status, this.data, this.error}) : super._();

  @override
  GetDetailedEvent rebuild(void Function(GetDetailedEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetDetailedEventBuilder toBuilder() =>
      new GetDetailedEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetDetailedEvent &&
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
    return (newBuiltValueToStringHelper(r'GetDetailedEvent')
          ..add('status', status)
          ..add('data', data)
          ..add('error', error))
        .toString();
  }
}

class GetDetailedEventBuilder
    implements Builder<GetDetailedEvent, GetDetailedEventBuilder> {
  _$GetDetailedEvent? _$v;

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

  GetDetailedEventBuilder();

  GetDetailedEventBuilder get _$this {
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
  void replace(GetDetailedEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetDetailedEvent;
  }

  @override
  void update(void Function(GetDetailedEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetDetailedEvent build() => _build();

  _$GetDetailedEvent _build() {
    _$GetDetailedEvent _$result;
    try {
      _$result = _$v ??
          new _$GetDetailedEvent._(
              status: status, data: _data?.build(), error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetDetailedEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
