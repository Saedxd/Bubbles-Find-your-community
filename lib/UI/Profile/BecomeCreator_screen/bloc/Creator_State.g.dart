// GENERATED CODE - DO NOT MODIFY BY HAND

part of Creator_State;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreatorState extends CreatorState {
  @override
  final String? error;
  @override
  final bool? isLoading;
  @override
  final bool? success;
  @override
  final GetQuestionsModel? Questions;
  @override
  final SubmitCreatorAnwersModel? CreatorAnwers;

  factory _$CreatorState([void Function(CreatorStateBuilder)? updates]) =>
      (new CreatorStateBuilder()..update(updates))._build();

  _$CreatorState._(
      {this.error,
      this.isLoading,
      this.success,
      this.Questions,
      this.CreatorAnwers})
      : super._();

  @override
  CreatorState rebuild(void Function(CreatorStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatorStateBuilder toBuilder() => new CreatorStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatorState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        Questions == other.Questions &&
        CreatorAnwers == other.CreatorAnwers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                success.hashCode),
            Questions.hashCode),
        CreatorAnwers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreatorState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('Questions', Questions)
          ..add('CreatorAnwers', CreatorAnwers))
        .toString();
  }
}

class CreatorStateBuilder
    implements Builder<CreatorState, CreatorStateBuilder> {
  _$CreatorState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  GetQuestionsModelBuilder? _Questions;
  GetQuestionsModelBuilder get Questions =>
      _$this._Questions ??= new GetQuestionsModelBuilder();
  set Questions(GetQuestionsModelBuilder? Questions) =>
      _$this._Questions = Questions;

  SubmitCreatorAnwersModelBuilder? _CreatorAnwers;
  SubmitCreatorAnwersModelBuilder get CreatorAnwers =>
      _$this._CreatorAnwers ??= new SubmitCreatorAnwersModelBuilder();
  set CreatorAnwers(SubmitCreatorAnwersModelBuilder? CreatorAnwers) =>
      _$this._CreatorAnwers = CreatorAnwers;

  CreatorStateBuilder();

  CreatorStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _Questions = $v.Questions?.toBuilder();
      _CreatorAnwers = $v.CreatorAnwers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatorState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatorState;
  }

  @override
  void update(void Function(CreatorStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatorState build() => _build();

  _$CreatorState _build() {
    _$CreatorState _$result;
    try {
      _$result = _$v ??
          new _$CreatorState._(
              error: error,
              isLoading: isLoading,
              success: success,
              Questions: _Questions?.build(),
              CreatorAnwers: _CreatorAnwers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'Questions';
        _Questions?.build();
        _$failedField = 'CreatorAnwers';
        _CreatorAnwers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreatorState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
