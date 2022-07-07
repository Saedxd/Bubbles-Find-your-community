// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Getprofile extends Getprofile {
  factory _$Getprofile([void Function(GetprofileBuilder)? updates]) =>
      (new GetprofileBuilder()..update(updates))._build();

  _$Getprofile._() : super._();

  @override
  Getprofile rebuild(void Function(GetprofileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetprofileBuilder toBuilder() => new GetprofileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Getprofile;
  }

  @override
  int get hashCode {
    return 9676777;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Getprofile').toString();
  }
}

class GetprofileBuilder implements Builder<Getprofile, GetprofileBuilder> {
  _$Getprofile? _$v;

  GetprofileBuilder();

  @override
  void replace(Getprofile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Getprofile;
  }

  @override
  void update(void Function(GetprofileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Getprofile build() => _build();

  _$Getprofile _build() {
    final _$result = _$v ?? new _$Getprofile._();
    replace(_$result);
    return _$result;
  }
}

class _$ChangeValue extends ChangeValue {
  @override
  final double? Value;

  factory _$ChangeValue([void Function(ChangeValueBuilder)? updates]) =>
      (new ChangeValueBuilder()..update(updates))._build();

  _$ChangeValue._({this.Value}) : super._();

  @override
  ChangeValue rebuild(void Function(ChangeValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeValueBuilder toBuilder() => new ChangeValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeValue && Value == other.Value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeValue')..add('Value', Value))
        .toString();
  }
}

class ChangeValueBuilder implements Builder<ChangeValue, ChangeValueBuilder> {
  _$ChangeValue? _$v;

  double? _Value;
  double? get Value => _$this._Value;
  set Value(double? Value) => _$this._Value = Value;

  ChangeValueBuilder();

  ChangeValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Value = $v.Value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeValue;
  }

  @override
  void update(void Function(ChangeValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeValue build() => _build();

  _$ChangeValue _build() {
    final _$result = _$v ?? new _$ChangeValue._(Value: Value);
    replace(_$result);
    return _$result;
  }
}

class _$ShowDialoog extends ShowDialoog {
  factory _$ShowDialoog([void Function(ShowDialoogBuilder)? updates]) =>
      (new ShowDialoogBuilder()..update(updates))._build();

  _$ShowDialoog._() : super._();

  @override
  ShowDialoog rebuild(void Function(ShowDialoogBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowDialoogBuilder toBuilder() => new ShowDialoogBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowDialoog;
  }

  @override
  int get hashCode {
    return 955584502;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ShowDialoog').toString();
  }
}

class ShowDialoogBuilder implements Builder<ShowDialoog, ShowDialoogBuilder> {
  _$ShowDialoog? _$v;

  ShowDialoogBuilder();

  @override
  void replace(ShowDialoog other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShowDialoog;
  }

  @override
  void update(void Function(ShowDialoogBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShowDialoog build() => _build();

  _$ShowDialoog _build() {
    final _$result = _$v ?? new _$ShowDialoog._();
    replace(_$result);
    return _$result;
  }
}

class _$AddMarkers extends AddMarkers {
  @override
  final Set<Marker>? marker2;

  factory _$AddMarkers([void Function(AddMarkersBuilder)? updates]) =>
      (new AddMarkersBuilder()..update(updates))._build();

  _$AddMarkers._({this.marker2}) : super._();

  @override
  AddMarkers rebuild(void Function(AddMarkersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddMarkersBuilder toBuilder() => new AddMarkersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddMarkers && marker2 == other.marker2;
  }

  @override
  int get hashCode {
    return $jf($jc(0, marker2.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddMarkers')..add('marker2', marker2))
        .toString();
  }
}

class AddMarkersBuilder implements Builder<AddMarkers, AddMarkersBuilder> {
  _$AddMarkers? _$v;

  Set<Marker>? _marker2;
  Set<Marker>? get marker2 => _$this._marker2;
  set marker2(Set<Marker>? marker2) => _$this._marker2 = marker2;

  AddMarkersBuilder();

  AddMarkersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _marker2 = $v.marker2;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddMarkers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddMarkers;
  }

  @override
  void update(void Function(AddMarkersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddMarkers build() => _build();

  _$AddMarkers _build() {
    final _$result = _$v ?? new _$AddMarkers._(marker2: marker2);
    replace(_$result);
    return _$result;
  }
}

class _$MakeDone extends MakeDone {
  factory _$MakeDone([void Function(MakeDoneBuilder)? updates]) =>
      (new MakeDoneBuilder()..update(updates))._build();

  _$MakeDone._() : super._();

  @override
  MakeDone rebuild(void Function(MakeDoneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MakeDoneBuilder toBuilder() => new MakeDoneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MakeDone;
  }

  @override
  int get hashCode {
    return 930333317;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('MakeDone').toString();
  }
}

class MakeDoneBuilder implements Builder<MakeDone, MakeDoneBuilder> {
  _$MakeDone? _$v;

  MakeDoneBuilder();

  @override
  void replace(MakeDone other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MakeDone;
  }

  @override
  void update(void Function(MakeDoneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MakeDone build() => _build();

  _$MakeDone _build() {
    final _$result = _$v ?? new _$MakeDone._();
    replace(_$result);
    return _$result;
  }
}

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
    return newBuiltValueToStringHelper('ClearError').toString();
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

class _$GetAllBubbles extends GetAllBubbles {
  factory _$GetAllBubbles([void Function(GetAllBubblesBuilder)? updates]) =>
      (new GetAllBubblesBuilder()..update(updates))._build();

  _$GetAllBubbles._() : super._();

  @override
  GetAllBubbles rebuild(void Function(GetAllBubblesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllBubblesBuilder toBuilder() => new GetAllBubblesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllBubbles;
  }

  @override
  int get hashCode {
    return 1073171996;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetAllBubbles').toString();
  }
}

class GetAllBubblesBuilder
    implements Builder<GetAllBubbles, GetAllBubblesBuilder> {
  _$GetAllBubbles? _$v;

  GetAllBubblesBuilder();

  @override
  void replace(GetAllBubbles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAllBubbles;
  }

  @override
  void update(void Function(GetAllBubblesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAllBubbles build() => _build();

  _$GetAllBubbles _build() {
    final _$result = _$v ?? new _$GetAllBubbles._();
    replace(_$result);
    return _$result;
  }
}

class _$GetPrimeBubbles extends GetPrimeBubbles {
  factory _$GetPrimeBubbles([void Function(GetPrimeBubblesBuilder)? updates]) =>
      (new GetPrimeBubblesBuilder()..update(updates))._build();

  _$GetPrimeBubbles._() : super._();

  @override
  GetPrimeBubbles rebuild(void Function(GetPrimeBubblesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetPrimeBubblesBuilder toBuilder() =>
      new GetPrimeBubblesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetPrimeBubbles;
  }

  @override
  int get hashCode {
    return 563046130;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetPrimeBubbles').toString();
  }
}

class GetPrimeBubblesBuilder
    implements Builder<GetPrimeBubbles, GetPrimeBubblesBuilder> {
  _$GetPrimeBubbles? _$v;

  GetPrimeBubblesBuilder();

  @override
  void replace(GetPrimeBubbles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetPrimeBubbles;
  }

  @override
  void update(void Function(GetPrimeBubblesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetPrimeBubbles build() => _build();

  _$GetPrimeBubbles _build() {
    final _$result = _$v ?? new _$GetPrimeBubbles._();
    replace(_$result);
    return _$result;
  }
}

class _$GetNewBubbles extends GetNewBubbles {
  factory _$GetNewBubbles([void Function(GetNewBubblesBuilder)? updates]) =>
      (new GetNewBubblesBuilder()..update(updates))._build();

  _$GetNewBubbles._() : super._();

  @override
  GetNewBubbles rebuild(void Function(GetNewBubblesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNewBubblesBuilder toBuilder() => new GetNewBubblesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNewBubbles;
  }

  @override
  int get hashCode {
    return 1038529282;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetNewBubbles').toString();
  }
}

class GetNewBubblesBuilder
    implements Builder<GetNewBubbles, GetNewBubblesBuilder> {
  _$GetNewBubbles? _$v;

  GetNewBubblesBuilder();

  @override
  void replace(GetNewBubbles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNewBubbles;
  }

  @override
  void update(void Function(GetNewBubblesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNewBubbles build() => _build();

  _$GetNewBubbles _build() {
    final _$result = _$v ?? new _$GetNewBubbles._();
    replace(_$result);
    return _$result;
  }
}

class _$UserMoved extends UserMoved {
  @override
  final double? lat;
  @override
  final double? lng;

  factory _$UserMoved([void Function(UserMovedBuilder)? updates]) =>
      (new UserMovedBuilder()..update(updates))._build();

  _$UserMoved._({this.lat, this.lng}) : super._();

  @override
  UserMoved rebuild(void Function(UserMovedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserMovedBuilder toBuilder() => new UserMovedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserMoved && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, lat.hashCode), lng.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserMoved')
          ..add('lat', lat)
          ..add('lng', lng))
        .toString();
  }
}

class UserMovedBuilder implements Builder<UserMoved, UserMovedBuilder> {
  _$UserMoved? _$v;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lng;
  double? get lng => _$this._lng;
  set lng(double? lng) => _$this._lng = lng;

  UserMovedBuilder();

  UserMovedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lat = $v.lat;
      _lng = $v.lng;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserMoved other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserMoved;
  }

  @override
  void update(void Function(UserMovedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserMoved build() => _build();

  _$UserMoved _build() {
    final _$result = _$v ?? new _$UserMoved._(lat: lat, lng: lng);
    replace(_$result);
    return _$result;
  }
}

class _$CreateBubbless extends CreateBubbless {
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final double? Radius;

  factory _$CreateBubbless([void Function(CreateBubblessBuilder)? updates]) =>
      (new CreateBubblessBuilder()..update(updates))._build();

  _$CreateBubbless._({this.lat, this.lng, this.Radius}) : super._();

  @override
  CreateBubbless rebuild(void Function(CreateBubblessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateBubblessBuilder toBuilder() =>
      new CreateBubblessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateBubbless &&
        lat == other.lat &&
        lng == other.lng &&
        Radius == other.Radius;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, lat.hashCode), lng.hashCode), Radius.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreateBubbless')
          ..add('lat', lat)
          ..add('lng', lng)
          ..add('Radius', Radius))
        .toString();
  }
}

class CreateBubblessBuilder
    implements Builder<CreateBubbless, CreateBubblessBuilder> {
  _$CreateBubbless? _$v;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lng;
  double? get lng => _$this._lng;
  set lng(double? lng) => _$this._lng = lng;

  double? _Radius;
  double? get Radius => _$this._Radius;
  set Radius(double? Radius) => _$this._Radius = Radius;

  CreateBubblessBuilder();

  CreateBubblessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lat = $v.lat;
      _lng = $v.lng;
      _Radius = $v.Radius;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateBubbless other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateBubbless;
  }

  @override
  void update(void Function(CreateBubblessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateBubbless build() => _build();

  _$CreateBubbless _build() {
    final _$result =
        _$v ?? new _$CreateBubbless._(lat: lat, lng: lng, Radius: Radius);
    replace(_$result);
    return _$result;
  }
}

class _$RaduisUpdated extends RaduisUpdated {
  @override
  final double? Radius;

  factory _$RaduisUpdated([void Function(RaduisUpdatedBuilder)? updates]) =>
      (new RaduisUpdatedBuilder()..update(updates))._build();

  _$RaduisUpdated._({this.Radius}) : super._();

  @override
  RaduisUpdated rebuild(void Function(RaduisUpdatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RaduisUpdatedBuilder toBuilder() => new RaduisUpdatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RaduisUpdated && Radius == other.Radius;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Radius.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RaduisUpdated')..add('Radius', Radius))
        .toString();
  }
}

class RaduisUpdatedBuilder
    implements Builder<RaduisUpdated, RaduisUpdatedBuilder> {
  _$RaduisUpdated? _$v;

  double? _Radius;
  double? get Radius => _$this._Radius;
  set Radius(double? Radius) => _$this._Radius = Radius;

  RaduisUpdatedBuilder();

  RaduisUpdatedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Radius = $v.Radius;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RaduisUpdated other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RaduisUpdated;
  }

  @override
  void update(void Function(RaduisUpdatedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RaduisUpdated build() => _build();

  _$RaduisUpdated _build() {
    final _$result = _$v ?? new _$RaduisUpdated._(Radius: Radius);
    replace(_$result);
    return _$result;
  }
}

class _$UpdateLocation extends UpdateLocation {
  @override
  final double? lat;
  @override
  final double? lng;

  factory _$UpdateLocation([void Function(UpdateLocationBuilder)? updates]) =>
      (new UpdateLocationBuilder()..update(updates))._build();

  _$UpdateLocation._({this.lat, this.lng}) : super._();

  @override
  UpdateLocation rebuild(void Function(UpdateLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateLocationBuilder toBuilder() =>
      new UpdateLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateLocation && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, lat.hashCode), lng.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateLocation')
          ..add('lat', lat)
          ..add('lng', lng))
        .toString();
  }
}

class UpdateLocationBuilder
    implements Builder<UpdateLocation, UpdateLocationBuilder> {
  _$UpdateLocation? _$v;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lng;
  double? get lng => _$this._lng;
  set lng(double? lng) => _$this._lng = lng;

  UpdateLocationBuilder();

  UpdateLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lat = $v.lat;
      _lng = $v.lng;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateLocation;
  }

  @override
  void update(void Function(UpdateLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateLocation build() => _build();

  _$UpdateLocation _build() {
    final _$result = _$v ?? new _$UpdateLocation._(lat: lat, lng: lng);
    replace(_$result);
    return _$result;
  }
}

class _$DeleteBubble extends DeleteBubble {
  factory _$DeleteBubble([void Function(DeleteBubbleBuilder)? updates]) =>
      (new DeleteBubbleBuilder()..update(updates))._build();

  _$DeleteBubble._() : super._();

  @override
  DeleteBubble rebuild(void Function(DeleteBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteBubbleBuilder toBuilder() => new DeleteBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteBubble;
  }

  @override
  int get hashCode {
    return 25848931;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('DeleteBubble').toString();
  }
}

class DeleteBubbleBuilder
    implements Builder<DeleteBubble, DeleteBubbleBuilder> {
  _$DeleteBubble? _$v;

  DeleteBubbleBuilder();

  @override
  void replace(DeleteBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteBubble;
  }

  @override
  void update(void Function(DeleteBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteBubble build() => _build();

  _$DeleteBubble _build() {
    final _$result = _$v ?? new _$DeleteBubble._();
    replace(_$result);
    return _$result;
  }
}

class _$ChangeSliderValue extends ChangeSliderValue {
  @override
  final double? value;

  factory _$ChangeSliderValue(
          [void Function(ChangeSliderValueBuilder)? updates]) =>
      (new ChangeSliderValueBuilder()..update(updates))._build();

  _$ChangeSliderValue._({this.value}) : super._();

  @override
  ChangeSliderValue rebuild(void Function(ChangeSliderValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeSliderValueBuilder toBuilder() =>
      new ChangeSliderValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeSliderValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeSliderValue')
          ..add('value', value))
        .toString();
  }
}

class ChangeSliderValueBuilder
    implements Builder<ChangeSliderValue, ChangeSliderValueBuilder> {
  _$ChangeSliderValue? _$v;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  ChangeSliderValueBuilder();

  ChangeSliderValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeSliderValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeSliderValue;
  }

  @override
  void update(void Function(ChangeSliderValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeSliderValue build() => _build();

  _$ChangeSliderValue _build() {
    final _$result = _$v ?? new _$ChangeSliderValue._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$OpenDoorTObeAbleTOsetBubble extends OpenDoorTObeAbleTOsetBubble {
  @override
  final bool? MakeHimBEableTOSEtBubbles;

  factory _$OpenDoorTObeAbleTOsetBubble(
          [void Function(OpenDoorTObeAbleTOsetBubbleBuilder)? updates]) =>
      (new OpenDoorTObeAbleTOsetBubbleBuilder()..update(updates))._build();

  _$OpenDoorTObeAbleTOsetBubble._({this.MakeHimBEableTOSEtBubbles}) : super._();

  @override
  OpenDoorTObeAbleTOsetBubble rebuild(
          void Function(OpenDoorTObeAbleTOsetBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenDoorTObeAbleTOsetBubbleBuilder toBuilder() =>
      new OpenDoorTObeAbleTOsetBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenDoorTObeAbleTOsetBubble &&
        MakeHimBEableTOSEtBubbles == other.MakeHimBEableTOSEtBubbles;
  }

  @override
  int get hashCode {
    return $jf($jc(0, MakeHimBEableTOSEtBubbles.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OpenDoorTObeAbleTOsetBubble')
          ..add('MakeHimBEableTOSEtBubbles', MakeHimBEableTOSEtBubbles))
        .toString();
  }
}

class OpenDoorTObeAbleTOsetBubbleBuilder
    implements
        Builder<OpenDoorTObeAbleTOsetBubble,
            OpenDoorTObeAbleTOsetBubbleBuilder> {
  _$OpenDoorTObeAbleTOsetBubble? _$v;

  bool? _MakeHimBEableTOSEtBubbles;
  bool? get MakeHimBEableTOSEtBubbles => _$this._MakeHimBEableTOSEtBubbles;
  set MakeHimBEableTOSEtBubbles(bool? MakeHimBEableTOSEtBubbles) =>
      _$this._MakeHimBEableTOSEtBubbles = MakeHimBEableTOSEtBubbles;

  OpenDoorTObeAbleTOsetBubbleBuilder();

  OpenDoorTObeAbleTOsetBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _MakeHimBEableTOSEtBubbles = $v.MakeHimBEableTOSEtBubbles;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenDoorTObeAbleTOsetBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenDoorTObeAbleTOsetBubble;
  }

  @override
  void update(void Function(OpenDoorTObeAbleTOsetBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenDoorTObeAbleTOsetBubble build() => _build();

  _$OpenDoorTObeAbleTOsetBubble _build() {
    final _$result = _$v ??
        new _$OpenDoorTObeAbleTOsetBubble._(
            MakeHimBEableTOSEtBubbles: MakeHimBEableTOSEtBubbles);
    replace(_$result);
    return _$result;
  }
}

class _$SearchBubblesLists extends SearchBubblesLists {
  @override
  final String? Keyword;

  factory _$SearchBubblesLists(
          [void Function(SearchBubblesListsBuilder)? updates]) =>
      (new SearchBubblesListsBuilder()..update(updates))._build();

  _$SearchBubblesLists._({this.Keyword}) : super._();

  @override
  SearchBubblesLists rebuild(
          void Function(SearchBubblesListsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchBubblesListsBuilder toBuilder() =>
      new SearchBubblesListsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchBubblesLists && Keyword == other.Keyword;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Keyword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchBubblesLists')
          ..add('Keyword', Keyword))
        .toString();
  }
}

class SearchBubblesListsBuilder
    implements Builder<SearchBubblesLists, SearchBubblesListsBuilder> {
  _$SearchBubblesLists? _$v;

  String? _Keyword;
  String? get Keyword => _$this._Keyword;
  set Keyword(String? Keyword) => _$this._Keyword = Keyword;

  SearchBubblesListsBuilder();

  SearchBubblesListsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Keyword = $v.Keyword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchBubblesLists other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchBubblesLists;
  }

  @override
  void update(void Function(SearchBubblesListsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchBubblesLists build() => _build();

  _$SearchBubblesLists _build() {
    final _$result = _$v ?? new _$SearchBubblesLists._(Keyword: Keyword);
    replace(_$result);
    return _$result;
  }
}

class _$UserJoinedBubble extends UserJoinedBubble {
  @override
  final int? Bubble_id;

  factory _$UserJoinedBubble(
          [void Function(UserJoinedBubbleBuilder)? updates]) =>
      (new UserJoinedBubbleBuilder()..update(updates))._build();

  _$UserJoinedBubble._({this.Bubble_id}) : super._();

  @override
  UserJoinedBubble rebuild(void Function(UserJoinedBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserJoinedBubbleBuilder toBuilder() =>
      new UserJoinedBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserJoinedBubble && Bubble_id == other.Bubble_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Bubble_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserJoinedBubble')
          ..add('Bubble_id', Bubble_id))
        .toString();
  }
}

class UserJoinedBubbleBuilder
    implements Builder<UserJoinedBubble, UserJoinedBubbleBuilder> {
  _$UserJoinedBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  UserJoinedBubbleBuilder();

  UserJoinedBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserJoinedBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserJoinedBubble;
  }

  @override
  void update(void Function(UserJoinedBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserJoinedBubble build() => _build();

  _$UserJoinedBubble _build() {
    final _$result = _$v ?? new _$UserJoinedBubble._(Bubble_id: Bubble_id);
    replace(_$result);
    return _$result;
  }
}

class _$UserLeftBubble extends UserLeftBubble {
  @override
  final int? Bubble_id;

  factory _$UserLeftBubble([void Function(UserLeftBubbleBuilder)? updates]) =>
      (new UserLeftBubbleBuilder()..update(updates))._build();

  _$UserLeftBubble._({this.Bubble_id}) : super._();

  @override
  UserLeftBubble rebuild(void Function(UserLeftBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserLeftBubbleBuilder toBuilder() =>
      new UserLeftBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLeftBubble && Bubble_id == other.Bubble_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Bubble_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserLeftBubble')
          ..add('Bubble_id', Bubble_id))
        .toString();
  }
}

class UserLeftBubbleBuilder
    implements Builder<UserLeftBubble, UserLeftBubbleBuilder> {
  _$UserLeftBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  UserLeftBubbleBuilder();

  UserLeftBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserLeftBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserLeftBubble;
  }

  @override
  void update(void Function(UserLeftBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserLeftBubble build() => _build();

  _$UserLeftBubble _build() {
    final _$result = _$v ?? new _$UserLeftBubble._(Bubble_id: Bubble_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
