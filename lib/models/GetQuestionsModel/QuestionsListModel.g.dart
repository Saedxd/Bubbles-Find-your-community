// GENERATED CODE - DO NOT MODIFY BY HAND

part of QuestionsListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestionsListModel> _$questionsListModelSerializer =
    new _$QuestionsListModelSerializer();

class _$QuestionsListModelSerializer
    implements StructuredSerializer<QuestionsListModel> {
  @override
  final Iterable<Type> types = const [QuestionsListModel, _$QuestionsListModel];
  @override
  final String wireName = 'QuestionsListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, QuestionsListModel object,
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
    value = object.answers;
    if (value != null) {
      result
        ..add('answers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AnswersListModel)])));
    }
    return result;
  }

  @override
  QuestionsListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionsListModelBuilder();

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
        case 'answers':
          result.answers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AnswersListModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$QuestionsListModel extends QuestionsListModel {
  @override
  final String? title;
  @override
  final String? created_at;
  @override
  final String? updated_at;
  @override
  final int? id;
  @override
  final BuiltList<AnswersListModel>? answers;

  factory _$QuestionsListModel(
          [void Function(QuestionsListModelBuilder)? updates]) =>
      (new QuestionsListModelBuilder()..update(updates))._build();

  _$QuestionsListModel._(
      {this.title, this.created_at, this.updated_at, this.id, this.answers})
      : super._();

  @override
  QuestionsListModel rebuild(
          void Function(QuestionsListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionsListModelBuilder toBuilder() =>
      new QuestionsListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionsListModel &&
        title == other.title &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        id == other.id &&
        answers == other.answers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, title.hashCode), created_at.hashCode),
                updated_at.hashCode),
            id.hashCode),
        answers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuestionsListModel')
          ..add('title', title)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('id', id)
          ..add('answers', answers))
        .toString();
  }
}

class QuestionsListModelBuilder
    implements Builder<QuestionsListModel, QuestionsListModelBuilder> {
  _$QuestionsListModel? _$v;

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

  ListBuilder<AnswersListModel>? _answers;
  ListBuilder<AnswersListModel> get answers =>
      _$this._answers ??= new ListBuilder<AnswersListModel>();
  set answers(ListBuilder<AnswersListModel>? answers) =>
      _$this._answers = answers;

  QuestionsListModelBuilder();

  QuestionsListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _id = $v.id;
      _answers = $v.answers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionsListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestionsListModel;
  }

  @override
  void update(void Function(QuestionsListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuestionsListModel build() => _build();

  _$QuestionsListModel _build() {
    _$QuestionsListModel _$result;
    try {
      _$result = _$v ??
          new _$QuestionsListModel._(
              title: title,
              created_at: created_at,
              updated_at: updated_at,
              id: id,
              answers: _answers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'answers';
        _answers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'QuestionsListModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
