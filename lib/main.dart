import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AdminPage.dart';

void main() => runApp(MyApp());


String username='';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: <String,WidgetBuilder>{
        '/AdminPage': (BuildContext context)=> new AdminPage(username: username,),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController user=new TextEditingController();
TextEditingController pass=new TextEditingController();

String msg='';

Future<List> _login() async {
  final response = await http.post("http://192.168.1.11/register/login.php", body: {
    "username": user.text,
    "password": pass.text,
    
  });

  var datauser = json.decode(response.body);

  if(datauser.length==0){
    setState(() {
          msg="Login Fail";
        });
  }else{
    if(datauser[0]['level']=='admin'){
       Navigator.pushReplacementNamed(context, '/AdminPage');
    }else if(datauser[0]['level']=='member'){
      Navigator.pushReplacementNamed(context, '/MemberPage');
    }

    setState(() {
          username= datauser[0]['username'];
        });
  
  }

  return datauser;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(   
                controller: user,                
                decoration: InputDecoration(
                  hintText: 'Username'
                ),           
                ),
              Text("Password",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: pass,  
                obscureText: true,                
                 decoration: InputDecoration(
                  hintText: 'Password'
                ),                
                ),
              
              RaisedButton(
                child: Text("Login"),
                onPressed: (){
                  _login();
                },
              ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
             

            ],
          ),
        ),
      ),
    );
}
}