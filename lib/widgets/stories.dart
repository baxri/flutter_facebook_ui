import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key key, this.currentUser, this.stories}) : super(key: key);

  Widget _storyBuilder(bool isAdd, story) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
                imageUrl: story.imageUrl,
                width: 110,
                height: double.infinity,
                fit: BoxFit.cover),
          ),
          Container(
            height: double.infinity,
            width: 110.0,
            decoration: BoxDecoration(
                gradient: Palette.storyGradient,
                borderRadius: BorderRadius.circular(12.0)),
          ),
          isAdd
              ? Container(
                  margin: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(Icons.add),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.blue[300])),
                  child: CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(story.user.imageUrl),
                    radius: 20,
                  ),
                ),
          Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                isAdd ? 'Add to Story' : story.user.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.builder(
        padding: EdgeInsets.all(4.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          if (index == 0) {
            return _storyBuilder(true, currentUser);
          }

          return _storyBuilder(false, stories[index - 1]);
        },
        itemCount: stories.length + 1,
      ),
    );
  }
}
