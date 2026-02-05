class OnboardingQuestions {
  OnboardingQuestions._();

  static const List<QuestionStep> steps = [
    QuestionStep(
      id: 1,
      hint: 'Imagine a specific person, not an abstract goal',
      questionEn: 'Who do you want to become in three years?',
      questionZh: '三年后你想成为谁？',
      hintEn: 'Imagine a specific person, not an abstract goal',
      hintZh: '想象一个具体的人，不是抽象目标',
    ),
    QuestionStep(
      id: 2,
      hint: 'Daily actions define who you are',
      questionEn: 'What does that person do every day?',
      questionZh: '那个人每天做什么？',
      hintEn: 'Daily actions define who you are',
      hintZh: '日常行为决定你是谁',
    ),
    QuestionStep(
      id: 3,
      hint: 'Change means losing some identities',
      questionEn: 'What do you need to give up to become them?',
      questionZh: '你需要放弃什么才能成为ta？',
      hintEn: 'Change means losing some identities',
      hintZh: '改变是"失去"一些身份',
    ),
    QuestionStep(
      id: 4,
      hint: 'Your identity declaration',
      questionEn: 'I am the type of person who...',
      questionZh: '我是一个...的人...',
      hintEn: 'Your identity declaration',
      hintZh: '你的身份宣言',
    ),
  ];
}

class QuestionStep {
  final int id;
  final String hint;
  final String questionEn;
  final String questionZh;
  final String hintEn;
  final String hintZh;

  const QuestionStep({
    required this.id,
    required this.hint,
    required this.questionEn,
    required this.questionZh,
    required this.hintEn,
    required this.hintZh,
  });

  String getQuestion(String locale) {
    return locale == 'zh' ? questionZh : questionEn;
  }

  String getHint(String locale) {
    return locale == 'zh' ? hintZh : hintEn;
  }
}
