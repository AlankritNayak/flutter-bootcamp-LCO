import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;
//  List<String> taskList = ["",];
  List<String> titleList = ["",];
  TextEditingController titlecontrol = new TextEditingController();
  TextEditingController taskcontrol = new TextEditingController();
  @override
  Widget taskfeild(String task, int ind) {
    return/* SizedBox(
          
          width: double.infinity,
          height: 150,
         child:*/Card(
            
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 3,
                color: Color(0xfffce1e1)),
                
                borderRadius: BorderRadiusDirectional.circular(50)),
            color: Color(0xffd1e5ff),
            child: ListTile(
              
              onTap: () {},
              enabled: true,
              leading: Icon(Icons.chevron_right),
              title: Text(
                task,
                style: TextStyle(
                  color: Color(0xffff5c5c),
                  fontSize: 30,
                  fontFamily:'Cursive')
               // key: Key(task),
              ),
            //  subtitle: Text(taskList[number_of_task]),
             // isThreeLine: true,

              trailing:
              Row(
                
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
               IconButton(
                  icon: Icon(
                    Icons.edit,
                  ),
                  onPressed: () => ShowDialog()),
               IconButton(
                  //key: Key(task),
                  icon: Icon(Icons.delete_forever),
                  onPressed: () => delete(ind),
               )   
              ])
            ));
  }
  delete(int ind){
    titleList.removeAt(ind);
    setState(() {
      
    });
  }
  onSave(){
  //  taskList[number_Of_task]=taskcontrol.text;
    titleList[number] = titlecontrol.text;
    setState(() { 
    });
    titlecontrol.text = "";
   // taskcontrol.text= "";
  }
  Future<void> ShowDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(20),
          children: <Widget>[
            TextField(
              // expands: true,
              maxLines: null,
              minLines: null,
              controller: titlecontrol,
              decoration: InputDecoration(
                  hintText: "Enter Task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 8,
                    borderSide: BorderSide(width: 5),
                  )),
            ),
            Container(
              height: 20,
            ),
            RaisedButton(
              onPressed:(){
                Navigator.of(context).pop();
                onSave();
              },
              color: Color(0xffff5c5c),
              textColor: Color(0xfffce1e1),
              child: Text("save"),
            )
          ],
        );
      },
    );
  }
//final _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
  //    key: _scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            title: Text(
              "I Wanna do : ",
              style: TextStyle(
                  color: Color(0xffff5c5c),
                  fontSize: 50,
                  fontFamily: 'IndieFlower'),
            ),
            actions: <Widget>[],
            backgroundColor: Color(0xfffce1e1),
          )),
      body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (BuildContext ctx, index) {
            final task = titleList[index];
            number = index;
            return  taskfeild(task, index);
          }),
      floatingActionButton: Container(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            backgroundColor: Color(0xfffce1e1),
            onPressed: () {
              
             // taskList.add("");
              titleList.add("");
              setState(() {});
            },
            child: Icon(
              Icons.note_add,
              size: 70,
              color: Color(0xffff5c5c),
            ),
          )),
    );
  }
}
