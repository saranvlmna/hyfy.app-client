// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hyfy/components/auth/authScreen.dart';

class UpdateDobScreen extends StatelessWidget {
  const UpdateDobScreen({super.key});

  get dateController => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 40.0),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "My birthday",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Ysabeau'),
                    textAlign: TextAlign.start,
                  ),
                  Container(height: 80.0),

//  Container(
//               color: Colors.green,
//               child: new IconButton(
//                   icon: new Icon(Icons.search,color: Colors.white,),onPressed: null),
//             ),

                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 30, top: 30),
                    child: IconButton(
                      color: const Color(0xffD2576D),
                      hoverColor: const Color(0xffD2576D),
                      highlightColor: const Color.fromARGB(255, 165, 121, 121),
                      splashColor: const Color.fromARGB(255, 221, 186, 193),
                      disabledColor: const Color.fromARGB(255, 176, 164, 164),
                      icon: const Text(
                        'Select date',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'BrunoAceSC'),
                      ),
                      iconSize: 100,
                      onPressed: () async {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const OtpVerifyScreen())
                        // );
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                          helpText: 'My birthday',
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Colors.white,
                                  onPrimary: Color(0xffD2576D),
                                  onSurface: Colors.black,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: const Color(0xffD2576D),
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            dateController.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    // ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 260,
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                  elevation: 20.0,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Color(0xffCB3333)),
                ),
              ),
            ),
            Container(height: 60.0),
          ],
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
