// GENERATED CODE - DO NOT MODIFY BY HAND

part of UserMadeBubbleModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserMadeBubbleModel> _$userMadeBubbleModelSerializer =
    new _$UserMadeBubbleModelSerializer();

class _$UserMadeBubbleModelSerializer
    implements StructuredSerializer<UserMadeBubbleModel> {
  @override
  final Iterable<Type> types = const [
    UserMadeBubbleModel,
    _$UserMadeBubbleModel
  ];
  @override
  final String wireName = 'UserMadeBubbleModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserMadeBubbleModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updated_at;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UserMadeBubbleModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserMadeBubbleModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserMadeBubbleModel extends UserMadeBubbleModel {
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? created_at;
  @override
  final String? updated_at;
  @override
  final int? id;

  factory _$UserMadeBubbleModel(
          [void Function(UserMadeBubbleModelBuilder)? updates]) =>
      (new UserMadeBubbleModelBuilder()..update(updates))._build();

  _$UserMadeBubbleModel._(
      {this.name, this.email, this.created_at, this.updated_at, this.id})
      : super._();

  @override
  UserMadeBubbleModel rebuild(
          void Function(UserMadeBubbleModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserMadeBubbleModelBuilder toBuilder() =>
      new UserMadeBubbleModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserMadeBubbleModel &&
        name == other.name &&
        email == other.email &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), email.hashCode),
                created_at.hashCode),
            updated_at.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserMadeBubbleModel')
          ..add('name', name)
          ..add('email', email)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('id', id))
        .toString();
  }
}

class UserMadeBubbleModelBuilder
    implements Builder<UserMadeBubbleModel, UserMadeBubbleModelBuilder> {
  _$UserMadeBubbleModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _updated_at;
  String? get updated_at => _$this._updated_at;
  set updated_at(String? updated_at) => _$this._updated_at = updated_at;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UserMadeBubbleModelBuilder();

  UserMadeBubbleModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _email = $v.email;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserMadeBubbleModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserMadeBubbleModel;
  }

  @override
  void update(void Function(UserMadeBubbleModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserMadeBubbleModel build() => _build();

  _$UserMadeBubbleModel _build() {
    final _$result = _$v ??
        new _$UserMadeBubbleModel._(
            name: name,
            email: email,
            created_at: created_at,
            updated_at: updated_at,
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
