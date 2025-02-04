import 'package:flutter/material.dart';
import 'package:droute_frontend/styles/color/app_color.dart';
import 'package:droute_frontend/screens/user/checkout.dart';

class SourceDestination extends StatefulWidget {
  const SourceDestination({super.key});

  @override
  State<SourceDestination> createState() => _SourceDestinationState();
}

class _SourceDestinationState extends State<SourceDestination> {
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController volumeController = TextEditingController();
  String _selectedUnit = "Inch";
  int _currentIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9), // White with opacity
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Location Section
            Container(
              margin: const EdgeInsets.only(top: 14, bottom: 14),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Current Location",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'sky bay F wing, mahalunge, balewadi.....',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.my_location,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Container with TextFormFields
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First TextFormField for Source
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Source",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Second TextFormField for Destination
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Destination",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Row with Weight and Volume Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Weight in Kg Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Weight in Kg",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: "Enter Weight",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Volume in ft^3 Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Volume in ft³",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: "Enter Volume",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Packaged Size Selection (Inch or Foot)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Packaged Size",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Row(
                        children: [
                          // Inch Option
                          Row(
                            children: [
                              Radio<String>(
                                value: 'inch',
                                groupValue: _selectedUnit,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedUnit = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Inch',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Foot Option
                          Row(
                            children: [
                              Radio<String>(
                                value: 'foot',
                                groupValue: _selectedUnit,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedUnit = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Foot',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Length, Width, Height Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Length Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: "Length",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Width Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: "Width",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Height Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: "Height",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Search Button
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: AppColor.deepOceanBlue,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: const Text(
                          "Search for a vehicle",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Driver Card Section
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return DriverCard(
                  driverName: 'Driver Name',
                  rating: 4.5,
                  origin: 'Pune',
                  originTime: '3:00 PM 15/01/25',
                  destination: 'Mumbai',
                  destinationTime: '3:00 PM 15/01/25',
                  weightCapacity: 120,
                  volumeCapacity: 80,
                );
              },
            ),
          ],
        ),
      )
      ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // Current tab index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current tab index
          });
        },
        selectedItemColor: AppColor.deepOceanBlue,
        // Active icon color
        unselectedItemColor: Colors.grey,
        // Inactive icon color
        showUnselectedLabels: true,
        // Show labels for inactive items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: "Note",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_crash_outlined),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  final String driverName;
  final double rating;
  final String origin;
  final String originTime;
  final String destination;
  final String destinationTime;
  final int weightCapacity;
  final int volumeCapacity;

  const DriverCard({
    Key? key,
    required this.driverName,
    required this.rating,
    required this.origin,
    required this.originTime,
    required this.destination,
    required this.destinationTime,
    required this.weightCapacity,
    required this.volumeCapacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.deepOceanBlue,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    driverName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$rating',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            color: AppColor.deepOceanBlue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLocationInfo(origin, originTime),
                  _buildLocationInfo(destination, destinationTime),
                ],
              ),
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Avl. wt. capacity: $weightCapacity kg',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Avl. vol. capacity: $volumeCapacity ft^3',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInfo(String location, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          location,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
