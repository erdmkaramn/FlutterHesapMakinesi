import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HesapMakinesi());
  }
}

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  var output = "0";
  var sayi1 = 0.0;
  var sayi2 = 0.0;
  var islem = "";
  var ilktik = true;
  buttonPressed(String buttonText) {
    if (ilktik) {
      output = "";
      ilktik = false;
    }

    if (buttonText == "TEMİZLE") {
      output = "0";
      sayi1 = 0.0;
      sayi2 = 0.0;
      islem = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      sayi1 = double.parse(output);
      islem = buttonText;
      output = sayi1.toString() + buttonText;
    } else if (buttonText == ".") {
      if (output.contains(".")) {
        print("Zaten Ondalık");
        return;
      } else {
        output = output + buttonText;
      }
    } else if (buttonText == "=") {
      if (islem == "+") {
        output = (sayi1 + sayi2).toString();
      }
      if (islem == "-") {
        output = (sayi1 - sayi2).toString();
      }
      if (islem == "X") {
        output = (sayi1 * sayi2).toString();
      }
      if (islem == "/") {
        output = (sayi1 / sayi2).toString();
      }
      sayi1 = 0.0;
      sayi2 = 0.0;
    } else {
      sayi2 = double.parse(buttonText);
      output = output + buttonText;
    }
    print(output);
    setState(() {
      output = output;
    });
  }

  buildButton(String buttonText) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(24),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () => {buttonPressed(buttonText)},
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hesap Makinesi",
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
                ),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("TEMİZLE"),
                    buildButton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
