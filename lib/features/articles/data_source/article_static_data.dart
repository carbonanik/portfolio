import 'package:portfolio/features/articles/models/article.dart';

final articleTagList = [
  "Flutter",
  "Dart",
  "State Management",
  "Widgets",
  "Performance",
  "UI/UX",
];

final staticArticles = [
  Article(
    id: "a1b2c3d4-e5f6-4g7h-8i9j-k0l1m2n3o4p5",
    title: const TitleContent(
        text: "Understanding StatefulWidget vs StatelessWidget"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "Widgets"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "In Flutter, choosing between StatefulWidget and StatelessWidget is fundamental. A StatelessWidget is immutable - once built, it never changes. Use it for static content like icons, text labels, or layout containers."),
      const CodeContent(code: """
class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Welcome to Flutter!');
  }
}
""", language: "dart"),
      const TextContent(
          text:
              "StatefulWidget, on the other hand, maintains state that can change over time. When you call setState(), Flutter rebuilds the widget with the new data. Use it for interactive elements like forms, animations, or counters."),
      const CodeContent(code: """
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text('Count: \$count');
  }
}
""", language: "dart"),
    ],
  ),
  Article(
    id: "b2c3d4e5-f6g7-h8i9-j0k1-l2m3n4o5p6q7",
    title: const TitleContent(text: "Flutter Layouts: Row, Column, and Stack"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "Widgets", "UI/UX"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "Flutter provides powerful layout widgets. Row arranges children horizontally, Column vertically, and Stack layers them on top of each other."),
      const CodeContent(code: """
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('First Item'),
    Text('Second Item'),
    Row(
      children: [
        Icon(Icons.star),
        Text('Rating'),
      ],
    ),
  ],
)
""", language: "dart"),
      const TextContent(
          text:
              "Use mainAxisAlignment and crossAxisAlignment to control spacing and alignment. Stack is perfect for overlays, badges, or complex UI compositions."),
    ],
  ),
  Article(
    id: "c3d4e5f6-g7h8-i9j0-k1l2-m3n4o5p6q7r8",
    title: const TitleContent(text: "Managing State with Provider"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "State Management"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "Provider is Flutter's recommended state management solution. It's simple, efficient, and works great for most apps. First, create a ChangeNotifier class:"),
      const CodeContent(code: """
class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }
}
""", language: "dart"),
      const TextContent(
          text:
              "Then wrap your app with ChangeNotifierProvider and use Consumer to rebuild widgets when state changes. It's that simple!"),
    ],
  ),
  Article(
    id: "bb176939-c2d5-4584-a9f2-66595632379a",
    title:
        const TitleContent(text: "Building Responsive Layouts with MediaQuery"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "UI/UX"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "MediaQuery helps you build responsive apps that adapt to different screen sizes. Access screen dimensions and adjust your UI accordingly."),
      const CodeContent(code: """
class ResponsiveContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    return Container(
      width: width > 600 ? 400 : width * 0.9,
      child: Text('Responsive!'),
    );
  }
}
""", language: "dart"),
      const TextContent(
          text:
              "You can also check orientation, padding, and device pixel ratio. This makes it easy to create layouts that work on phones, tablets, and desktops."),
    ],
  ),
  Article(
    id: "6fe51f87-0376-44ee-944d-3770bd18e690",
    title: const TitleContent(text: "ListView Best Practices"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "Performance", "Widgets"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "ListView is essential for scrollable content, but use it wisely. For small lists, ListView is fine. For large or infinite lists, always use ListView.builder for better performance."),
      const CodeContent(code: """
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)
""", language: "dart"),
      const TextContent(
          text:
              "ListView.builder only creates widgets that are visible on screen, saving memory and improving scroll performance. For complex layouts, consider CustomScrollView with Slivers."),
    ],
  ),
  Article(
    id: "11817e01-20ec-441a-8064-853ae2d934b7",
    title: const TitleContent(text: "Navigation Basics: Routes and Navigator"),
    featuredImage: "image/banner.png",
    tags: ["Flutter"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "Navigation in Flutter uses the Navigator widget to manage a stack of routes. Push a new screen with Navigator.push and return with Navigator.pop."),
      const CodeContent(code: """
// Navigate to new screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailScreen()),
);

// Return to previous screen
Navigator.pop(context);

// Pass data back
Navigator.pop(context, 'result data');
""", language: "dart"),
      const TextContent(
          text:
              "For more complex apps, consider named routes or packages like go_router for declarative routing with deep linking support."),
    ],
  ),
  Article(
    id: "4acdecc5-4044-4c57-8c04-f6dd886fd77d",
    title: const TitleContent(text: "Async Programming with FutureBuilder"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "Dart"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "FutureBuilder makes handling asynchronous data easy. It rebuilds your UI when a Future completes, perfect for API calls or database queries."),
      const CodeContent(code: """
FutureBuilder<User>(
  future: fetchUser(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasError) {
      return Text('Error: \${snapshot.error}');
    }
    return Text('Hello, \${snapshot.data!.name}');
  },
)
""", language: "dart"),
      const TextContent(
          text:
              "Always check connectionState and hasError to handle loading and error states gracefully."),
    ],
  ),
  Article(
    id: "bdd5f35c-9095-4165-b8fd-2f04e427a54c",
    title: const TitleContent(
        text: "Custom Widgets: Composition Over Inheritance"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "Widgets"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "Flutter encourages composition - building complex widgets from simpler ones. Extract reusable parts into custom widgets to keep your code clean."),
      const CodeContent(code: """
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
""", language: "dart"),
      const TextContent(
          text:
              "This makes your code more maintainable and reusable across your app."),
    ],
  ),
  Article(
    id: "39e309d4-9dcc-469d-be0f-f1ba487efb2a",
    title: const TitleContent(text: "Theme and Styling in Flutter"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "UI/UX"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "Define a consistent theme in MaterialApp to style your entire app. This includes colors, text styles, and component themes."),
      const CodeContent(code: """
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
    ),
  ),
  home: HomeScreen(),
)
""", language: "dart"),
      const TextContent(
          text:
              "Access theme properties with Theme.of(context) anywhere in your widget tree. For dark mode, define a separate darkTheme."),
    ],
  ),
  Article(
    id: "c8d13c34-2106-49f1-91e2-892a107a40cf",
    title: const TitleContent(text: "Form Validation Made Easy"),
    featuredImage: "image/banner.png",
    tags: ["Flutter", "Widgets"],
    author: "✏️ the coder",
    publishedAt: DateTime.now(),
    contents: [
      const TextContent(
          text:
              "Flutter's Form widget combined with TextFormField makes validation straightforward. Use a GlobalKey to access form state."),
      const CodeContent(code: """
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  ),
)

// Validate on submit
if (_formKey.currentState!.validate()) {
  // Process form
}
""", language: "dart"),
      const TextContent(
          text:
              "The validator function runs when you call validate(), showing error messages automatically."),
    ],
  ),
];
