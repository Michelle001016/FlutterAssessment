import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';

class ContactDetail extends StatefulWidget {
  _ContactDetailPageState createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetail> {

  @override
  void initState()
  {
    super.initState();
  }

  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.deepOrange,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed:(){
                Navigator.pop(context);
              },)
            ],
            title: Text('Contact Details', style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                )
            ),),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/user.png')
                                  )
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 110.0),
                              child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("User: Michelle",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Phone Number: 016-2211456",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Check in: 2021-08-22 18:10:55",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                                      ],
                                    ),
                                  ]
                              ),

                            )
                          ],
                        ),

                        TextFormField(
                          decoration: InputDecoration(labelText: "First Name"),
                        ),
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(labelText: "Last Name"),
                        ),
                        SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.centerLeft,
                              child: ButtonTheme(minWidth: 100.0,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                    onPressed: null,
                                  child: Text('Upload Image', style: TextStyle(color: Colors.white),),
                                  textColor: Colors.white,
                                  splashColor: Colors.black,
                                  color: Colors.deepOrangeAccent,
                                ),)
                        ),

                        SizedBox(height: 20.0),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: ButtonTheme(minWidth: 100.0,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                child: Text('Save', style: TextStyle(color: Colors.white),),
                                textColor: Colors.white,
                                splashColor: Colors.black,
                                color: Colors.deepOrangeAccent,
                                onPressed: (){
                                },
                              ),
                            ),
                        ),
                      ],
                    )
                ),
              ),
            ),
          )
        ),
    );
  }

}
