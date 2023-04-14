import 'package:appchat/api/api_search.dart';
import 'package:appchat/blocs/bloc/nav_bloc_bloc.dart';
import 'package:appchat/blocs/userBloc/user_bloc.dart';
import 'package:appchat/goRouter/app_route.dart';
import 'package:appchat/models/user_model.dart';
import 'package:appchat/utils/global.color.dart';
import 'package:appchat/view/widget/SearchGlobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtControllerSearch = TextEditingController();
  List<userModel> totalUser = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void search(String searchQuery) async {
    //if (searchQuery.length >= 5) {
      totalUser = await apiSearch.getAllUserSearch();
      
      List<userModel> searchUser = [];
      userbloc.userController.sink.add([]);
      if (searchQuery.isEmpty) {
        userbloc.userController.sink.add(totalUser);
        return;
      }
      totalUser.forEach((user) {
        if (user.email.toLowerCase().contains(searchQuery.toLowerCase())) {
          searchUser.add(user);
        }
      });
      userbloc.userController.sink.add(searchUser);
    // } else {
    //   userbloc.userController.sink.add([]);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 15, left: 15, bottom: 15),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        context.go(AppRoute.VIEWCHAT + "/viewfriend/1");
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(top: 15, left: 30, bottom: 15),
                    child: Text(
                      "Tìm bạn bè",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(18),
                  color: GlobalColors.backgroundSearch),
              child: TextField(
                onChanged: (text) => search(text),
                controller: txtControllerSearch,
                style: TextStyle(fontSize: 15),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tìm kiếm",
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: userSearchWidget(),
            ),
          ],
        )),
      ),
    );
  }

  Widget userSearchWidget() {
    return StreamBuilder(
      stream: userbloc.userController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("Trống"),
          );
        } else {
          if (snapshot.data!.length <= 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: Container(
                  width: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/premium-vector/young-girl-anime-style-character-vector-illustration-design-manga-anime-girl_147933-93.jpg"),
                  ),
                ),
                // title: Text(snapshot.data![index].email),
                subtitle: Text(snapshot.data![index].email),
                title: Text(
                  snapshot.data![index].username,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Container(
                  height: 20,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalColors.backgroundSearch,
                  ),
                  
                  child: snapshot.data![index].friendsStatus==1 ? Text("Bạn bè",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),) 
                  :Text("Thêm bạn bè",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),),
                  
                  ), 
                ),
              ),
            
          );
        }
        // return snapshot.connectionState == ConnectionState.waiting
        //     ? Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : ListView.builder(
        //         itemCount: snapshot.data?.length,
        //         itemBuilder: (context, index) => ListTile(
        //           leading: Image.network(
        //               "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Breezeicons-actions-22-im-user.svg/1200px-Breezeicons-actions-22-im-user.svg.png"),
        //           // title: Text(snapshot.data![index].email),
        //           title: Text(snapshot.data![index].email),
        //         ),
        //       );
      },
    );
  }
}
