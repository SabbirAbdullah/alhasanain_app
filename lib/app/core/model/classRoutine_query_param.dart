
class ClassRoutineQueryParam {

  String className;
  String section;
  String session;


  ClassRoutineQueryParam({

    required this.className,
    required this.section,
    required this.session,
  });

  Map<String, dynamic> toJson() {
    return {
      'className': className,
      'section': section,
      'session': session,

    };
  }
}