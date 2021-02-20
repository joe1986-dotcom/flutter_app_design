class Question{
  // 問題Id
  final int id;
  // 問題文
  final String question;
  // 正解番号
  final int correctAns;
  // 選択肢（文字列リスト）
  final List<String> options;

  // コンストラクタ
  Question({this.id, this.question, this.correctAns, this.options});
}
  // 問題Json
  const List sample_data = [
    {
      "id":1,
      "question":"Flutter is an open-source UI software development kit created by ______",
      "correctAns":1,
      "options":["Apple","Google","Facebook","Amazon"],
    },

  ];

