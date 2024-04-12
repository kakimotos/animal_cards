import 'package:flutter/material.dart';

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

  Map<String, dynamic> animal1 = {
    'name': 'アオサギ',
    'description': '日本で最も大きいサギ。体は灰色で、飛ぶと風切羽の黒が目立つ。成鳥には、頭に黒い冠羽（かんむりばね）がある。よく見ると、眼の上に黒い模様がある。海岸や干潟、川、湖沼、水田などで、魚やカエルなどをとらえて食べる。ほかのサギ類と集団で繁殖することもあるが、アオサギだけのコロニー（集団繁殖地）をつくることが多い。',
    'type': '鳥類',
    'origin': '日本',
    'size': '93cm',
    'image': 'images/animal1.png'
  };

  Map<String, dynamic> animal2 = {
    'name': 'アカモズ',
    'description': '日本で最も大きいサギ。体は灰色で、飛ぶと風切羽の黒が目立つ。成鳥には、頭に黒い冠羽（かんむりばね）がある。よく見ると、眼の上に黒い模様がある。海岸や干潟、川、湖沼、水田などで、魚やカエルなどをとらえて食べる。ほかのサギ類と集団で繁殖することもあるが、アオサギだけのコロニー（集団繁殖地）をつくることが多い。',
    'type': '鳥類',
    'origin': '日本',
    'size': '20cm',
    'image': 'images/animal2.png'
  };

  Map<String, dynamic> animal3 = {
    'name': 'アトリ',
    'description': '日本で最も大きいサギ。体は灰色で、飛ぶと風切羽の黒が目立つ。成鳥には、頭に黒い冠羽（かんむりばね）がある。よく見ると、眼の上に黒い模様がある。海岸や干潟、川、湖沼、水田などで、魚やカエルなどをとらえて食べる。ほかのサギ類と集団で繁殖することもあるが、アオサギだけのコロニー（集団繁殖地）をつくることが多い。',
    'type': '鳥類',
    'origin': '日本',
    'size': '16cm',
    'image': 'images/animal3.png'
  };

  Map<String, dynamic> animal4 = {
    'name': 'オオヨロイトカゲ',
    'description': '開けた草原にすむ。全身にとげ状のうろこが並び、とくに尾のとげは大きい。後頭部にもとげ状のうろこがあり、まるでよろいを着ているようである。地面に1メートル以上の深い穴を掘り、おどろくと穴に逃げこむ。上体を起こし、太陽に顔をむけてよく日光浴をする。小動物を食べる。胎生（たいせい）で、夏から秋に2頭の幼体を産む。',
    'type': '爬虫類',
    'origin': '南アフリカ',
    'size': '30-40cm',
    'image': 'images/animal4.png'
  };

  Map<String, dynamic> animal5 = {
    'name': 'アフリカツメガエル',
    'description': 'おもに池や水たまりなどの流れのないところにすむ。後肢の内側の3本の指に黒いつめがあり、このつめで水底の泥を掘ってえさをさがす。舌が退化しているので、えさは前肢でかきこむようにして食べる。体側に魚のような側線がある。早春から晩夏が繁殖期で、卵を1個ずつ水草などに産みつける。幼生は半透明で1対のひげがある。',
    'type': '両生類',
    'origin': 'アフリカ南部',
    'size': '約100mm',
    'image': 'images/animal5.png'
  };

  Map<String, dynamic> animal6 = {
    'name': 'モンハナシャコ',
    'description': 'シャコの仲間でははでな色彩で、尾扇（びせん）のふち取りの色は深紅。自分の巣穴を持ち昼間はあまり遠出をしないが、泳ぐスピードはかなり速い。エビのはさみに相当する捕脚（ほきゃく）には数本のとげがあり、この部分を使っての強力なパンチは貝がらをも砕くほどだ。夜間に歩き回ってえものを見つけて一撃でしとめる。肉食性でカニやヤドカリもつかまえて食べる。',
    'type': '無脊椎動物',
    'origin': '太平洋・大西洋・インド洋',
    'size': '150mm',
    'image': 'images/animal6.png'
  };

  //ここでanimals配列を定義
  late List<Map<String, dynamic>> animals = [animal1, animal2, animal3, animal4, animal5, animal6];

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




