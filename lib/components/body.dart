import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/components/progressbar.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "images/back.png"
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: ProgressBar(),
              ),
              SizedBox(height:10),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text.rich(
                    TextSpan(
                      text: "Question 1",
                      style: Theme.of(context).textTheme.headline4.copyWith(color:Colors.green),
                      children: [
                        TextSpan(
                        text: "/10",
                        style: Theme.of(context).textTheme.headline5.copyWith(color:Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              Divider(
                thickness: 3,
                color: Colors.grey,
              ),

            ],
          ),
        )
      ],
    );
  }
}



