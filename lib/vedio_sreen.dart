import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'database.dart' as fbDatabase;
class VideoScreen extends StatefulWidget {

  final String id;
  final String desc;
  final String title;
  final int vedioSerial;
  final int vedioCat;
  VideoScreen({this.id, this.desc, this.title, this.vedioSerial, this.vedioCat});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  YoutubePlayerController _controller;
  bool _loading = false;

  _launchURL(url) async {
    setState(() {
      _loading = true;
    });
    //const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),

    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //flexibleSpace: FlexibleSpaceBar(

          title: Text('${widget.title}', textAlign: TextAlign.right,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        toolbarHeight: 75.0,

      ),
      body:new Scrollbar(
        isAlwaysShown: true,
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                  child: new ListView(
                      children:<Widget>[
                        for(int y=0; y<fbDatabase.allCategories.length; y++)
                          if(fbDatabase.allCategories[y].category_id == widget.vedioCat)
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: new Text(
                              ' ${fbDatabase.allCategories[y].category_title}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45,
                              ),
                              textAlign: TextAlign.right,
                            )
                        ),
                        new YoutubePlayerControllerProvider( // Provides controller to all the widget below it.
                          controller: _controller,
                          child: YoutubePlayerIFrame(
                            aspectRatio: 16 / 9,
                          ),
                        ),
                        new Padding(
                            padding: new EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: new Text(widget.desc, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),textAlign: TextAlign.center, )
                        ),
                        for(int i=0; i<fbDatabase.allLinks.length; i++)
                          if(fbDatabase.allLinks[i].link != "" && widget.vedioSerial == fbDatabase.allLinks[i].vedio_serial)
                            new Container(
                              margin: EdgeInsets.all(10.0),
                              child:RaisedButton(
                                child: new Text('${fbDatabase.allLinks[i].resource_title}',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5)),
                                onPressed:() =>{_loading ? Center(child: CircularProgressIndicator(),) : _launchURL('${fbDatabase.allLinks[i].link}')},
                              ),
                            ),
                      ],
                    ),
              ),
            ],
        ),
      ),
    )
    );
  }
}