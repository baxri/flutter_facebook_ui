import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';

import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  Rooms(this.onlineUsers);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rooms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(' - Video chat with friends')
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 60,
          padding: EdgeInsets.only(right: 5),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  height: 20,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.blue[50],
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.videocam,
                          color: Palette.facebookBlue,
                          size: 25,
                        ),
                        Text(
                          'Createee',
                          style: TextStyle(color: Palette.facebookBlue),
                        )
                      ],
                    ),
                  ),
                );
              }

              final User user = onlineUsers[index - 1];

              return Container(
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
                // color: Colors.green,
                height: 20,
                width: 40,
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(user.imageUrl),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              color: Colors.green[300],
                              shape: BoxShape.circle),
                        ))
                  ],
                ),
              );
            },
            itemCount: onlineUsers.length + 1,
          ),
        ),
      ],
    );
  }
}
