
import 'package:appchat/blocs/bloc/nav_bloc_bloc.dart';
import 'package:appchat/view/screens.dart/friends_screen.dart';
import 'package:appchat/view/screens.dart/home_screen.dart';
import 'package:appchat/view/screens.dart/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  final bottomNavigationBloc = NavBlocBloc();
  BottomNavigation({required this.idpage});
  final int idpage;
  @override
  Widget build(BuildContext context) {
    if(idpage==1){
       bottomNavigationBloc.add(BottomNavigationEvent.friends);
    }
    return BlocBuilder<NavBlocBloc, int>(
      bloc: bottomNavigationBloc,
      builder: (context, currentIndex) {
        return Scaffold( 
          body: IndexedStack(
            index: currentIndex,
            children: <Widget>[
              HomeScreen(currentIndex: currentIndex),
              FriendsScreen(currentIndex: currentIndex),
              ProfileScreen(currentIndex: currentIndex),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              switch (index) {
                case 0:
                  bottomNavigationBloc.add(BottomNavigationEvent.home);
                  break;
                case 1:
                  bottomNavigationBloc.add(BottomNavigationEvent.friends);
                  break;
                case 2:
                  bottomNavigationBloc.add(BottomNavigationEvent.profile);
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Đoạn chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Bạn bè',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Cá nhân',
              ),
            ],
          ),
        );
      },
    );
  }
}