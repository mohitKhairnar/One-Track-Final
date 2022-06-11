import 'package:flutter/material.dart';

class MyListItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String img;
  Color color;
  Color gradient;
  MyListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.gradient,
    required this.img,
  }) : super(key: key);
  @override
  State<MyListItem> createState() => _MyListItemState(img);
}

class _MyListItemState extends State<MyListItem> {
  int _itemCount = 0;
  Color color = Color.fromRGBO(108, 115, 255, 1);
  Color gradient = Color.fromRGBO(58, 63, 255, 1);

  final String img;
  bool _load = false;

  _MyListItemState(this.img);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: GestureDetector(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    gradient: LinearGradient(
                      colors: [color, gradient],
                      begin: Alignment.topCenter,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: ListTile(
                    textColor: Colors.white,
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image(
                          image: AssetImage("images/$img.jpg"),
                          width: 53,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(widget.title),
                    ),
                    subtitle: Text(
                      widget.subtitle,
                      style: TextStyle(fontSize: 12),
                    ),
                    onTap: () {},
                    trailing: _buildTrailingWidget(),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildTrailingWidget() {
    return FittedBox(
      child: Row(
        children: [
          IconButton(
              color: Colors.white,
              onPressed: () => setState(() {
                    _itemCount != 0 ? _itemCount-- : _itemCount;
                  }),
              icon: Icon(Icons.remove)),
          Text(_itemCount.toString()),
          IconButton(
              color: Colors.white,
              onPressed: () => setState(() {
                    _itemCount++;
                  }),
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
