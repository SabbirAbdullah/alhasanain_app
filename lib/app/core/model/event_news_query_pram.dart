class EventNewsQueryPrem {
  String className;
  String session;
  int page;
  int limit;

  EventNewsQueryPrem({required this.session, required this.className,required this.limit,required this.page});

  Map<String, dynamic> toJson() {
    return {
      'className': className,
      'session': session,
      'limit':limit,
      'page':page
    };
  }
}