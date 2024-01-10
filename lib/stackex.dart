import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: StackEx(),
  ));
}

class StackEx extends StatelessWidget {
  const StackEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Atm Card"),
          elevation: 5,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Stack(children: [
            Container(
              height: 300,
              width: 400,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/02/26/73/34/360_F_226733418_88GpLUUrxNOS3AyeBVhwLZapAspZ6a05.jpg"))),
            ),
            Positioned(
              left: 20,
              top: 16,
              child: Text(
                "Visa Platinum",
                style: GoogleFonts.abel(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 30,
              top: 80,
              child: Row(
                children: [
                  const Icon(
                    Icons.nfc,
                    color: Colors.grey,
                    size: 50,
                  ),
                  Transform.rotate(
                    angle: 90 * pi / 180,
                    child: const Icon(
                      Icons.wifi,
                      color: Colors.grey,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              left: 30,
              child: Text("4000 1187 2345 5641",
                  style: GoogleFonts.frederickaTheGreat(
                    fontSize: 25,
                    color: Colors.white,
                  )),
            ),
            Positioned(
                top: 178,
                left: 30,
                child: Text("4000",
                    style: GoogleFonts.frederickaTheGreat(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            Positioned(
              left: 100,
              top: 210,
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'GOOD',
                        style: GoogleFonts.scada(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "THRU",
                        style: GoogleFonts.scada(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Text(
                    "12/20",
                    style: GoogleFonts.frederickaTheGreat(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 10,
              child: Text(
                "EISHA KHANNA",
                style: GoogleFonts.kreon(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                Text(
                "VISA",
                style: GoogleFonts.racingSansOne(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text("Platinum", style: GoogleFonts.racingSansOne(
                fontSize: 10,
                color: Colors.white,
                ),)
                ],
              ),
            )
          ]),
        ));
  }
}
