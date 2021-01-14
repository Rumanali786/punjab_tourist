import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class Hotels extends StatefulWidget {
  @override
  _HotelsState createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
Icon cusIcon = Icon(Icons.search);
Widget cusSearchBar = Text("Hotels");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: cusSearchBar,
        actions: [
          IconButton(icon: cusIcon, onPressed: (){
            setState(() {
              if(this.cusIcon.icon == Icons.search ){
                this.cusIcon = Icon(Icons.cancel);
                this.cusSearchBar = Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Here')
                  ),
                );
              }
              else
              {
                this.cusIcon = Icon(Icons.search);
                this.cusSearchBar = Text("Hotels");
              }
            });
          }),
        ],
      ),
      body:
          DropdownButton<String>(
            items: <String>['A', 'B', 'C', 'D'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          )
      );
  }
}
