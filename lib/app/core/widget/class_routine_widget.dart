import 'package:flutter/material.dart';

class ClassRoutineCardWidget extends StatelessWidget {
  final String period;
  final String subject;
  final String teacher;

   ClassRoutineCardWidget({super.key, required this.period, required this.subject, required this.teacher});


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey.shade100),
          borderRadius:
          BorderRadius.circular(6),
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
              const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  bottom: 15),
              child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .start,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .center,
                  children: [
                    Center(
                        child: Text(
                          period,
                          style: TextStyle(
                              color:
                              Colors.grey,
                              fontWeight:
                              FontWeight
                                  .bold,
                              fontSize: 24),
                        )),
                    SizedBox(
                      width: 15,
                    ),

                    Center(
                      child: Container(
                        height: 42,
                        width: 1,
                        color: Colors.grey,
                      ),
                    ), //divider
                    SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      Padding(
                        padding:
                        const EdgeInsets
                            .all(8.0),
                        child: Text(
                         subject,
                          style: TextStyle(
                              color: Colors
                                  .white,
                              fontSize: 12),
                        ),
                      ),
                      //Text("9:30 AM",style: TextStyle(color: Colors.white,fontSize: 16),),
                    ]),

                    Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Text(
                            teacher,
                            style: TextStyle(
                                color: Colors
                                    .black,
                                fontWeight:
                                FontWeight
                                    .bold,
                                fontSize:
                                14),
                          ),
                        ]),
                  ]),
            ),
          ],
        ));
  }
}
