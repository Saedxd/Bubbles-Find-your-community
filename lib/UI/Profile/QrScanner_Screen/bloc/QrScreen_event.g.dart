// GENERATED CODE - DO NOT MODIFY BY HAND

part of QrScreen_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddfriendWithQr extends AddfriendWithQr {
  @override
  final String? serial;

  factory _$AddfriendWithQr([void Function(AddfriendWithQrBuilder)? updates]) =>
      (new AddfriendWithQrBuilder()..update(updates))._build();

  _$AddfriendWithQr._({this.serial}) : super._();

  @override
  AddfriendWithQr rebuild(void Function(AddfriendWithQrBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddfriendWithQrBuilder toBuilder() =>
      new AddfriendWithQrBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddfriendWithQr && serial == other.serial;
  }

  @override
  int get hashCode {
    return $jf($jc(0, serial.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddfriendWithQr')
          ..add('serial', serial))
        .toString();
  }
}

class AddfriendWithQrBuilder
    implements Builder<AddfriendWithQr, AddfriendWithQrBuilder> {
  _$AddfriendWithQr? _$v;

  String? _serial;
  String? get serial => _$this._serial;
  set serial(String? serial) => _$this._serial = serial;

  AddfriendWithQrBuilder();

  AddfriendWithQrBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serial = $v.serial;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddfriendWithQr other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddfriendWithQr;
  }

  @override
  void update(void Function(AddfriendWithQrBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddfriendWithQr build() => _build();

  _$AddfriendWithQr _build() {
    final _$result = _$v ?? new _$AddfriendWithQr._(serial: serial);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
