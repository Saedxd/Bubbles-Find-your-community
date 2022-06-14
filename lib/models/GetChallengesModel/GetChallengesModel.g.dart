// GENERATED CODE - DO NOT MODIFY BY HAND

part of AceeptRequestModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetChallengesModel> _$getChallengesModelSerializer =
    new _$GetChallengesModelSerializer();

class _$GetChallengesModelSerializer
    implements StructuredSerializer<GetChallengesModel> {
  @override
  final Iterable<Type> types = const [GetChallengesModel, _$GetChallengesModel];
  @override
  final String wireName = 'GetChallengesModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetChallengesModel object,
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
    value = object.challenges;
    if (value != null) {
      result
        ..add('challenges')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ChallengesListModel)])));
    }
    value = object.challengesStatus;
    if (value != null) {
      result
        ..add('challengesStatus')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.values;
    if (value != null) {
      result
        ..add('values')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    return result;
  }

  @override
  GetChallengesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetChallengesModelBuilder();

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
        case 'challenges':
          result.challenges.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ChallengesListModel)]))!
              as BuiltList<Object?>);
          break;
        case 'challengesStatus':
          result.challengesStatus.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'values':
          result.values.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetChallengesModel extends GetChallengesModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<ChallengesListModel>? challenges;
  @override
  final BuiltList<int>? challengesStatus;
  @override
  final BuiltList<int>? values;

  factory _$GetChallengesModel(
          [void Function(GetChallengesModelBuilder)? updates]) =>
      (new GetChallengesModelBuilder()..update(updates))._build();

  _$GetChallengesModel._(
      {this.msg,
      this.statuscode,
      this.challenges,
      this.challengesStatus,
      this.values})
      : super._();

  @override
  GetChallengesModel rebuild(
          void Function(GetChallengesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetChallengesModelBuilder toBuilder() =>
      new GetChallengesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetChallengesModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        challenges == other.challenges &&
        challengesStatus == other.challengesStatus &&
        values == other.values;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, msg.hashCode), statuscode.hashCode),
                challenges.hashCode),
            challengesStatus.hashCode),
        values.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetChallengesModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('challenges', challenges)
          ..add('challengesStatus', challengesStatus)
          ..add('values', values))
        .toString();
  }
}

class GetChallengesModelBuilder
    implements Builder<GetChallengesModel, GetChallengesModelBuilder> {
  _$GetChallengesModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<ChallengesListModel>? _challenges;
  ListBuilder<ChallengesListModel> get challenges =>
      _$this._challenges ??= new ListBuilder<ChallengesListModel>();
  set challenges(ListBuilder<ChallengesListModel>? challenges) =>
      _$this._challenges = challenges;

  ListBuilder<int>? _challengesStatus;
  ListBuilder<int> get challengesStatus =>
      _$this._challengesStatus ??= new ListBuilder<int>();
  set challengesStatus(ListBuilder<int>? challengesStatus) =>
      _$this._challengesStatus = challengesStatus;

  ListBuilder<int>? _values;
  ListBuilder<int> get values => _$this._values ??= new ListBuilder<int>();
  set values(ListBuilder<int>? values) => _$this._values = values;

  GetChallengesModelBuilder();

  GetChallengesModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _challenges = $v.challenges?.toBuilder();
      _challengesStatus = $v.challengesStatus?.toBuilder();
      _values = $v.values?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetChallengesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetChallengesModel;
  }

  @override
  void update(void Function(GetChallengesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetChallengesModel build() => _build();

  _$GetChallengesModel _build() {
    _$GetChallengesModel _$result;
    try {
      _$result = _$v ??
          new _$GetChallengesModel._(
              msg: msg,
              statuscode: statuscode,
              challenges: _challenges?.build(),
              challengesStatus: _challengesStatus?.build(),
              values: _values?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'challenges';
        _challenges?.build();
        _$failedField = 'challengesStatus';
        _challengesStatus?.build();
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetChallengesModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
