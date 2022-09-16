// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetSubGenderss;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetSubGender> _$getSubGenderSerializer =
    new _$GetSubGenderSerializer();

class _$GetSubGenderSerializer implements StructuredSerializer<GetSubGender> {
  @override
  final Iterable<Type> types = const [GetSubGender, _$GetSubGender];
  @override
  final String wireName = 'GetSubGender';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetSubGender object,
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
    value = object.genders;
    if (value != null) {
      result
        ..add('genders')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SubgendersListModel)])));
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
  GetSubGender deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetSubGenderBuilder();

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
        case 'genders':
          result.genders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SubgendersListModel)]))!
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

class _$GetSubGender extends GetSubGender {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<SubgendersListModel>? genders;
  @override
  final String? error;

  factory _$GetSubGender([void Function(GetSubGenderBuilder)? updates]) =>
      (new GetSubGenderBuilder()..update(updates))._build();

  _$GetSubGender._({this.msg, this.statuscode, this.genders, this.error})
      : super._();

  @override
  GetSubGender rebuild(void Function(GetSubGenderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSubGenderBuilder toBuilder() => new GetSubGenderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSubGender &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        genders == other.genders &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), genders.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetSubGender')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('genders', genders)
          ..add('error', error))
        .toString();
  }
}

class GetSubGenderBuilder
    implements Builder<GetSubGender, GetSubGenderBuilder> {
  _$GetSubGender? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<SubgendersListModel>? _genders;
  ListBuilder<SubgendersListModel> get genders =>
      _$this._genders ??= new ListBuilder<SubgendersListModel>();
  set genders(ListBuilder<SubgendersListModel>? genders) =>
      _$this._genders = genders;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  GetSubGenderBuilder();

  GetSubGenderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _genders = $v.genders?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetSubGender other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetSubGender;
  }

  @override
  void update(void Function(GetSubGenderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetSubGender build() => _build();

  _$GetSubGender _build() {
    _$GetSubGender _$result;
    try {
      _$result = _$v ??
          new _$GetSubGender._(
              msg: msg,
              statuscode: statuscode,
              genders: _genders?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genders';
        _genders?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetSubGender', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
