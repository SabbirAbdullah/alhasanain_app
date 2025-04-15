
import 'package:flutter/material.dart';



class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key, required this.studentName, required this.studentClass});
  final String studentName;
  final String studentClass;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
        Color(0x00e6F9FF),
    Color(0xffe9fff8),
    Color(0xfffff6e2),
    ],
    ),),
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      studentName ,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 4,bottom: 4),
                      child: Text(
                        studentClass ,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}