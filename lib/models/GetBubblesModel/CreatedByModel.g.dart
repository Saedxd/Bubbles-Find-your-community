// GENERATED CODE - DO NOT MODIFY BY HAND

part of CreatedByModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreatedByModel> _$createdByModelSerializer =
    new _$CreatedByModelSerializer();

class _$CreatedByModelSerializer
    implements StructuredSerializer<CreatedByModel> {
  @override
  final Iterable<Type> types = const [CreatedByModel, _$CreatedByModel];
  @override
  final String wireName = 'CreatedByModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CreatedByModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserMadeBubbleModel)));
    }
    return result;
  }

  @override
  CreatedByModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreatedByModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserMadeBubbleModel))!
              as UserMadeBubbleModel);
          break;
      }
    }

    return result.build();
  }
}

class _$CreatedByModel extends CreatedByModel {
  @override
  final String? type;
  @override
  final UserMadeBubbleModel? user;

  factory _$CreatedByModel([void Function(CreatedByModelBuilder)? updates]) =>
      (new CreatedByModelBuilder()..update(updates))._build();

  _$CreatedByModel._({this.type, this.user}) : super._();

  @override
  CreatedByModel rebuild(void Function(CreatedByModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatedByModelBuilder toBuilder() =>
      new CreatedByModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatedByModel && type == other.type && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatedByModel')
          ..add('type', type)
          ..add('user', user))
        .toString();
  }
}

class CreatedByModelBuilder
    implements Builder<CreatedByModel, CreatedByModelBuilder> {
  _$CreatedByModel? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  UserMadeBubbleModelBuilder? _user;
  UserMadeBubbleModelBuilder get user =>
      _$this._user ??= new UserMadeBubbleModelBuilder();
  set user(UserMadeBubbleModelBuilder? user) => _$this._user = user;

  CreatedByModelBuilder();

  CreatedByModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatedByModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatedByModel;
  }

  @override
  void update(void Function(CreatedByModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatedByModel build() => _build();

  _$CreatedByModel _build() {
    _$CreatedByModel _$result;
    try {
      _$result =
          _$v ?? new _$CreatedByModel._(type: type, user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreatedByModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
