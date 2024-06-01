// home_page.dart
import 'package:flutter/material.dart';
import 'package:assignment_1/screens/tripshome_page.dart';
import 'package:assignment_1/screens/profile_page.dart';
import 'package:assignment_1/screens/myBooking.dart';
import 'package:assignment_1/screens/cart_page.dart';
import 'package:assignment_1/models/cart_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  CartModel cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    final pages = [
      TripsHome(),
      MyBookingPage(bookings: cartModel.bookings),
      CartPage(cartModel: cartModel),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Malaysia Xplore',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(),
        child: ClipRRect(
          child: BottomNavigationBar(
            selectedItemColor: Colors.indigoAccent,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            backgroundColor: Colors.deepPurpleAccent,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "HOME",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: "My Booking",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "CARTS",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
