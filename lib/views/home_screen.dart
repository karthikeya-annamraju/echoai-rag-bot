import 'package:flutter/material.dart';
import 'package:rag_chatbot/theme/app_colors.dart';
import 'package:rag_chatbot/widgets/search_section.dart';

import '../widgets/side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // side nav bar
          SideBar(),
          Expanded(
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
                        child: Text('Pro', style: TextStyle(
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
          )
        ],
      )
    );
  }
}
