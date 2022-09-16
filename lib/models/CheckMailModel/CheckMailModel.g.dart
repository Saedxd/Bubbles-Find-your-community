// GENERATED CODE - DO NOT MODIFY BY HAND

part of CheckMailModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CheckMailModel> _$checkMailModelSerializer =
    new _$CheckMailModelSerializer();

class _$CheckMailModelSerializer
    implements StructuredSerializer<CheckMailModel> {
  @override
  final Iterable<Type> types = const [CheckMailModel, _$CheckMailModel];
  @override
  final String wireName = 'CheckMailModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CheckMailModel object,
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
  CheckMailModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheckMailModelBuilder();

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
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CheckMailModel extends CheckMailModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final String? error;

  factory _$CheckMailModel([void Function(CheckMailModelBuilder)? updates]) =>
      (new CheckMailModelBuilder()..update(updates))._build();

  _$CheckMailModel._({this.msg, this.statuscode, this.error}) : super._();

  @override
  CheckMailModel rebuild(void Function(CheckMailModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckMailModelBuilder toBuilder() =>
      new CheckMailModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckMailModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckMailModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('error', error))
        .toString();
  }
}

class CheckMailModelBuilder
    implements Builder<CheckMailModel, CheckMailModelBuilder> {
  _$CheckMailModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  CheckMailModelBuilder();

  CheckMailModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckMailModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckMailModel;
  }

  @override
  void update(void Function(CheckMailModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckMailModel build() => _build();

  _$CheckMailModel _build() {
    final _$result = _$v ??
        new _$CheckMailModel._(msg: msg, statuscode: statuscode, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
