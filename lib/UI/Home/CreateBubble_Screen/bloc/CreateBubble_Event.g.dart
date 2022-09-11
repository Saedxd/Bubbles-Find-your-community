// GENERATED CODE - DO NOT MODIFY BY HAND

part of CreateBubble_Event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeDone1 extends ChangeDone1 {
  @override
  final bool? DoneColor1;

  factory _$ChangeDone1([void Function(ChangeDone1Builder)? updates]) =>
      (new ChangeDone1Builder()..update(updates))._build();

  _$ChangeDone1._({this.DoneColor1}) : super._();

  @override
  ChangeDone1 rebuild(void Function(ChangeDone1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeDone1Builder toBuilder() => new ChangeDone1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeDone1 && DoneColor1 == other.DoneColor1;
  }

  @override
  int get hashCode {
    return $jf($jc(0, DoneColor1.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeDone1')
          ..add('DoneColor1', DoneColor1))
        .toString();
  }
}

class ChangeDone1Builder implements Builder<ChangeDone1, ChangeDone1Builder> {
  _$ChangeDone1? _$v;

  bool? _DoneColor1;
  bool? get DoneColor1 => _$this._DoneColor1;
  set DoneColor1(bool? DoneColor1) => _$this._DoneColor1 = DoneColor1;

  ChangeDone1Builder();

  ChangeDone1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _DoneColor1 = $v.DoneColor1;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeDone1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeDone1;
  }

  @override
  void update(void Function(ChangeDone1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeDone1 build() => _build();

  _$ChangeDone1 _build() {
    final _$result = _$v ?? new _$ChangeDone1._(DoneColor1: DoneColor1);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeDone2 extends ChangeDone2 {
  @override
  final bool? DoneColor2;

  factory _$ChangeDone2([void Function(ChangeDone2Builder)? updates]) =>
      (new ChangeDone2Builder()..update(updates))._build();

  _$ChangeDone2._({this.DoneColor2}) : super._();

  @override
  ChangeDone2 rebuild(void Function(ChangeDone2Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeDone2Builder toBuilder() => new ChangeDone2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeDone2 && DoneColor2 == other.DoneColor2;
  }

  @override
  int get hashCode {
    return $jf($jc(0, DoneColor2.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeDone2')
          ..add('DoneColor2', DoneColor2))
        .toString();
  }
}

class ChangeDone2Builder implements Builder<ChangeDone2, ChangeDone2Builder> {
  _$ChangeDone2? _$v;

  bool? _DoneColor2;
  bool? get DoneColor2 => _$this._DoneColor2;
  set DoneColor2(bool? DoneColor2) => _$this._DoneColor2 = DoneColor2;

  ChangeDone2Builder();

  ChangeDone2Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _DoneColor2 = $v.DoneColor2;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeDone2 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeDone2;
  }

  @override
  void update(void Function(ChangeDone2Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeDone2 build() => _build();

  _$ChangeDone2 _build() {
    final _$result = _$v ?? new _$ChangeDone2._(DoneColor2: DoneColor2);
    replace(_$result);
    return _$result;
  }
}

class _$GetFreinds extends GetFreinds {
  factory _$GetFreinds([void Function(GetFreindsBuilder)? updates]) =>
      (new GetFreindsBuilder()..update(updates))._build();

  _$GetFreinds._() : super._();

  @override
  GetFreinds rebuild(void Function(GetFreindsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetFreindsBuilder toBuilder() => new GetFreindsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetFreinds;
  }

  @override
  int get hashCode {
    return 680793356;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetFreinds').toString();
  }
}

class GetFreindsBuilder implements Builder<GetFreinds, GetFreindsBuilder> {
  _$GetFreinds? _$v;

  GetFreindsBuilder();

  @override
  void replace(GetFreinds other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetFreinds;
  }

  @override
  void update(void Function(GetFreindsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetFreinds build() => _build();

  _$GetFreinds _build() {
    final _$result = _$v ?? new _$GetFreinds._();
    replace(_$result);
    return _$result;
  }
}

class _$CreateBubble extends CreateBubble {
  @override
  final double? lng;
  @override
  final double? lat;
  @override
  final int? raduis;
  @override
  final List<String>? Dates;
  @override
  final List<int>? OrganizersId;
  @override
  final String? Start_Date;
  @override
  final String? End_Date;
  @override
  final List<String>? Base64Images;
  @override
  final String? ColorS;
  @override
  final String? LOcation;
  @override
  final String? Title;
  @override
  final String? Description;
  @override
  final int? Cateogory_id;

  factory _$CreateBubble([void Function(CreateBubbleBuilder)? updates]) =>
      (new CreateBubbleBuilder()..update(updates))._build();

  _$CreateBubble._(
      {this.lng,
      this.lat,
      this.raduis,
      this.Dates,
      this.OrganizersId,
      this.Start_Date,
      this.End_Date,
      this.Base64Images,
      this.ColorS,
      this.LOcation,
      this.Title,
      this.Description,
      this.Cateogory_id})
      : super._();

  @override
  CreateBubble rebuild(void Function(CreateBubbleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateBubbleBuilder toBuilder() => new CreateBubbleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateBubble &&
        lng == other.lng &&
        lat == other.lat &&
        raduis == other.raduis &&
        Dates == other.Dates &&
        OrganizersId == other.OrganizersId &&
        Start_Date == other.Start_Date &&
        End_Date == other.End_Date &&
        Base64Images == other.Base64Images &&
        ColorS == other.ColorS &&
        LOcation == other.LOcation &&
        Title == other.Title &&
        Description == other.Description &&
        Cateogory_id == other.Cateogory_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, lng.hashCode),
                                                    lat.hashCode),
                                                raduis.hashCode),
                                            Dates.hashCode),
                                        OrganizersId.hashCode),
                                    Start_Date.hashCode),
                                End_Date.hashCode),
                            Base64Images.hashCode),
                        ColorS.hashCode),
                    LOcation.hashCode),
                Title.hashCode),
            Description.hashCode),
        Cateogory_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateBubble')
          ..add('lng', lng)
          ..add('lat', lat)
          ..add('raduis', raduis)
          ..add('Dates', Dates)
          ..add('OrganizersId', OrganizersId)
          ..add('Start_Date', Start_Date)
          ..add('End_Date', End_Date)
          ..add('Base64Images', Base64Images)
          ..add('ColorS', ColorS)
          ..add('LOcation', LOcation)
          ..add('Title', Title)
          ..add('Description', Description)
          ..add('Cateogory_id', Cateogory_id))
        .toString();
  }
}

class CreateBubbleBuilder
    implements Builder<CreateBubble, CreateBubbleBuilder> {
  _$CreateBubble? _$v;

  double? _lng;
  double? get lng => _$this._lng;
  set lng(double? lng) => _$this._lng = lng;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  int? _raduis;
  int? get raduis => _$this._raduis;
  set raduis(int? raduis) => _$this._raduis = raduis;

  List<String>? _Dates;
  List<String>? get Dates => _$this._Dates;
  set Dates(List<String>? Dates) => _$this._Dates = Dates;

  List<int>? _OrganizersId;
  List<int>? get OrganizersId => _$this._OrganizersId;
  set OrganizersId(List<int>? OrganizersId) =>
      _$this._OrganizersId = OrganizersId;

  String? _Start_Date;
  String? get Start_Date => _$this._Start_Date;
  set Start_Date(String? Start_Date) => _$this._Start_Date = Start_Date;

  String? _End_Date;
  String? get End_Date => _$this._End_Date;
  set End_Date(String? End_Date) => _$this._End_Date = End_Date;

  List<String>? _Base64Images;
  List<String>? get Base64Images => _$this._Base64Images;
  set Base64Images(List<String>? Base64Images) =>
      _$this._Base64Images = Base64Images;

  String? _ColorS;
  String? get ColorS => _$this._ColorS;
  set ColorS(String? ColorS) => _$this._ColorS = ColorS;

  String? _LOcation;
  String? get LOcation => _$this._LOcation;
  set LOcation(String? LOcation) => _$this._LOcation = LOcation;

  String? _Title;
  String? get Title => _$this._Title;
  set Title(String? Title) => _$this._Title = Title;

  String? _Description;
  String? get Description => _$this._Description;
  set Description(String? Description) => _$this._Description = Description;

  int? _Cateogory_id;
  int? get Cateogory_id => _$this._Cateogory_id;
  set Cateogory_id(int? Cateogory_id) => _$this._Cateogory_id = Cateogory_id;

  CreateBubbleBuilder();

  CreateBubbleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lng = $v.lng;
      _lat = $v.lat;
      _raduis = $v.raduis;
      _Dates = $v.Dates;
      _OrganizersId = $v.OrganizersId;
      _Start_Date = $v.Start_Date;
      _End_Date = $v.End_Date;
      _Base64Images = $v.Base64Images;
      _ColorS = $v.ColorS;
      _LOcation = $v.LOcation;
      _Title = $v.Title;
      _Description = $v.Description;
      _Cateogory_id = $v.Cateogory_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateBubble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateBubble;
  }

  @override
  void update(void Function(CreateBubbleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateBubble build() => _build();

  _$CreateBubble _build() {
    final _$result = _$v ??
        new _$CreateBubble._(
            lng: lng,
            lat: lat,
            raduis: raduis,
            Dates: Dates,
            OrganizersId: OrganizersId,
            Start_Date: Start_Date,
            End_Date: End_Date,
            Base64Images: Base64Images,
            ColorS: ColorS,
            LOcation: LOcation,
            Title: Title,
            Description: Description,
            Cateogory_id: Cateogory_id);
    replace(_$result);
    return _$result;
  }
}

class _$SearchFreinds extends SearchFreinds {
  @override
  final String? Keyword;

  factory _$SearchFreinds([void Function(SearchFreindsBuilder)? updates]) =>
      (new SearchFreindsBuilder()..update(updates))._build();

  _$SearchFreinds._({this.Keyword}) : super._();

  @override
  SearchFreinds rebuild(void Function(SearchFreindsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchFreindsBuilder toBuilder() => new SearchFreindsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchFreinds && Keyword == other.Keyword;
  }

  @override
  int get hashCode {
    return $jf($jc(0, Keyword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchFreinds')
          ..add('Keyword', Keyword))
        .toString();
  }
}

class SearchFreindsBuilder
    implements Builder<SearchFreinds, SearchFreindsBuilder> {
  _$SearchFreinds? _$v;

  String? _Keyword;
  String? get Keyword => _$this._Keyword;
  set Keyword(String? Keyword) => _$this._Keyword = Keyword;

  SearchFreindsBuilder();

  SearchFreindsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Keyword = $v.Keyword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchFreinds other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchFreinds;
  }

  @override
  void update(void Function(SearchFreindsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchFreinds build() => _build();

  _$SearchFreinds _build() {
    final _$result = _$v ?? new _$SearchFreinds._(Keyword: Keyword);
    replace(_$result);
    return _$result;
  }
}

class _$ChangeDone3 extends ChangeDone3 {
  @override
  final bool? ChangeDone33;

  factory _$ChangeDone3([void Function(ChangeDone3Builder)? updates]) =>
      (new ChangeDone3Builder()..update(updates))._build();

  _$ChangeDone3._({this.ChangeDone33}) : super._();

  @override
  ChangeDone3 rebuild(void Function(ChangeDone3Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeDone3Builder toBuilder() => new ChangeDone3Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeDone3 && ChangeDone33 == other.ChangeDone33;
  }

  @override
  int get hashCode {
    return $jf($jc(0, ChangeDone33.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeDone3')
          ..add('ChangeDone33', ChangeDone33))
        .toString();
  }
}

class ChangeDone3Builder implements Builder<ChangeDone3, ChangeDone3Builder> {
  _$ChangeDone3? _$v;

  bool? _ChangeDone33;
  bool? get ChangeDone33 => _$this._ChangeDone33;
  set ChangeDone33(bool? ChangeDone33) => _$this._ChangeDone33 = ChangeDone33;

  ChangeDone3Builder();

  ChangeDone3Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ChangeDone33 = $v.ChangeDone33;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeDone3 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeDone3;
  }

  @override
  void update(void Function(ChangeDone3Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeDone3 build() => _build();

  _$ChangeDone3 _build() {
    final _$result = _$v ?? new _$ChangeDone3._(ChangeDone33: ChangeDone33);
    replace(_$result);
    return _$result;
  }
}

class _$AddStartandEndTime extends AddStartandEndTime {
  @override
  final String? StartTime;
  @override
  final String? EndTime;

  factory _$AddStartandEndTime(
          [void Function(AddStartandEndTimeBuilder)? updates]) =>
      (new AddStartandEndTimeBuilder()..update(updates))._build();

  _$AddStartandEndTime._({this.StartTime, this.EndTime}) : super._();

  @override
  AddStartandEndTime rebuild(
          void Function(AddStartandEndTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddStartandEndTimeBuilder toBuilder() =>
      new AddStartandEndTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddStartandEndTime &&
        StartTime == other.StartTime &&
        EndTime == other.EndTime;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, StartTime.hashCode), EndTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddStartandEndTime')
          ..add('StartTime', StartTime)
          ..add('EndTime', EndTime))
        .toString();
  }
}

class AddStartandEndTimeBuilder
    implements Builder<AddStartandEndTime, AddStartandEndTimeBuilder> {
  _$AddStartandEndTime? _$v;

  String? _StartTime;
  String? get StartTime => _$this._StartTime;
  set StartTime(String? StartTime) => _$this._StartTime = StartTime;

  String? _EndTime;
  String? get EndTime => _$this._EndTime;
  set EndTime(String? EndTime) => _$this._EndTime = EndTime;

  AddStartandEndTimeBuilder();

  AddStartandEndTimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _StartTime = $v.StartTime;
      _EndTime = $v.EndTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddStartandEndTime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddStartandEndTime;
  }

  @override
  void update(void Function(AddStartandEndTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddStartandEndTime build() => _build();

  _$AddStartandEndTime _build() {
    final _$result = _$v ??
        new _$AddStartandEndTime._(StartTime: StartTime, EndTime: EndTime);
    replace(_$result);
    return _$result;
  }
}

class _$ChangePickedColor extends ChangePickedColor {
  @override
  final String? PickedColor;

  factory _$ChangePickedColor(
          [void Function(ChangePickedColorBuilder)? updates]) =>
      (new ChangePickedColorBuilder()..update(updates))._build();

  _$ChangePickedColor._({this.PickedColor}) : super._();

  @override
  ChangePickedColor rebuild(void Function(ChangePickedColorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangePickedColorBuilder toBuilder() =>
      new ChangePickedColorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangePickedColor && PickedColor == other.PickedColor;
  }

  @override
  int get hashCode {
    return $jf($jc(0, PickedColor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangePickedColor')
          ..add('PickedColor', PickedColor))
        .toString();
  }
}

class ChangePickedColorBuilder
    implements Builder<ChangePickedColor, ChangePickedColorBuilder> {
  _$ChangePickedColor? _$v;

  String? _PickedColor;
  String? get PickedColor => _$this._PickedColor;
  set PickedColor(String? PickedColor) => _$this._PickedColor = PickedColor;

  ChangePickedColorBuilder();

  ChangePickedColorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _PickedColor = $v.PickedColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangePickedColor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangePickedColor;
  }

  @override
  void update(void Function(ChangePickedColorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangePickedColor build() => _build();

  _$ChangePickedColor _build() {
    final _$result = _$v ?? new _$ChangePickedColor._(PickedColor: PickedColor);
    replace(_$result);
    return _$result;
  }
}

class _$GetEventCateogories extends GetEventCateogories {
  factory _$GetEventCateogories(
          [void Function(GetEventCateogoriesBuilder)? updates]) =>
      (new GetEventCateogoriesBuilder()..update(updates))._build();

  _$GetEventCateogories._() : super._();

  @override
  GetEventCateogories rebuild(
          void Function(GetEventCateogoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetEventCateogoriesBuilder toBuilder() =>
      new GetEventCateogoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetEventCateogories;
  }

  @override
  int get hashCode {
    return 743596468;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetEventCateogories').toString();
  }
}

class GetEventCateogoriesBuilder
    implements Builder<GetEventCateogories, GetEventCateogoriesBuilder> {
  _$GetEventCateogories? _$v;

  GetEventCateogoriesBuilder();

  @override
  void replace(GetEventCateogories other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetEventCateogories;
  }

  @override
  void update(void Function(GetEventCateogoriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetEventCateogories build() => _build();

  _$GetEventCateogories _build() {
    final _$result = _$v ?? new _$GetEventCateogories._();
    replace(_$result);
    return _$result;
  }
}

class _$SelectColor extends SelectColor {
  @override
  final int? Index;
  @override
  final String? PickedColor;

  factory _$SelectColor([void Function(SelectColorBuilder)? updates]) =>
      (new SelectColorBuilder()..update(updates))._build();

  _$SelectColor._({this.Index, this.PickedColor}) : super._();

  @override
  SelectColor rebuild(void Function(SelectColorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SelectColorBuilder toBuilder() => new SelectColorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SelectColor &&
        Index == other.Index &&
        PickedColor == other.PickedColor;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, Index.hashCode), PickedColor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SelectColor')
          ..add('Index', Index)
          ..add('PickedColor', PickedColor))
        .toString();
  }
}

class SelectColorBuilder implements Builder<SelectColor, SelectColorBuilder> {
  _$SelectColor? _$v;

  int? _Index;
  int? get Index => _$this._Index;
  set Index(int? Index) => _$this._Index = Index;

  String? _PickedColor;
  String? get PickedColor => _$this._PickedColor;
  set PickedColor(String? PickedColor) => _$this._PickedColor = PickedColor;

  SelectColorBuilder();

  SelectColorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Index = $v.Index;
      _PickedColor = $v.PickedColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SelectColor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SelectColor;
  }

  @override
  void update(void Function(SelectColorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SelectColor build() => _build();

  _$SelectColor _build() {
    final _$result =
        _$v ?? new _$SelectColor._(Index: Index, PickedColor: PickedColor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
