// GENERATED CODE - DO NOT MODIFY BY HAND

part of ImagesEventListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImagesEventListModel> _$imagesEventListModelSerializer =
    new _$ImagesEventListModelSerializer();

class _$ImagesEventListModelSerializer
    implements StructuredSerializer<ImagesEventListModel> {
  @override
  final Iterable<Type> types = const [
    ImagesEventListModel,
    _$ImagesEventListModel
  ];
  @override
  final String wireName = 'ImagesEventListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ImagesEventListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
  ImagesEventListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImagesEventListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ImagesEventListModel extends ImagesEventListModel {
  @override
  final String? image;

  factory _$ImagesEventListModel(
          [void Function(ImagesEventListModelBuilder)? updates]) =>
      (new ImagesEventListModelBuilder()..update(updates))._build();

  _$ImagesEventListModel._({this.image}) : super._();

  @override
  ImagesEventListModel rebuild(
          void Function(ImagesEventListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImagesEventListModelBuilder toBuilder() =>
      new ImagesEventListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImagesEventListModel && image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(0, image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImagesEventListModel')
          ..add('image', image))
        .toString();
  }
}

class ImagesEventListModelBuilder
    implements Builder<ImagesEventListModel, ImagesEventListModelBuilder> {
  _$ImagesEventListModel? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ImagesEventListModelBuilder();

  ImagesEventListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImagesEventListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImagesEventListModel;
  }

  @override
  void update(void Function(ImagesEventListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImagesEventListModel build() => _build();

  _$ImagesEventListModel _build() {
    final _$result = _$v ?? new _$ImagesEventListModel._(image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
