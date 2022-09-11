// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetbadgeModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetbadgeModel> _$getbadgeModelSerializer =
    new _$GetbadgeModelSerializer();

class _$GetbadgeModelSerializer implements StructuredSerializer<GetbadgeModel> {
  @override
  final Iterable<Type> types = const [GetbadgeModel, _$GetbadgeModel];
  @override
  final String wireName = 'GetbadgeModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetbadgeModel object,
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
    value = object.count;
    if (value != null) {
      result
        ..add('count')
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
  GetbadgeModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetbadgeModelBuilder();

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
        case 'count':
          result.count = serializers.deserialize(value,
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

class _$GetbadgeModel extends GetbadgeModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final int? count;
  @override
  final String? error;

  factory _$GetbadgeModel([void Function(GetbadgeModelBuilder)? updates]) =>
      (new GetbadgeModelBuilder()..update(updates))._build();

  _$GetbadgeModel._({this.msg, this.statuscode, this.count, this.error})
      : super._();

  @override
  GetbadgeModel rebuild(void Function(GetbadgeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetbadgeModelBuilder toBuilder() => new GetbadgeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetbadgeModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        count == other.count &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), count.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetbadgeModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('count', count)
          ..add('error', error))
        .toString();
  }
}

class GetbadgeModelBuilder
    implements Builder<GetbadgeModel, GetbadgeModelBuilder> {
  _$GetbadgeModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  GetbadgeModelBuilder();

  GetbadgeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _count = $v.count;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetbadgeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetbadgeModel;
  }

  @override
  void update(void Function(GetbadgeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetbadgeModel build() => _build();

  _$GetbadgeModel _build() {
    final _$result = _$v ??
        new _$GetbadgeModel._(
            msg: msg, statuscode: statuscode, count: count, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
