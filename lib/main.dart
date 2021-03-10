import 'package:flutter/material.dart';

void main() => runApp(new FlutterCalcMidTerm());
class FlutterCalcMidTerm extends StatelessWidget {
  Widget build(BuildContext buildcx) {
    return new MaterialApp(
      title: '',
      home: new CalcState(),
    );
  }
}
class CalcState extends StatefulWidget{
  CalcStateState createState() => CalcStateState();
}
class CalcStateState extends State<CalcState> {
  dynamic text ='0';
  double firstNumber = 0;
  double secondNumber = 0;

  dynamic result = '';
  dynamic resultFinal = '';
  dynamic operand = '';
  dynamic preOperand = '';

  Widget btn(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 0),
      child: new RaisedButton(
              child: Text(btnText,
              style: TextStyle(
                fontSize: 30
              ),
              ),
              onPressed: (){
                  estimate(btnText);
              },
              color: color,
              padding: EdgeInsets.all(30.0),
              shape: ContinuousRectangleBorder()
    )
    );
  }
  Widget zeroBtn(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 0),
      child: new RaisedButton(
              child: Text(btnText,
              style: TextStyle(
                fontSize: 30
              ),
              ),
              onPressed: (){
                estimate(btnText);
              },
              color: color,
              padding: EdgeInsets.only(left: 116, right: 40, top: 30, bottom: 30),
              shape: BeveledRectangleBorder()
    )
    );
  } 
  Widget build(BuildContext buildCx) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black12,
      body: Container(
        margin: EdgeInsets.only(bottom: 0.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70.0,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                ),
              )
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              btn('C',const Color(0xffa5a5a5)), // AARRGGBB
              btn('+/-',const Color(0xffa5a5a5)),
              btn('%',const Color(0xffa5a5a5)),
              btn('/', Colors.orange),            
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              btn('7',const Color.fromRGBO(210,211,215,1)),
              btn('8',const Color.fromRGBO(210,211,215,1)),
              btn('9',const Color.fromRGBO(210,211,215,1)),
              btn('x',Colors.orange),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              btn('4',const Color.fromRGBO(210,211,215,1)),
              btn('5',const Color.fromRGBO(210,211,215,1)),
              btn('6',const Color.fromRGBO(210,211,215,1)),
              btn('-',Colors.orange),
            ],), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              btn('1',const Color.fromRGBO(210,211,215,1)),
              btn('2',const Color.fromRGBO(210,211,215,1)),
              btn('3',const Color.fromRGBO(210,211,215,1)),
              btn('+',Colors.orange),
            ],), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              zeroBtn('0',const Color.fromRGBO(210,211,215,1)),
              btn('.',const Color.fromRGBO(210,211,215,1)),
              btn('=',Colors.orange),
            ],),         
          ],
        ),
      ),
    );
  }
  String isContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> eraseDot = result.toString().split('.');
      if(!(int.parse(eraseDot[1]) > 0))
        return result = eraseDot[0].toString();
    }
    return result;
  }
  void estimate(btnText) {
    if(btnText  == 'C') {
      text ='0';
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      resultFinal = '';
      operand = '';
      preOperand = '';
    } else if( operand == '=' && btnText == '=') {
      if(preOperand == '+') {
         resultFinal = addition();
      } else if( preOperand == '-') {
          resultFinal = subtraction();
      } else if( preOperand == 'x') {
          resultFinal = multiplication();
      } else if( preOperand == '/') {
          resultFinal = division();
      }
    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(firstNumber == 0) {
          firstNumber = double.parse(result);
      } else {
          secondNumber = double.parse(result);
      }
      if(operand == '+') {
          resultFinal = addition();
      } else if( operand == '-') {
          resultFinal = subtraction();
      } else if( operand == 'x') {
          resultFinal = multiplication();
      } else if( operand == '/') {
          resultFinal = division();
      }
      preOperand = operand;
      operand = btnText;
      result = '';
      }
    else if(btnText == '%') {
     result = firstNumber / 100;
     resultFinal = isContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      resultFinal = result;
      }
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-' + result.toString();
        resultFinal = result;
    }
    else {
        result = result + btnText;
        resultFinal = result;
    }
    setState(() {
          text = resultFinal;
        });
  }
  String addition() {
         result = (firstNumber + secondNumber).toString();
          firstNumber = double.parse(result);
          return isContainDecimal(result);
  }

  String subtraction() {
         result = (firstNumber - secondNumber).toString();
          firstNumber = double.parse(result);
         return isContainDecimal(result);
  }
  String multiplication() {
         result = (firstNumber * secondNumber).toString();
          firstNumber = double.parse(result);
         return isContainDecimal(result);
  }
  String division() {
          result = (firstNumber / secondNumber).toString();
           firstNumber = double.parse(result);
          return isContainDecimal(result);
  }

}