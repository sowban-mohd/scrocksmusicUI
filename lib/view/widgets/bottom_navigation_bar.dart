import 'package:flutter/material.dart';
import 'package:srocksmusicapp/core/app_theme.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.borderColor, width: 1.0),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset('assets/images/selected_arrow_icon.png'),
              SizedBox(height: 8),
              Image.asset('assets/images/home_selected.png'),
              SizedBox(height: 4),
              Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Syne',
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: AppTheme.fontColorPrimary,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Image.asset('assets/images/news.png'),
                SizedBox(height: 4),
                Text(
                  'News',
                  style: TextStyle(
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppTheme.fontColorTertiary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Image.asset('assets/images/trackbox.png'),
                SizedBox(height: 4),
                Text(
                  'Trackbox',
                  style: TextStyle(
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppTheme.fontColorTertiary,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Image.asset('assets/images/projects.png'),
                SizedBox(height: 4),
                Text(
                  'Projects',
                  style: TextStyle(
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppTheme.fontColorTertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
