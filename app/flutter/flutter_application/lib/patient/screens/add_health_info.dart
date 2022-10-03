import 'package:flutter/material.dart';
import 'package:conditional_questions/conditional_questions.dart';
import '../patient.dart';

class PatientHealthInfo extends StatelessWidget {
  int id;
  PatientHealthInfo({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ND TELEMEDICINE'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: PopupMenuButton(
                child: Icon(Icons.account_circle),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 'logout',
                      child: Text('Log out'),
                    ),
                    PopupMenuItem(
                      value: 'changePW',
                      child: Text('Change Password'),
                    ),
                    PopupMenuItem(
                      value: 'rmAccount',
                      child: Text('Delete account'),
                    ),
                  ];
                },
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // todo debug msg
                  print("passed user id healthinfo: $id");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Patient(id: id)));
                },
                child: Icon(Icons.home),
              )),
        ],
      ),
      body: HealthInfo(),
    );
  }
}

class HealthInfo extends StatefulWidget {
  HealthInfo({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HealthInfoState createState() => _HealthInfoState();
}

class _HealthInfoState extends State<HealthInfo> {
  final _key = GlobalKey<QuestionFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConditionalQuestions(
        key: _key,
        children: questions(),
        trailing: [
          MaterialButton(
            color: Colors.deepOrange,
            splashColor: Colors.orangeAccent,
            onPressed: () async {
              if (_key.currentState!.validate()) {
                print("validated!");
                await (Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (_) => Scaffold(
                            appBar: AppBar(
                              leading: BackButton(color: Colors.black),
                            ),
                            body: SingleChildScrollView(
                              child: Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: _key.currentState!
                                        .getElementList()
                                        .map<Widget>((element) {
                                      return Row(children: [
                                        Text("${element.question}:"),
                                        Text(element.answer == null
                                            ? "null"
                                            : element.answer)
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ));
              }
            },
            child: Text("Submit"),
          ),
          // todo: remove button for debug
          MaterialButton(
              child: Text("debug"),
              onPressed: () {
                if (_key.currentState!.getElementList().elementAt(1).question ==
                    "Comments") {
                  for (int i = 0; i < 9; ++i) {
                    print(
                        "returned list of survey$i: ${_key.currentState!.getElementList().elementAt(i).question}");
                  }
                } else {
                  for (int i = 0; i < 8; ++i) {
                    print(
                        "returned list of survey$i: ${_key.currentState!.getElementList().elementAt(i).question}");
                  }
                }
              })
        ],
        leading: [Text("TITLE")],
      ),
    );
  }
}

List<Question> questions() {
  return [
    // Question(
    //   question: "What is your name?",
    //   //isMandatory: true,
    //   validate: (field) {
    //     if (field.isEmpty) return "Field cannot be empty";
    //     return null;
    //   },
    // ),
    NestedQuestion(
        question: "Are you on any medications?",
        answers: ["Yes", "No"],
        children: {
          'Yes': [
            Question(
              question: "Comments",
            ),
          ],
        },
        isMandatory: true),
    PolarQuestion(
        question: "Liver disease?", answers: ["Yes", "No"], isMandatory: true),
    PolarQuestion(
        question: "Kidney Disease?", answers: ["Yes", "No"], isMandatory: true),
    PolarQuestion(
        question: "Heart Disease?", answers: ["Yes", "No"], isMandatory: true),
    PolarQuestion(
        question: "Diabetes?", answers: ["Yes", "No"], isMandatory: true),
    PolarQuestion(
        question: "Cancers?", answers: ["Yes", "No"], isMandatory: true),
    Question(question: "Any other medical problems or allergies?"),
    Question(question: "Any past surgeries or hospitalisations?"),
  ];
}
