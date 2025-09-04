import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rag_chatbot/services/chat_web_service.dart';
import 'package:rag_chatbot/widgets/answer_section.dart';
import 'package:rag_chatbot/widgets/side_bar.dart';
import 'package:rag_chatbot/widgets/sources_section.dart';

class ChatPage extends StatefulWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  // StreamBuilder(stream: ChatWebService().contentStream, builder: (context, snapshot) {
  // if (snapshot.connectionState == ConnectionState.waiting) {
  // return const Center(
  // child: CircularProgressIndicator(),
  // );
  // }
  // fullResponse += snapshot.data!['data'] ?? "";
  // return Text(fullResponse);
  // }),


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? SideBar() : SizedBox(),
          kIsWeb ? const SizedBox(width: 100,) : SizedBox(),
          // main content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(widget.question, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),
                    SizedBox(height: 24,),
                    // sources
                    SourcesSection(),
                    SizedBox(height: 24,),
                    // answer section
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
