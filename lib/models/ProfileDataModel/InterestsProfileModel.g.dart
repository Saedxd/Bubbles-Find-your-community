// GENERATED CODE - DO NOT MODIFY BY HAND

part of InterestsProfileModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InterestsProfileModel> _$interestsProfileModelSerializer =
    new _$InterestsProfileModelSerializer();

class _$InterestsProfileModelSerializer
    implements StructuredSerializer<InterestsProfileModel> {
  @override
  final Iterable<Type> types = const [
    InterestsProfileModel,
    _$InterestsProfileModel
  ];
  @override
  final String wireName = 'InterestsProfileModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, InterestsProfileModel object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
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
  InterestsProfileModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InterestsProfileModelBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
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

class _$InterestsProfileModel extends InterestsProfileModel {
  @override
  final String? title;
  @override
  final String? image;
  @override
  final int? id;

  factory _$InterestsProfileModel(
          [void Function(InterestsProfileModelBuilder)? updates]) =>
      (new InterestsProfileModelBuilder()..update(updates))._build();

  _$InterestsProfileModel._({this.title, this.image, this.id}) : super._();

  @override
  InterestsProfileModel rebuild(
          void Function(InterestsProfileModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InterestsProfileModelBuilder toBuilder() =>
      new InterestsProfileModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InterestsProfileModel &&
        title == other.title &&
        image == other.image &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), image.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InterestsProfileModel')
          ..add('title', title)
          ..add('image', image)
          ..add('id', id))
        .toString();
  }
}

class InterestsProfileModelBuilder
    implements Builder<InterestsProfileModel, InterestsProfileModelBuilder> {
  _$InterestsProfileModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  InterestsProfileModelBuilder();

  InterestsProfileModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _image = $v.image;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InterestsProfileModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InterestsProfileModel;
  }

  @override
  void update(void Function(InterestsProfileModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InterestsProfileModel build() => _build();

  _$InterestsProfileModel _build() {
    final _$result = _$v ??
        new _$InterestsProfileModel._(title: title, image: image, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
