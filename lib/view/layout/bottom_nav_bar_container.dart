import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/view/shared/component.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:flutter_task/view_model/nav_bar_cubit/nav_bar_cubit_logic.dart';
import 'package:flutter_task/view_model/nav_bar_cubit/nav_bar_state.dart';
import 'package:get/get.dart';
class NavBarContainer extends StatefulWidget {
  const NavBarContainer({Key? key}) : super(key: key);

  @override
  _NavBarContainerState createState() => _NavBarContainerState();
}

class _NavBarContainerState extends State<NavBarContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarAppCubit(),
      child: BlocConsumer<NavBarAppCubit, NavBarState>(
        listener: (context, state) {},
        builder: (context, state) {
          NavBarAppCubit cubit = NavBarAppCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.pageIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: bgSecondary,
              backgroundColor: bgPrimary,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              iconSize: 30,
              selectedFontSize: 10,
              currentIndex: cubit.pageIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    label: "home".tr,
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ImageIcon(
                        AssetImage("assets/icons/Glyph@2x.png"),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "league".tr,
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ImageIcon(
                        AssetImage("assets/icons/Glyph2@2x.png"),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "media".tr,
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ImageIcon(
                        AssetImage(
                          "assets/icons/Glyph3@2x.png",
                        ),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "statics".tr,
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ImageIcon(
                        AssetImage(
                          "assets/icons/Glyph4@2x.png",
                        ),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "more".tr,
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ImageIcon(
                        AssetImage(
                          "assets/icons/Glyph5@2x.png",
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
