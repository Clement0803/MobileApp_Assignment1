class Booking {
  final String name;
  final String location;
  final String date;
  final int guests;
  final String bookingId;
  final String status;
  final String image;

  Booking({
    required this.name,
    required this.location,
    required this.date,
    required this.guests,
    required this.bookingId,
    required this.status,
    required this.image,
  });

  Booking copyWith({String? status}) {
    return Booking(
      name: this.name,
      location: this.location,
      date: this.date,
      guests: this.guests,
      bookingId: this.bookingId,
      status: status ?? this.status,
      image: this.image,
    );
  }
}
