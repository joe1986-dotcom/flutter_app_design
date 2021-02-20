import 'package:flutter/cupertino.dart';
import 'package:flutter_app_design/models/question.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController with SingleGetTickerProviderMixin {

  // region メンバ変数

  // アニメーションコントローラー
  AnimationController _animationController;
  // アニメーション定義
  Animation _animation;
  Animation get animation => _animation;


  // ページコントローラー
  PageController _pageController;
  PageController get pageController => _pageController;
  // 全問題をQuestionクラスから取得
  List<Question> _questions = sample_data.map((question) => Question(
    id:question["id"],
    question:question["question"],
    correctAns:question["correctAns"],
    options:question["options"])).toList();
  List<Question> get questions => _questions;
  // 問題の正解番号
  int _currentCorrectAns;
  int get currentCorrectAns => _currentCorrectAns;
  // 選択された答え番号
  int _selectedAns;
  int get selectedAns => _selectedAns;

  // 現在の問題数
  RxInt _currentQuestionNum = 1.obs;
  RxInt get currentQuestionNum => _currentQuestionNum;
  // 現在の正解数
  int _correctNum = 0;
  int get correctNum => _correctNum;
  // endregion

  // region 初期化
  // ページコントローラーを取得
  @override
  onInit() {

    _animationController = AnimationController(duration:Duration(seconds: 60),vsync: this);
    // アニメーション追加（時刻）
    _animation = Tween(begin:0.0, end:1.0).animate(_animationController)
      ..addListener(() {
       update();
    });

    // アニメーションをスタートする
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();

  }

  // endregion

  // region 終了
  @override
  void onClose() {
    _pageController.dispose();
    _animationController.dispose();
    super.onClose();
  }



  // endregion

  // region メソッド

  // 正解チェック
  void checkAns(Question question, int selectedIndex){
    // 正解
    int correctAnsIndex = question.correctAns;
    // 選択
    int currentSelectedIndex = selectedIndex;

    if(correctAnsIndex == currentSelectedIndex){
      // 正解数を1上げる
      _correctNum++;
    }

    _animationController.stop();

    update();
    // 3秒待って次の問題へ遷移
    Future.delayed(Duration(seconds: 3),(){
      // 新しい画面にする
      nextQuestion();
    });

  }

  void nextQuestion(){
    // 問題数が最後か判定
    if(_questions.length != currentQuestionNum){
      // 最後でなければ画面を変える
      _pageController.nextPage(
        duration: Duration(milliseconds: 250),
        curve: Curves.ease,
      );

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);

    }


    // 最後であれば別画面に遷移
  }


  // 次の問題を出題

  // 現在の問題番号を更新
  void updateNum(int index){
    this._currentQuestionNum.value = index + 1;
  }

  // endregion

}