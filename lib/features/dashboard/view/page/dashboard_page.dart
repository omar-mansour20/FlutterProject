import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/controller/dashboard_controller.dart';
import 'package:hotel_reservation_project/features/dashboard/controller/dashboard_state.dart';
// import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/view/page/account_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/cards/view/page/Card_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/home_local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/page/home_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/view/page/reservation_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/favorite/view/page/favorite_page.dart';

class dashBoardPage extends StatelessWidget {
  final List<String> appBarTitles = const ['Home','cards','Favorite','Account'];

  const dashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        // to take an object from controller
        create: (context) => dashboardController(), //object
        child: BlocBuilder<dashboardController, dashboardState>(
            // for syncing changes
            builder: (context, state) {
          dashboardController controller = context.read<dashboardController>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Text(appBarTitles[controller.tapIndex]),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () async {
                controller.onChangingTapIndex(3);
                Navigator.pushNamed(context, 'newAccount');
                },
                icon: const Icon(CupertinoIcons.add)),
                IconButton(onPressed: () async {
                controller.onChangingTapIndex(2);
                Navigator.pushNamed(context, 'reservation');
                }, icon: const Icon(CupertinoIcons.bed_double))
              ],
              

              
            ),
            //pageview
            body: PageView(
              controller: controller.pageViewController,
              onPageChanged: controller.onChangingTapIndex,
              children: const [
                  HomePage(),
                  CardPage(),
                FavoritePage(),
                AccountPage()
              ],
            ),
            // navigationbar
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.tapIndex,
              onTap: controller.onChangingTapIndex,
              showSelectedLabels: true,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.red,
              unselectedLabelStyle: const TextStyle(fontSize: 20),
              selectedLabelStyle: const TextStyle(fontSize: 25),
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.home,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bed), label: 'cards'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_rounded), label: 'Account'),
                //BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Page4'),
                //BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Page5'),
              ],
            ),
          );
        }));
  }
}
