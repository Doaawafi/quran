import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/screens/quran_page.dart';
import '../widget/custom_container.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = 'home_screen';

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children:const [
            SizedBox(height: 120,),
            Image(
            image: AssetImage("images/q11.png"),
            width: 20,
            height: 150,
          ),
            Dashboard(),
        ],
      ),
    );
  }
}
class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  var _items = [];

  Future<void> readJson2() async {
    final String response =
        await rootBundle.loadString('assets/hafs_smart_v8.json');
    final data = await json.decode(response) as List;
    setState(() {
      _items = data;
    });
    print(_items);
  }

  void initState() {
    readJson2();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainer(
              image: 'images/quran.png',
              title: "Quran",
              color: Colors.orange.shade200,
              onpressed: () {
                Navigator.pushReplacementNamed(context, QuranPage.id);
              },
              style:const  TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              fun: () {  },
              subTitle: 'Go To Quran',),
            const SizedBox(width: 20,),
            CustomContainer(
              image: 'images/srerch.png',
              title: "Search",
              color: Colors.white,
              onpressed: () {
                showSearch(
                    context: context, delegate: DataSearch(list: _items));
              },
              style: TextStyle(
                  color: Colors.blue.shade800,
                  fontSize: 18,
                  fontWeight: FontWeight.bold

              ), fun: () {  },
              subTitle: 'Go to Search',
            ),
          ],
        ),
        CustomContainer(
            image: 'images/bookmarks.png',
            title: "Bookmarks",
            color: Colors.lightBlue.shade200,
            onpressed: () {},
           style: const TextStyle(
               color: Colors.white,
               fontSize: 18,
               fontWeight: FontWeight.bold

           ),
           fun: () {  },
          subTitle: 'Go To Bookmarks',),

      ],
    );
  }
}
class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;

  DataSearch({required this.list});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, 'null');
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
     return PageView.builder(
      itemBuilder: (context, index) {
        return Column();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    var searchlist = query.isEmpty
        ? list
        : list.where((p) => p['aya_text_emlaey'].contains(query)).toList();

    return ListView.builder(
      itemCount: searchlist.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text('${searchlist[i]['sura_name_ar']}'),
          subtitle: Text('${searchlist[i]['aya_text_emlaey']}'),
          onTap: () {
            query = query = searchlist[i]['sura_name_ar'] +
                searchlist[i]['aya_text_emlaey'];
            showResults(context);
          },
        );
      },
    );
  }
}
