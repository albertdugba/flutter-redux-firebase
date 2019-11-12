import 'package:flutter/material.dart';
import 'package:screen_lock/dog_model.dart';

class DogDetails extends StatefulWidget {
  final Dog dog;
  DogDetails(this.dog);
  @override
  _DogDetailsState createState() => _DogDetailsState();
}

class _DogDetailsState extends State<DogDetails> {
  final double dogAvatarSize = 115.0;
  double _sliderValue = 10;

  Future<Null> _ratingErrorDialogue() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('They\'re good dogs'),
            actions: <Widget>[
              FlatButton(
                child: Text('Try again'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 15.0,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  value: _sliderValue,
                ),
              ),
              Container(
                child: Text(
                  '${_sliderValue.toInt()}',
                  style: Theme.of(context).textTheme.display1,
                ),
              )
            ],
          ),
        ),
        submitRateButton,
      ],
    );
  }

  void updateRating() {
    if (_sliderValue < 10) {
      _ratingErrorDialogue();
    } else {
      setState(() => widget.dog.rating = _sliderValue.toInt());
    }
  }

  Widget get submitRateButton {
    return RaisedButton(
      onPressed: () => updateRating(),
      child: Text('Submit'),
      color: Colors.indigoAccent,
    );
  }

  Widget get dogImage {
    return Container(
        height: dogAvatarSize,
        width: dogAvatarSize,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                  // just like CSS:
                  // it takes the same 4 properties
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: const Color(0x33000000)),
              const BoxShadow(
                  offset: const Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: const Color(0x24000000)),
              const BoxShadow(
                  offset: const Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: const Color(0x1F000000)),
            ],
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(widget.dog.imageUrl))));
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star),
        Text(
          '${widget.dog.rating} / 10',
          style: Theme.of(context).textTheme.display2,
        )
      ],
    );
  }

  Widget get dogProfile {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
            0.1,
            0.5,
            0.7,
            0.9
          ],
              colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ])),
      child: Column(
        children: <Widget>[
          dogImage,
          Text(
            '${widget.dog.name}  🎾',
            style: TextStyle(fontSize: 32.0),
          ),
          Text(
            widget.dog.location,
            style: TextStyle(fontSize: 32.0),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.dog.description),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text('Meet ${widget.dog.name}'),
        ),
        body: ListView(
          children: <Widget>[dogProfile, addYourRating],
        ));
  }
}
