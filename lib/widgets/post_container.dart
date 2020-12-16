import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/post_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(post: post),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(post.caption)),
          post.imageUrl != null
              ? Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    CachedNetworkImage(
                      imageUrl: post.imageUrl,
                    ),
                  ],
                )
              : SizedBox.shrink(),
          _PostStats(post: post),
          _PostActions(post: post),
        ],
      ),
    );
  }
}

class _PostActions extends StatelessWidget {
  final Post post;

  const _PostActions({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PostButton(
            onTap: () {},
            icon: Icon(
              MdiIcons.thumbUpOutline,
              color: Colors.grey[600],
              size: 20.0,
            ),
            label: 'Like'),
        PostButton(
            onTap: () {},
            icon: Icon(
              MdiIcons.commentOutline,
              color: Colors.grey[600],
              size: 20.0,
            ),
            label: 'Like'),
        PostButton(
            onTap: () {},
            icon: Icon(
              MdiIcons.shareOutline,
              color: Colors.grey[600],
              size: 25.0,
            ),
            label: 'Like'),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Palette.facebookBlue),
            child: Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: 10.0,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Expanded(
              child: Text(
            post.likes.toString(),
            style: TextStyle(color: Colors.grey[600]),
          )),
          Text(
            post.comments.toString() + ' Comments',
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            post.shares.toString() + ' Shares',
            style: TextStyle(color: Colors.grey[600]),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(post.user.imageUrl),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.user.name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        post.timeAgo,
                        style: TextStyle(fontSize: 10.0, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Icon(
                        Icons.public,
                        size: 12.0,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.black87,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
