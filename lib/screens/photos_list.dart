import 'package:flutter/material.dart';
class Item{
  final int id;
  final String task;
  final String image;
  Item(
      {
        required this.id,
        required this.task,
        required this.image
      }
      );
}
class Photos{
  static int length = 5;
  static final items = [
  Item(
      id: 0,
      task: 'Go out! Meet a few people today',
      image:
      "images/people-1.jpg"),
  Item(
      id: 1,
      task: 'Listen to your favorite tracks!',
      image:
      "images/people-2.jpg"),
  Item(
      id: 2,
      task: 'Find people with whom you could do something you love to do!',
      image:
      "images/work.jpg"
  ),
  Item(
     id: 3,
     task: 'Get a pet! If you already have one, take it for a walk, or spend some time with it!',
     image: 'images/pet.jpg'
  ),
  Item(
     id: 4,
     task: 'You did good today, look forward to another productive day!',
     image: 'images/raccoon-branch.jpg'
  ),
  ];
}

class PhotosList extends StatefulWidget {
  const PhotosList({Key? key}) : super(key: key);
  @override
  State<PhotosList> createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
  Widget _buildBody() {
    return SizedBox(
        height: 485,
        child: ListView.builder(
          //scrollDirection: Axis.vertical,
          //shrinkWrap: true,
            itemCount: Photos.length,
            itemBuilder: (context, i) {
              return Dismissible(
                background: Container(
                  color: Colors.green,
                  child: const Icon(Icons.check_box_outlined, size: 60, color: Colors.white),
                ),
                key: ValueKey<Object>(Photos.items[i]),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    Photos.items.removeAt(i);
                    Photos.length = Photos.length - 1;
                  });
                },
                child: SizedBox(
                    child: Column(
                        children: <Widget>[
                          Image.asset(Photos.items[i].image),
                          Text(Photos.items[i].task,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.5
                              )
                          )
                        ]
                    )
                ),
              );
            }
        )
    );
  }
}