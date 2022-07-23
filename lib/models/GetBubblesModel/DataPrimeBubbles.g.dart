// GENERATED CODE - DO NOT MODIFY BY HAND

part of DataPrimeBubbles;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataPrimeBubbles> _$dataPrimeBubblesSerializer =
    new _$DataPrimeBubblesSerializer();

class _$DataPrimeBubblesSerializer
    implements StructuredSerializer<DataPrimeBubbles> {
  @override
  final Iterable<Type> types = const [DataPrimeBubbles, _$DataPrimeBubbles];
  @override
  final String wireName = 'DataPrimeBubbles';

  @override
  Iterable<Object?> serialize(Serializers serializers, DataPrimeBubbles object,
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
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.draw_type;
    if (value != null) {
      result
        ..add('draw_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lng;
    if (value != null) {
      result
        ..add('lng')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.is_available;
    if (value != null) {
      result
        ..add('is_available')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.start_event_date;
    if (value != null) {
      result
        ..add('start_event_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.end_event_date;
    if (value != null) {
      result
        ..add('end_event_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organizers;
    if (value != null) {
      result
        ..add('organizers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(OrganizersListModel)])));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ImagesEventListModel)])));
    }
    value = object.dates;
    if (value != null) {
      result
        ..add('dates')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DatesEventListModel)])));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.radius;
    if (value != null) {
      result
        ..add('radius')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.created_by;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CreatedByModel)));
    }
    value = object.is_save;
    if (value != null) {
      result
        ..add('is_save')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  DataPrimeBubbles deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataPrimeBubblesBuilder();

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
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'draw_type':
          result.draw_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lng':
          result.lng = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'is_available':
          result.is_available = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start_event_date':
          result.start_event_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'end_event_date':
          result.end_event_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organizers':
          result.organizers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(OrganizersListModel)]))!
              as BuiltList<Object?>);
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ImagesEventListModel)]))!
              as BuiltList<Object?>);
          break;
        case 'dates':
          result.dates.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DatesEventListModel)]))!
              as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'radius':
          result.radius = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_by':
          result.created_by.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CreatedByModel))!
              as CreatedByModel);
          break;
        case 'is_save':
          result.is_save = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$DataPrimeBubbles extends DataPrimeBubbles {
  @override
  final String? title;
  @override
  final String? color;
  @override
  final String? location;
  @override
  final String? description;
  @override
  final String? draw_type;
  @override
  final String? type;
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final String? is_available;
  @override
  final String? start_event_date;
  @override
  final String? end_event_date;
  @override
  final BuiltList<OrganizersListModel>? organizers;
  @override
  final BuiltList<ImagesEventListModel>? images;
  @override
  final BuiltList<DatesEventListModel>? dates;
  @override
  final int? id;
  @override
  final double? radius;
  @override
  final CreatedByModel? created_by;
  @override
  final bool? is_save;

  factory _$DataPrimeBubbles(
          [void Function(DataPrimeBubblesBuilder)? updates]) =>
      (new DataPrimeBubblesBuilder()..update(updates))._build();

  _$DataPrimeBubbles._(
      {this.title,
      this.color,
      this.location,
      this.description,
      this.draw_type,
      this.type,
      this.lat,
      this.lng,
      this.is_available,
      this.start_event_date,
      this.end_event_date,
      this.organizers,
      this.images,
      this.dates,
      this.id,
      this.radius,
      this.created_by,
      this.is_save})
      : super._();

  @override
  DataPrimeBubbles rebuild(void Function(DataPrimeBubblesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataPrimeBubblesBuilder toBuilder() =>
      new DataPrimeBubblesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataPrimeBubbles &&
        title == other.title &&
        color == other.color &&
        location == other.location &&
        description == other.description &&
        draw_type == other.draw_type &&
        type == other.type &&
        lat == other.lat &&
        lng == other.lng &&
        is_available == other.is_available &&
        start_event_date == other.start_event_date &&
        end_event_date == other.end_event_date &&
        organizers == other.organizers &&
        images == other.images &&
        dates == other.dates &&
        id == other.id &&
        radius == other.radius &&
        created_by == other.created_by &&
        is_save == other.is_save;
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            title
                                                                                .hashCode),
                                                                        color
                                                                            .hashCode),
                                                                    location
                                                                        .hashCode),
                                                                description
                                                                    .hashCode),
                                                            draw_type.hashCode),
                                                        type.hashCode),
                                                    lat.hashCode),
                                                lng.hashCode),
                                            is_available.hashCode),
                                        start_event_date.hashCode),
                                    end_event_date.hashCode),
                                organizers.hashCode),
                            images.hashCode),
                        dates.hashCode),
                    id.hashCode),
                radius.hashCode),
            created_by.hashCode),
        is_save.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataPrimeBubbles')
          ..add('title', title)
          ..add('color', color)
          ..add('location', location)
          ..add('description', description)
          ..add('draw_type', draw_type)
          ..add('type', type)
          ..add('lat', lat)
          ..add('lng', lng)
          ..add('is_available', is_available)
          ..add('start_event_date', start_event_date)
          ..add('end_event_date', end_event_date)
          ..add('organizers', organizers)
          ..add('images', images)
          ..add('dates', dates)
          ..add('id', id)
          ..add('radius', radius)
          ..add('created_by', created_by)
          ..add('is_save', is_save))
        .toString();
  }
}

class DataPrimeBubblesBuilder
    implements Builder<DataPrimeBubbles, DataPrimeBubblesBuilder> {
  _$DataPrimeBubbles? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _draw_type;
  String? get draw_type => _$this._draw_type;
  set draw_type(String? draw_type) => _$this._draw_type = draw_type;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lng;
  double? get lng => _$this._lng;
  set lng(double? lng) => _$this._lng = lng;

  String? _is_available;
  String? get is_available => _$this._is_available;
  set is_available(String? is_available) => _$this._is_available = is_available;

  String? _start_event_date;
  String? get start_event_date => _$this._start_event_date;
  set start_event_date(String? start_event_date) =>
      _$this._start_event_date = start_event_date;

  String? _end_event_date;
  String? get end_event_date => _$this._end_event_date;
  set end_event_date(String? end_event_date) =>
      _$this._end_event_date = end_event_date;

  ListBuilder<OrganizersListModel>? _organizers;
  ListBuilder<OrganizersListModel> get organizers =>
      _$this._organizers ??= new ListBuilder<OrganizersListModel>();
  set organizers(ListBuilder<OrganizersListModel>? organizers) =>
      _$this._organizers = organizers;

  ListBuilder<ImagesEventListModel>? _images;
  ListBuilder<ImagesEventListModel> get images =>
      _$this._images ??= new ListBuilder<ImagesEventListModel>();
  set images(ListBuilder<ImagesEventListModel>? images) =>
      _$this._images = images;

  ListBuilder<DatesEventListModel>? _dates;
  ListBuilder<DatesEventListModel> get dates =>
      _$this._dates ??= new ListBuilder<DatesEventListModel>();
  set dates(ListBuilder<DatesEventListModel>? dates) => _$this._dates = dates;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  double? _radius;
  double? get radius => _$this._radius;
  set radius(double? radius) => _$this._radius = radius;

  CreatedByModelBuilder? _created_by;
  CreatedByModelBuilder get created_by =>
      _$this._created_by ??= new CreatedByModelBuilder();
  set created_by(CreatedByModelBuilder? created_by) =>
      _$this._created_by = created_by;

  bool? _is_save;
  bool? get is_save => _$this._is_save;
  set is_save(bool? is_save) => _$this._is_save = is_save;

  DataPrimeBubblesBuilder();

  DataPrimeBubblesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _color = $v.color;
      _location = $v.location;
      _description = $v.description;
      _draw_type = $v.draw_type;
      _type = $v.type;
      _lat = $v.lat;
      _lng = $v.lng;
      _is_available = $v.is_available;
      _start_event_date = $v.start_event_date;
      _end_event_date = $v.end_event_date;
      _organizers = $v.organizers?.toBuilder();
      _images = $v.images?.toBuilder();
      _dates = $v.dates?.toBuilder();
      _id = $v.id;
      _radius = $v.radius;
      _created_by = $v.created_by?.toBuilder();
      _is_save = $v.is_save;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataPrimeBubbles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataPrimeBubbles;
  }

  @override
  void update(void Function(DataPrimeBubblesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataPrimeBubbles build() => _build();

  _$DataPrimeBubbles _build() {
    _$DataPrimeBubbles _$result;
    try {
      _$result = _$v ??
          new _$DataPrimeBubbles._(
              title: title,
              color: color,
              location: location,
              description: description,
              draw_type: draw_type,
              type: type,
              lat: lat,
              lng: lng,
              is_available: is_available,
              start_event_date: start_event_date,
              end_event_date: end_event_date,
              organizers: _organizers?.build(),
              images: _images?.build(),
              dates: _dates?.build(),
              id: id,
              radius: radius,
              created_by: _created_by?.build(),
              is_save: is_save);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'organizers';
        _organizers?.build();
        _$failedField = 'images';
        _images?.build();
        _$failedField = 'dates';
        _dates?.build();

        _$failedField = 'created_by';
        _created_by?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DataPrimeBubbles', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
