// GENERATED CODE - DO NOT MODIFY BY HAND

part of DeleteOldmessagesModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeleteOldmessagesModel> _$deleteOldmessagesModelSerializer =
    new _$DeleteOldmessagesModelSerializer();

class _$DeleteOldmessagesModelSerializer
    implements StructuredSerializer<DeleteOldmessagesModel> {
  @override
  final Iterable<Type> types = const [
    DeleteOldmessagesModel,
    _$DeleteOldmessagesModel
  ];
  @override
  final String wireName = 'DeleteOldmessagesModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DeleteOldmessagesModel object,
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
  DeleteOldmessagesModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeleteOldmessagesModelBuilder();

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

class _$DeleteOldmessagesModel extends DeleteOldmessagesModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final String? error;

  factory _$DeleteOldmessagesModel(
          [void Function(DeleteOldmessagesModelBuilder)? updates]) =>
      (new DeleteOldmessagesModelBuilder()..update(updates))._build();

  _$DeleteOldmessagesModel._({this.msg, this.statuscode, this.error})
      : super._();

  @override
  DeleteOldmessagesModel rebuild(
          void Function(DeleteOldmessagesModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteOldmessagesModelBuilder toBuilder() =>
      new DeleteOldmessagesModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteOldmessagesModel &&
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
    return (newBuiltValueToStringHelper(r'DeleteOldmessagesModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('error', error))
        .toString();
  }
}

class DeleteOldmessagesModelBuilder
    implements Builder<DeleteOldmessagesModel, DeleteOldmessagesModelBuilder> {
  _$DeleteOldmessagesModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  DeleteOldmessagesModelBuilder();

  DeleteOldmessagesModelBuilder get _$this {
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
  void replace(DeleteOldmessagesModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteOldmessagesModel;
  }

  @override
  void update(void Function(DeleteOldmessagesModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteOldmessagesModel build() => _build();

  _$DeleteOldmessagesModel _build() {
    final _$result = _$v ??
        new _$DeleteOldmessagesModel._(
            msg: msg, statuscode: statuscode, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
