// GENERATED CODE - DO NOT MODIFY BY HAND

part of DatesEventListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DatesEventListModel> _$datesEventListModelSerializer =
    new _$DatesEventListModelSerializer();

class _$DatesEventListModelSerializer
    implements StructuredSerializer<DatesEventListModel> {
  @override
  final Iterable<Type> types = const [
    DatesEventListModel,
    _$DatesEventListModel
  ];
  @override
  final String wireName = 'DatesEventListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DatesEventListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updated_at;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.event_info_id;
    if (value != null) {
      result
        ..add('event_info_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  DatesEventListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DatesEventListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'event_info_id':
          result.event_info_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$DatesEventListModel extends DatesEventListModel {
  @override
  final String? date;
  @override
  final String? created_at;
  @override
  final String? updated_at;
  @override
  final int? id;
  @override
  final int? event_info_id;

  factory _$DatesEventListModel(
          [void Function(DatesEventListModelBuilder)? updates]) =>
      (new DatesEventListModelBuilder()..update(updates))._build();

  _$DatesEventListModel._(
      {this.date,
      this.created_at,
      this.updated_at,
      this.id,
      this.event_info_id})
      : super._();

  @override
  DatesEventListModel rebuild(
          void Function(DatesEventListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DatesEventListModelBuilder toBuilder() =>
      new DatesEventListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DatesEventListModel &&
        date == other.date &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        id == other.id &&
        event_info_id == other.event_info_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, date.hashCode), created_at.hashCode),
                updated_at.hashCode),
            id.hashCode),
        event_info_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DatesEventListModel')
          ..add('date', date)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('id', id)
          ..add('event_info_id', event_info_id))
        .toString();
  }
}

class DatesEventListModelBuilder
    implements Builder<DatesEventListModel, DatesEventListModelBuilder> {
  _$DatesEventListModel? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _updated_at;
  String? get updated_at => _$this._updated_at;
  set updated_at(String? updated_at) => _$this._updated_at = updated_at;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _event_info_id;
  int? get event_info_id => _$this._event_info_id;
  set event_info_id(int? event_info_id) =>
      _$this._event_info_id = event_info_id;

  DatesEventListModelBuilder();

  DatesEventListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _id = $v.id;
      _event_info_id = $v.event_info_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DatesEventListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DatesEventListModel;
  }

  @override
  void update(void Function(DatesEventListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DatesEventListModel build() => _build();

  _$DatesEventListModel _build() {
    final _$result = _$v ??
        new _$DatesEventListModel._(
            date: date,
            created_at: created_at,
            updated_at: updated_at,
            id: id,
            event_info_id: event_info_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
