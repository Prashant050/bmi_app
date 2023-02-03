import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "BMI APP",
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var msg = "";

  var bgColor = Colors.blue.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI APP"),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 21),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text("Enter your weight(in Kg)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text("Enter your Feet(in Feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text("Enter your Feet(in Feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if(wt!= "" && ft!= "" && inch!= ""){
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iIn = int.parse(inch);

                        var tInch = (iFt * 12) + iIn;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;

                        var bmi = iWt / (tM * tM);

                        if(bmi > 25){
                          msg = "You are OverWeight!!!";
                          bgColor = Colors.orange.shade200;
                        }else if(bmi < 18) {
                          msg = "You are UnderWeight!!!";
                          bgColor = Colors.red.shade200;
                        }else {
                          msg = "You are Healthy!!!";
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                        });

                      } else {
                        setState(() {
                          result = "Please fill all the required blanks..!!";

                        });
                      }

                },
                    child: const Text("Calculate")),
                SizedBox(height: 11,),

                Text(result, style: TextStyle(fontSize: 19),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
