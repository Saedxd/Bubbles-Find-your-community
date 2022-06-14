// GENERATED CODE - DO NOT MODIFY BY HAND

part of Creator_Event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
    replace(_$result);
    return _$result;
  }
}

class _$GetQuestions extends GetQuestions {
  factory _$GetQuestions([void Function(GetQuestionsBuilder)? updates]) =>
      (new GetQuestionsBuilder()..update(updates))._build();

  _$GetQuestions._() : super._();

  @override
  GetQuestions rebuild(void Function(GetQuestionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetQuestionsBuilder toBuilder() => new GetQuestionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetQuestions;
  }

  @override
  int get hashCode {
    return 218881071;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetQuestions').toString();
  }
}

class GetQuestionsBuilder
    implements Builder<GetQuestions, GetQuestionsBuilder> {
  _$GetQuestions? _$v;

  GetQuestionsBuilder();

  @override
  void replace(GetQuestions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetQuestions;
  }

  @override
  void update(void Function(GetQuestionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetQuestions build() => _build();

  _$GetQuestions _build() {
    final _$result = _$v ?? new _$GetQuestions._();
    replace(_$result);
    return _$result;
  }
}

class _$SubmitAnswers extends SubmitAnswers {
  @override
  final List<int>? AnswerID;
  @override
  final List<int>? QuestionId;

  factory _$SubmitAnswers([void Function(SubmitAnswersBuilder)? updates]) =>
      (new SubmitAnswersBuilder()..update(updates))._build();

  _$SubmitAnswers._({this.AnswerID, this.QuestionId}) : super._();

  @override
  SubmitAnswers rebuild(void Function(SubmitAnswersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubmitAnswersBuilder toBuilder() => new SubmitAnswersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubmitAnswers &&
        AnswerID == other.AnswerID &&
        QuestionId == other.QuestionId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, AnswerID.hashCode), QuestionId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubmitAnswers')
          ..add('AnswerID', AnswerID)
          ..add('QuestionId', QuestionId))
        .toString();
  }
}

class SubmitAnswersBuilder
    implements Builder<SubmitAnswers, SubmitAnswersBuilder> {
  _$SubmitAnswers? _$v;

  List<int>? _AnswerID;
  List<int>? get AnswerID => _$this._AnswerID;
  set AnswerID(List<int>? AnswerID) => _$this._AnswerID = AnswerID;

  List<int>? _QuestionId;
  List<int>? get QuestionId => _$this._QuestionId;
  set QuestionId(List<int>? QuestionId) => _$this._QuestionId = QuestionId;

  SubmitAnswersBuilder();

  SubmitAnswersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _AnswerID = $v.AnswerID;
      _QuestionId = $v.QuestionId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubmitAnswers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubmitAnswers;
  }

  @override
  void update(void Function(SubmitAnswersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubmitAnswers build() => _build();

  _$SubmitAnswers _build() {
    final _$result = _$v ??
        new _$SubmitAnswers._(AnswerID: AnswerID, QuestionId: QuestionId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
