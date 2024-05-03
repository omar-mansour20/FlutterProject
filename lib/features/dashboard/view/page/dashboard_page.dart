import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/controller/dashboard_controller.dart';
import 'package:hotel_reservation_project/features/dashboard/controller/dashboard_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/view/page/account_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/repo/home_local_db_data.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/page/home_page.dart';

import '../../modules/home/model/repo/firebase_data.dart';

class dashBoardPage extends StatelessWidget {
  final List<String> appBarTitles = const ['Home', 'Search', 'Account'];

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
              actions: [
                IconButton(onPressed: () async {
                await  (await DatabaseRepo.instance).insert(name: 'omar',address: 'menouf');
                await  (await HotelDatabaseRepo.instance).insert(name: 'omar',address: 'menouf');
                //await (await FirebaseRepo.instance).insert(name: 'Helton',address: 'cairo');
                }, icon: Icon(CupertinoIcons.add))
              ],
            ),
            //pageview
            body: PageView(
              controller: controller.pageViewController,
              onPageChanged: controller.onChangingTapIndex,
              children: [
                  HomePage()
                ,
                Text(
                  "Search",
                ),
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
              selectedLabelStyle: const TextStyle(fontSize: 30),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.home,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
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
