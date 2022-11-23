import 'package:eido_events_project/services/local_notifications/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../constants.dart';
import '../../models/notifications_model.dart';

class HomeAccountServerPageView extends StatefulWidget {

  static const String pageName = 'server_account/home';
  String? payload;
  HomeAccountServerPageView({Key? key, this.payload}) : super(key: key);

  @override
  State<HomeAccountServerPageView> createState() => _HomeAccountServerPageViewState();
}

class _HomeAccountServerPageViewState extends State<HomeAccountServerPageView> {

  final List<NotificationsModel> tasks = [];
  late NotificationService notification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("PAYLOAD=${widget.payload}");

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
    notification = NotificationService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: notifBgColor,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, right: 20, left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back, color: titleProgramEventManage, size: 25,),
                      ),
                      const SizedBox(width: 11,),
                      const Text("Notifications", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19, color: titleProgramEventManage, fontStyle: FontStyle.normal, fontFamily: "Inter")),
                    ],
                  ),

                  InkWell(
                    onTap: () => {},
                    child: Image.asset("assets/images/notif-cloch.png", width: 24, height: 24,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
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
                      //margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: tasks[position].isFgColor ? const Color(0xffD6F4FF) : null,
                        border: const Border(
                          bottom: BorderSide(width: 1.0, color: iconColor),
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
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
                          if(tasks[position].isAccepted && tasks[position].isRejected)...{
                            Container(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  MaterialButton(
                                      height: 35,
                                      color: whiteColor,
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(color: Color(0xff7A7D86)),
                                          borderRadius: BorderRadius.circular(100.0)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Row(
                                        children: [
                                          const Text('Rejeter',
                                            style: TextStyle(color: Color(0xff7A7D86), fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                                          const SizedBox(width: 10,),
                                          Image.asset("assets/images/close-square.png", width: 16, height: 16,),
                                        ],
                                      )
                                  ),
                                  const SizedBox(width: 8,),
                                  MaterialButton(
                                      height: 35,
                                      color: const Color(0xff2097F6),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                                      onPressed: () async {

                                        await notification.showLocalNotification(
                                            id: tasks[position].id,
                                            title: tasks[position].name,
                                            body: tasks[position].description,
                                            payload: tasks[position].createdBy
                                        );

                                      },
                                      child: Row(
                                        children: [
                                          const Text('Accepter',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                                          const SizedBox(width: 10,),
                                          Image.asset("assets/images/check-success-icon.png", width: 16, height: 16,),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                          }
                        ],
                      )
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
