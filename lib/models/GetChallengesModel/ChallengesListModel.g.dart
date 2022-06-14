// GENERATED CODE - DO NOT MODIFY BY HAND

part of ChallengesListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChallengesListModel> _$challengesListModelSerializer =
    new _$ChallengesListModelSerializer();

class _$ChallengesListModelSerializer
    implements StructuredSerializer<ChallengesListModel> {
  @override
  final Iterable<Type> types = const [
    ChallengesListModel,
    _$ChallengesListModel
  ];
  @override
  final String wireName = 'ChallengesListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChallengesListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.point;
    if (value != null) {
      result
        ..add('point')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.max_number;
    if (value != null) {
      result
        ..add('max_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ChallengesListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChallengesListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'point':
          result.point = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'max_number':
          result.max_number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ChallengesListModel extends ChallengesListModel {
  @override
  final String? title;
  @override
  final int? id;
  @override
  final int? point;
  @override
  final int? max_number;

  factory _$ChallengesListModel(
          [void Function(ChallengesListModelBuilder)? updates]) =>
      (new ChallengesListModelBuilder()..update(updates))._build();

  _$ChallengesListModel._({this.title, this.id, this.point, this.max_number})
      : super._();

  @override
  ChallengesListModel rebuild(
          void Function(ChallengesListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChallengesListModelBuilder toBuilder() =>
      new ChallengesListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChallengesListModel &&
        title == other.title &&
        id == other.id &&
        point == other.point &&
        max_number == other.max_number;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), id.hashCode), point.hashCode),
        max_number.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChallengesListModel')
          ..add('title', title)
          ..add('id', id)
          ..add('point', point)
          ..add('max_number', max_number))
        .toString();
  }
}

class ChallengesListModelBuilder
    implements Builder<ChallengesListModel, ChallengesListModelBuilder> {
  _$ChallengesListModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _point;
  int? get point => _$this._point;
  set point(int? point) => _$this._point = point;

  int? _max_number;
  int? get max_number => _$this._max_number;
  set max_number(int? max_number) => _$this._max_number = max_number;

  ChallengesListModelBuilder();

  ChallengesListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _id = $v.id;
      _point = $v.point;
      _max_number = $v.max_number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChallengesListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChallengesListModel;
  }

  @override
  void update(void Function(ChallengesListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChallengesListModel build() => _build();

  _$ChallengesListModel _build() {
    final _$result = _$v ??
        new _$ChallengesListModel._(
            title: title, id: id, point: point, max_number: max_number);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
