import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tut/data/response/status.dart';
import 'package:flutter_mvvm_tut/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_tut/utils/utils.dart';
import 'package:flutter_mvvm_tut/viewmodel/home_viewmodel.dart';
import 'package:flutter_mvvm_tut/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetchMovieListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        trailing: TextButton(
          child: const Text('Logout'),
          onPressed: () {
            userPreferences.remove().then(
              (value) {
                Navigator.popAndPushNamed(context, RoutesName.login);
              },
            );
          },
        ),
      ),
      child: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, _) {
          switch (value.movieList.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator.adaptive());
            case Status.error:
              return Center(child: Text(value.movieList.message.toString()));
            case Status.completed:
              return ListView.builder(
                itemCount: value.movieList.data!.movies!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        value.movieList.data!.movies![index].posterUrl.toString(),
                        errorBuilder: (context, error, stack) {
                          return const Icon(
                            Icons.error_outline,
                            color: CupertinoColors.destructiveRed,
                          );
                        },
                      ),
                      title: Text(value.movieList.data!.movies![index].title.toString()),
                      subtitle: Text(value.movieList.data!.movies![index].year.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Utils.averageRating(value.movieList.data!.movies![index].ratings!).toStringAsFixed(1)),
                          Icon(Icons.star, color: CupertinoColors.systemYellow,),
                        ],
                      ),
                    ),
                  );
                },
              );
            default:
          }
          return Column(
            children: [
              Center(child: Text('data')),
            ],
          );
        }),
      ),
    );
  }
}
