import 'package:api_using_provider/controller/homescreebcontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.watch<homescreenController>().getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<homescreenController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<homescreenController>().getData();
        },
      ),
      body: provider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: provider.resmodel?.articles?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.resmodel?.articles?[index].title ?? ""),
                );
              },
            ),
    );
  }
}
