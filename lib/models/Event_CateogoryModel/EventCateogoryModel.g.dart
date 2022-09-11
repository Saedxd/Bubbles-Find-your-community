// GENERATED CODE - DO NOT MODIFY BY HAND

part of EventCateogoryModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventCateogoryModel> _$eventCateogoryModelSerializer =
    new _$EventCateogoryModelSerializer();

class _$EventCateogoryModelSerializer
    implements StructuredSerializer<EventCateogoryModel> {
  @override
  final Iterable<Type> types = const [
    EventCateogoryModel,
    _$EventCateogoryModel
  ];
  @override
  final String wireName = 'EventCateogoryModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EventCateogoryModel object,
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
    value = object.event_category;
    if (value != null) {
      result
        ..add('event_category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CateogoryList)])));
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
  EventCateogoryModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventCateogoryModelBuilder();

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
        case 'event_category':
          result.event_category.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CateogoryList)]))!
              as BuiltList<Object?>);
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

class _$EventCateogoryModel extends EventCateogoryModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<CateogoryList>? event_category;
  @override
  final String? error;

  factory _$EventCateogoryModel(
          [void Function(EventCateogoryModelBuilder)? updates]) =>
      (new EventCateogoryModelBuilder()..update(updates))._build();

  _$EventCateogoryModel._(
      {this.msg, this.statuscode, this.event_category, this.error})
      : super._();

  @override
  EventCateogoryModel rebuild(
          void Function(EventCateogoryModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventCateogoryModelBuilder toBuilder() =>
      new EventCateogoryModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventCateogoryModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        event_category == other.event_category &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode),
            event_category.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventCateogoryModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('event_category', event_category)
          ..add('error', error))
        .toString();
  }
}

class EventCateogoryModelBuilder
    implements Builder<EventCateogoryModel, EventCateogoryModelBuilder> {
  _$EventCateogoryModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<CateogoryList>? _event_category;
  ListBuilder<CateogoryList> get event_category =>
      _$this._event_category ??= new ListBuilder<CateogoryList>();
  set event_category(ListBuilder<CateogoryList>? event_category) =>
      _$this._event_category = event_category;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  EventCateogoryModelBuilder();

  EventCateogoryModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _event_category = $v.event_category?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventCateogoryModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventCateogoryModel;
  }

  @override
  void update(void Function(EventCateogoryModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventCateogoryModel build() => _build();

  _$EventCateogoryModel _build() {
    _$EventCateogoryModel _$result;
    try {
      _$result = _$v ??
          new _$EventCateogoryModel._(
              msg: msg,
              statuscode: statuscode,
              event_category: _event_category?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'event_category';
        _event_category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventCateogoryModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
