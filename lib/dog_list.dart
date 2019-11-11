import 'package:flutter/material.dart';
import 'package:screen_lock/dog_card.dart';
import 'package:screen_lock/dog_model.dart';

class DogList extends StatelessWidget {
  final List<Dog> doggos;

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (context, index) {
        return DogCard(doggos[index]);
      },
    );
  }

  DogList(this.doggos);
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}
