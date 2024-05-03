// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});

//   @override
//  Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SerachCubit(),
//       child: BlocBuilder<SerachCubit, SerachState>(
//         builder: (context, state) {
//           final SerachCubit controller = context.read<SerachCubit>();
//           //scaffold
//           return Scaffold(
//             body: state is SerachLoading
//                 ? const CircularProgressIndicator()// loading screen
//                 : state is SerachEmpty
//                     ? const Center(
//                         child: Icon(
//                         CupertinoIcons.delete, // icon of delete if state is empty
//                         size: 100,
//                         color: Colors.red,
//                       )
//                       )
//                       //else
//                     : ListView.builder( 
//                         itemCount: controller.accounts.length,
//                         itemBuilder: (_, int index) {
//                           return AccountItemWidget(accountModel: controller.accounts[index]);
//                         }),
//           );
//         },
//       ),
//     );
//   }
// }