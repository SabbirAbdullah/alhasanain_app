import 'package:flutter/material.dart';

class AttendenceWidget extends StatelessWidget {
  const AttendenceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                width:MediaQuery.of(context).size.width*0.5,
                child:const Text("14/02/2024",style: TextStyle(color: Color(0xff565656),fontSize: 12),),
              ),

              const Icon(Icons.clear_rounded,size: 20,color: Colors.red,),
              const Icon(Icons.check_circle_outline,size: 20,color: Colors.green,),

            ],
          ),
        ),
      ],
    );
  }
}
