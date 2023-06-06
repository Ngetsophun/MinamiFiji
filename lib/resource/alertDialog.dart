

import 'package:flutter/material.dart';

import 'package:minamifuji/Screen/Login_Screen/loginForm.dart';

class SingoutDialog extends StatelessWidget {
  const SingoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Really??"),
      content: Text('Do you want to exit'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No')),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Form()));
        }, child: Text('Yes'))    
      ],
    );
    
  }
 

}
