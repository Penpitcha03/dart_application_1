import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = [
    // คำถาม 1
    Question(
      text: 'จุลินทรีย์มีกี่ชนิด?',
      options: [
        '2 ชนิด',
        '3 ชนิด',
        '4 ชนิด',
        '5 ชนิด',],
      answer: '3 ชนิด',),

    // คำถาม 2
    Question(
      text: 'หม้อนึ่งฆ่าเชื้อความดันไอ(autoclave)ใช้ความดันเท่าไหร่ในการฆ่าเชื้อ',
      options: [
        '15 ปอนด์',
        '17 ปอนด์',
        '19ปอนด์',
        '21ปอนด์',],
      answer: '17 ปอนด์',),

    // คำถาม 3
    Question(
      text: 'จานเพาะเชื้อทำให้ปราศจากเชื้อโดยวิธีใด',
      options: [
        'นำไปเผาผ่านไฟ',
        'นำไปต้มในนำ้เดือด',
        'นำไปอบในตู้อบลมร้อน',
        'นำไปใส่หม้อนึ่งฆ่าเชื้อความดันไอ',],
      answer: 'นำไปอบในตู้อบลมร้อน',),

    // คำถาม 4
    Question(
      text: 'อาหารเลี้ยงเชื้อ PDA ใช้เลี้ยงจุลินทรีย์ชนิดใด)',
      options: [
        'เเบคทีเรีย',
        'รา',
        'ยีสต์',
        'ไวรัส',],
      answer: 'รา',),

    // คำถาม 5
    Question(
      text: 'ข้อใดไม่ใช่องค์ประกอบหลักของเซลล์จุลินทรีย์?',
      options: [
        'เเหล่งคาร์บอน ',
        'ไนโตรเจน',
        'ธาตุอาหารรอง',
        'สังกะสี',],
      answer: 'สังกะสี',),

    // คำถาม 6
    Question(
      text: 'เเบคทีเรียเจริญได้ดีในค่า pHที่เท่าไหร่',
      options: [
        'pH 4',
        'pH 5',
        'pH 6',
        'pH 7',],
      answer: 'pH 7',),

    // คำถาม 7
    Question(
      text: 'ขั้นตอนเเรกก่อนทำการเตรียมอาหารเลี้ยงเชื้อคืออะไร',
      options: [
        'ชั่งอาหารเลี้ยงเชื้อใส่ขวดดูเเรน',
        'นำไปฆ่าเชื้อด้วยautoclave',
        'คำนวณปริมาณอาหารเลี้ยงเชื้อ',
        'เทอาหารลงจานเพาะเชื้อ',],
      answer: 'คำนวณปริมาณอาหารเลี้ยงเชื้อ',),

    // คำถาม 8
    Question(
      text: 'ราสกุลไหนที่ใช้ในการทำเต้าหู้ยี้',
      options: [
        'Mucor',
        'Rhizopus',
        'Aspergillus',
        'Penicillium',],
      answer: 'Mucor',),

    // คำถาม 9
    Question(
      text: 'เอนไซม์ใดทำหน้าที่เร่งปฏิกิริยาการเกิดสีน้ำตาลของผักผลไม้',
      options: [
        'OPP',
        'APO',
        'PPO',
        'POP',],
      answer: 'PPO',),

    // คำถาม 10
    Question(
      text: 'เเคโรทีนอยด์เป็นรงควัตถุสีอะไร',
      options: [
        'ม่วง',
        'ส้ม',
        'เหลือง',
        'เขียว',],
      answer: 'ส้ม',),
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(questions[currentQuestionIndex].text),
            ...questions[currentQuestionIndex].options.map((answer) {
              return ListTile(
                title: Text(answer),
                onTap: () {
                  if (answer == questions[currentQuestionIndex].answer) {
                    score++;
                  }
                  setState(() {
                    if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                    } else {
                      // แสดงผลลัพธ์
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('ผลลัพธ์'),
                          content: Text('คุณได้คะแนน $score จาก ${questions.length} คะแนน'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('ปิด'),
                            ),
                          ],
                        ),
                      );
                    }
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final String answer;

  Question({
    required this.text,
    required this.options,
    required this.answer,
  });
}