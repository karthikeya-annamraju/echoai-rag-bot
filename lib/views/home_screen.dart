import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rag_chatbot/services/chat_web_service.dart';
import 'package:rag_chatbot/theme/app_colors.dart';
import 'package:rag_chatbot/widgets/search_section.dart';

import '../widgets/side_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // side nav bar
          kIsWeb ? SideBar() : SizedBox(),
          Expanded(
            child: Padding(
              padding: !kIsWeb ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
              child: Column(
                children: [
                  // search section
                  Expanded(child: SearchSection()),
                  // footer
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                          child: Text('EchoAI', style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                          child: Text('Enterprise', style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                          child: Text('Store', style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                          child: Text('Blog', style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                          child: Text('Careers', style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                          child: Text('English (English)', style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
