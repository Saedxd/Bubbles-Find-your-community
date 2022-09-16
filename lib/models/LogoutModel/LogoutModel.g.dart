// GENERATED CODE - DO NOT MODIFY BY HAND

part of LogoutModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LogoutModel> _$logoutModelSerializer = new _$LogoutModelSerializer();

class _$LogoutModelSerializer implements StructuredSerializer<LogoutModel> {
  @override
  final Iterable<Type> types = const [LogoutModel, _$LogoutModel];
  @override
  final String wireName = 'LogoutModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, LogoutModel object,
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
  LogoutModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LogoutModelBuilder();

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

class _$LogoutModel extends LogoutModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final String? error;

  factory _$LogoutModel([void Function(LogoutModelBuilder)? updates]) =>
      (new LogoutModelBuilder()..update(updates))._build();

  _$LogoutModel._({this.msg, this.statuscode, this.error}) : super._();

  @override
  LogoutModel rebuild(void Function(LogoutModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogoutModelBuilder toBuilder() => new LogoutModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogoutModel &&
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
    return (newBuiltValueToStringHelper(r'LogoutModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('error', error))
        .toString();
  }
}

class LogoutModelBuilder implements Builder<LogoutModel, LogoutModelBuilder> {
  _$LogoutModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  LogoutModelBuilder();

  LogoutModelBuilder get _$this {
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
  void replace(LogoutModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogoutModel;
  }

  @override
  void update(void Function(LogoutModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogoutModel build() => _build();

  _$LogoutModel _build() {
    final _$result = _$v ??
        new _$LogoutModel._(msg: msg, statuscode: statuscode, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
