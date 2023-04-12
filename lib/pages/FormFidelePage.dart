import 'package:flutter/material.dart';
import '../widget/ChampSaisie.dart';
import '../widget/ChampSaisieNumber.dart';
import '../widget/Chargement.dart';
class FormFidelePage extends StatefulWidget{
  @override
  State<FormFidelePage> createState() => _FormFidelePageState();
}

class _FormFidelePageState extends State<FormFidelePage> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Form(
      child: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _imageUpload(),
                SizedBox(
                  height: 20,
                ),
                Text("S'enregistrer", style: TextStyle(fontSize: 20)),
                SizedBox(
                  height: 20,
                ),
                ChampSaisie(ctrl: firstName,
                    label: "Nom",
                    required: true,
                    isPassword: false),
                SizedBox(
                  height: 20,
                ),
                ChampSaisie(ctrl: lastName,
                    label: "Prénom",
                    required: true,
                    isPassword: false),
                SizedBox(
                  height: 20,
                ),
                ChampSaisieNumber(ctrl: age,
                    label: "age",
                    required: true,
                    isPassword: false),
                SizedBox(
                  height: 20,
                ),
                _buttonWidget(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _imageUpload() {
    return Stack(
      children: <Widget> [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage('assets/old-man.png'),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 20.0,
            ),
        )
      ],
    );
  }
  Widget _iconApp() {
    return Ink(
      child: Icon(
        Icons.home,
        size: 60,
        color: Colors.orange,
      ),
    );
  }

  Widget _buttonWidget() {
    return Container(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          print(firstName.text);
          print(lastName.text);
          print(age.text);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Text("S'identifier"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}