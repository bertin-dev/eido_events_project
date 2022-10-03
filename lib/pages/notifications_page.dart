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

    setState(() {
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.red, false));
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.purple, true));
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.amber, false));
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.green, true));
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.blue, true));
    });
  }

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 15));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: notifBgColor,
      /*appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // here the desired height
        child: AppBar(
          title: const Text("Notifications", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: whiteColor),),
          centerTitle: false,
          //toolbarHeight: 1.0,
          /*flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_page/notifications.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),*/
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
        ),
      ),*/
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 102,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_page/bg-notif.png'),
                  fit: BoxFit.cover,
                )
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 55, right: 20, left: 24),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back, color: whiteColor, size: 25,),
                      ),
                      const SizedBox(width: 11,),
                      const Expanded(
                            child: Text("Notifications", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19, color: whiteColor, fontStyle: FontStyle.normal, fontFamily: "Inter")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, position){
              return Dismissible(
                key: Key(tasks[position].toString()),
                background: _myHiddenContainer(
                  //tasks[position].status
                    Colors.red
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    minVerticalPadding: 0,
                    //contentPadding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
                    leading: ClipOval(
                      child: CircleAvatar(
                        radius: 22,
                        child: Image.asset("assets/images/home_page/avatar.png"),
                      ),
                    ),
                    title: Wrap(
                      children: const [
                        Text("David Siliba ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Inter"),),
                        Text("demande à avoir un serveur", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Inter"))
                      ],
                    ),
                    subtitle: tasks[position].isDivider ? Wrap(
                      children: const[
                        SizedBox(height: 5,),
                        Divider(height: 1,),
                        SizedBox(height: 5,),
                        Text("Encours de service par ",style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, fontFamily: "Inter")),
                        Text(" chatnoir122", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: iconColor, fontFamily: "Inter")),
                      ],
                    ) :  null,
                    trailing: Wrap(
                      children: [
                        Text(timeago.format(fifteenAgo),style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
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

