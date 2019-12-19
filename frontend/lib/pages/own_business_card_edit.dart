import'package:cardy_b/logic/app_state.dart';
import 'package:cardy_b/logic/database.dart';
import 'package:cardy_b/logic/model.dart';
import 'package:cardy_b/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class BusinessCardEditScreen extends StatefulWidget {
  @override
  State createState() => _BusinessCardEditScreenState();
}

class _BusinessCardEditScreenState extends State<BusinessCardEditScreen> {
  List<Widget> _checkboxes = getCheckboxes();


  void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget checkbox = _checkboxes.removeAt(oldIndex);
        _checkboxes.insert(newIndex, checkbox);
      });
    }
    // Make sure there is a scroll controller attached to the scroll view that contains ReorderableSliverList.
    // Otherwise an error will be thrown.
  Widget build(BuildContext context) {

      ScrollController _scrollController = PrimaryScrollController.of(context) ?? ScrollController();
      return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: true,
          appBar: CardyBAppBar(),
          body: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              ReorderableSliverList(
                delegate: ReorderableSliverChildListDelegate(_checkboxes),
                onReorder: _onReorder,
              )
            ]
          )
      );
    }
}

List<Widget> getCheckboxes(){
  var db = Database();
  final int _userId = AppState().userid;
  var p = db.getParticipantById(_userId);
  var _fields = Map<String, String>();
  if (p.bio != null) _fields['Bio'] = p.bio;
  if (p.company != null) _fields['Company'] = p.company;
  if (p.position != null) _fields['Position'] = p.position;
  if (p.website != null) _fields['Website'] = p.website;
  if (p.linkedIn != null) _fields['LinkedIn'] = p.linkedIn;
  if (p.gitHub != null) _fields['GitHub'] = p.gitHub;
  if (p.twitter != null) _fields['Twitter'] = p.twitter;

  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue){
    rememberMe = newValue;

    if (rememberMe) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  }

  @override
    List<Widget> fields = List();
    _fields.forEach((title, content) {
      fields.add(Container(
          padding: EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 0.1,),
          child: Flex(crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded( child:
              Checkbox(
                  value: rememberMe,
                  onChanged: _onRememberMeChanged
              ),),
          Expanded(
              flex: 5,
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Container(
                  //padding: EdgeInsets.all(0.03 * MediaQuery.of(context).size.width,
                  //),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.01 ),
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                )
            ])),
            ],
          )
          ));
    });
    return fields;
}
