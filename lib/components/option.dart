import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/constants.dart';
import 'package:flutter_app_design/controllers/question_controller.dart';
import 'package:get/get.dart';

class Option extends StatelessWidget {

  // 選択肢（番号）
  final int index;
  // 選択肢（テキスト）
  final String text;
  // 押下したときの処理
  final VoidCallback press;

  const Option({Key key, this.index, this.text, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init:QuestionController(),
      builder: (qnController) {
        Color getColor() {
          // デフォルト
          Color result = kGrayColor;

          if (qnController.isAnswered) {
            if (index == qnController.currentCorrectAns) {
              // 回答が一致
              result = kGreenColor;
            }
            else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.currentCorrectAns) {

              // 回答が不一致
              result = kRedColor;
            }
          }
          return result;
        }
        IconData getIcon(){
          return getColor() == kGreenColor ? Icons.done : Icons.close;
        }


        return InkWell(
          onTap: press,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: getColor()),
            ),
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${index+1}.${text}"),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: getColor() == kGrayColor ? Colors.transparent : getColor(),
                    border: Border.all(color: getColor()),
                  ),
                  child: getColor() == kGrayColor? null : Icon(
                    getIcon(),
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
