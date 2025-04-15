
import 'package:flutter/material.dart';
import '../../../../core/values/app_colors.dart';

class ComputerScreen extends StatelessWidget {
  const ComputerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        elevation: 1,
        iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,

        title: const Text("Computer",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
            ,fontSize:16
        ),),
        leading:const BackButton(
           color: Colors.white),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction to Computers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'A computer is an electronic device that can perform a variety of tasks such as processing data, storing information, and executing programs. It can perform complex calculations and operations with the help of hardware and software, making it an essential tool in modern life.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Key Components of a Computer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Central Processing Unit (CPU): The CPU is the brain of the computer. It performs calculations and executes instructions from programs.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Memory: The memory, or RAM (Random Access Memory), is where the computer stores data that is being actively used by the CPU.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Storage: Storage devices like hard drives (HDD) or solid-state drives (SSD) store data permanently or temporarily.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Input Devices: Input devices such as keyboards, mice, and touchpads allow the user to interact with the computer.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5. Output Devices: Output devices like monitors and printers display or output the results of the computer’s computations.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Types of Computers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Personal Computers (PC): These are general-purpose computers used by individuals for tasks like browsing the internet, word processing, and entertainment.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Laptops: Portable computers with similar functionality to personal computers but are smaller and more mobile.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Servers: Servers are computers that provide services and resources to other computers or devices over a network.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Mainframe Computers: Large and powerful systems used by businesses and governments to process vast amounts of data.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5. Supercomputers: Extremely powerful machines used for complex scientific computations and simulations.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Uses of Computers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Education: Computers are widely used in educational institutions for learning, teaching, and research purposes.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Business: Computers are essential for managing business operations, communication, and analysis.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Healthcare: Computers are used in healthcare for patient record management, diagnostic tools, and research.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Entertainment: Computers are used for gaming, streaming, music production, and other forms of entertainment.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5. Communication: Computers enable instant communication through email, messaging apps, and social media platforms.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'History of Computers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'The history of computers dates back to ancient times with the invention of tools like the abacus for counting. Over time, mechanical calculators and the development of electronic circuits led to the first programmable computers in the 20th century. The invention of the microprocessor in the 1970s revolutionized personal computing, leading to the computers we use today.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Future of Computers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'The future of computing includes advancements in artificial intelligence, quantum computing, and faster, more energy-efficient hardware. Computers are expected to become even more integrated into daily life, with advancements in augmented reality, virtual reality, and autonomous systems.',
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
              'Computers are powerful tools that have revolutionized virtually every aspect of life. As technology continues to evolve, the role of computers in society will only continue to expand.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
