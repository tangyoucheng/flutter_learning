import 'package:flutter/material.dart';
import 'input/button_floating_action_demo.dart';
import 'input/button_demo.dart';
import 'input/popup_menu_button_demo.dart';
import 'input/form_demo.dart';
import 'input/checkbox_demo.dart';
import 'input/radio_demo.dart';
import 'input/switch_demo.dart';
import 'input/slider_demo.dart';
import 'input/date_time_demo.dart';
import 'dialog/simple_dialog_demo.dart';
import 'dialog/alert_dialog_demo.dart';
import 'dialog/bottom_sheet_demo.dart';
import 'dialog/snack_bar_demo.dart';
import 'dialog/expansion_panel_demo.dart';
import 'mdc/chip_demo.dart';
import 'mdc/data_table_demo.dart';
import 'mdc/paginated_data_table_demo.dart';
import 'mdc/card_demo.dart';
import 'mdc/stepper_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: new ListView(
        children: <Widget>[
          ListItem(title: 'StepperDemo', page: StepperDemo()),
          ListItem(title: 'CardDemo', page: CardDemo()),
          ListItem(title: 'PaginatedDataTableDemo', page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTableDemo', page: DataTableDemo()),
          ListItem(title: 'ChipDemo', page: ChipDemo()),
          ListItem(title: 'ExpansionPanelDemo', page: ExpansionPanelDemo()),
          ListItem(title: 'SnackBarDemo', page: SnackBarDemo()),
          ListItem(title: 'BottomSheetDemo', page: BottomSheetDemo()),
          ListItem(title: 'AlertDialogDemo', page: AlertDialogDemo()),
          ListItem(title: 'SimpleDialogDemo', page: SimpleDialogDemo()),
          ListItem(title: 'DateTimeDemo', page: DateTimeDemo()),
          ListItem(title: 'SliderDemo', page: SliderDemo()),
          ListItem(title: 'SwitchDemo', page: SwitchDemo()),
          ListItem(title: 'RadioDemo', page: RadioDemo()),
          ListItem(title: 'CheckboxDemo', page: CheckboxDemo()),
          ListItem(title: 'Form', page: FormDemo()),
          ListItem(title: 'PopupMenuButtonDemo', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: 'FloatingActionButtonDemo', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('_WidgetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  ListItem({
    this.title,
    this.page,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (content) => page));
      },
    );
  }
}
