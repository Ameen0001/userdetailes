import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userdetailes/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Users> data=[];
  Future getData()async{
    var url=Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response= await http.get(url);
   if(response.statusCode == 200){
     setState(() {
       data=usersFromJson(response.body);
     });



   }else{
     print('error');
   }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount:data.length,itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.blue,child: Text(style: TextStyle(fontSize: 30),data[index].id.toString())),
                    SizedBox(width: 10,),
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),data[index].name),
                        Text(data[index].phone),
                      ],
                    )
                  ],
                ),
              )



            ],
          ),
        );
      },),

    );
  }
}
