
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/values/app_colors.dart';

class DailyLesson extends StatelessWidget {
  const DailyLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
        appBar: AppBar(
          elevation: 1,
          iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
          centerTitle: true,
          backgroundColor: AppColors.appBarColor,
          title: Text("Daily Lesson",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
              ,fontSize:16
          ),),
          leading:BackButton( color: Colors.white),

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,// Adjust to control card height/width ratio
              ),
              itemCount: 10, // Adjust this to however many items you need
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: AppColors.pageBackground,
                          actionsAlignment: MainAxisAlignment.end,
                          scrollable: true,
                          actionsPadding: EdgeInsets.only(bottom: 8,right: 8),
                          contentPadding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 6),
                          insetPadding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          title: Text("Lesson Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                          content: Container(
                            width:  MediaQuery.of(context).size.width * .90,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.appBarColor
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 4.0,bottom: 4,right: 8,left: 8),
                                        child: Text('Bangla',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                                      ),

                                    ),
                                    SizedBox(width: 6,),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.grey),
                                        color: Color(0xff0b6fbe),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 4.0,bottom: 4,right: 8,left: 8),
                                        child: Text('Sunday',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                                      ),

                                    )

                                  ],
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('Book:',style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w400),),
                                      ),

                                    ),
                                    SizedBox(width: 6,),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('Material:',style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w400),),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('CW:',style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w400),),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('HW:',style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w400),),
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close",style: TextStyle(color: AppColors.appBarColor,fontWeight: FontWeight.w600,fontSize: 16),),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                   color: AppColors.appBarColor
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4.0,bottom: 4,right: 8,left: 8),
                                  child: Text('Bangla',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                                ),

                              ),
                              SizedBox(width: 6,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff0b6fbe),
                                ),
                                child: Padding(
                                  padding:const EdgeInsets.only(top: 4.0,bottom: 4,right: 8,left: 8),
                                  child: Text('Sunday',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                                ),

                              )

                            ],
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('Book:',style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w400),),
                                ),

                              ),
                              SizedBox(width: 6,),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('Material:',style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w400),),
                                ),

                              )

                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('CW:',style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w400),),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
                );
              },
            ),
        ),


    );
    throw UnimplementedError();
  }



}

