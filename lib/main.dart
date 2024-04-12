import 'package:flutter/material.dart';
import 'data/animals_data.dart';
import 'data/plants_data.dart';



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
      // home: const AnimalListPage(title: '動物図鑑'),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs:[
                Tab(icon: Icon(Icons.pets)),
                Tab(icon: Icon(Icons.local_florist)),
              ]
            ),
            title: const Text('いきもの図鑑'),
          ),
          body: TabBarView(
            children: [
              AnimalListPage(),
              PlantListPage(),
            ]
          )
        )
      )
    );
  }
}

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key});

  @override
  State<AnimalListPage> createState() => _AnimalListPageState();
}

class PlantListPage extends StatefulWidget {
  const PlantListPage({super.key});

  @override
  State<PlantListPage> createState() => _PlantListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class _PlantListPageState extends State<PlantListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing:16,
            crossAxisCount: 2,
            childAspectRatio: 0.55,

          ),
          scrollDirection: Axis.vertical,
          primary:false,
          padding: const EdgeInsets.all(32.0),
          itemCount: plants.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> plant = plants[index];
            return _buildPlantColumn(plant, context);
          },
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildPlantColumn(Map<String, dynamic> plant, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantDetailPage(plant: plant),
          ),
        );
      },
      child: Column(
          children: [
            Image.asset(plant['image']),
            Text(plant['name']),
            Text(
              plant['description'],
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

class PlantDetailPage extends StatelessWidget {
  final Map<String, dynamic> plant;

  const PlantDetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant['name']), // 動物の名前をタイトルとして使用
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(plant['image']),
            SizedBox(height:18),// 画像
            const Text('説明', style:TextStyle(fontWeight: FontWeight.bold)),
            Text(plant['description']), // 説明
            SizedBox(height:18),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      children:[
                        Icon(Icons.book, color:Colors.green),
                        const Text('花の咲く季節', style: TextStyle(fontSize:16)),
                        Text(plant['type'])
                      ]
                  ),
                  Column(
                      children:[
                        Icon(Icons.height, color:Colors.green),
                        const Text('全長', style:TextStyle(fontSize:16)),
                        Text(plant['size']),
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




