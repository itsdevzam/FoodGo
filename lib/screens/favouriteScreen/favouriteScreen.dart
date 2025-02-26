import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../util/constants.dart';
import '../../util/helper.dart';
import '../productDetailScreen/productDetailScreen.dart';

class favouriteScreen extends StatefulWidget {
  const favouriteScreen({super.key});

  @override
  State<favouriteScreen> createState() => _favouriteScreenState();
}

List<Map<String, dynamic>> _favIndex = [];

class _favouriteScreenState extends State<favouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Favourite",
                style: TextStyle(
                    color: Colors.black, fontSize: 45, fontFamily: 'Lobester'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: _favIndex.isEmpty
                  ? Container(
                      height: helper.deviceHeight(context),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: helper.deviceHeight(context)*0.15),
                          const Icon(
                            Iconsax.emoji_sad,
                            size: 80,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Nothing to show ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, left: 10, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => productDetailScreen(
                                            name: constants.listData[
                                                    _favIndex[index]['isfav']]
                                                ['name'],
                                            type: constants.listData[
                                                    _favIndex[index]['isfav']]
                                                ['type'],
                                            description: constants.listData[
                                                    _favIndex[index]['isfav']]
                                                ['description'],
                                            imgPath: constants.listData[
                                                    _favIndex[index]['isfav']]
                                                ['path'],
                                            price: constants.listData[
                                                    _favIndex[index]['isfav']]
                                                ['price'],
                                            rating: constants.listData[
                                                    _favIndex[index]['isfav']]
                                                ['rating'],
                                            time: constants.listData[
                                                    _favIndex[index]['isfav']]
                                                ['time'],
                                            itemIndex: _favIndex[index]
                                                ['isfav'],
                                          )));
                            },
                            child: SizedBox(
                              height: 130,
                              child: Card(
                                color: constants.softWhite,
                                elevation: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          '${constants.listData[_favIndex[index]['isfav']]['path']}.png',
                                          height: 100,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${constants.listData[_favIndex[index]['isfav']]['name']}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                '${constants.listData[_favIndex[index]['isfav']]['type']}'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Text(
                                                  constants.listData[
                                                      _favIndex[index]
                                                          ['isfav']]['rating'],
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              constants.listData[
                                                      _favIndex[index]['isfav']]
                                                  ['isfav'] = false;
                                              _updatefavList();
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Iconsax.tag_cross,
                                              color: Colors.red,
                                            )),
                                        Text(
                                          '${constants.listData[_favIndex[index]['isfav']]['price']}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: _favIndex.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _updatefavList();
    super.initState();
  }

  void _updatefavList() {
    _favIndex.clear();
    for (int i = 0; i < constants.listData.length; i++) {
      if (constants.listData[i]['isfav'] == true) {
        _favIndex.add({"isfav": i});
      }
    }
  }
}
