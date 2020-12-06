import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {   
    return MaterialApp(   
        
      home: new Scaffold(   
         backgroundColor: Colors.cyan,
           
        body: Center(   
          child: Column(
            children: [
              Container(
                height: 150.0,
                width: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/top.png'),
                    fit: BoxFit.fill,
                  ),
              
                ),
              ),
              Container(
                height: 50.0,
                width: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/welcome.png'),
                    fit: BoxFit.fill,
                  ),
                
                ),
              ),
              Container(
               height: 50.0,
                width: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/center.png'),
                    fit: BoxFit.fill,
                  ),
                
                ),
              ),
              Container(
               height: 50.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/learn.png'),
                    fit: BoxFit.fill,
                  ),
                
                ),
              ),
              IconButton(
                  icon: Image.asset('assets/images/button.jpg'),
                  iconSize: 100,
                  onPressed: () {
            _navigateToNextScreen(context);
          },
              ),
              IconButton(
                  icon: Image.asset('assets/images/exit.png'),
                  iconSize: 100,
                  onPressed: () {},
              ),
            ]
          )
        ),   
      ),   
    );   
  }   
  }

  

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DialogExample()));
  }

  

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.cyan,
    
      body: Container(
        child: Row(
          children: [
            Container(
                  alignment: Alignment(-1,-0.90),
                  child: Image.asset('assets/images/home.png',
                  height: 100,
                  width: 50,
                  ),
                ),
          Container(
                alignment: Alignment(0.4,-0.80),
                child: Text('SCIENCE IS FUN',
                style: new TextStyle(
                  fontSize: 30.0,
                  ),
                )
              ,
            ),
        
         Row(children: [
           
         ],)
          
          ],
        ),
      )

      ),


    );
  }
}

class HumanBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.cyan,
      
      body: Container(
       child: Column(
          children: [
              new Align(
                  alignment: Alignment(-0.70,1),
                  child: Image.asset('assets/images/home.png',
                  height: 100,
                  width: 50,)
              ),
            new Align(
              alignment: Alignment.topCenter,
              child: Text('HUMAN BODY ORGANS',
              style: new TextStyle(
                fontSize: 30.0,
                )
              )
            ),
             new Container(
          
          padding: EdgeInsets.all(16.0),
          child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          shrinkWrap: true,
          
          
          children: <Widget>[
           IconButton(
                    icon: Image.asset('assets/images/brain.png'),
                    iconSize: 50,
                    onPressed: () {
                     
                    },
                    ),
            Image.asset("assets/images/lungs.png"),
            Image.asset("assets/images/kidney.jpg"),
            Image.asset("assets/images/intestine.png"),
            Image.asset("assets/images/stomach.jpg"),
            Image.asset("assets/images/heart.png"),

          ],
        )
            )

          ],
        ),
      )
    ),
  );
}
}

class DialogExample extends StatefulWidget {

  @override
  _DialogExampleState createState() => new _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  String _text = "initial";
  TextEditingController _c;
  @override
  initState(){
    _c = new TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(_text),
            new RaisedButton(onPressed: () {
              showDialog(child: new Dialog(
                child: new Column(
                  children: <Widget>[
                    new TextField(
                        decoration: new InputDecoration(hintText: "Update Info"),
                        controller: _c,

                    ),
                    new FlatButton(
                      child: new Text("Save"),
                      onPressed: (){
                        setState((){
                        this._text = _c.text;
                      });
                      Navigator.pop(context);
                      },
                    )
                  ],
                ),

              ), context: context);
            },child: new Text("Enter your name"),)
          ],
        )
      ),
    );
  }
}



 