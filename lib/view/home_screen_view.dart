import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srocksmusicapp/core/app_theme.dart';
import 'package:srocksmusicapp/view/widgets/bottom_navigation_bar.dart';
import 'package:srocksmusicapp/view/widgets/service_card.dart';
import 'package:srocksmusicapp/viewmodel/home_viewmodel.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenView> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Delay to ensure context is fully ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewmodel>(context, listen: false).getServiceCards();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final homeViewModel = Provider.of<HomeViewmodel>(context);

    if (homeViewModel.errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(homeViewModel.errorMessage!)));
    }
    
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //Demo booking part
            Container(
              height: screenHeight * (0.4), //Takes 40% of screen's height
              width: double.infinity, //Takes the entire screen width
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppTheme.radiant1, AppTheme.radiant2],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 270,
                          height: 39,
                          child: TextField(
                            controller: controller,
                            style: TextStyle(
                              fontFamily: 'Syne',
                              fontWeight: FontWeight.w400,
                              fontSize: 13.0,
                              color: AppTheme.fontColorPrimary,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                'assets/images/search_icon.png',
                                width: 15,
                                height: 15,
                              ),
                              hintText: 'Search "Punjabi songs"',
                              hintStyle: TextStyle(
                                fontFamily: 'Syne',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0,
                                color: AppTheme.fontColorTertiary,
                              ),
                              contentPadding: EdgeInsets.all(2.0),
                              fillColor: AppTheme.textFieldFill,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),

                              //Divider and voice Icon
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 14.0),
                                child: SizedBox(
                                  width: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        child: VerticalDivider(
                                          thickness: 1.0,
                                          color: AppTheme.dividerColor,
                                        ),
                                      ),
                                      Image.asset('assets/images/mic_icon.png'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),

                        //Avatar Icon
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircleAvatar(
                            radius: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                'assets/images/avatar_placeholder.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: -screenWidth * 0.375,
                            bottom: 10,
                            child: Image.asset(
                              'assets/images/layer_1.png',
                              width: 110,
                            ),
                          ),
                          Positioned(
                            right: -screenWidth * 0.375,
                            bottom: 10,
                            child: Image.asset(
                              'assets/images/layer_2.png',
                              width: 110,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Booking text, button, images
                              Text(
                                'Claim your',
                                style: TextStyle(
                                  fontFamily: 'Syne',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                  color: AppTheme.fontColorPrimary,
                                ),
                              ),
                              Text(
                                'Free Demo',
                                style: TextStyle(
                                  color: AppTheme.fontColorPrimary,
                                  fontFamily: 'Lobster',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 36,
                                ),
                              ),
                              Text(
                                'for custom music production',
                                style: TextStyle(
                                  color: AppTheme.fontColorPrimary,
                                  fontFamily: 'Syne',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 16),

                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: 90,
                                height: 33,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Book now',
                                    style: TextStyle(
                                      color: AppTheme.fontColorSecondary,
                                      fontFamily: 'Syne',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Service Part
            Expanded(
              child:
                  homeViewModel.isLoading
                      ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                      : Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.03),
                        child: Column(
                          children: [
                            Text(
                              'Hire hand-picked Pros for popular music services',
                              style: TextStyle(
                                color: AppTheme.fontColorPrimary,
                                fontFamily: 'Syne',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20),

                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final serviceCard =
                                      homeViewModel.serviceCards[index];
                                  return ServiceCardWidget(
                                    iconPath: serviceCard.iconPath,
                                    name: serviceCard.name,
                                    description: serviceCard.description,
                                    backgroundImagePath:
                                        serviceCard.backgroundImagePath,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 10);
                                },
                                itemCount: homeViewModel.serviceCards.length,
                              ),
                            ),
                          ],
                        ),
                      ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}
