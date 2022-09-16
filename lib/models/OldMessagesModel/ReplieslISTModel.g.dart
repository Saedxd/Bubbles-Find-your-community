// GENERATED CODE - DO NOT MODIFY BY HAND

part of ReplieslISTModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReplieslISTModel> _$replieslISTModelSerializer =
    new _$ReplieslISTModelSerializer();

class _$ReplieslISTModelSerializer
    implements StructuredSerializer<ReplieslISTModel> {
  @override
  final Iterable<Type> types = const [ReplieslISTModel, _$ReplieslISTModel];
  @override
  final String wireName = 'ReplieslISTModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReplieslISTModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alias;
    if (value != null) {
      result
        ..add('alias')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.CreatAt;
    if (value != null) {
      result
        ..add('CreatAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.background;
    if (value != null) {
      result
        ..add('background')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ReplieslISTModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReplieslISTModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alias':
          result.alias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'CreatAt':
          result.CreatAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'background':
          result.background = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ReplieslISTModel extends ReplieslISTModel {
  @override
  final int? id;
  @override
  final String? comment;
  @override
  final String? alias;
  @override
  final String? avatar;
  @override
  final String? CreatAt;
  @override
  final String? background;

  factory _$ReplieslISTModel(
          [void Function(ReplieslISTModelBuilder)? updates]) =>
      (new ReplieslISTModelBuilder()..update(updates))._build();

  _$ReplieslISTModel._(
      {this.id,
      this.comment,
      this.alias,
      this.avatar,
      this.CreatAt,
      this.background})
      : super._();

  @override
  ReplieslISTModel rebuild(void Function(ReplieslISTModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplieslISTModelBuilder toBuilder() =>
      new ReplieslISTModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplieslISTModel &&
        id == other.id &&
        comment == other.comment &&
        alias == other.alias &&
        avatar == other.avatar &&
        CreatAt == other.CreatAt &&
        background == other.background;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), comment.hashCode), alias.hashCode),
                avatar.hashCode),
            CreatAt.hashCode),
        background.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReplieslISTModel')
          ..add('id', id)
          ..add('comment', comment)
          ..add('alias', alias)
          ..add('avatar', avatar)
          ..add('CreatAt', CreatAt)
          ..add('background', background))
        .toString();
  }
}

class ReplieslISTModelBuilder
    implements Builder<ReplieslISTModel, ReplieslISTModelBuilder> {
  _$ReplieslISTModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _CreatAt;
  String? get CreatAt => _$this._CreatAt;
  set CreatAt(String? CreatAt) => _$this._CreatAt = CreatAt;

  String? _background;
  String? get background => _$this._background;
  set background(String? background) => _$this._background = background;

  ReplieslISTModelBuilder();

  ReplieslISTModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _comment = $v.comment;
      _alias = $v.alias;
      _avatar = $v.avatar;
      _CreatAt = $v.CreatAt;
      _background = $v.background;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplieslISTModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReplieslISTModel;
  }

  @override
  void update(void Function(ReplieslISTModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReplieslISTModel build() => _build();

  _$ReplieslISTModel _build() {
    final _$result = _$v ??
        new _$ReplieslISTModel._(
            id: id,
            comment: comment,
            alias: alias,
            avatar: avatar,
            CreatAt: CreatAt,
            background: background);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
