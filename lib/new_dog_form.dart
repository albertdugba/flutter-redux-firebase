import 'package:flutter/material.dart';
import 'package:screen_lock/dog_model.dart';

class AddDogForm extends StatefulWidget {
  @override
  _AddDogFormState createState() => _AddDogFormState();
}

class _AddDogFormState extends State<AddDogForm> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  void submitPup(context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                Icons.warning,
                color: Colors.white,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                'Pup needs a name',
                style: Theme.of(context).textTheme.subhead,
              ),
            ],
          )));
    } else {
      var newDog = Dog(nameController.text, locationController.text,
          descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: nameController,
                  onChanged: (value) => nameController.text = value,
                  decoration: InputDecoration(labelText: 'Name the pup'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: locationController,
                  onChanged: (value) => locationController.text = value,
                  decoration: InputDecoration(labelText: 'Location of the pup'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: descriptionController,
                  onChanged: (value) => descriptionController.text = value,
                  decoration: InputDecoration(labelText: 'All about the pup'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => submitPup(context),
                      color: Colors.indigoAccent,
                      child: Text('Submit Pup'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
