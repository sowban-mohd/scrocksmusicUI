import 'package:flutter/material.dart';
import 'package:srocksmusicapp/core/app_theme.dart';
import 'package:srocksmusicapp/view/second_screen.dart';

class ServiceCardWidget extends StatelessWidget {
  final String iconPath;
  final String name;
  final String description;
  final String backgroundImagePath;

  const ServiceCardWidget({
    super.key,
    required this.iconPath,
    required this.name,
    required this.description,
    required this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(serviceName: name),
            ),
          ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 335,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              opacity: 0.2,
              fit: BoxFit.cover,
              image: AssetImage(backgroundImagePath),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(iconPath, width: 45, height: 45),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppTheme.fontColorPrimary,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        description,
                        style: TextStyle(
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppTheme.fontColorPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/arrow_icon.png',
                  width: 14,
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
