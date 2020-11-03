import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('La vamos a romper en el ISC', true),
    Question('Luciana va a cambiar', false),
    Question('Chamo necesita transplante de pulmón', true),
    Question('Que nota el ICFES', false),
    Question('Our ISC will win outstanding', true),
    Question('frutivity will be a game changer', true),
    Question('Frubana will beat us', false),
    Question('Meneses needs to work more', true),
    Question('Juan Camilo is going to EAFIT', true),
    Question('Alyssa is normal', false),
    Question('Meneses will quit the checho', false),
    Question('I have two legs and two arms', true),
    Question('It is possible for Paula to win the Paraolympics', true),
    Question('Chamo cayó en el vicio', true),
    Question('This will be the best year in parties of our lives', true),
    Question('Barrientos likes football players and animals', true),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('returning true');

      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
