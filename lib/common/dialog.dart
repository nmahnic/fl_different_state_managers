
import 'package:flutter/material.dart';

void customDialog(BuildContext context){
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const [
              Text('This is a demo alert dialog.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
  );
}