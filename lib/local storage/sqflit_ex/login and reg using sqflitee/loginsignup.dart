import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/peakpx.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PUNCH",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "PUNCH.EARN.REPEAT",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.credit_card_rounded,
                        size: 50,
                      ),
                      const Text("Some Randome Data"),
                      Spacer(flex: 2,),
                      MaterialButton(
                          color: Colors.black,
                          shape: StadiumBorder(),
                          minWidth: 300,
                          height: 50,
                          onPressed: () {},
                          child: Text(
                            "SIGNUP",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      MaterialButton(
                          color: Colors.white,
                          shape: StadiumBorder(),
                          minWidth: 300,
                          height: 50,
                          onPressed: () {},

                          child: Text(
                            "SIGNUP",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
