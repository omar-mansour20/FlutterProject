import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/controller/dashboard_controller.dart';
import 'package:hotel_reservation_project/features/dashboard/controller/dashboard_state.dart';

class dashBoardPage extends StatelessWidget {
  const dashBoardPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
      // to take an object from controller
      create: (context) => dashboardController(), //object
      child: BlocBuilder<dashboardController, dashboardState>( // for syncing changes
         builder: (context, state){
          dashboardController controller = context.read<dashboardController>();

          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.red,),
            //pageview
            body: PageView(
              controller: controller.pageViewController,
              onPageChanged: controller.onChangingTapIndex,
              children: [Text("Page1",),Text("Page2"),Text("Page3"),Text("Page4"),Text("Page5")],
            ),
            // navigationbar
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.tapIndex,
              onTap: controller.onChangingTapIndex,
              showSelectedLabels: true,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.red,
              unselectedLabelStyle: const TextStyle(fontSize: 20),
              selectedLabelStyle:const TextStyle(fontSize: 30) ,
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Page1'),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Page2'),
                BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Page3'),
                BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Page4'),
                BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Page5'),
              ],

              ),
          );
        } 
      )
    );
  }
} 