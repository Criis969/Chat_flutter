import 'package:chat/contactlist_screen.dart';
import 'package:flutter/material.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({ Key? key }) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Username"),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _usernameController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: ()=>{
                    if(_usernameController.value.text.isNotEmpty){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactListScreen(username:_usernameController.value.text)),
                      )
                    }
                  },
                  child: const Text("Aceptar")
              )
            ],
          ),
      ),
    );
  }
}