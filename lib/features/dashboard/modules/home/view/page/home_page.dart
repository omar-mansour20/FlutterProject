import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/Themes/my_Theme.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_cubit.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/controller/hotel_state.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/components/Home_component.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {

   return BlocProvider.value(
    value: HotelCubit.instance,
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (context,state){
          final HotelCubit controller =context.read<HotelCubit>();
      return MaterialApp(
        theme:MyTheme.instance.dark,
          darkTheme:MyTheme.instance.light,
          themeMode:ThemeMode.light,
          home: Scaffold(

            body: State is HotelLoading?
            const CircularProgressIndicator():
            State is HotelEmpty?
            const Center(child: Icon(CupertinoIcons.delete,
            size: 50,
            color: Colors.blue,
            ),):

             ListView.builder(

              itemBuilder: (_,int index)=>Home_component(
                hotelModel: controller.hotels[index], controller: controller,) ,
              itemCount: controller.hotels.length,
               ),

    ),
      );
        }
    ),
   );
  }
}

 





// this vommented code to show the content of db of hotels



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//      return BlocProvider(
//       create: (context) => HotelCubit(),
//       child: BlocBuilder<HotelCubit, HotelState>(
//         builder: (context, state) {
//           final HotelCubit controller = context.read<HotelCubit>();
//           //scaffold
//           return Scaffold(
//             //backgroundColor: Color.fromARGB(255, 45, 45, 45),
//             body: state is HotelLoading
//                 ? const CircularProgressIndicator() // loading screen
//                 : state is HotelEmpty
//                     ? const Center(
//                         child: Icon(
//                         CupertinoIcons
//                             .delete, // icon of delete if state is empty
//                         size: 100,
//                         color: Colors.red,
//                       ))
//                     //else
//                     : ListView.builder(
//                         itemCount: controller.hotels.length,
//                         itemBuilder: (_, int index) {
//                           return HotelItemWidget(
//                               hotelModel: controller.hotels[index]);
//                         }),
//           );
//         },
//       ),
//     );
//   }
// }




// class HotelItemWidget extends StatelessWidget {
//   const HotelItemWidget({super.key, required this.hotelModel});
//   final HotelModel hotelModel;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color:Color.fromARGB(255, 129, 184, 192),
//           border: Border.all(color: Colors.black,width: 2),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 hotelModel.id ?? 'no id',
//                 style: const TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 hotelModel.name ?? 'no name',
//                 style: const TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 hotelModel.address ?? 'no id',
//                 style: const TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 hotelModel.roomCategory ?? 'no id',
//                 style: const TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 hotelModel.descreption ?? 'no id',
//                 style: const TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 1),
//                 child: Text(
//                   (hotelModel.price).toString()??'0',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



