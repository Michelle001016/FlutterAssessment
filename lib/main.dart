import 'package:Contacts_list/ContactDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyApp> {

  final _searchable =
      [
        'Michelle',
        'William',
        'Calvin',
        'Winson',
        'Kelly',
        'Aaron',
        'Fendi',
        'Kelvin',
        'Emily',
        'Jonathan',
        'Kent',
        'Daniel',
        'Andrew',
        'Isaac',
        'Jensen',
        'Eva',
        'Kenny',
        'Ashley',
      ];

  var items = [];
  @override
  void initState()
  {
    super.initState();
    items.addAll(_searchable);
  }

  @override
  Widget build(BuildContext context) {

    final title = items.length.toString() + ' Contacts List';

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.deepOrange,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.verified_user, color: Colors.white), onPressed: null,)
            ],
            title: Text(title, style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                )
            ),),
          ),
          body: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(2.0),
                margin: EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0))
                      ),
                      prefix: Icon(Icons.search),
                      labelText: 'Search'
                  ),
                  onChanged: (value) {
                    filterContact(value.toLowerCase());
                  },
                ),
              ),
              new Expanded(
                  child: new ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return new Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: GestureDetector(
                          child: new Container(
                              margin: EdgeInsets.all(9.0),
                              padding: EdgeInsets.all(6.0),
                              child: new Row(
                                children: <Widget>[
                                  new CircleAvatar(
                                    child: new Text('${items[index][0]}'),
                                    backgroundColor: Colors.amber,
                                    foregroundColor: Colors.white,
                                  ),
                                  new Padding(padding: EdgeInsets.all(8.0)),
                                  new Text(
                                    '${items[index]}',
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              )
                            ),
                            onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder:(context) => ContactDetail()));
                            }
                          ),
                        );
                      }
                  )
              )
            ],
          ),
          floatingActionButton: new FloatingActionButton(onPressed: null,
            child: new Icon(Icons.people),
            backgroundColor: Colors.deepOrangeAccent,
            foregroundColor: Colors.white,

          ),
        ));
  }
    void filterContact(String searchTerm){
    var searchList = [];

      searchList.addAll(_searchable);
      if(searchTerm.isNotEmpty){

        List<Map<String, dynamic>> topList = List<Map<String, dynamic>>();
        searchList.forEach((element){

          if(element.toLowerCase().contains(searchTerm.trim()))
            {
              topList.add(element);
              print(element);
            }
        });
        setState(() {
          items.clear();
          items.addAll(topList);
        });
        return;
      }
      else{
        setState(() {
          items.clear();
          items.addAll(_searchable);
      });
    }
  }


}
