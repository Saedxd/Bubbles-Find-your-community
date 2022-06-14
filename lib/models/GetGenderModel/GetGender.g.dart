// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetGender;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetGenderModel> _$getGenderModelSerializer =
    new _$GetGenderModelSerializer();

class _$GetGenderModelSerializer
    implements StructuredSerializer<GetGenderModel> {
  @override
  final Iterable<Type> types = const [GetGenderModel, _$GetGenderModel];
  @override
  final String wireName = 'GetGenderModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetGenderModel object,
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
                BuiltList, const [const FullType(GendersListModel)])));
    }
    return result;
  }

  @override
  GetGenderModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetGenderModelBuilder();

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
                      BuiltList, const [const FullType(GendersListModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetGenderModel extends GetGenderModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<GendersListModel>? genders;

  factory _$GetGenderModel([void Function(GetGenderModelBuilder)? updates]) =>
      (new GetGenderModelBuilder()..update(updates))._build();

  _$GetGenderModel._({this.msg, this.statuscode, this.genders}) : super._();

  @override
  GetGenderModel rebuild(void Function(GetGenderModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetGenderModelBuilder toBuilder() =>
      new GetGenderModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetGenderModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        genders == other.genders;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), genders.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetGenderModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('genders', genders))
        .toString();
  }
}

class GetGenderModelBuilder
    implements Builder<GetGenderModel, GetGenderModelBuilder> {
  _$GetGenderModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<GendersListModel>? _genders;
  ListBuilder<GendersListModel> get genders =>
      _$this._genders ??= new ListBuilder<GendersListModel>();
  set genders(ListBuilder<GendersListModel>? genders) =>
      _$this._genders = genders;

  GetGenderModelBuilder();

  GetGenderModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _genders = $v.genders?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetGenderModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetGenderModel;
  }

  @override
  void update(void Function(GetGenderModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetGenderModel build() => _build();

  _$GetGenderModel _build() {
    _$GetGenderModel _$result;
    try {
      _$result = _$v ??
          new _$GetGenderModel._(
              msg: msg, statuscode: statuscode, genders: _genders?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'genders';
        _genders?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetGenderModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
