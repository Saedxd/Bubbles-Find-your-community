// GENERATED CODE - DO NOT MODIFY BY HAND

part of VerifyProfile_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
    replace(_$result);
    return _$result;
  }
}

class _$AddImages extends AddImages {
  @override
  final String? image1;
  @override
  final String? image2;

  factory _$AddImages([void Function(AddImagesBuilder)? updates]) =>
      (new AddImagesBuilder()..update(updates))._build();

  _$AddImages._({this.image1, this.image2}) : super._();

  @override
  AddImages rebuild(void Function(AddImagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddImagesBuilder toBuilder() => new AddImagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddImages &&
        image1 == other.image1 &&
        image2 == other.image2;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, image1.hashCode), image2.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddImages')
          ..add('image1', image1)
          ..add('image2', image2))
        .toString();
  }
}

class AddImagesBuilder implements Builder<AddImages, AddImagesBuilder> {
  _$AddImages? _$v;

  String? _image1;
  String? get image1 => _$this._image1;
  set image1(String? image1) => _$this._image1 = image1;

  String? _image2;
  String? get image2 => _$this._image2;
  set image2(String? image2) => _$this._image2 = image2;

  AddImagesBuilder();

  AddImagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image1 = $v.image1;
      _image2 = $v.image2;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddImages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddImages;
  }

  @override
  void update(void Function(AddImagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddImages build() => _build();

  _$AddImages _build() {
    final _$result = _$v ?? new _$AddImages._(image1: image1, image2: image2);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeDone extends ChangeDone {
  factory _$ChangeDone([void Function(ChangeDoneBuilder)? updates]) =>
      (new ChangeDoneBuilder()..update(updates))._build();

  _$ChangeDone._() : super._();

  @override
  ChangeDone rebuild(void Function(ChangeDoneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeDoneBuilder toBuilder() => new ChangeDoneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeDone;
  }

  @override
  int get hashCode {
    return 809805745;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ChangeDone').toString();
  }
}

class ChangeDoneBuilder implements Builder<ChangeDone, ChangeDoneBuilder> {
  _$ChangeDone? _$v;

  ChangeDoneBuilder();

  @override
  void replace(ChangeDone other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeDone;
  }

  @override
  void update(void Function(ChangeDoneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeDone build() => _build();

  _$ChangeDone _build() {
    final _$result = _$v ?? new _$ChangeDone._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
