// GENERATED CODE - DO NOT MODIFY BY HAND

part of SubgendersListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubgendersListModel> _$subgendersListModelSerializer =
    new _$SubgendersListModelSerializer();

class _$SubgendersListModelSerializer
    implements StructuredSerializer<SubgendersListModel> {
  @override
  final Iterable<Type> types = const [
    SubgendersListModel,
    _$SubgendersListModel
  ];
  @override
  final String wireName = 'SubgendersListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SubgendersListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SubgendersListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubgendersListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SubgendersListModel extends SubgendersListModel {
  @override
  final String? title;
  @override
  final int? id;
  @override
  final int? type;
  @override
  final String? image;

  factory _$SubgendersListModel(
          [void Function(SubgendersListModelBuilder)? updates]) =>
      (new SubgendersListModelBuilder()..update(updates))._build();

  _$SubgendersListModel._({this.title, this.id, this.type, this.image})
      : super._();

  @override
  SubgendersListModel rebuild(
          void Function(SubgendersListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubgendersListModelBuilder toBuilder() =>
      new SubgendersListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubgendersListModel &&
        title == other.title &&
        id == other.id &&
        type == other.type &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, title.hashCode), id.hashCode), type.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubgendersListModel')
          ..add('title', title)
          ..add('id', id)
          ..add('type', type)
          ..add('image', image))
        .toString();
  }
}

class SubgendersListModelBuilder
    implements Builder<SubgendersListModel, SubgendersListModelBuilder> {
  _$SubgendersListModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  SubgendersListModelBuilder();

  SubgendersListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _id = $v.id;
      _type = $v.type;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubgendersListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubgendersListModel;
  }

  @override
  void update(void Function(SubgendersListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubgendersListModel build() => _build();

  _$SubgendersListModel _build() {
    final _$result = _$v ??
        new _$SubgendersListModel._(
            title: title, id: id, type: type, image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
