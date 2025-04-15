import 'package:flutter/material.dart';

class AttendenceHeader extends StatelessWidget {
  const AttendenceHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width:MediaQuery.of(context).size.width*0.5,
          child:const Text("Date",style: TextStyle(color: Color(0xff565656),fontWeight: FontWeight.bold,fontSize: 14),),
        ),

        const Text("Absent",style: TextStyle(color: Color(0xff565656),fontWeight: FontWeight.bold,fontSize: 14),),
        const Text("Present",style: TextStyle(color: Color(0xff565656),fontWeight: FontWeight.bold,fontSize: 14),)


      ],
    );
  }
}
