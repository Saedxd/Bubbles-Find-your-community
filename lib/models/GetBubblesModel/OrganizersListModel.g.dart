// GENERATED CODE - DO NOT MODIFY BY HAND

part of OrganizersListModel;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrganizersListModel> _$organizersListModelSerializer =
    new _$OrganizersListModelSerializer();

class _$OrganizersListModelSerializer
    implements StructuredSerializer<OrganizersListModel> {
  @override
  final Iterable<Type> types = const [
    OrganizersListModel,
    _$OrganizersListModel
  ];
  @override
  final String wireName = 'OrganizersListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OrganizersListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_creator;
    if (value != null) {
      result
        ..add('is_creator')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.email_verified_at;
    if (value != null) {
      result
        ..add('email_verified_at')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updated_at;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.first_name;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.last_name;
    if (value != null) {
      result
        ..add('last_name')
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
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birth_date;
    if (value != null) {
      result
        ..add('birth_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alias;
    if (value != null) {
      result
        ..add('alias')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fcm_token;
    if (value != null) {
      result
        ..add('fcm_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lattitude;
    if (value != null) {
      result
        ..add('lattitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.langtitude;
    if (value != null) {
      result
        ..add('langtitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatar_social;
    if (value != null) {
      result
        ..add('avatar_social')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serial;
    if (value != null) {
      result
        ..add('serial')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image1;
    if (value != null) {
      result
        ..add('image1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image2;
    if (value != null) {
      result
        ..add('image2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.login_at;
    if (value != null) {
      result
        ..add('login_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_notify;
    if (value != null) {
      result
        ..add('is_notify')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.social_id;
    if (value != null) {
      result
        ..add('social_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.daily_login;
    if (value != null) {
      result
        ..add('daily_login')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_register;
    if (value != null) {
      result
        ..add('is_register')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.added_user;
    if (value != null) {
      result
        ..add('added_user')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.invitation;
    if (value != null) {
      result
        ..add('invitation')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.visit_bubble;
    if (value != null) {
      result
        ..add('visit_bubble')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num_friend;
    if (value != null) {
      result
        ..add('num_friend')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.points;
    if (value != null) {
      result
        ..add('points')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num_bubble;
    if (value != null) {
      result
        ..add('num_bubble')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.invitation_num;
    if (value != null) {
      result
        ..add('invitation_num')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.added_user_status;
    if (value != null) {
      result
        ..add('added_user_status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.invitation_status;
    if (value != null) {
      result
        ..add('invitation_status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.visit_bubble_status;
    if (value != null) {
      result
        ..add('visit_bubble_status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  OrganizersListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganizersListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_creator':
          result.is_creator = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'email_verified_at':
          result.email_verified_at = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'background_color':
          result.background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birth_date':
          result.birth_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alias':
          result.alias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fcm_token':
          result.fcm_token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lattitude':
          result.lattitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'langtitude':
          result.langtitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar_social':
          result.avatar_social = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'serial':
          result.serial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image1':
          result.image1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image2':
          result.image2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'login_at':
          result.login_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_notify':
          result.is_notify = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'social_id':
          result.social_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'daily_login':
          result.daily_login = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_register':
          result.is_register = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'added_user':
          result.added_user = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'invitation':
          result.invitation = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'visit_bubble':
          result.visit_bubble = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_friend':
          result.num_friend = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'points':
          result.points = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_bubble':
          result.num_bubble = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'invitation_num':
          result.invitation_num = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'added_user_status':
          result.added_user_status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'invitation_status':
          result.invitation_status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'visit_bubble_status':
          result.visit_bubble_status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$OrganizersListModel extends OrganizersListModel {
  @override
  final String? email;
  @override
  final int? id;
  @override
  final int? is_creator;
  @override
  final int? email_verified_at;
  @override
  final String? created_at;
  @override
  final String? updated_at;
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final String? background_color;
  @override
  final String? bio;
  @override
  final String? birth_date;
  @override
  final String? alias;
  @override
  final String? fcm_token;
  @override
  final String? lattitude;
  @override
  final String? langtitude;
  @override
  final String? avatar;
  @override
  final String? avatar_social;
  @override
  final String? serial;
  @override
  final String? image1;
  @override
  final String? image2;
  @override
  final String? login_at;
  @override
  final int? is_notify;
  @override
  final int? social_id;
  @override
  final int? daily_login;
  @override
  final int? is_register;
  @override
  final int? added_user;
  @override
  final int? invitation;
  @override
  final int? visit_bubble;
  @override
  final int? num_friend;
  @override
  final int? points;
  @override
  final int? num_bubble;
  @override
  final int? invitation_num;
  @override
  final int? added_user_status;
  @override
  final int? invitation_status;
  @override
  final int? visit_bubble_status;
  @override
  final String? gender;

  factory _$OrganizersListModel(
          [void Function(OrganizersListModelBuilder)? updates]) =>
      (new OrganizersListModelBuilder()..update(updates))._build();

  _$OrganizersListModel._(
      {this.email,
      this.id,
      this.is_creator,
      this.email_verified_at,
      this.created_at,
      this.updated_at,
      this.first_name,
      this.last_name,
      this.background_color,
      this.bio,
      this.birth_date,
      this.alias,
      this.fcm_token,
      this.lattitude,
      this.langtitude,
      this.avatar,
      this.avatar_social,
      this.serial,
      this.image1,
      this.image2,
      this.login_at,
      this.is_notify,
      this.social_id,
      this.daily_login,
      this.is_register,
      this.added_user,
      this.invitation,
      this.visit_bubble,
      this.num_friend,
      this.points,
      this.num_bubble,
      this.invitation_num,
      this.added_user_status,
      this.invitation_status,
      this.visit_bubble_status,
      this.gender})
      : super._();

  @override
  OrganizersListModel rebuild(
          void Function(OrganizersListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizersListModelBuilder toBuilder() =>
      new OrganizersListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizersListModel &&
        email == other.email &&
        id == other.id &&
        is_creator == other.is_creator &&
        email_verified_at == other.email_verified_at &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        background_color == other.background_color &&
        bio == other.bio &&
        birth_date == other.birth_date &&
        alias == other.alias &&
        fcm_token == other.fcm_token &&
        lattitude == other.lattitude &&
        langtitude == other.langtitude &&
        avatar == other.avatar &&
        avatar_social == other.avatar_social &&
        serial == other.serial &&
        image1 == other.image1 &&
        image2 == other.image2 &&
        login_at == other.login_at &&
        is_notify == other.is_notify &&
        social_id == other.social_id &&
        daily_login == other.daily_login &&
        is_register == other.is_register &&
        added_user == other.added_user &&
        invitation == other.invitation &&
        visit_bubble == other.visit_bubble &&
        num_friend == other.num_friend &&
        points == other.points &&
        num_bubble == other.num_bubble &&
        invitation_num == other.invitation_num &&
        added_user_status == other.added_user_status &&
        invitation_status == other.invitation_status &&
        visit_bubble_status == other.visit_bubble_status &&
        gender == other.gender;
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, email.hashCode), id.hashCode), is_creator.hashCode), email_verified_at.hashCode), created_at.hashCode), updated_at.hashCode), first_name.hashCode), last_name.hashCode), background_color.hashCode), bio.hashCode), birth_date.hashCode), alias.hashCode), fcm_token.hashCode), lattitude.hashCode), langtitude.hashCode), avatar.hashCode), avatar_social.hashCode),
                                                                                serial.hashCode),
                                                                            image1.hashCode),
                                                                        image2.hashCode),
                                                                    login_at.hashCode),
                                                                is_notify.hashCode),
                                                            social_id.hashCode),
                                                        daily_login.hashCode),
                                                    is_register.hashCode),
                                                added_user.hashCode),
                                            invitation.hashCode),
                                        visit_bubble.hashCode),
                                    num_friend.hashCode),
                                points.hashCode),
                            num_bubble.hashCode),
                        invitation_num.hashCode),
                    added_user_status.hashCode),
                invitation_status.hashCode),
            visit_bubble_status.hashCode),
        gender.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizersListModel')
          ..add('email', email)
          ..add('id', id)
          ..add('is_creator', is_creator)
          ..add('email_verified_at', email_verified_at)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('background_color', background_color)
          ..add('bio', bio)
          ..add('birth_date', birth_date)
          ..add('alias', alias)
          ..add('fcm_token', fcm_token)
          ..add('lattitude', lattitude)
          ..add('langtitude', langtitude)
          ..add('avatar', avatar)
          ..add('avatar_social', avatar_social)
          ..add('serial', serial)
          ..add('image1', image1)
          ..add('image2', image2)
          ..add('login_at', login_at)
          ..add('is_notify', is_notify)
          ..add('social_id', social_id)
          ..add('daily_login', daily_login)
          ..add('is_register', is_register)
          ..add('added_user', added_user)
          ..add('invitation', invitation)
          ..add('visit_bubble', visit_bubble)
          ..add('num_friend', num_friend)
          ..add('points', points)
          ..add('num_bubble', num_bubble)
          ..add('invitation_num', invitation_num)
          ..add('added_user_status', added_user_status)
          ..add('invitation_status', invitation_status)
          ..add('visit_bubble_status', visit_bubble_status)
          ..add('gender', gender))
        .toString();
  }
}

class OrganizersListModelBuilder
    implements Builder<OrganizersListModel, OrganizersListModelBuilder> {
  _$OrganizersListModel? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _is_creator;
  int? get is_creator => _$this._is_creator;
  set is_creator(int? is_creator) => _$this._is_creator = is_creator;

  int? _email_verified_at;
  int? get email_verified_at => _$this._email_verified_at;
  set email_verified_at(int? email_verified_at) =>
      _$this._email_verified_at = email_verified_at;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _updated_at;
  String? get updated_at => _$this._updated_at;
  set updated_at(String? updated_at) => _$this._updated_at = updated_at;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _background_color;
  String? get background_color => _$this._background_color;
  set background_color(String? background_color) =>
      _$this._background_color = background_color;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _birth_date;
  String? get birth_date => _$this._birth_date;
  set birth_date(String? birth_date) => _$this._birth_date = birth_date;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _fcm_token;
  String? get fcm_token => _$this._fcm_token;
  set fcm_token(String? fcm_token) => _$this._fcm_token = fcm_token;

  String? _lattitude;
  String? get lattitude => _$this._lattitude;
  set lattitude(String? lattitude) => _$this._lattitude = lattitude;

  String? _langtitude;
  String? get langtitude => _$this._langtitude;
  set langtitude(String? langtitude) => _$this._langtitude = langtitude;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _avatar_social;
  String? get avatar_social => _$this._avatar_social;
  set avatar_social(String? avatar_social) =>
      _$this._avatar_social = avatar_social;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  String? _image1;
  String? get image1 => _$this._image1;
  set image1(String? image1) => _$this._image1 = image1;

  String? _image2;
  String? get image2 => _$this._image2;
  set image2(String? image2) => _$this._image2 = image2;

  String? _login_at;
  String? get login_at => _$this._login_at;
  set login_at(String? login_at) => _$this._login_at = login_at;

  int? _is_notify;
  int? get is_notify => _$this._is_notify;
  set is_notify(int? is_notify) => _$this._is_notify = is_notify;

  int? _social_id;
  int? get social_id => _$this._social_id;
  set social_id(int? social_id) => _$this._social_id = social_id;

  int? _daily_login;
  int? get daily_login => _$this._daily_login;
  set daily_login(int? daily_login) => _$this._daily_login = daily_login;

  int? _is_register;
  int? get is_register => _$this._is_register;
  set is_register(int? is_register) => _$this._is_register = is_register;

  int? _added_user;
  int? get added_user => _$this._added_user;
  set added_user(int? added_user) => _$this._added_user = added_user;

  int? _invitation;
  int? get invitation => _$this._invitation;
  set invitation(int? invitation) => _$this._invitation = invitation;

  int? _visit_bubble;
  int? get visit_bubble => _$this._visit_bubble;
  set visit_bubble(int? visit_bubble) => _$this._visit_bubble = visit_bubble;

  int? _num_friend;
  int? get num_friend => _$this._num_friend;
  set num_friend(int? num_friend) => _$this._num_friend = num_friend;

  int? _points;
  int? get points => _$this._points;
  set points(int? points) => _$this._points = points;

  int? _num_bubble;
  int? get num_bubble => _$this._num_bubble;
  set num_bubble(int? num_bubble) => _$this._num_bubble = num_bubble;

  int? _invitation_num;
  int? get invitation_num => _$this._invitation_num;
  set invitation_num(int? invitation_num) =>
      _$this._invitation_num = invitation_num;

  int? _added_user_status;
  int? get added_user_status => _$this._added_user_status;
  set added_user_status(int? added_user_status) =>
      _$this._added_user_status = added_user_status;

  int? _invitation_status;
  int? get invitation_status => _$this._invitation_status;
  set invitation_status(int? invitation_status) =>
      _$this._invitation_status = invitation_status;

  int? _visit_bubble_status;
  int? get visit_bubble_status => _$this._visit_bubble_status;
  set visit_bubble_status(int? visit_bubble_status) =>
      _$this._visit_bubble_status = visit_bubble_status;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  OrganizersListModelBuilder();

  OrganizersListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _id = $v.id;
      _is_creator = $v.is_creator;
      _email_verified_at = $v.email_verified_at;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _background_color = $v.background_color;
      _bio = $v.bio;
      _birth_date = $v.birth_date;
      _alias = $v.alias;
      _fcm_token = $v.fcm_token;
      _lattitude = $v.lattitude;
      _langtitude = $v.langtitude;
      _avatar = $v.avatar;
      _avatar_social = $v.avatar_social;
      _serial = $v.serial;
      _image1 = $v.image1;
      _image2 = $v.image2;
      _login_at = $v.login_at;
      _is_notify = $v.is_notify;
      _social_id = $v.social_id;
      _daily_login = $v.daily_login;
      _is_register = $v.is_register;
      _added_user = $v.added_user;
      _invitation = $v.invitation;
      _visit_bubble = $v.visit_bubble;
      _num_friend = $v.num_friend;
      _points = $v.points;
      _num_bubble = $v.num_bubble;
      _invitation_num = $v.invitation_num;
      _added_user_status = $v.added_user_status;
      _invitation_status = $v.invitation_status;
      _visit_bubble_status = $v.visit_bubble_status;
      _gender = $v.gender;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizersListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizersListModel;
  }

  @override
  void update(void Function(OrganizersListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizersListModel build() => _build();

  _$OrganizersListModel _build() {
    final _$result = _$v ??
        new _$OrganizersListModel._(
            email: email,
            id: id,
            is_creator: is_creator,
            email_verified_at: email_verified_at,
            created_at: created_at,
            updated_at: updated_at,
            first_name: first_name,
            last_name: last_name,
            background_color: background_color,
            bio: bio,
            birth_date: birth_date,
            alias: alias,
            fcm_token: fcm_token,
            lattitude: lattitude,
            langtitude: langtitude,
            avatar: avatar,
            avatar_social: avatar_social,
            serial: serial,
            image1: image1,
            image2: image2,
            login_at: login_at,
            is_notify: is_notify,
            social_id: social_id,
            daily_login: daily_login,
            is_register: is_register,
            added_user: added_user,
            invitation: invitation,
            visit_bubble: visit_bubble,
            num_friend: num_friend,
            points: points,
            num_bubble: num_bubble,
            invitation_num: invitation_num,
            added_user_status: added_user_status,
            invitation_status: invitation_status,
            visit_bubble_status: visit_bubble_status,
            gender: gender);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
