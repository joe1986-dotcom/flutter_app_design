
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/screens/quiz_screen.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "images/back.png"
                  ),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [

                  Spacer(flex: 2,),
                  Text(
                    "Let's Play Quiz,",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "Enter your informations below",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Spacer(),
                  TextField(
                    style: TextStyle(
                      color: Colors.white
                    ),

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintStyle: TextStyle(
                      color: Colors.white
                      ),
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => {
                      Get.to(QuizScreen())
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Let's start quiz",
                        style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.black
                        ),
                      ),

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ),
                  Spacer(flex: 2,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
