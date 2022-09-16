// GENERATED CODE - DO NOT MODIFY BY HAND

part of NewPollAnswersModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewPollAnswersModel> _$newPollAnswersModelSerializer =
    new _$NewPollAnswersModelSerializer();

class _$NewPollAnswersModelSerializer
    implements StructuredSerializer<NewPollAnswersModel> {
  @override
  final Iterable<Type> types = const [
    NewPollAnswersModel,
    _$NewPollAnswersModel
  ];
  @override
  final String wireName = 'NewPollAnswersModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NewPollAnswersModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.answer;
    if (value != null) {
      result
        ..add('answer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_checked;
    if (value != null) {
      result
        ..add('is_checked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.participants;
    if (value != null) {
      result
        ..add('participants')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PollParticipantsModel)])));
    }
    return result;
  }

  @override
  NewPollAnswersModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewPollAnswersModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_checked':
          result.is_checked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'participants':
          result.participants.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(PollParticipantsModel)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NewPollAnswersModel extends NewPollAnswersModel {
  @override
  final int? id;
  @override
  final int? rate;
  @override
  final String? answer;
  @override
  final bool? is_checked;
  @override
  final BuiltList<PollParticipantsModel>? participants;

  factory _$NewPollAnswersModel(
          [void Function(NewPollAnswersModelBuilder)? updates]) =>
      (new NewPollAnswersModelBuilder()..update(updates))._build();

  _$NewPollAnswersModel._(
      {this.id, this.rate, this.answer, this.is_checked, this.participants})
      : super._();

  @override
  NewPollAnswersModel rebuild(
          void Function(NewPollAnswersModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewPollAnswersModelBuilder toBuilder() =>
      new NewPollAnswersModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewPollAnswersModel &&
        id == other.id &&
        rate == other.rate &&
        answer == other.answer &&
        is_checked == other.is_checked &&
        participants == other.participants;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), rate.hashCode), answer.hashCode),
            is_checked.hashCode),
        participants.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewPollAnswersModel')
          ..add('id', id)
          ..add('rate', rate)
          ..add('answer', answer)
          ..add('is_checked', is_checked)
          ..add('participants', participants))
        .toString();
  }
}

class NewPollAnswersModelBuilder
    implements Builder<NewPollAnswersModel, NewPollAnswersModelBuilder> {
  _$NewPollAnswersModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _rate;
  int? get rate => _$this._rate;
  set rate(int? rate) => _$this._rate = rate;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  bool? _is_checked;
  bool? get is_checked => _$this._is_checked;
  set is_checked(bool? is_checked) => _$this._is_checked = is_checked;

  ListBuilder<PollParticipantsModel>? _participants;
  ListBuilder<PollParticipantsModel> get participants =>
      _$this._participants ??= new ListBuilder<PollParticipantsModel>();
  set participants(ListBuilder<PollParticipantsModel>? participants) =>
      _$this._participants = participants;

  NewPollAnswersModelBuilder();

  NewPollAnswersModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _rate = $v.rate;
      _answer = $v.answer;
      _is_checked = $v.is_checked;
      _participants = $v.participants?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewPollAnswersModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewPollAnswersModel;
  }

  @override
  void update(void Function(NewPollAnswersModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewPollAnswersModel build() => _build();

  _$NewPollAnswersModel _build() {
    _$NewPollAnswersModel _$result;
    try {
      _$result = _$v ??
          new _$NewPollAnswersModel._(
              id: id,
              rate: rate,
              answer: answer,
              is_checked: is_checked,
              participants: _participants?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'participants';
        _participants?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NewPollAnswersModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
