import 'package:flutter/material.dart';
import 'package:splash/controllers/home_controler.dart';
import 'package:splash/models/post_model.dart';
import 'package:splash/repositories/home_repository_imp.dart';
import 'package:splash/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", (_) => true);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, index) => ListTile(
              leading: Text(list[index].id.toString()),
              title: Text(list[index].title),
              //subtitle: Text(list[index].body),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context)
                    .pushNamed("/details", arguments: list[index]);
              },
            ),
            separatorBuilder: (_, __) => const Divider(
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
