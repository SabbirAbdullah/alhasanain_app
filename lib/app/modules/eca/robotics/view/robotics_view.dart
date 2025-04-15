import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';


class RoboticsScreen extends StatelessWidget {
  const RoboticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        elevation: 1,
        iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,

        title: Text("Robotics",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
            ,fontSize:16
        ),),
        leading:BackButton( color: Colors.white),

     
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction to Robotics',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Robotics is an interdisciplinary branch of engineering and science that includes mechanical engineering, electrical engineering, computer science, and others. The goal of robotics is to design, construct, operate, and use robots to perform tasks that are either too difficult or dangerous for humans.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Types of Robots',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Industrial Robots: These robots are used in manufacturing processes to automate repetitive tasks such as welding, assembling, and packaging.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Service Robots: These robots assist humans by performing tasks like cleaning, delivering items, or assisting in medical procedures.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Autonomous Robots: These robots can operate independently, without human intervention, and can perform complex tasks like navigating a room or interacting with objects.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Key Components of a Robot',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Sensors: Robots use sensors to gather information about their environment. This includes cameras, infrared sensors, and temperature sensors.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Actuators: Actuators control the movement of the robot. These can be electric motors or hydraulic systems.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Controller: The controller is the "brain" of the robot. It processes the information received from sensors and sends instructions to the actuators.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Power Supply: Robots require a power source such as batteries, solar cells, or electrical power to function.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Applications of Robotics',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Manufacturing: Robots are widely used in assembly lines, improving productivity and precision.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Healthcare: Robots assist in surgeries, diagnostics, and patient care, enhancing medical outcomes.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Exploration: Robots are used in space exploration, undersea exploration, and hazardous environments where humans cannot go.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Domestic Use: Robots like vacuum cleaners and lawn mowers help with everyday household tasks.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Future of Robotics',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'The future of robotics is bright, with advancements in AI, machine learning, and autonomy. Robots will become increasingly capable of performing complex tasks autonomously, and their presence will expand into everyday life, from healthcare to entertainment, and even home maintenance.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Conclusion',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Robotics is an exciting and rapidly evolving field that holds immense potential. As technology continues to advance, robots will play a crucial role in enhancing human capabilities, improving safety, and transforming industries.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


