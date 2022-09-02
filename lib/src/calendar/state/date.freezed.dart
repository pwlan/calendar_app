// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarEntry _$CalendarEntryFromJson(Map<String, dynamic> json) {
  return _CalendarEntry.fromJson(json);
}

/// @nodoc
mixin _$CalendarEntry {
  DateTime get date => throw _privateConstructorUsedError;
  bool get today => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarEntryCopyWith<CalendarEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEntryCopyWith<$Res> {
  factory $CalendarEntryCopyWith(
          CalendarEntry value, $Res Function(CalendarEntry) then) =
      _$CalendarEntryCopyWithImpl<$Res>;
  $Res call({DateTime date, bool today});
}

/// @nodoc
class _$CalendarEntryCopyWithImpl<$Res>
    implements $CalendarEntryCopyWith<$Res> {
  _$CalendarEntryCopyWithImpl(this._value, this._then);

  final CalendarEntry _value;
  // ignore: unused_field
  final $Res Function(CalendarEntry) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? today = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      today: today == freezed
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CalendarEntryCopyWith<$Res>
    implements $CalendarEntryCopyWith<$Res> {
  factory _$$_CalendarEntryCopyWith(
          _$_CalendarEntry value, $Res Function(_$_CalendarEntry) then) =
      __$$_CalendarEntryCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, bool today});
}

/// @nodoc
class __$$_CalendarEntryCopyWithImpl<$Res>
    extends _$CalendarEntryCopyWithImpl<$Res>
    implements _$$_CalendarEntryCopyWith<$Res> {
  __$$_CalendarEntryCopyWithImpl(
      _$_CalendarEntry _value, $Res Function(_$_CalendarEntry) _then)
      : super(_value, (v) => _then(v as _$_CalendarEntry));

  @override
  _$_CalendarEntry get _value => super._value as _$_CalendarEntry;

  @override
  $Res call({
    Object? date = freezed,
    Object? today = freezed,
  }) {
    return _then(_$_CalendarEntry(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      today: today == freezed
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarEntry with DiagnosticableTreeMixin implements _CalendarEntry {
  const _$_CalendarEntry({required this.date, required this.today});

  factory _$_CalendarEntry.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarEntryFromJson(json);

  @override
  final DateTime date;
  @override
  final bool today;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarEntry(date: $date, today: $today)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarEntry'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('today', today));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarEntry &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.today, today));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(today));

  @JsonKey(ignore: true)
  @override
  _$$_CalendarEntryCopyWith<_$_CalendarEntry> get copyWith =>
      __$$_CalendarEntryCopyWithImpl<_$_CalendarEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarEntryToJson(
      this,
    );
  }
}

abstract class _CalendarEntry implements CalendarEntry {
  const factory _CalendarEntry(
      {required final DateTime date,
      required final bool today}) = _$_CalendarEntry;

  factory _CalendarEntry.fromJson(Map<String, dynamic> json) =
      _$_CalendarEntry.fromJson;

  @override
  DateTime get date;
  @override
  bool get today;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarEntryCopyWith<_$_CalendarEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
