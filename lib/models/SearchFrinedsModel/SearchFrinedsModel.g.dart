// GENERATED CODE - DO NOT MODIFY BY HAND

part of SearchFrinedsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchFrinedsModel> _$searchFrinedsModelSerializer =
    new _$SearchFrinedsModelSerializer();

class _$SearchFrinedsModelSerializer
    implements StructuredSerializer<SearchFrinedsModel> {
  @override
  final Iterable<Type> types = const [SearchFrinedsModel, _$SearchFrinedsModel];
  @override
  final String wireName = 'SearchFrinedsModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SearchFrinedsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(UserModell)])));
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
  SearchFrinedsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchFrinedsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserModell)]))!
              as BuiltList<Object?>);
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

class _$SearchFrinedsModel extends SearchFrinedsModel {
  @override
  final BuiltList<UserModell>? user;
  @override
  final String? error;

  factory _$SearchFrinedsModel(
          [void Function(SearchFrinedsModelBuilder)? updates]) =>
      (new SearchFrinedsModelBuilder()..update(updates))._build();

  _$SearchFrinedsModel._({this.user, this.error}) : super._();

  @override
  SearchFrinedsModel rebuild(
          void Function(SearchFrinedsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchFrinedsModelBuilder toBuilder() =>
      new SearchFrinedsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchFrinedsModel &&
        user == other.user &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, user.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchFrinedsModel')
          ..add('user', user)
          ..add('error', error))
        .toString();
  }
}

class SearchFrinedsModelBuilder
    implements Builder<SearchFrinedsModel, SearchFrinedsModelBuilder> {
  _$SearchFrinedsModel? _$v;

  ListBuilder<UserModell>? _user;
  ListBuilder<UserModell> get user =>
      _$this._user ??= new ListBuilder<UserModell>();
  set user(ListBuilder<UserModell>? user) => _$this._user = user;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  SearchFrinedsModelBuilder();

  SearchFrinedsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchFrinedsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchFrinedsModel;
  }

  @override
  void update(void Function(SearchFrinedsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchFrinedsModel build() => _build();

  _$SearchFrinedsModel _build() {
    _$SearchFrinedsModel _$result;
    try {
      _$result =
          _$v ?? new _$SearchFrinedsModel._(user: _user?.build(), error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchFrinedsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
