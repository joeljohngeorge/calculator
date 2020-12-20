import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Calculator",
        theme: ThemeData(
          primarySwatch:Colors.purple,
        ),
      home: Calcpage(),
    );
  }
}
class Calcpage extends StatefulWidget {
  @override
  _CalcpageState createState() => _CalcpageState();
}

class _CalcpageState extends State<Calcpage> {
double n1=0.0;
double n2=0.0;
String output="0";
String result="0";
String operation="";
  void clickprint(String val)
  {
      if(val=="AC"){
       result="0";
        n1=0.0;
        n2=0.0;
        operation="";
      }
      else if(val=="+" || val=="-" || val=="/" || val=="x")
      {
        n1=double.parse(output);
        result="0";
        operation=val;
      }
      else if(val==".")
      {  if(result.contains("."))
         { print("Already exists");
            return; }
            else
             result=result+val;}

      else if(val=="=")
       { n2=double.parse(output);
        if(operation=="+")
         { result=(n1+n2).toString();}
        if(operation=="-")
        { result=(n1-n2).toString();}
        if(operation=="/")
        { result=(n1/n2).toString();}
        if(operation=="x")
        { result=(n1*n2).toString();}
        n1=0.0;
        n2=0.0;
        operation="";
  }
  else
    {   result+=val;}
    print(result);
    setState(() {
      output=double.parse(result).toStringAsFixed(2);
    });
  }
  @override
  Widget build(BuildContext context) {
    
                
    Widget customizedbutton(String val){
        return Expanded(child: OutlineButton(
          padding: EdgeInsets.all(20),
          onPressed: ()=>clickprint(val),
          child: Text("$val",style: TextStyle(fontSize:30)
          )
        )
        );
    }
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Calculator")
        )
      ),
      body: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerRight,
              child: Text("$output",
            style:TextStyle(fontSize:40,fontWeight: FontWeight.w600)),
            )
            ),
    
            Row(children: <Widget>[
              customizedbutton("7"),
              customizedbutton("8"),
              customizedbutton("9"),
              customizedbutton("+"),
              
            ],),
            Row(children: <Widget>[
              customizedbutton("4"),
              customizedbutton("5"),
              customizedbutton("6"),
              customizedbutton("/"),
            ],),
            Row
            (children: <Widget>[
              customizedbutton("1"),
              customizedbutton("2"),
              customizedbutton("3"),
              customizedbutton("-"),
            ],),
            Row(children: <Widget>[

              customizedbutton("."),
              customizedbutton("0"),
              customizedbutton("00"),
              customizedbutton("x"),],),
          
          Row(children: <Widget>[
             customizedbutton("AC"),
             customizedbutton("=")
             ],),
          ],
      ),
    ),);
  }
}
  