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
  @override
  final i.GlobalKey? globalKey;
  @override
  final String? avatar;
  @override
  final String? Background_Color;
  @override
  final Uint8List? Uint8;

  factory _$UserMoved([void Function(UserMovedBuilder)? updates]) =>
      (new UserMovedBuilder()..update(updates))._build();

  _$UserMoved._(
      {this.lat,
      this.lng,
      this.globalKey,
      this.avatar,
      this.Background_Color,
      this.Uint8})
      : super._();

  @override
  UserMoved rebuild(void Function(UserMovedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserMovedBuilder toBuilder() => new UserMovedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserMoved &&
        lat == other.lat &&
        lng == other.lng &&
        globalKey == other.globalKey &&
        avatar == other.avatar &&
        Background_Color == other.Background_Color &&
        Uint8 == other.Uint8;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, lat.hashCode), lng.hashCode),
                    globalKey.hashCode),
                avatar.hashCode),
            Background_Color.hashCode),
        Uint8.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserMoved')
          ..add('lat', lat)
          ..add('lng', lng)
          ..add('globalKey', globalKey)
          ..add('avatar', avatar)
          ..add('Background_Color', Background_Color)
          ..add('Uint8', Uint8))
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

  i.GlobalKey? _globalKey;
  i.GlobalKey? get globalKey => _$this._globalKey;
  set globalKey(i.GlobalKey? globalKey) => _$this._globalKey = globalKey;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _Background_Color;
  String? get Background_Color => _$this._Background_Color;
  set Background_Color(String? Background_Color) =>
      _$this._Background_Color = Background_Color;

  Uint8List? _Uint8;
  Uint8List? get Uint8 => _$this._Uint8;
  set Uint8(Uint8List? Uint8) => _$this._Uint8 = Uint8;

  UserMovedBuilder();

  UserMovedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lat = $v.lat;
      _lng = $v.lng;
      _globalKey = $v.globalKey;
      _avatar = $v.avatar;
      _Background_Color = $v.Background_Color;
      _Uint8 = $v.Uint8;
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
    final _$result = _$v ??
        new _$UserMoved._(
            lat: lat,
            lng: lng,
            globalKey: globalKey,
            avatar: avatar,
            Background_Color: Background_Color,
            Uint8: Uint8);
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

class _$SearchBubblesList extends SearchBubblesList {
  @override
  final String? Keyword;
  @override
  final bool? Change_ViewStatus;

  factory _$SearchBubblesList(
          [void Function(SearchBubblesListBuilder)? updates]) =>
      (new SearchBubblesListBuilder()..update(updates))._build();

  _$SearchBubblesList._({this.Keyword, this.Change_ViewStatus}) : super._();

  @override
  SearchBubblesList rebuild(void Function(SearchBubblesListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchBubblesListBuilder toBuilder() =>
      new SearchBubblesListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchBubblesList &&
        Keyword == other.Keyword &&
        Change_ViewStatus == other.Change_ViewStatus;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Keyword.hashCode), Change_ViewStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchBubblesList')
          ..add('Keyword', Keyword)
          ..add('Change_ViewStatus', Change_ViewStatus))
        .toString();
  }
}

class SearchBubblesListBuilder
    implements Builder<SearchBubblesList, SearchBubblesListBuilder> {
  _$SearchBubblesList? _$v;

  String? _Keyword;
  String? get Keyword => _$this._Keyword;
  set Keyword(String? Keyword) => _$this._Keyword = Keyword;

  bool? _Change_ViewStatus;
  bool? get Change_ViewStatus => _$this._Change_ViewStatus;
  set Change_ViewStatus(bool? Change_ViewStatus) =>
      _$this._Change_ViewStatus = Change_ViewStatus;

  SearchBubblesListBuilder();

  SearchBubblesListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Keyword = $v.Keyword;
      _Change_ViewStatus = $v.Change_ViewStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchBubblesList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchBubblesList;
  }

  @override
  void update(void Function(SearchBubblesListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchBubblesList build() => _build();

  _$SearchBubblesList _build() {
    final _$result = _$v ??
        new _$SearchBubblesList._(
            Keyword: Keyword, Change_ViewStatus: Change_ViewStatus);
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

class _$GetNearbyBubbles extends GetNearbyBubbles {
  @override
  final double? lat;
  @override
  final double? lng;

  factory _$GetNearbyBubbles(
          [void Function(GetNearbyBubblesBuilder)? updates]) =>
      (new GetNearbyBubblesBuilder()..update(updates))._build();

  _$GetNearbyBubbles._({this.lat, this.lng}) : super._();

  @override
  GetNearbyBubbles rebuild(void Function(GetNearbyBubblesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNearbyBubblesBuilder toBuilder() =>
      new GetNearbyBubblesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNearbyBubbles && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, lat.hashCode), lng.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetNearbyBubbles')
          ..add('lat', lat)
          ..add('lng', lng))
        .toString();
  }
}

class GetNearbyBubblesBuilder
    implements Builder<GetNearbyBubbles, GetNearbyBubblesBuilder> {
  _$GetNearbyBubbles? _$v;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lng;
  double? get lng => _$this._lng;
  set lng(double? lng) => _$this._lng = lng;

  GetNearbyBubblesBuilder();

  GetNearbyBubblesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lat = $v.lat;
      _lng = $v.lng;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetNearbyBubbles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNearbyBubbles;
  }

  @override
  void update(void Function(GetNearbyBubblesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNearbyBubbles build() => _build();

  _$GetNearbyBubbles _build() {
    final _$result = _$v ?? new _$GetNearbyBubbles._(lat: lat, lng: lng);
    replace(_$result);
    return _$result;
  }
}

class _$GetPopularNowBubbles extends GetPopularNowBubbles {
  factory _$GetPopularNowBubbles(
          [void Function(GetPopularNowBubblesBuilder)? updates]) =>
      (new GetPopularNowBubblesBuilder()..update(updates))._build();

  _$GetPopularNowBubbles._() : super._();

  @override
  GetPopularNowBubbles rebuild(
          void Function(GetPopularNowBubblesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetPopularNowBubblesBuilder toBuilder() =>
      new GetPopularNowBubblesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetPopularNowBubbles;
  }

  @override
  int get hashCode {
    return 618923906;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GetPopularNowBubbles').toString();
  }
}

class GetPopularNowBubblesBuilder
    implements Builder<GetPopularNowBubbles, GetPopularNowBubblesBuilder> {
  _$GetPopularNowBubbles? _$v;

  GetPopularNowBubblesBuilder();

  @override
  void replace(GetPopularNowBubbles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetPopularNowBubbles;
  }

  @override
  void update(void Function(GetPopularNowBubblesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetPopularNowBubbles build() => _build();

  _$GetPopularNowBubbles _build() {
    final _$result = _$v ?? new _$GetPopularNowBubbles._();
    replace(_$result);
    return _$result;
  }
}

class _$NotifyNearBubble extends NotifyNearBubble {
  @override
  final String? Distance;
  @override
  final String? Title;

  factory _$NotifyNearBubble(
          [void Function(NotifyNearBubbleBuilder)? updates]) =>
      (new NotifyNearBubbleBuilder()..update(updates))._build();

  _$NotifyNearBubble._({this.Distance, this.Title}) : super._();

  @override
  NotifyNearBubble rebuild(void Function(NotifyNearBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotifyNearBubbleBuilder toBuilder() =>
      new NotifyNearBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotifyNearBubble &&
        Distance == other.Distance &&
        Title == other.Title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Distance.hashCode), Title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotifyNearBubble')
          ..add('Distance', Distance)
          ..add('Title', Title))
        .toString();
  }
}

class NotifyNearBubbleBuilder
    implements Builder<NotifyNearBubble, NotifyNearBubbleBuilder> {
  _$NotifyNearBubble? _$v;

  String? _Distance;
  String? get Distance => _$this._Distance;
  set Distance(String? Distance) => _$this._Distance = Distance;

  String? _Title;
  String? get Title => _$this._Title;
  set Title(String? Title) => _$this._Title = Title;

  NotifyNearBubbleBuilder();

  NotifyNearBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Distance = $v.Distance;
      _Title = $v.Title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotifyNearBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotifyNearBubble;
  }

  @override
  void update(void Function(NotifyNearBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotifyNearBubble build() => _build();

  _$NotifyNearBubble _build() {
    final _$result =
        _$v ?? new _$NotifyNearBubble._(Distance: Distance, Title: Title);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeShapStatus extends ChangeShapStatus {
  factory _$ChangeShapStatus(
          [void Function(ChangeShapStatusBuilder)? updates]) =>
      (new ChangeShapStatusBuilder()..update(updates))._build();

  _$ChangeShapStatus._() : super._();

  @override
  ChangeShapStatus rebuild(void Function(ChangeShapStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeShapStatusBuilder toBuilder() =>
      new ChangeShapStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeShapStatus;
  }

  @override
  int get hashCode {
    return 304080668;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ChangeShapStatus').toString();
  }
}

class ChangeShapStatusBuilder
    implements Builder<ChangeShapStatus, ChangeShapStatusBuilder> {
  _$ChangeShapStatus? _$v;

  ChangeShapStatusBuilder();

  @override
  void replace(ChangeShapStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeShapStatus;
  }

  @override
  void update(void Function(ChangeShapStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeShapStatus build() => _build();

  _$ChangeShapStatus _build() {
    final _$result = _$v ?? new _$ChangeShapStatus._();
    replace(_$result);
    return _$result;
  }
}

class _$SaveEventStatus extends SaveEventStatus {
  factory _$SaveEventStatus([void Function(SaveEventStatusBuilder)? updates]) =>
      (new SaveEventStatusBuilder()..update(updates))._build();

  _$SaveEventStatus._() : super._();

  @override
  SaveEventStatus rebuild(void Function(SaveEventStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveEventStatusBuilder toBuilder() =>
      new SaveEventStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveEventStatus;
  }

  @override
  int get hashCode {
    return 1030716695;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SaveEventStatus').toString();
  }
}

class SaveEventStatusBuilder
    implements Builder<SaveEventStatus, SaveEventStatusBuilder> {
  _$SaveEventStatus? _$v;

  SaveEventStatusBuilder();

  @override
  void replace(SaveEventStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SaveEventStatus;
  }

  @override
  void update(void Function(SaveEventStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SaveEventStatus build() => _build();

  _$SaveEventStatus _build() {
    final _$result = _$v ?? new _$SaveEventStatus._();
    replace(_$result);
    return _$result;
  }
}

class _$GetSavedBubbles extends GetSavedBubbles {
  @override
  final int? User_id;

  factory _$GetSavedBubbles([void Function(GetSavedBubblesBuilder)? updates]) =>
      (new GetSavedBubblesBuilder()..update(updates))._build();

  _$GetSavedBubbles._({this.User_id}) : super._();

  @override
  GetSavedBubbles rebuild(void Function(GetSavedBubblesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSavedBubblesBuilder toBuilder() =>
      new GetSavedBubblesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSavedBubbles && User_id == other.User_id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, User_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetSavedBubbles')
          ..add('User_id', User_id))
        .toString();
  }
}

class GetSavedBubblesBuilder
    implements Builder<GetSavedBubbles, GetSavedBubblesBuilder> {
  _$GetSavedBubbles? _$v;

  int? _User_id;
  int? get User_id => _$this._User_id;
  set User_id(int? User_id) => _$this._User_id = User_id;

  GetSavedBubblesBuilder();

  GetSavedBubblesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _User_id = $v.User_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetSavedBubbles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetSavedBubbles;
  }

  @override
  void update(void Function(GetSavedBubblesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetSavedBubbles build() => _build();

  _$GetSavedBubbles _build() {
    final _$result = _$v ?? new _$GetSavedBubbles._(User_id: User_id);
    replace(_$result);
    return _$result;
  }
}

class _$ToggleSaveBubble extends ToggleSaveBubble {
  @override
  final int? Bubble_id;
  @override
  final int? index;
  @override
  final String? List_type;
  @override
  final bool? Saved_Status;

  factory _$ToggleSaveBubble(
          [void Function(ToggleSaveBubbleBuilder)? updates]) =>
      (new ToggleSaveBubbleBuilder()..update(updates))._build();

  _$ToggleSaveBubble._(
      {this.Bubble_id, this.index, this.List_type, this.Saved_Status})
      : super._();

  @override
  ToggleSaveBubble rebuild(void Function(ToggleSaveBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToggleSaveBubbleBuilder toBuilder() =>
      new ToggleSaveBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToggleSaveBubble &&
        Bubble_id == other.Bubble_id &&
        index == other.index &&
        List_type == other.List_type &&
        Saved_Status == other.Saved_Status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, Bubble_id.hashCode), index.hashCode),
            List_type.hashCode),
        Saved_Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ToggleSaveBubble')
          ..add('Bubble_id', Bubble_id)
          ..add('index', index)
          ..add('List_type', List_type)
          ..add('Saved_Status', Saved_Status))
        .toString();
  }
}

class ToggleSaveBubbleBuilder
    implements Builder<ToggleSaveBubble, ToggleSaveBubbleBuilder> {
  _$ToggleSaveBubble? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _List_type;
  String? get List_type => _$this._List_type;
  set List_type(String? List_type) => _$this._List_type = List_type;

  bool? _Saved_Status;
  bool? get Saved_Status => _$this._Saved_Status;
  set Saved_Status(bool? Saved_Status) => _$this._Saved_Status = Saved_Status;

  ToggleSaveBubbleBuilder();

  ToggleSaveBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _index = $v.index;
      _List_type = $v.List_type;
      _Saved_Status = $v.Saved_Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ToggleSaveBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ToggleSaveBubble;
  }

  @override
  void update(void Function(ToggleSaveBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToggleSaveBubble build() => _build();

  _$ToggleSaveBubble _build() {
    final _$result = _$v ??
        new _$ToggleSaveBubble._(
            Bubble_id: Bubble_id,
            index: index,
            List_type: List_type,
            Saved_Status: Saved_Status);
    replace(_$result);
    return _$result;
  }
}

class _$ToggleSaveBubbleEventScreen extends ToggleSaveBubbleEventScreen {
  @override
  final int? Bubble_id;
  @override
  final int? index;
  @override
  final String? List_type;
  @override
  final bool? Saved_Status;

  factory _$ToggleSaveBubbleEventScreen(
          [void Function(ToggleSaveBubbleEventScreenBuilder)? updates]) =>
      (new ToggleSaveBubbleEventScreenBuilder()..update(updates))._build();

  _$ToggleSaveBubbleEventScreen._(
      {this.Bubble_id, this.index, this.List_type, this.Saved_Status})
      : super._();

  @override
  ToggleSaveBubbleEventScreen rebuild(
          void Function(ToggleSaveBubbleEventScreenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToggleSaveBubbleEventScreenBuilder toBuilder() =>
      new ToggleSaveBubbleEventScreenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToggleSaveBubbleEventScreen &&
        Bubble_id == other.Bubble_id &&
        index == other.index &&
        List_type == other.List_type &&
        Saved_Status == other.Saved_Status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, Bubble_id.hashCode), index.hashCode),
            List_type.hashCode),
        Saved_Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ToggleSaveBubbleEventScreen')
          ..add('Bubble_id', Bubble_id)
          ..add('index', index)
          ..add('List_type', List_type)
          ..add('Saved_Status', Saved_Status))
        .toString();
  }
}

class ToggleSaveBubbleEventScreenBuilder
    implements
        Builder<ToggleSaveBubbleEventScreen,
            ToggleSaveBubbleEventScreenBuilder> {
  _$ToggleSaveBubbleEventScreen? _$v;

  int? _Bubble_id;
  int? get Bubble_id => _$this._Bubble_id;
  set Bubble_id(int? Bubble_id) => _$this._Bubble_id = Bubble_id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _List_type;
  String? get List_type => _$this._List_type;
  set List_type(String? List_type) => _$this._List_type = List_type;

  bool? _Saved_Status;
  bool? get Saved_Status => _$this._Saved_Status;
  set Saved_Status(bool? Saved_Status) => _$this._Saved_Status = Saved_Status;

  ToggleSaveBubbleEventScreenBuilder();

  ToggleSaveBubbleEventScreenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubble_id = $v.Bubble_id;
      _index = $v.index;
      _List_type = $v.List_type;
      _Saved_Status = $v.Saved_Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ToggleSaveBubbleEventScreen other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ToggleSaveBubbleEventScreen;
  }

  @override
  void update(void Function(ToggleSaveBubbleEventScreenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToggleSaveBubbleEventScreen build() => _build();

  _$ToggleSaveBubbleEventScreen _build() {
    final _$result = _$v ??
        new _$ToggleSaveBubbleEventScreen._(
            Bubble_id: Bubble_id,
            index: index,
            List_type: List_type,
            Saved_Status: Saved_Status);
    replace(_$result);
    return _$result;
  }
}

class _$GiveHimListOfBoolean extends GiveHimListOfBoolean {
  @override
  final List<bool>? List_Saved_Status;

  factory _$GiveHimListOfBoolean(
          [void Function(GiveHimListOfBooleanBuilder)? updates]) =>
      (new GiveHimListOfBooleanBuilder()..update(updates))._build();

  _$GiveHimListOfBoolean._({this.List_Saved_Status}) : super._();

  @override
  GiveHimListOfBoolean rebuild(
          void Function(GiveHimListOfBooleanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GiveHimListOfBooleanBuilder toBuilder() =>
      new GiveHimListOfBooleanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GiveHimListOfBoolean &&
        List_Saved_Status == other.List_Saved_Status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, List_Saved_Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GiveHimListOfBoolean')
          ..add('List_Saved_Status', List_Saved_Status))
        .toString();
  }
}

class GiveHimListOfBooleanBuilder
    implements Builder<GiveHimListOfBoolean, GiveHimListOfBooleanBuilder> {
  _$GiveHimListOfBoolean? _$v;

  List<bool>? _List_Saved_Status;
  List<bool>? get List_Saved_Status => _$this._List_Saved_Status;
  set List_Saved_Status(List<bool>? List_Saved_Status) =>
      _$this._List_Saved_Status = List_Saved_Status;

  GiveHimListOfBooleanBuilder();

  GiveHimListOfBooleanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _List_Saved_Status = $v.List_Saved_Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GiveHimListOfBoolean other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GiveHimListOfBoolean;
  }

  @override
  void update(void Function(GiveHimListOfBooleanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GiveHimListOfBoolean build() => _build();

  _$GiveHimListOfBoolean _build() {
    final _$result = _$v ??
        new _$GiveHimListOfBoolean._(List_Saved_Status: List_Saved_Status);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeToDetailUiState extends ChangeToDetailUiState {
  @override
  final BubbleData? Bubbledata;
  @override
  final bool? Status;

  factory _$ChangeToDetailUiState(
          [void Function(ChangeToDetailUiStateBuilder)? updates]) =>
      (new ChangeToDetailUiStateBuilder()..update(updates))._build();

  _$ChangeToDetailUiState._({this.Bubbledata, this.Status}) : super._();

  @override
  ChangeToDetailUiState rebuild(
          void Function(ChangeToDetailUiStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeToDetailUiStateBuilder toBuilder() =>
      new ChangeToDetailUiStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeToDetailUiState &&
        Bubbledata == other.Bubbledata &&
        Status == other.Status;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Bubbledata.hashCode), Status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeToDetailUiState')
          ..add('Bubbledata', Bubbledata)
          ..add('Status', Status))
        .toString();
  }
}

class ChangeToDetailUiStateBuilder
    implements Builder<ChangeToDetailUiState, ChangeToDetailUiStateBuilder> {
  _$ChangeToDetailUiState? _$v;

  BubbleData? _Bubbledata;
  BubbleData? get Bubbledata => _$this._Bubbledata;
  set Bubbledata(BubbleData? Bubbledata) => _$this._Bubbledata = Bubbledata;

  bool? _Status;
  bool? get Status => _$this._Status;
  set Status(bool? Status) => _$this._Status = Status;

  ChangeToDetailUiStateBuilder();

  ChangeToDetailUiStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Bubbledata = $v.Bubbledata;
      _Status = $v.Status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeToDetailUiState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeToDetailUiState;
  }

  @override
  void update(void Function(ChangeToDetailUiStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeToDetailUiState build() => _build();

  _$ChangeToDetailUiState _build() {
    final _$result = _$v ??
        new _$ChangeToDetailUiState._(Bubbledata: Bubbledata, Status: Status);
    replace(_$result);
    return _$result;
  }
}

class _$SwitchBetweenDetailUi extends SwitchBetweenDetailUi {
  factory _$SwitchBetweenDetailUi(
          [void Function(SwitchBetweenDetailUiBuilder)? updates]) =>
      (new SwitchBetweenDetailUiBuilder()..update(updates))._build();

  _$SwitchBetweenDetailUi._() : super._();

  @override
  SwitchBetweenDetailUi rebuild(
          void Function(SwitchBetweenDetailUiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwitchBetweenDetailUiBuilder toBuilder() =>
      new SwitchBetweenDetailUiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwitchBetweenDetailUi;
  }

  @override
  int get hashCode {
    return 127570363;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SwitchBetweenDetailUi').toString();
  }
}

class SwitchBetweenDetailUiBuilder
    implements Builder<SwitchBetweenDetailUi, SwitchBetweenDetailUiBuilder> {
  _$SwitchBetweenDetailUi? _$v;

  SwitchBetweenDetailUiBuilder();

  @override
  void replace(SwitchBetweenDetailUi other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwitchBetweenDetailUi;
  }

  @override
  void update(void Function(SwitchBetweenDetailUiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwitchBetweenDetailUi build() => _build();

  _$SwitchBetweenDetailUi _build() {
    final _$result = _$v ?? new _$SwitchBetweenDetailUi._();
    replace(_$result);
    return _$result;
  }
}

class _$AddMarker extends AddMarker {
  @override
  final Marker marker;
  @override
  final Circle circle;

  factory _$AddMarker([void Function(AddMarkerBuilder)? updates]) =>
      (new AddMarkerBuilder()..update(updates))._build();

  _$AddMarker._({required this.marker, required this.circle}) : super._() {
    BuiltValueNullFieldError.checkNotNull(marker, 'AddMarker', 'marker');
    BuiltValueNullFieldError.checkNotNull(circle, 'AddMarker', 'circle');
  }

  @override
  AddMarker rebuild(void Function(AddMarkerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddMarkerBuilder toBuilder() => new AddMarkerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddMarker &&
        marker == other.marker &&
        circle == other.circle;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, marker.hashCode), circle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddMarker')
          ..add('marker', marker)
          ..add('circle', circle))
        .toString();
  }
}

class AddMarkerBuilder implements Builder<AddMarker, AddMarkerBuilder> {
  _$AddMarker? _$v;

  Marker? _marker;
  Marker? get marker => _$this._marker;
  set marker(Marker? marker) => _$this._marker = marker;

  Circle? _circle;
  Circle? get circle => _$this._circle;
  set circle(Circle? circle) => _$this._circle = circle;

  AddMarkerBuilder();

  AddMarkerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _marker = $v.marker;
      _circle = $v.circle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddMarker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddMarker;
  }

  @override
  void update(void Function(AddMarkerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddMarker build() => _build();

  _$AddMarker _build() {
    final _$result = _$v ??
        new _$AddMarker._(
            marker: BuiltValueNullFieldError.checkNotNull(
                marker, 'AddMarker', 'marker'),
            circle: BuiltValueNullFieldError.checkNotNull(
                circle, 'AddMarker', 'circle'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
