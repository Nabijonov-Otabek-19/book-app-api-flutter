import 'package:book_app_api/screen/details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../data/models/book_model.dart';
import '../data/source/remote/api/book_api.dart';
import '../widgets/widget_book_item.dart';
import '../widgets/widget_fail.dart';
import '../widgets/widget_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Status { initial, loading, fail, success }

class _HomeScreenState extends State<HomeScreen> {
  final api = BookApi();
  final controller = PageController();
  var list = <BookModel>[];
  var status = Status.initial;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    status = Status.loading;
    setState(() {});
    try {
      list = await api.getList();
      status = Status.success;
    } catch (e) {
      status = Status.fail;
      print("$e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "name".tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.setLocale(const Locale("uz"));
          await Future.delayed(const Duration(seconds: 2));
          if (mounted) context.setLocale(const Locale("ru"));
          await Future.delayed(const Duration(seconds: 2));
          if (mounted) context.setLocale(const Locale("en"));
        },
        child: Text(tr("author")),
      ),
      body: SafeArea(
        child: Builder(builder: (context) {
          if (status == Status.loading) {
            return const WidgetShimmer();
          }
          if (status == Status.fail) {
            return const WidgetFail(message: "Xatolik");
          }
          return GridView.builder(
            itemCount: list.length,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              final model = list[index];
              return WidgetBookItem(
                name: model.name,
                author: model.author,
                image: model.image,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen(id: model.id);
                      },
                    ),
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
