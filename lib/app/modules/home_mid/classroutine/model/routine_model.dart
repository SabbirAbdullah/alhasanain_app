

import 'routine_period_model.dart';

class RoutineDay {
  final String day;
  final List<RoutinePeriod> periods;

  RoutineDay({
    required this.day,
    required this.periods,
  });

  factory RoutineDay.fromJson(Map<String, dynamic> json) {
    return RoutineDay(
      day: json['day'],
      periods: (json['periods'] as List)
          .map((period) => RoutinePeriod.fromJson(period))
          .toList(),
    );
  }
}
