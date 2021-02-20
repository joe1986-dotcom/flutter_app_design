import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/components/progressbar.dart';
import 'package:flutter_app_design/components/question_card.dart';
import 'package:flutter_app_design/controllers/question_controller.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 問題を管理するコントローラーを生成
    QuestionController _questionController = Get.put(QuestionController());

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(
                child: PageView.builder(
                  // 全問題数を定義（コントローラーから取得）
                  itemCount: 4,
                  // スクロールしないように設定
                  physics: NeverScrollableScrollPhysics(),
                  // 問題部分は別ウィジェットで管理
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),

              ),
            ],
          ),
        )
      ],
    );
  }
}



