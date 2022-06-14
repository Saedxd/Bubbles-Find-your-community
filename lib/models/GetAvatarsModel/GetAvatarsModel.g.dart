// GENERATED CODE - DO NOT MODIFY BY HAND

part of GetGender;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetAvatarsModel> _$getAvatarsModelSerializer =
    new _$GetAvatarsModelSerializer();

class _$GetAvatarsModelSerializer
    implements StructuredSerializer<GetAvatarsModel> {
  @override
  final Iterable<Type> types = const [GetAvatarsModel, _$GetAvatarsModel];
  @override
  final String wireName = 'GetAvatarsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetAvatarsModel object,
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
    value = object.avatars;
    if (value != null) {
      result
        ..add('avatars')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AvatarListModel)])));
    }
    return result;
  }

  @override
  GetAvatarsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetAvatarsModelBuilder();

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
        case 'avatars':
          result.avatars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AvatarListModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetAvatarsModel extends GetAvatarsModel {
  @override
  final String? msg;
  @override
  final int? statuscode;
  @override
  final BuiltList<AvatarListModel>? avatars;

  factory _$GetAvatarsModel([void Function(GetAvatarsModelBuilder)? updates]) =>
      (new GetAvatarsModelBuilder()..update(updates))._build();

  _$GetAvatarsModel._({this.msg, this.statuscode, this.avatars}) : super._();

  @override
  GetAvatarsModel rebuild(void Function(GetAvatarsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAvatarsModelBuilder toBuilder() =>
      new GetAvatarsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAvatarsModel &&
        msg == other.msg &&
        statuscode == other.statuscode &&
        avatars == other.avatars;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, msg.hashCode), statuscode.hashCode), avatars.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetAvatarsModel')
          ..add('msg', msg)
          ..add('statuscode', statuscode)
          ..add('avatars', avatars))
        .toString();
  }
}

class GetAvatarsModelBuilder
    implements Builder<GetAvatarsModel, GetAvatarsModelBuilder> {
  _$GetAvatarsModel? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  ListBuilder<AvatarListModel>? _avatars;
  ListBuilder<AvatarListModel> get avatars =>
      _$this._avatars ??= new ListBuilder<AvatarListModel>();
  set avatars(ListBuilder<AvatarListModel>? avatars) =>
      _$this._avatars = avatars;

  GetAvatarsModelBuilder();

  GetAvatarsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _statuscode = $v.statuscode;
      _avatars = $v.avatars?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAvatarsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAvatarsModel;
  }

  @override
  void update(void Function(GetAvatarsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAvatarsModel build() => _build();

  _$GetAvatarsModel _build() {
    _$GetAvatarsModel _$result;
    try {
      _$result = _$v ??
          new _$GetAvatarsModel._(
              msg: msg, statuscode: statuscode, avatars: _avatars?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'avatars';
        _avatars?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetAvatarsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
