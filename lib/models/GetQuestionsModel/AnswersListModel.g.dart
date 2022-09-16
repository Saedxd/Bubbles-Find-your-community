// GENERATED CODE - DO NOT MODIFY BY HAND

part of AnswersListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnswersListModel> _$answersListModelSerializer =
    new _$AnswersListModelSerializer();

class _$AnswersListModelSerializer
    implements StructuredSerializer<AnswersListModel> {
  @override
  final Iterable<Type> types = const [AnswersListModel, _$AnswersListModel];
  @override
  final String wireName = 'AnswersListModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AnswersListModel object,
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
    value = object.question_id;
    if (value != null) {
      result
        ..add('question_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AnswersListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnswersListModelBuilder();

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
        case 'question_id':
          result.question_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$AnswersListModel extends AnswersListModel {
  @override
  final String? title;
  @override
  final String? created_at;
  @override
  final String? updated_at;
  @override
  final int? id;
  @override
  final int? question_id;

  factory _$AnswersListModel(
          [void Function(AnswersListModelBuilder)? updates]) =>
      (new AnswersListModelBuilder()..update(updates))._build();

  _$AnswersListModel._(
      {this.title, this.created_at, this.updated_at, this.id, this.question_id})
      : super._();

  @override
  AnswersListModel rebuild(void Function(AnswersListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnswersListModelBuilder toBuilder() =>
      new AnswersListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnswersListModel &&
        title == other.title &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        id == other.id &&
        question_id == other.question_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, title.hashCode), created_at.hashCode),
                updated_at.hashCode),
            id.hashCode),
        question_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnswersListModel')
          ..add('title', title)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('id', id)
          ..add('question_id', question_id))
        .toString();
  }
}

class AnswersListModelBuilder
    implements Builder<AnswersListModel, AnswersListModelBuilder> {
  _$AnswersListModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _updated_at;
  String? get updated_at => _$this._updated_at;
  set updated_at(String? updated_at) => _$this._updated_at = updated_at;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _question_id;
  int? get question_id => _$this._question_id;
  set question_id(int? question_id) => _$this._question_id = question_id;

  AnswersListModelBuilder();

  AnswersListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _id = $v.id;
      _question_id = $v.question_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnswersListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnswersListModel;
  }

  @override
  void update(void Function(AnswersListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnswersListModel build() => _build();

  _$AnswersListModel _build() {
    final _$result = _$v ??
        new _$AnswersListModel._(
            title: title,
            created_at: created_at,
            updated_at: updated_at,
            id: id,
            question_id: question_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
