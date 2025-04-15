import 'package:flutter/material.dart';


import '../../../../core/values/app_colors.dart';


class ArcheryScreen extends StatelessWidget {
  const ArcheryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        elevation: 1,
        iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,

        title: const Text("Archery",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
            ,fontSize:16
        ),),
        leading:const BackButton( color: Colors.white),
        ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction to Archery',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Archery is the practice or sport of shooting arrows with a bow. It is one of the oldest forms of weaponry and was originally used for hunting and warfare. Today, archery is practiced both recreationally and competitively, and it has evolved into a precise sport with a rich history.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Types of Archery',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Target Archery: This is the most common type of archery, where archers shoot at a target from a set distance. It is often seen in competitions and Olympic events.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Field Archery: Field archery involves shooting arrows at targets set in natural environments, such as forests or open fields. The targets are placed at varying distances.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. 3D Archery: In this type of archery, archers shoot at 3D animal-shaped targets placed at unknown distances. It mimics the hunting experience.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Bowhunting: This involves using a bow and arrow for hunting animals in the wild. It requires high levels of skill and is typically done in specific seasons and locations.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Archery Equipment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Bow: The bow is the main piece of equipment in archery. It is a flexible, curved weapon used to launch arrows. There are several types of bows, including:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '   - Recurve Bow: A bow with limbs that curve away from the archer when unstrung. It is commonly used in Olympic archery.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '   - Compound Bow: A bow that uses a system of pulleys and cables to assist the archer in drawing the string. It is typically used in target and field archery.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '   - Longbow: A traditional, simple bow that is longer and typically made from wood.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Arrows: Arrows are long, slender projectiles that are shot from the bow. They are made up of several parts:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '   - Shaft: The main body of the arrow, usually made from materials like wood, carbon fiber, or aluminum.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '   - Fletching: The feathers or vanes attached to the rear of the arrow to stabilize its flight.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '   - Nock: The small notch at the back of the arrow that holds it on the bowstring.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '   - Tip: The sharp point at the front of the arrow used to pierce the target.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3. Bowstring: The string that connects the ends of the bow and propels the arrow forward when released.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Benefits of Archery',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Physical Fitness: Archery improves strength, coordination, and flexibility. It requires both upper body and core strength.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Focus and Concentration: Archery demands a high level of mental focus and concentration, as accuracy is key to success.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Stress Relief: Archery can be a relaxing and meditative sport, helping to reduce stress and anxiety.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Mental Toughness: Archery helps develop patience and perseverance, as success requires both practice and discipline.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5. Social Interaction: Archery can be a social sport, with many opportunities for group practice, competitions, and community events.',
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
              'Archery is a rewarding sport that offers numerous physical, mental, and social benefits. Whether you are participating in competitions or simply enjoying it as a hobby, archery provides an excellent way to stay active and challenge yourself.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


