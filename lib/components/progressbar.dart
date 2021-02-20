import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/controllers/question_controller.dart';
import 'package:get/get.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color:Color(0xFF3F4768),
          width: 3,
        ),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) =>
            Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * qnController.animation.value,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                );

              }
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (qnController.animation.value * 60).round().toString() + " sec",
                      // 10.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.timer,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
