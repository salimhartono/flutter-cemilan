import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappcemilan/detail.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Dessert"),
      ),
      body: _PageList(),
    );
  }
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');
final bigHeaderTextStyle =
    baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);
final descTextStyle =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w300);
final footerTextStyle =
    baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);

class _PageList extends StatefulWidget {
  @override
  _PageStateListState createState() => _PageStateListState();
}

class _PageStateListState extends State<_PageList> {
  List<String> judul = [
    "Jamur Krispi",
    "Otak-otak",
    "Klepon",
    "Pepes",
    "Roti Ola Roti"
  ];

  List<String> subJudul = [
    "Jamur Krispi dengan taburan bubuk cabai balado",
    "Otak-otak bakar khas Boyolali",
    "Insya Allah klepon halal dan sehat",
    "Pepes ikan tuna dengan irisan cabai merah asli",
    "Roti bagi semua kalangan yang halal"
  ];

  List<String> gambar = [
    "images/jamurkrispi.jpg",
    "images/otakotak.jpg",
    "images/klepon.jpg",
    "images/pepes.jpg",
    "images/contoh.jpg",
  ];

  List<String> jmlh = ["10 Pcs", "12 Pcs", "13 Pcs", "13 Pcs", "13 Pcs"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: judul.length,
        itemBuilder: (BuildContext contex, int index) {
          final title = judul[index].toString();
          final subTitle = subJudul[index].toString();
          final jmlah = jmlh[index].toString();
          final img = gambar[index].toString();
          return Container(
            height: 200,
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  backgroundImage(img),
                  Container(
                    child: topContent(title, subTitle, jmlah),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              itemJudul: title,
                              itemSub: subTitle,
                              qty: jmlah,
                              itemImage: img,
                            )));
              },
            ),
          );
        },
      ),
    );
  }

  backgroundImage(String gambar) {
    return new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.luminosity),
                image: AssetImage(gambar))));
  }

  topContent(String nama, String deskripsi, String stok) {
    return new Container(
      //height: 80.0,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderTextStyle,
          ),
          Text(
            deskripsi,
            style: descTextStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Container(
            height: 2,
            width: 80,
            color: Colors.redAccent,
          ),
          Text(
            stok,
            style: descTextStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
