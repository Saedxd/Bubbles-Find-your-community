// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetQuestionsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetQuestionsModel> _$getQuestionsModelSerializer =
    new _$GetQuestionsModelSerializer();

class _$GetQuestionsModelSerializer
    implements StructuredSerializer<GetQuestionsModel> {
  @override
  final Iterable<Type> types = const [GetQuestionsModel, _$GetQuestionsModel];
  @override
  final String wireName = 'GetQuestionsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetQuestionsModel object,
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
    value = object.questions;
    if (value != null) {
      result
        ..add('questions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(QuestionsListModel)])));
    }
    return result;
  }

  @override
  GetQuestionsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetQuestionsModelBuilder();

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
        case 'questions':
          result.questions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(QuestionsListModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetQuestionsModel extends GetQuestionsModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<QuestionsListModel>? questions;

  factory _$GetQuestionsModel(
          [void Function(GetQuestionsModelBuilder)? updates]) =>
      (new GetQuestionsModelBuilder()..update(updates))._build();

  _$GetQuestionsModel._({this.msg, this.statuscode, this.questions})
      : super._();

  @override
  GetQuestionsModel rebuild(void Function(GetQuestionsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetQuestionsModelBuilder toBuilder() =>
      new GetQuestionsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetQuestionsModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        questions == other.questions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, msg.hashCode), statuscode.hashCode), questions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetQuestionsModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('questions', questions))
        .toString();
  }
}

class GetQuestionsModelBuilder
    implements Builder<GetQuestionsModel, GetQuestionsModelBuilder> {
  _$GetQuestionsModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<QuestionsListModel>? _questions;
  ListBuilder<QuestionsListModel> get questions =>
      _$this._questions ??= new ListBuilder<QuestionsListModel>();
  set questions(ListBuilder<QuestionsListModel>? questions) =>
      _$this._questions = questions;

  GetQuestionsModelBuilder();

  GetQuestionsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _questions = $v.questions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetQuestionsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetQuestionsModel;
  }

  @override
  void update(void Function(GetQuestionsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetQuestionsModel build() => _build();

  _$GetQuestionsModel _build() {
    _$GetQuestionsModel _$result;
    try {
      _$result = _$v ??
          new _$GetQuestionsModel._(
              msg: msg, statuscode: statuscode, questions: _questions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'questions';
        _questions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetQuestionsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
