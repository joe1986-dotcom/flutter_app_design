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
    {
      "id": 2,
      "question": "When google release Flutter.",
      "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
      "correctAns": 2,
    },
    {
      "id": 3,
      "question": "A memory location that holds a single letter or number.",
      "options": ['Double', 'Int', 'Char', 'Word'],
      "correctAns": 2,
    },
    {
      "id": 4,
      "question": "What command do you use to output data to the screen?",
      "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
      "correctAns": 2,
    },
  ];

