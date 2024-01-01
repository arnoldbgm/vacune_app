import 'package:flutter/material.dart';
import 'package:flutter_vacuna/pages/home_page.dart';
import 'package:flutter_vacuna/ui/general/colors.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Tu carnet de vacunacion",
              style: TextStyle(
                fontSize: 46.0,
                height: 1,
                fontWeight: FontWeight.w700,
                color: Color(0xff2A2B30),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Con esta App podras gestionar los carnet de las personas que mas prefieras",
              style: TextStyle(
                fontSize: 16.0,
                height: 1.4,
                fontWeight: FontWeight.w500,
                color: Color(0xff2A2B30),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kFontPrimaryColor,
                ),
                child: Text(
                  "Iniciar ahora",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
