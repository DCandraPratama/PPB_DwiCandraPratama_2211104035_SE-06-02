import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPackage extends StatefulWidget {
  const MyPackage({super.key});

  @override
  State<MyPackage> createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Package", style: GoogleFonts.sriracha()),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  hintText: "Masukan Username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  hintText: "Masukan Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Ini adalah Elevated Button",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            ),
            SizedBox(height: 15),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Ini adalah text button",
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 15),
            DropdownButton<String>(
                isExpanded: true,
                value: selectedValue,
                items: <String>['Pilih Opsi...', 'Opsi 1', 'Opsi 2']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
