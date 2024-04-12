import 'package:flutter/material.dart';
import 'data/animals_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimalListPage(title: '動物図鑑'),
    );
  }
}

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key, required this.title});

  final String title;

  @override
  State<AnimalListPage> createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing:16,
            crossAxisCount: 2,
            childAspectRatio: 0.8,

          ),
          scrollDirection: Axis.vertical,
          primary:false,
          padding: const EdgeInsets.all(32.0),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> animal = animals[index];
            return _buildAnimalColumn(animal, context);
          },
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildAnimalColumn(Map<String, dynamic> animal, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimalDetailPage(animal: animal),
          ),
        );
      },
      child: Column(
          children: [
            Image.asset(animal['image']),
            Text(animal['name']),
            Text(
              animal['description'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ]
      ),
    );
  }

}

class AnimalDetailPage extends StatelessWidget {
  final Map<String, dynamic> animal;

  const AnimalDetailPage({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal['name']), // 動物の名前をタイトルとして使用
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(animal['image']),
            SizedBox(height:18),// 画像
            const Text('説明', style:TextStyle(fontWeight: FontWeight.bold)),
            Text(animal['description']), // 説明
            SizedBox(height:18),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      children:[
                        Icon(Icons.book, color:Colors.green),
                        const Text('分類', style: TextStyle(fontSize:16)),
                        Text(animal['type'])
                      ]
                  ),
                  Column(
                      children:[
                        Icon(Icons.map, color:Colors.green),
                        const Text('生息地', style:TextStyle(fontSize:16)),
                        Text(animal['origin']),
                      ]
                  ),
                  Column(
                      children:[
                        Icon(Icons.height, color:Colors.green),
                        const Text('全長', style:TextStyle(fontSize:16)),
                        Text(animal['size']),
                      ]
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}




