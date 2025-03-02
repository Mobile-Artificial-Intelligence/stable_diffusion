part of 'package:sdcpp/sdcpp.dart';

enum ScheduleType {
  defaultSchedule,
  discrete,
  karras,
  exponential,
  ays,
  gits,
  count;

  schedule_t toNative() {
    switch (this) {
      case ScheduleType.defaultSchedule:
        return schedule_t.DEFAULT;
      case ScheduleType.discrete:
        return schedule_t.DISCRETE;
      case ScheduleType.karras:
        return schedule_t.KARRAS;
      case ScheduleType.exponential:
        return schedule_t.EXPONENTIAL;
      case ScheduleType.ays:
        return schedule_t.AYS;
      case ScheduleType.gits:
        return schedule_t.GITS;
      case ScheduleType.count:
        return schedule_t.N_SCHEDULES;
    }
  }
}