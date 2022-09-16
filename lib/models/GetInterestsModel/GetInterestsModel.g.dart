// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetInterestsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetInterestsModel> _$getInterestsModelSerializer =
    new _$GetInterestsModelSerializer();

class _$GetInterestsModelSerializer
    implements StructuredSerializer<GetInterestsModel> {
  @override
  final Iterable<Type> types = const [GetInterestsModel, _$GetInterestsModel];
  @override
  final String wireName = 'GetInterestsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetInterestsModel object,
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
    value = object.StatusCode;
    if (value != null) {
      result
        ..add('StatusCode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.interests;
    if (value != null) {
      result
        ..add('interests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(InterestsListModel)])));
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
  GetInterestsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetInterestsModelBuilder();

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
        case 'StatusCode':
          result.StatusCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'interests':
          result.interests.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(InterestsListModel)]))!
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

class _$GetInterestsModel extends GetInterestsModel {
  @override
  final String? msg;
  @override
  final int? StatusCode;
  @override
  final BuiltList<InterestsListModel>? interests;
  @override
  final String? error;

  factory _$GetInterestsModel(
          [void Function(GetInterestsModelBuilder)? updates]) =>
      (new GetInterestsModelBuilder()..update(updates))._build();

  _$GetInterestsModel._({this.msg, this.StatusCode, this.interests, this.error})
      : super._();

  @override
  GetInterestsModel rebuild(void Function(GetInterestsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetInterestsModelBuilder toBuilder() =>
      new GetInterestsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetInterestsModel &&
        msg == other.msg &&
        StatusCode == other.StatusCode &&
        interests == other.interests &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), StatusCode.hashCode), interests.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetInterestsModel')
          ..add('msg', msg)
          ..add('StatusCode', StatusCode)
          ..add('interests', interests)
          ..add('error', error))
        .toString();
  }
}

class GetInterestsModelBuilder
    implements Builder<GetInterestsModel, GetInterestsModelBuilder> {
  _$GetInterestsModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _StatusCode;
  int? get StatusCode => _$this._StatusCode;
  set StatusCode(int? StatusCode) => _$this._StatusCode = StatusCode;

  ListBuilder<InterestsListModel>? _interests;
  ListBuilder<InterestsListModel> get interests =>
      _$this._interests ??= new ListBuilder<InterestsListModel>();
  set interests(ListBuilder<InterestsListModel>? interests) =>
      _$this._interests = interests;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  GetInterestsModelBuilder();

  GetInterestsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _StatusCode = $v.StatusCode;
      _interests = $v.interests?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetInterestsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetInterestsModel;
  }

  @override
  void update(void Function(GetInterestsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetInterestsModel build() => _build();

  _$GetInterestsModel _build() {
    _$GetInterestsModel _$result;
    try {
      _$result = _$v ??
          new _$GetInterestsModel._(
              msg: msg,
              StatusCode: StatusCode,
              interests: _interests?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'interests';
        _interests?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetInterestsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
