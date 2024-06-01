import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingHotels extends StatefulWidget {
  @override
  _BookingHotelsState createState() => _BookingHotelsState();
}

class _BookingHotelsState extends State<BookingHotels> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  int _numAdults = 1;
  int _numChildren = 0;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: (isCheckIn ? _checkInDate : _checkOutDate) ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
          if (_checkOutDate != null && _checkOutDate!.isBefore(picked)) {
            _checkOutDate = picked.add(Duration(days: 1));
          }
        } else {
          _checkOutDate = picked;
        }
      });
    }
  }

  void _selectGuests(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select Guests",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Adults", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (_numAdults > 1) {
                                setModalState(() {
                                  _numAdults--;
                                });
                                setState(() {});
                              }
                            },
                          ),
                          Text('$_numAdults', style: TextStyle(fontSize: 16)),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setModalState(() {
                                _numAdults++;
                              });
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Children", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (_numChildren > 0) {
                                setModalState(() {
                                  _numChildren--;
                                });
                                setState(() {});
                              }
                            },
                          ),
                          Text('$_numChildren', style: TextStyle(fontSize: 16)),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setModalState(() {
                                _numChildren++;
                              });
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Done"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 70, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
                Text(
                  "Booking",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.hotel_outlined,
                  color: Colors.deepPurpleAccent,
                  size: 30,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchField(),
                      const SizedBox(height: 10),
                      _dateRow(),
                      const SizedBox(height: 10),
                      _guestField(context),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text('Search'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.10),
            blurRadius: 30,
            spreadRadius: 8,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Tune Hotel KLIA-KLIA2',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset('assets/icons/Filter.svg'),
          ),
        ),
      ),
    );
  }

  Widget _dateRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: [
          Expanded(child: _dateField(context, 'Check-In', _checkInDate, true)),
          const SizedBox(width: 10),
          Expanded(child: _dateField(context, 'Check-Out', _checkOutDate, false)),
        ],
      ),
    );
  }

  Container _dateField(BuildContext context, String label, DateTime? date, bool isCheckIn) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.10),
            blurRadius: 30,
            spreadRadius: 8,
          ),
        ],
      ),
      child: TextField(
        readOnly: true,
        onTap: () => _selectDate(context, isCheckIn),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: date == null ? label : '${date.toLocal()}'.split(' ')[0],
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Icon(
            Icons.calendar_today,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _guestField(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectGuests(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.10),
              blurRadius: 30,
              spreadRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Guests',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              '$_numAdults Adults, $_numChildren Children',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

