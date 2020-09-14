import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flut101ep6/pages/vga_detali.dart';
import 'package:flutter_cache_store/flutter_cache_store.dart';
import 'package:flut101ep6/models/vga.dart';

class VgaPage extends StatefulWidget {
  @override
  _VgaPageState createState() => _VgaPageState();
}

class _VgaPageState extends State<VgaPage> {
  List<Vga> vgas = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final store = await CacheStore.getInstance();
    File file = await store.getFile('https://www.advice.co.th/pc/get_comp/vga');
    final jsonString = json.decode(file.readAsStringSync());

    setState(() {
      jsonString.forEach((v) {
        final vga = Vga.fromJson(v);
        vgas.add(vga);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pc Build'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VgaDetailPage(),
                )),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://img.advice.co.th/images_nas/pic_product4/A0131871/A0131871_1.jpg",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text('$i'),
              ],
            ),
          );
        },
      ),
    );
  }
}

// end ep6
