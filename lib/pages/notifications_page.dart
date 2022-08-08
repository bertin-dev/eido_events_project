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
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.red));
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.purple));
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.amber));
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.green));
      tasks.add(NotificationsModel("Meeting", "Room 400", "12:30", Colors.blue));
    });
  }

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 15));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: notifBgColor,
      appBar: PreferredSize(
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
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, position){
              return Dismissible(
                key: Key(tasks[position].toString()),
                background: _myHiddenContainer(
                    //tasks[position].status
                    Colors.red
                ),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      leading: ClipOval(
                        child: CircleAvatar(
                          child: Image.asset("assets/images/home_page/avatar.png"),
                        ),
                      ),
                      title: Wrap(
                        children: const [
                          Text("David Siliba ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          Text("demande à avoir un serveur", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
                        ],
                      ),
                      subtitle: Wrap(
                        children: const[
                          Text("Encours de service par ",style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
                          Text(" chatnoir122", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: iconColor)),
                        ],
                      ),
                      trailing: Wrap(
                        children: [
                          Text(timeago.format(fifteenAgo),style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                onDismissed: (direction){
                  if(direction == DismissDirection.endToStart){
                    Scaffold.of(context).showSnackBar(const SnackBar(content: Text("Suppression effectué avec succès.")));
                  }
                },
              );
            },
        ),
      ),
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

