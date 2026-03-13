import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';
import '../services/storage_service.dart';
import 'qr_scan_screen.dart';

class CheckinScreen extends StatefulWidget {
  const CheckinScreen({super.key});

  @override
  State<CheckinScreen> createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen> {

  final TextEditingController previousTopicController = TextEditingController();
  final TextEditingController expectedTopicController = TextEditingController();

  int mood = 3;
  String locationText = "Location not fetched";

  Future<void> getLocation() async {
    Position? position = await LocationService.getCurrentLocation();

    if (position != null) {
      setState(() {
        locationText =
            "Lat: ${position.latitude}, Lng: ${position.longitude}";
      });
    }
  }

  void submitCheckin() {

    Map<String, dynamic> data = {
      "previousTopic": previousTopicController.text,
      "expectedTopic": expectedTopicController.text,
      "mood": mood,
      "location": locationText,
      "time": DateTime.now().toString()
    };

    StorageService.saveCheckin(data);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Check-in saved")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Check-in"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [

            const Text("Previous Topic"),
            TextField(controller: previousTopicController),

            const SizedBox(height: 20),

            const Text("Expected Topic"),
            TextField(controller: expectedTopicController),

            const SizedBox(height: 20),

            const Text("Mood (1-5)"),

            Slider(
              min: 1,
              max: 5,
              divisions: 4,
              value: mood.toDouble(),
              label: mood.toString(),
              onChanged: (value) {
                setState(() {
                  mood = value.toInt();
                });
              },
            ),

            const SizedBox(height: 20),

            Text(locationText),

            ElevatedButton(
              onPressed: getLocation,
              child: const Text("Get Location"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Scan QR Code"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QRScanScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: submitCheckin,
              child: const Text("Submit Check-in"),
            ),

          ],
        ),
      ),
    );
  }
}