import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderApp(size: size),
            Expanded(
              child: ListView(
                children: [
                  PublishedWithEdit(),
                  Stories(size: size),
                  Posts(size: size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Posts extends StatelessWidget {
  const Posts({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Post(
              imageUrl: "images/1.jpg",
              userName: "Jean Claude",
              userPhoto: "images/1.jpg",
              size: size),
          Post(
              imageUrl: "images/2.jpg",
              userName: "Paul Yve",
              userPhoto: "images/2.jpg",
              size: size),
          Post(
              imageUrl: "images/3.jpg",
              userName: "Beatrice",
              userPhoto: "images/3.jpg",
              size: size),
        ],
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key key,
    @required this.userPhoto,
    @required this.userName,
    @required this.imageUrl,
    @required this.size,
  }) : super(key: key);

  final String userPhoto;
  final String userName;
  final String imageUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 8,
            color: Colors.grey.withOpacity(.70),
          ),
        ),
        PostHeader(
          userPhoto: userPhoto,
          userName: userName,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "La coupe Un5 continue",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Image.asset(
                imageUrl,
                height: 400,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.thumb_up_off_alt),
                      SizedBox(width: 5.0),
                      Text("255")
                    ],
                  ),
                  color: Colors.grey.withOpacity(.23),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(width: 5.0),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat),
                      SizedBox(width: 5.0),
                      Text("255")
                    ],
                  ),
                  color: Colors.grey.withOpacity(.23),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(width: 5.0),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share_outlined),
                      SizedBox(width: 5.0),
                      Text("255")
                    ],
                  ),
                  color: Colors.grey.withOpacity(.23),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class PostHeader extends StatelessWidget {
  final String userName;
  final String userPhoto;
  const PostHeader({
    Key key,
    this.userName,
    this.userPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        /*       mainAxisAlignment: MainAxisAlignment.spaceBetween, */

        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 33,
                  child: CircleAvatar(
                      backgroundImage: AssetImage(userPhoto), radius: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        ),
                        Icon(
                          Icons.verified_user,
                          color: Colors.blueAccent,
                          size: 18.0,
                        )
                      ],
                    ),
                  ]),
                )
              ],
            ),
          ),
          FlatButton(
              onPressed: null,
              child: Icon(
                Icons.more_horiz,
                size: 38.0,
              ))
        ],
      ),
    );
  }
}

class Stories extends StatelessWidget {
  const Stories({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Story(
              name: "user 1",
              imageUrl: "images/avatar.jpg",
            ),
            Story(
              name: "user 1",
              imageUrl: "images/1.jpg",
            ),
            Story(
              name: "user 1",
              imageUrl: "images/2.jpg",
            ),
            Story(
              name: "user 1",
              imageUrl: "images/3.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

class Story extends StatelessWidget {
  final String name;
  final String imageUrl;
  const Story({
    Key key,
    this.name,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 8),
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imageUrl,
                height: 180,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 150,
              height: 180,
              decoration: BoxDecoration(
                /*  color: Colors.black.withOpacity(0.25), */
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.85)
                    ]),
                borderRadius: BorderRadius.circular(12.0),
              ),
            )
          ]),
        ),
      ],
    );
  }
}

class PublishedWithEdit extends StatelessWidget {
  const PublishedWithEdit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Published(),
          EditToCallActions(),
        ],
      ),
    );
  }
}

class EditToCallActions extends StatelessWidget {
  const EditToCallActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.text_fields,
                        color: Colors.lightBlueAccent.withOpacity(.90),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Texte",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_camera_front,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Vidéo en dir",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Localisation",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 8,
            color: Colors.grey.withOpacity(.70),
          ),
        )
      ],
    );
  }
}

class Published extends StatelessWidget {
  const Published({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "A quoi pensez-vous ?",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.60),
                              fontSize: 19.0,
                              letterSpacing: 1.0),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 2,
                        child: Container(
                          height: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Icon(
                    Icons.add_a_photo,
                    size: 38,
                  ),
                  Text("Photo"),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 1,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class HeaderApp extends StatelessWidget {
  const HeaderApp({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TopBarWithSearchBox(),
          HeaderIconsAction(),
          SizedBox(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              height: 1,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class TopBarWithSearchBox extends StatelessWidget {
  const TopBarWithSearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.account_circle,
            size: 35,
          ),
          Expanded(
            child: Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.40),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Recherche sur Facebook",
                          hintStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),
          Icon(
            Icons.menu,
            size: 35,
          ),
        ],
      ),
    );
  }
}

class HeaderIconsAction extends StatelessWidget {
  const HeaderIconsAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.home,
            color: Colors.black87,
          ),
          Icon(
            Icons.supervised_user_circle,
            color: Colors.black87,
          ),
          Icon(
            Icons.messenger,
            color: Colors.black87,
          ),
          Icon(
            Icons.live_tv,
            color: Colors.black87,
          ),
          Icon(
            Icons.notifications,
            color: Colors.black87,
          ),
          Icon(
            Icons.assistant_photo_outlined,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
