// GENERATED CODE - DO NOT MODIFY BY HAND

part of PollParticipantsModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PollParticipantsModel> _$pollParticipantsModelSerializer =
    new _$PollParticipantsModelSerializer();

class _$PollParticipantsModelSerializer
    implements StructuredSerializer<PollParticipantsModel> {
  @override
  final Iterable<Type> types = const [
    PollParticipantsModel,
    _$PollParticipantsModel
  ];
  @override
  final String wireName = 'PollParticipantsModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PollParticipantsModel object,
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
    value = object.background_color;
    if (value != null) {
      result
        ..add('background_color')
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
    return result;
  }

  @override
  PollParticipantsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PollParticipantsModelBuilder();

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
        case 'background_color':
          result.background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PollParticipantsModel extends PollParticipantsModel {
  @override
  final String? name;
  @override
  final String? background_color;
  @override
  final String? image;

  factory _$PollParticipantsModel(
          [void Function(PollParticipantsModelBuilder)? updates]) =>
      (new PollParticipantsModelBuilder()..update(updates))._build();

  _$PollParticipantsModel._({this.name, this.background_color, this.image})
      : super._();

  @override
  PollParticipantsModel rebuild(
          void Function(PollParticipantsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PollParticipantsModelBuilder toBuilder() =>
      new PollParticipantsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PollParticipantsModel &&
        name == other.name &&
        background_color == other.background_color &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, name.hashCode), background_color.hashCode), image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PollParticipantsModel')
          ..add('name', name)
          ..add('background_color', background_color)
          ..add('image', image))
        .toString();
  }
}

class PollParticipantsModelBuilder
    implements Builder<PollParticipantsModel, PollParticipantsModelBuilder> {
  _$PollParticipantsModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  PollParticipantsModelBuilder();

  PollParticipantsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _background_color = $v.background_color;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PollParticipantsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PollParticipantsModel;
  }

  @override
  void update(void Function(PollParticipantsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PollParticipantsModel build() => _build();

  _$PollParticipantsModel _build() {
    final _$result = _$v ??
        new _$PollParticipantsModel._(
            name: name, background_color: background_color, image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
