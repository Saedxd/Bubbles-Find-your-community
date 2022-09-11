// GENERATED CODE - DO NOT MODIFY BY HAND

part of FriendListSearchModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FriendListSearchModel> _$friendListSearchModelSerializer =
    new _$FriendListSearchModelSerializer();

class _$FriendListSearchModelSerializer
    implements StructuredSerializer<FriendListSearchModel> {
  @override
  final Iterable<Type> types = const [
    FriendListSearchModel,
    _$FriendListSearchModel
  ];
  @override
  final String wireName = 'FriendListSearchModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FriendListSearchModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(FreindsFilteredListModel)])));
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
  FriendListSearchModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FriendListSearchModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(FreindsFilteredListModel)
              ]))! as BuiltList<Object?>);
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

class _$FriendListSearchModel extends FriendListSearchModel {
  @override
  final BuiltList<FreindsFilteredListModel>? user;
  @override
  final String? error;

  factory _$FriendListSearchModel(
          [void Function(FriendListSearchModelBuilder)? updates]) =>
      (new FriendListSearchModelBuilder()..update(updates))._build();

  _$FriendListSearchModel._({this.user, this.error}) : super._();

  @override
  FriendListSearchModel rebuild(
          void Function(FriendListSearchModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendListSearchModelBuilder toBuilder() =>
      new FriendListSearchModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FriendListSearchModel &&
        user == other.user &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, user.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FriendListSearchModel')
          ..add('user', user)
          ..add('error', error))
        .toString();
  }
}

class FriendListSearchModelBuilder
    implements Builder<FriendListSearchModel, FriendListSearchModelBuilder> {
  _$FriendListSearchModel? _$v;

  ListBuilder<FreindsFilteredListModel>? _user;
  ListBuilder<FreindsFilteredListModel> get user =>
      _$this._user ??= new ListBuilder<FreindsFilteredListModel>();
  set user(ListBuilder<FreindsFilteredListModel>? user) => _$this._user = user;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  FriendListSearchModelBuilder();

  FriendListSearchModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FriendListSearchModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FriendListSearchModel;
  }

  @override
  void update(void Function(FriendListSearchModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FriendListSearchModel build() => _build();

  _$FriendListSearchModel _build() {
    _$FriendListSearchModel _$result;
    try {
      _$result = _$v ??
          new _$FriendListSearchModel._(user: _user?.build(), error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FriendListSearchModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
