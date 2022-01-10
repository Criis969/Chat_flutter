import 'package:chat/chat_screen.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  final String username;
  const ContactListScreen({ Key? key, required this.username}) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<String> _usuarios = ["Cristian", "Ana", "Joel", "Dani"];
  List<String> _contactos = List<String>.empty(growable: true);

  void initState(){
    _usuarios.forEach((element) {
      if(element != widget.username){
        _contactos.add(element);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Lista de contactos", style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          itemCount: _contactos.length,
          itemBuilder: (BuildContext context, int index){
            return Row(
              children: <Widget>[
                Text(_contactos[index]),
                const SizedBox(width: 100.0,),
                ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen(username: widget.username, contact: _contactos[index])),
                      )
                    },
                    child: const Text("Seleccionar")
                ),
              ],
            );
      }
      ),
    );
  }
}