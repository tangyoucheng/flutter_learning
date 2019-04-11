import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];
  String _action = 'Nonthing';
  List<String> _selected = [];
  String _choice = 'Lemon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///换行显示小部件
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(label: Text('Life')),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(backgroundColor: Colors.grey, child: Text('皓')),
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://resources.ninghao.net/images/wanghao.jpg'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),

                ///用列表生成带删除功能的小碎片
                Divider(
                  color: Colors.red,
                  height: 32.0,
                  indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),

                /// 动作碎片
                Divider(
                  color: Colors.red,
                  height: 32.0,
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('Action Chip:${_action}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),

                ///过滤碎片
                Divider(
                  color: Colors.red,
                  height: 32.0,
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('Filter Chip:${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),

                /// 选择碎片
                Divider(
                  color: Colors.red,
                  height: 32.0,
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('Choice Chip:${_choice}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.black,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: () {
            setState(() {
              _tags = [
                'Apple',
                'Banana',
                'Lemon',
              ];
              _selected = [];
              _choice = 'Lemon';
            });
          }),
    );
  }
}
