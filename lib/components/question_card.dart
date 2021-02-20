import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/components/option.dart';
import 'package:flutter_app_design/controllers/question_controller.dart';
import 'package:flutter_app_design/models/question.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  QuestionCard({Key key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.question),
          SizedBox(height: 10.0),
          ...List.generate(
          // 全問題数
          4, (index) => Option(
            index:index,
            text: question.options[index],
            press: (){
              _questionController.checkAns(question, index);
            },
            ),
          ),
        ],
      ),
    );
  }
}
