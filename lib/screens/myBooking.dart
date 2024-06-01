// myBooking.dart
import 'package:flutter/material.dart';
import 'package:assignment_1/models/booking_model.dart';

class MyBookingPage extends StatefulWidget {
  final List<Booking> bookings;

  MyBookingPage({required this.bookings});

  @override
  _MyBookingPageState createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  String filter = 'Upcoming';

  void _cancelBooking(int index) {
    setState(() {
      widget.bookings[index] = widget.bookings[index].copyWith(status: 'Cancel');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Booking> filteredBookings = widget.bookings.where((booking) => booking.status == filter).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filter = 'Upcoming';
                  });
                },
                child: Text('Upcoming'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filter = 'Complete';
                  });
                },
                child: Text('Complete'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filter = 'Cancel';
                  });
                },
                child: Text('Cancel'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBookings.length,
              itemBuilder: (context, index) {
                final booking = filteredBookings[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                      booking.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(booking.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location: ${booking.location}'),
                        Text('Date: ${booking.date}'),
                        Text('Guests: ${booking.guests}'),
                        Text('Booking ID: ${booking.bookingId}'),
                      ],
                    ),
                    trailing: booking.status == 'Upcoming'
                        ? ElevatedButton(
                      onPressed: () {
                        _cancelBooking(index);
                      },
                      child: const Text('Cancel'),
                    )
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
