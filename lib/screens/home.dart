import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:projet_application/database.dart';
import 'package:projet_application/entity/user_entity.dart';
import 'package:projet_application/models/user.dart';
import 'package:projet_application/screens/add_user.dart';
import 'package:projet_application/screens/message.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  AppDatabase databaseInstance;

  HomePage({super.key, required this.databaseInstance});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /**  liste des utilisateurs */
  List<User> users = [];
  int pageCourante = 1; // page initial
  // le controller de la page
  final PagingController<int, User> pagingController = PagingController(
      firstPageKey: 1); // firstPageKey : l'indice de la premiere page

  double fontSize = 10;
  changeFontSize() {
    setState(() {
      fontSize = fontSize >= 25 ? 10 : fontSize++;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    pagingController.addPageRequestListener((pageKey) {
      getUsers(
          pageKey: pageKey, pagingController: pagingController, pageSize: 4);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x0C0C0C0C),
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "Chat App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0x0C0C0C0C),
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            // backgroundColor: Colors.red,
            backgroundImage: AssetImage("assets/images/avatar-1.jpg"),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                  title: "ADD A USER",
                  contentPadding: const EdgeInsets.all(8.0),
                  content: createUser(
                      databaseInstance: widget.databaseInstance,
                      typeAction: "add",
                      refreshUI: () => setState(() {})));
              // setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0xFFF2613F)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     style: const TextStyle(color: Colors.black26, fontSize: 20),
          //     decoration: const InputDecoration(
          //         fillColor: Color(0xFFF3EEEA),
          //         filled: true,
          //         hintText: "Search",
          //         hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
          //         prefixIcon: Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: Icon(
          //             Icons.search,
          //             size: 40,
          //           ),
          //         ),
          //         border: OutlineInputBorder(
          //             borderSide:
          //                 BorderSide(width: 2, color: Color(0x0C0C0C0C)),
          //             borderRadius: BorderRadius.all(Radius.circular(40)))),
          //   ),
          // ),
          SizedBox(
              height: 140,
              child: PagedListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<User>(
                    itemBuilder: (context, user, index) =>
                        createAvatar(user: user),
                  ))
              // ListView(
              //   physics: const BouncingScrollPhysics(),
              //   scrollDirection: Axis.horizontal,
              //   children: List.generate(
              //       users.length, (index) => createAvatar(user: users[index])),
              // ),
              ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "News users",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: widget.databaseInstance.userDao.findAllUser(),
                  builder: (context, data) {
                    if (!data.hasError && data.hasData) {
                      List<Utilisateur> users = data.data as List<Utilisateur>;
                      return ListView(
                        shrinkWrap: true,
                        children: users
                            .map((user) => createNews(
                                  user: user,
                                  onDelete: (user) {
                                    users.remove(user);
                                  },
                                ))
                            .toList(),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })
              // PagedListView(
              //     pagingController: pagingController,
              //     physics: const BouncingScrollPhysics(),
              //     builderDelegate: PagedChildBuilderDelegate<User>(
              //       itemBuilder: (context, user, index) => GestureDetector(
              //           onTap: () {
              //             Get.snackbar("email", user.email,
              //                 snackPosition: SnackPosition.BOTTOM);

              //             Get.to(() => MessagePage(
              //                 user: user,
              //                 databaseInstance: widget.databaseInstance));
              //           },
              //           child: createNews(user: user)),
              //     )
              // )
              )
        ],
      ),
    );
  }

  Widget createAvatar({required User user}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.image),
                ),
              ),
              Positioned(
                top: 80,
                right: 10,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                ),
              )
            ],
          ),
          Text(
            user.firstName,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget createNews({required Utilisateur user, required Function onDelete}) {
    return Dismissible(
      key: ValueKey(user.id),
      background: Container(
        color: GFColors.WARNING,
        alignment: Alignment.centerLeft,
        height: 50,
        child: GFIconButton(
          color: GFColors.TRANSPARENT,
          icon: const Icon(Icons.edit, color: GFColors.WHITE),
          onPressed: () {},
        ),
      ),
      secondaryBackground: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          height: 50,
          child: GFIconButton(
            color: GFColors.TRANSPARENT,
            icon: const Icon(
              Icons.delete,
              color: GFColors.WHITE,
            ),
            onPressed: () {},
          )),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete(user);
          widget.databaseInstance.userDao.deleteUser(user.id as int);
          Get.snackbar("Suppression", "Deleted successfully",
              snackPosition: SnackPosition.BOTTOM);
          setState(() {});
        } else {
          onDelete(user);
          Get.defaultDialog(
              title: "UPDATE USER",
              contentPadding: const EdgeInsets.all(8.0),
              content: createUser(
                  databaseInstance: widget.databaseInstance,
                  typeAction: "update",
                  initUser: user,
                  refreshUI: () => setState(() {})),
              barrierDismissible: false,
              // onCancel: () => setState(() {}),
              actions: [
                Container(
                  alignment: Alignment.topRight,
                  child: GFIconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {});
                        Get.back();
                      }),
                )
              ]);
        }
      },
      child: FlipInX(
        child: Card(
          color: GFColors.DARK,
          elevation: 5.2,
          child: ListTile(
            title: Text(
              "${user.prenom} ${user.nom}",
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

/**  NOTE
 *  Gex.to( () => OtherPage() ) : navigue vers la page OtherPage()
 *  Gex.off( () => OtherPage() ) : changer de page en supprimant la derniere page ouverte en cache
 * Gex.offAll( () => OtherPage() ) : changer de page en supprimant toutes les pages ouvertes en cache
 * Get.back() : permet de routerner a la page precedente 
 * 
 */
