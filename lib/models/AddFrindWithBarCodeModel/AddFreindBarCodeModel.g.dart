// GENERATED CODE - DO NOT MODIFY BY HAND

part of AddFreindBarCodeModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddFreindBarCodeModel> _$addFreindBarCodeModelSerializer =
    new _$AddFreindBarCodeModelSerializer();

class _$AddFreindBarCodeModelSerializer
    implements StructuredSerializer<AddFreindBarCodeModel> {
  @override
  final Iterable<Type> types = const [
    AddFreindBarCodeModel,
    _$AddFreindBarCodeModel
  ];
  @override
  final String wireName = 'AddFreindBarCodeModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AddFreindBarCodeModel object,
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
    return result;
  }

  @override
  AddFreindBarCodeModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddFreindBarCodeModelBuilder();

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
      }
    }

    return result.build();
  }
}

class _$AddFreindBarCodeModel extends AddFreindBarCodeModel {
  @override
  final String? msg;
  @override
  final int? statuscode;

  factory _$AddFreindBarCodeModel(
          [void Function(AddFreindBarCodeModelBuilder)? updates]) =>
      (new AddFreindBarCodeModelBuilder()..update(updates))._build();

  _$AddFreindBarCodeModel._({this.msg, this.statuscode}) : super._();

  @override
  AddFreindBarCodeModel rebuild(
          void Function(AddFreindBarCodeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFreindBarCodeModelBuilder toBuilder() =>
      new AddFreindBarCodeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFreindBarCodeModel &&
        msg == other.msg &&
        statuscode == other.statuscode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, msg.hashCode), statuscode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddFreindBarCodeModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode))
        .toString();
  }
}

class AddFreindBarCodeModelBuilder
    implements Builder<AddFreindBarCodeModel, AddFreindBarCodeModelBuilder> {
  _$AddFreindBarCodeModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  AddFreindBarCodeModelBuilder();

  AddFreindBarCodeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddFreindBarCodeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddFreindBarCodeModel;
  }

  @override
  void update(void Function(AddFreindBarCodeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddFreindBarCodeModel build() => _build();

  _$AddFreindBarCodeModel _build() {
    final _$result =
        _$v ?? new _$AddFreindBarCodeModel._(msg: msg, statuscode: statuscode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
