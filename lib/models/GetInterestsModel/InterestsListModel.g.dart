// GENERATED CODE - DO NOT MODIFY BY HAND

part of InterestsListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InterestsListModel> _$interestsListModelSerializer =
    new _$InterestsListModelSerializer();

class _$InterestsListModelSerializer
    implements StructuredSerializer<InterestsListModel> {
  @override
  final Iterable<Type> types = const [InterestsListModel, _$InterestsListModel];
  @override
  final String wireName = 'InterestsListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, InterestsListModel object,
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
  InterestsListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InterestsListModelBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$InterestsListModel extends InterestsListModel {
  @override
  final String? title;
  @override
  final int? id;
  @override
  final String? image;

  factory _$InterestsListModel(
          [void Function(InterestsListModelBuilder)? updates]) =>
      (new InterestsListModelBuilder()..update(updates))._build();

  _$InterestsListModel._({this.title, this.id, this.image}) : super._();

  @override
  InterestsListModel rebuild(
          void Function(InterestsListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InterestsListModelBuilder toBuilder() =>
      new InterestsListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InterestsListModel &&
        title == other.title &&
        id == other.id &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), id.hashCode), image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InterestsListModel')
          ..add('title', title)
          ..add('id', id)
          ..add('image', image))
        .toString();
  }
}

class InterestsListModelBuilder
    implements Builder<InterestsListModel, InterestsListModelBuilder> {
  _$InterestsListModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  InterestsListModelBuilder();

  InterestsListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _id = $v.id;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InterestsListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InterestsListModel;
  }

  @override
  void update(void Function(InterestsListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InterestsListModel build() => _build();

  _$InterestsListModel _build() {
    final _$result =
        _$v ?? new _$InterestsListModel._(title: title, id: id, image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
