import 'package:flutter/material.dart';
import 'package:recipia/screens/random_recipe/widgets/expandable.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "CHEF'S SECRET",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: ListView(
          children: [
            ExpandableGroup(
              isExpanded: false,
              collapsedIcon: const Icon(Icons.arrow_drop_down),
              header: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Terms of Use",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              items: const [
                ListTile(
                  title: Text("Acceptance of Terms"),
                  subtitle: Text(
                      "By using CHEF'S SECRET, you agree to these terms. All recipes, nutritional information, and food data are provided for personal culinary exploration."),
                ),
                ListTile(
                    title: Text("Data & Usage"),
                    subtitle: Text(
                        "CHEF'S SECRET connects to global food databases to deliver recipes, ingredients, and cooking instructions directly to your device.")),
              ],
            ),
            ExpandableGroup(
              isExpanded: false,
              collapsedIcon: Icon(Icons.arrow_drop_down),
              header: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Features",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              items: const [
                ListTile(
                  title: Text(
                    'App includes 5,000+ recipes.',
                  ),
                ),
                ListTile(
                  title: Text(
                    'Cost breakdown per servings.',
                  ),
                ),
                ListTile(
                  title: Text(
                    'Related recipes.',
                  ),
                ),
                ListTile(
                  title: Text(
                    'Autocomplete search feature.',
                  ),
                ),
                ListTile(
                  title: Text(
                    'Save your favorite recipes.',
                  ),
                ),
                ListTile(
                  title: Text(
                    'Get random recipes.',
                  ),
                ),
                ListTile(
                  title: Text(
                    'Everyday meal plans with nutrients.',
                  ),
                ),
              ],
            ),
            ExpandableGroup(
              isExpanded: false,
              collapsedIcon: Icon(Icons.arrow_drop_down),
              header: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "App Information",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              items: [
                const ListTile(
                  title: Text(
                    "CHEF'S SECRET - Your Ultimate Cooking Companion",
                  ),
                  subtitle: Text("Developed by Varshitha"),
                ),
                const ListTile(
                  title: Text(
                    'Powered by Spoonacular Food API',
                  ),
                  subtitle: Text('Providing world-class recipe and nutrition intelligence.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
