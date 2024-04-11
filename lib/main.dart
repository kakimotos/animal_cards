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

  List<String> animal1 = [
    'アオサギ',
    '日本で最も大きいサギ。体は灰色で、飛ぶと風切羽の黒が目立つ。成鳥には、頭に黒い冠羽（かんむりばね）がある。よく見ると、眼の上に黒い模様がある。海岸や干潟、川、湖沼、水田などで、魚やカエルなどをとらえて食べる。ほかのサギ類と集団で繁殖することもあるが、アオサギだけのコロニー（集団繁殖地）をつくることが多い。',
    '鳥類',
    '日本',
    '93cm',
    'images/animal1.png'
  ];

  List<String> animal2 = [
    'アカモズ',
    'モズに似ているが、ひたいと、のどから腹が白い。頭から背、尾は赤茶色。翼には白い模様がない。眼をおおうように、くちばしの根元から黒い線が出る。平地から山地の明るい林やしげった林のふち、やぶのある草原などにすむ。おもに昆虫を食べ、小鳥やカエルなどをおそうことがある。大きいえものは足でつかむが、普通はくちばしでくわえる。環境省のレッドリストの絶滅危惧ⅠB類に指定されている。',
    '鳥類',
    '日本',
    '20cm',
    'images/animal2.png'
  ];

  List<String> animal3 = [
    'アトリ',
    'カワラヒワより大きい。オスの夏羽は頭が黒い。オスの冬羽とメスの頭は灰色がかったかっ色。飛ぶと、黒い尾と腰の白のパターンが目立つ。山地の林にすみ、地上で草の種子などを食べる。ときには平地の畑や水田などでもえさをとる。年によって数万、数十万羽の群れがやってくることがある。これは繁殖地での個体数の増減に関係がある。',
    '鳥類',
    '日本',
    '16cm',
    'images/animal3.png'
  ];

  List<String> animal4 = [
    'オオヨロイトカゲ',
    '開けた草原にすむ。全身にとげ状のうろこが並び、とくに尾のとげは大きい。後頭部にもとげ状のうろこがあり、まるでよろいを着ているようである。地面に1メートル以上の深い穴を掘り、おどろくと穴に逃げこむ。上体を起こし、太陽に顔をむけてよく日光浴をする。小動物を食べる。胎生（たいせい）で、夏から秋に2頭の幼体を産む。',
    '爬虫類',
    '南アフリカ',
    '30-40cm',
    'images/animal4.png'
  ];

  List<String> animal5 = [
    'アフリカツメガエル',
    'おもに池や水たまりなどの流れのないところにすむ。後肢の内側の3本の指に黒いつめがあり、このつめで水底の泥を掘ってえさをさがす。舌が退化しているので、えさは前肢でかきこむようにして食べる。体側に魚のような側線がある。早春から晩夏が繁殖期で、卵を1個ずつ水草などに産みつける。幼生は半透明で1対のひげがある。',
    '両生類',
    'アフリカ南部',
    '約100mm',
    'images/animal5.png'
  ];

  //ここでanimals配列を定義
  late List<List<String>> animals = [animal1, animal2, animal3, animal4, animal5];

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
            List<String> animal = animals[index];
            return _buildAnimalColumn(animal, context);
          },
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildAnimalColumn(List<String> animal, BuildContext context) {
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
            Image.asset(animal[5]),
            Text(animal[0]),
            Text(
              animal[1],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ]
      ),
    );
  }

  Widget _animalColumn1() {
    return Column(
        children: [
          Image.asset(animal1[5]),
          Text(animal1[0]),
          Text(
            animal1[1],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ]
    );
  }

}

class AnimalDetailPage extends StatelessWidget {
  final List<String> animal;

  const AnimalDetailPage({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal[0]), // 動物の名前をタイトルとして使用
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(animal[5]),
            SizedBox(height:18),// 画像
            const Text('説明', style:TextStyle(fontWeight: FontWeight.bold)),
            Text(animal[1]), // 説明
            SizedBox(height:18),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      children:[
                        Icon(Icons.book, color:Colors.green),
                        const Text('分類', style: TextStyle(fontSize:16)),
                        Text(animal[2])
                      ]
                  ),
                  Column(
                      children:[
                        Icon(Icons.map, color:Colors.green),
                        const Text('生息地', style:TextStyle(fontSize:16)),
                        Text(animal[3]),
                      ]
                  ),
                  Column(
                      children:[
                        Icon(Icons.height, color:Colors.green),
                        const Text('全長', style:TextStyle(fontSize:16)),
                        Text(animal[4]),
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




