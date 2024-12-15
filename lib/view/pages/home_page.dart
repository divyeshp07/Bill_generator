import 'package:bill_manager_jmd_task/view/pages/create_bill_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateBillPage(),
                ));
          },
          label: Text('Create new bill')),
    );
  }
}
