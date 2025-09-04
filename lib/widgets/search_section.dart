import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rag_chatbot/services/chat_web_service.dart';
import 'package:rag_chatbot/views/chat_page.dart';
import 'package:rag_chatbot/widgets/search_bar_button.dart';

import '../theme/app_colors.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {

  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Where knowledge begins',
          style: GoogleFonts.ibmPlexMono(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 30,),
        Container(
          width: 700,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.searchBarBorder, width: 1.5),
            color: AppColors.searchBar
          ),
          child: Column(
            children: [
              // text field
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: 'Search anything...',
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero
                  ),
                ),
              ),
              // options and send button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButton(icon: Icons.auto_awesome_outlined, text: 'Focus',),
                    SizedBox(width: 12,),
                    SearchBarButton(icon: Icons.add_circle, text: 'Attach',),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        ChatWebService().chat(queryController.text.trim());
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ChatPage(question: queryController.text.trim())));
                      },
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: Icon(Icons.arrow_forward, color: AppColors.background,),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
