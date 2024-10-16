import 'package:flutter/material.dart';

class FlexibleExpanded extends StatelessWidget {
  const FlexibleExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible vs Expanded"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildExampleRow(
              title: "Flexible",
              description: "Flexible takes up the remaining space but can shrink if needed",
              isFlexible: true,
            ),
            const SizedBox(height: 20),
            _buildExampleRow(
              title: "Expanded",
              description: "Expanded forces the widget to take up all the remaining space.",
              isFlexible: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleRow({
    required String title,
    required String description,
    required bool isFlexible,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            if (isFlexible)
              Flexible(child: _buildGreenContainer(description))
            else
              Expanded(child: _buildGreenContainer(description)),
            const Icon(Icons.sentiment_satisfied_alt),
          ],
        ),
      ],
    );
  }

  Widget _buildGreenContainer(String text) {
    return Container(
      height: 50,
      color: Colors.amber,
      padding: const EdgeInsets.all(4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}