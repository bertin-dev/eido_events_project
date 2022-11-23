import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/notifications_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsPageView extends StatefulWidget {
  const NotificationsPageView({Key? key}) : super(key: key);
  static const String pageName = 'notifications';

  @override
  State<NotificationsPageView> createState() => _NotificationsPageViewState();
}

class _NotificationsPageViewState extends State<NotificationsPageView> {

  final List<NotificationsModel> tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tasks.add(NotificationsModel(id: 1, name: "David Silbia", description: "Demande à avoir un serveur", tasktime: 2, bgColorDelete: Colors.red, isFgColor: true,
        isDivider: false, isAccepted: true, isRejected: true, createdBy: "chatnoir122"
    ));
    tasks.add(NotificationsModel(id: 2, name: "Eric Bullet", description: "Demande à avoir un serveur", tasktime: 5, bgColorDelete: Colors.red, isFgColor: false,
        isDivider: true, isAccepted: false, isRejected: false, createdBy: "chatnoir122"
    ));
    tasks.add(NotificationsModel(id: 3, name: "David Silbia", description: "Demande à avoir un serveur", tasktime: 60, bgColorDelete: Colors.red, isFgColor: true,
        isDivider: false, isAccepted: true, isRejected: true, createdBy: "chatnoir122"
    ));
    tasks.add(NotificationsModel(id: 4, name: "Eric Bullet", description: "Demande à avoir un serveur", tasktime: 16, bgColorDelete: Colors.red, isFgColor: false,
        isDivider: true, isAccepted: false, isRejected: false, createdBy: "chatnoir122"
    ));
    tasks.add(NotificationsModel(id: 5, name: "Eric Bullet", description: "Demande à avoir un serveur", tasktime: 31, bgColorDelete: Colors.red, isFgColor: false,
        isDivider: true, isAccepted: false, isRejected: false, createdBy: "chatnoir122"
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: notifBgColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 102,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
                /*image: DecorationImage(
                  image: AssetImage('assets/images/home_page/bg-notif.png'),
                  fit: BoxFit.cover,
                )*/
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 35, right: 20, left: 24),
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Image.asset("assets/images/left-icon.png", width: 32, height: 32,)
                  ),
                  const SizedBox(width: 11,),
                  const Expanded(
                    child: Text("Notifications", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19, color: whiteColor, fontStyle: FontStyle.normal, fontFamily: "Inter")),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, position){
              final timeEgo = DateTime.now().subtract(Duration(minutes: tasks[position].tasktime));
              return Dismissible(
                key: Key(tasks[position].toString()),
                background: _myHiddenContainer(
                    tasks[position].bgColorDelete
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 13.0),
                  decoration: BoxDecoration(
                    color: tasks[position].isFgColor ? const Color(0xffD6F4FF) : null,
                    border: tasks[position].isFgColor ? const Border(
                      bottom: BorderSide(width: 1.0, color: iconColor),
                      top: BorderSide(width: 1.0, color: iconColor),
                    ) : null,
                  ),
                  child: ListTile(
                    minVerticalPadding: 0,
                    //contentPadding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
                    leading: ClipOval(
                      child: CircleAvatar(
                        radius: 22,
                        child: Image.asset("assets/images/home_page/avatar.png"),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "Inter",
                              color: Color(0xff060518)
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "${tasks[position].name} ", style: const TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: tasks[position].description, style: const TextStyle(fontWeight: FontWeight.w400)),
                          ]
                      ),
                    ),
                    subtitle: tasks[position].isDivider ? Wrap(
                      children: [
                        const Divider(height: 1, color: Color(0xffBAC9CE),),
                        const SizedBox(height: 5,),
                        const Text("a été servi par ",style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, fontFamily: "Inter")),
                        Text(tasks[position].createdBy, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: iconColor, fontFamily: "Inter")),
                      ],
                    ) :  null,
                    trailing: Wrap(
                      children: [
                        Text(timeago.format(timeEgo), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
                      ],
                    ),
                  ),
                ),
                onDismissed: (direction){
                  if(direction == DismissDirection.endToStart){
                    print("Suppression effectué avec succès");
                    //Scaffold.of(context).showSnackBar(const SnackBar(content: Text("Suppression effectué avec succès.")));
                  }
                },
              );
            },
          ),
        ],
      )
    );
  }

  Widget _myHiddenContainer(Color taskColor) {
    return Container(
      padding: const EdgeInsets.only(right: 20.0),
      height: MediaQuery.of(context).size.height,
      color: taskColor,
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Image.asset("assets/images/home_page/delete.png"),
          color: Colors.white,
          onPressed: (){
            setState(() {
            });
          },
        ),
      ),
    );
  }

}

