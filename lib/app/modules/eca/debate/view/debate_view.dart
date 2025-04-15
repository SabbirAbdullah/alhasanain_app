
import 'package:flutter/material.dart';
import '../../../../core/values/app_colors.dart';


class DebateScreen extends StatelessWidget {
  const DebateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        elevation: 1,
        iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,

        title: const Text("Debate",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
            ,fontSize:16
        ),),
        leading:const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction to Debate',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Debate is a formal discussion on a particular topic where opposing arguments are presented. It is a structured way to discuss ideas, and participants typically express and defend their opinions in a manner that is respectful and well-reasoned. Debate plays a key role in fostering critical thinking, public speaking, and problem-solving skills.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Types of Debate',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. **Parliamentary Debate**: This is a popular form of debate practiced in many countries. In parliamentary debate, participants argue for or against a specific proposal, typically with the aim to convince the audience or judges.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. **Lincoln-Douglas Debate**: This type of debate focuses on values and ethical issues. The participants argue for or against a value-based proposition, usually with one side taking the affirmative and the other opposing it.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. **Policy Debate**: In policy debates, the focus is on proposing and debating specific policies or actions that should be taken by governments or institutions. It requires in-depth research and understanding of policy-related issues.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. **Public Forum Debate**: This is a team-based debate that involves discussing current events and issues. The format is designed to be accessible to a wide audience, and participants focus on clear, understandable arguments.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Importance of Debate',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Debate is crucial for several reasons:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '1. **Enhances Critical Thinking**: Debating helps individuals think critically by requiring them to analyze issues from multiple perspectives and construct logical arguments.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. **Improves Communication Skills**: Debate is an excellent platform for developing verbal and non-verbal communication skills. It requires the speaker to articulate thoughts clearly, listen actively, and respond effectively.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. **Promotes Research and Knowledge**: Participants need to be well-versed in the topics they debate. This encourages thorough research and understanding of complex subjects.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. **Fosters Respectful Discourse**: Debate teaches individuals to engage in respectful and civil discourse, even when disagreeing. It encourages people to listen to opposing viewpoints and respond thoughtfully.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Skills Developed through Debate',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. **Public Speaking**: Debate enhances one’s ability to speak clearly, confidently, and persuasively in front of an audience.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. **Logical Reasoning**: Debaters must use logic and reasoning to structure their arguments and counter their opponent’s points.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. **Teamwork**: Many debate formats involve teams. Teamwork helps individuals learn how to collaborate effectively, divide tasks, and support each other.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. **Time Management**: Debaters must manage their time effectively to present their arguments and respond to their opponent within a set time limit.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Benefits of Debate',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. **Increased Confidence**: Through regular practice, debaters gain confidence in their public speaking abilities and overall communication skills.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. **Better Problem Solving**: Debate encourages creative problem-solving and helps individuals think on their feet to respond to new arguments.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. **Broader Perspectives**: Engaging with diverse topics and arguments in debate broadens a person’s worldview and allows them to consider multiple viewpoints.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. **Academic Advantage**: Debate improves research and writing skills, which are beneficial for academic success and competitions.',
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
              'Debate is a powerful tool for learning, growing, and engaging with the world. Whether in competitive settings or as a means of self-expression, debate fosters important skills like critical thinking, communication, and respect for differing opinions. Participating in debates enriches an individual’s intellect and builds strong foundations for success in many areas of life.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

