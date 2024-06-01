// cart_model.dart
import 'package:assignment_1/models/booking_model.dart';
import 'package:assignment_1/models/hotels_model.dart';

class CartModel {
  List<Hotel> hotels = [
    Hotel(
      name: 'Villa Hotel',
      location: 'Kuala-Lumpur',
      rating: 4.5,
      image: 'assets/images/hotel1.jpg',
      price: 'RM 278',
    ),
    Hotel(
      name: 'Sri Hotel',
      location: 'Kuching',
      rating: 4.7,
      image: 'assets/images/hotel2.jpg',
      price: 'RM 98',
    ),
    Hotel(
      name: '99 Hotel',
      location: 'Sabah',
      rating: 4.2,
      image: 'assets/images/hotel3.jpg',
      price: 'RM 108',
    ),
    // Add more hotels as needed
  ];

  List<Booking> bookings = [];

  void removeHotel(int index) {
    hotels.removeAt(index);
  }

  void bookHotel(Hotel hotel) {
    final booking = Booking(
      name: hotel.name,
      location: hotel.location,
      date: '2023-12-31', // Placeholder date
      guests: 2, // Placeholder number of guests
      bookingId: 'BK${DateTime.now().millisecondsSinceEpoch}',
      status: 'Upcoming',
      image: hotel.image,
    );
    bookings.add(booking);
  }
}
