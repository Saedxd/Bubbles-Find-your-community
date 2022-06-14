// GENERATED CODE - DO NOT MODIFY BY HAND

part of AddNewFriendModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddNewFriendModel> _$addNewFriendModelSerializer =
    new _$AddNewFriendModelSerializer();

class _$AddNewFriendModelSerializer
    implements StructuredSerializer<AddNewFriendModel> {
  @override
  final Iterable<Type> types = const [AddNewFriendModel, _$AddNewFriendModel];
  @override
  final String wireName = 'AddNewFriendModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddNewFriendModel object,
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
  AddNewFriendModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddNewFriendModelBuilder();

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

class _$AddNewFriendModel extends AddNewFriendModel {
  @override
  final String? msg;
  @override
  final int? statuscode;

  factory _$AddNewFriendModel(
          [void Function(AddNewFriendModelBuilder)? updates]) =>
      (new AddNewFriendModelBuilder()..update(updates))._build();

  _$AddNewFriendModel._({this.msg, this.statuscode}) : super._();

  @override
  AddNewFriendModel rebuild(void Function(AddNewFriendModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddNewFriendModelBuilder toBuilder() =>
      new AddNewFriendModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddNewFriendModel &&
        msg == other.msg &&
        statuscode == other.statuscode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, msg.hashCode), statuscode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddNewFriendModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode))
        .toString();
  }
}

class AddNewFriendModelBuilder
    implements Builder<AddNewFriendModel, AddNewFriendModelBuilder> {
  _$AddNewFriendModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  AddNewFriendModelBuilder();

  AddNewFriendModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddNewFriendModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddNewFriendModel;
  }

  @override
  void update(void Function(AddNewFriendModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddNewFriendModel build() => _build();

  _$AddNewFriendModel _build() {
    final _$result =
        _$v ?? new _$AddNewFriendModel._(msg: msg, statuscode: statuscode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
