// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarEntry _$$_CalendarEntryFromJson(Map<String, dynamic> json) =>
    _$_CalendarEntry(
      date: DateTime.parse(json['date'] as String),
      today: json['today'] as bool,
    );

Map<String, dynamic> _$$_CalendarEntryToJson(_$_CalendarEntry instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'today': instance.today,
    };
