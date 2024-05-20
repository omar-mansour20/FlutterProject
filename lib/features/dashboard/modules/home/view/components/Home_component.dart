import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/model/home_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/home/view/page/home_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/reservation/view/page/reservation_page.dart';

class Home_component extends StatelessWidget {
  const Home_component({super.key,required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 247, 207),
      body: Center(
        child: ListView(
          children: [
            Text(hotelModel.name??"hotel"),
            Text(hotelModel.descreption??"descreption")
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel1.jpeg',
            //       hotelName: 'Boutique Hotel',
            //       hotelSalary: "2500",
            //     ),
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel2.jpeg',
            //       hotelName: 'Westin Hotel',
            //       hotelSalary: "2500",
            //     ),
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel3.jpeg',
            //       hotelName: 'Shangri-La Hotel',
            //       hotelSalary: "2500",
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel4.jpeg',
            //       hotelName: 'Sheraton Hotel',
            //       hotelSalary: "2500",
            //     ),
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel5.jpeg',
            //       hotelName: 'Hyatt Hotel',
            //       hotelSalary: "2500",
            //     ),
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel6.jpeg',
            //       hotelName: 'Fairmont Hotel',
            //       hotelSalary: "2500",
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel7.jpeg',
            //       hotelName: 'Mandarin Hotel',
            //       hotelSalary: "2500",
            //     ),
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel8.jpeg',
            //       hotelName: 'Peninsula Hotel',
            //       hotelSalary: "2500",
            //     ),
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel9.jpeg',
            //       hotelName: 'Regis Hotel',
            //       hotelSalary: "2500",
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel10.jpeg',
            //       hotelName: 'Seasons Hotel',
            //       hotelSalary: "2500",
            //     ),
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel11.jpeg',
            //       hotelName: 'Wynn Hotel',
            //       hotelSalary: "2500",
            //     ),
            //     HotelBox(
            //       imageUrl: 'assets/images/hotel12.jpeg',
            //       hotelName: 'paris Hotel',
            //       hotelSalary: "2500",
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class HotelBox extends StatelessWidget {
  final String imageUrl;
  final String hotelName;
  final String hotelSalary;
  HotelBox(
      {required this.imageUrl,
      required this.hotelName,
      required this.hotelSalary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hotelName,
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hotelSalary,
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReservationPage()),
              );
            },
            child: Text(
              'reservation',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 30, 108, 172),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
