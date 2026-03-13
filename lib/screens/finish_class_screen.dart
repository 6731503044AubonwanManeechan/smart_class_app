import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class FinishClassScreen extends StatelessWidget {
  const FinishClassScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final checkins = StorageService.getCheckins();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Finish Class"),
      ),

      body: ListView.builder(
        itemCount: checkins.length,
        itemBuilder: (context, index) {

          final data = checkins[index];

          return ListTile(
            title: Text(data["previousTopic"] ?? ""),
            subtitle: Text(
                "Expected: ${data["expectedTopic"]} | Mood: ${data["mood"]}"),
          );
        },
      ),
    );
  }
}