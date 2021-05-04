
class Data {
   List<myvedios> vedios = [];
   List<mycategories> categories = [];

  Data({this.vedios, this.categories});

  /*factory Data.fromJson(Map<String, dynamic> json) {
    var vediosList = json['myVedios'] as List;
    print(vediosList.runtimeType);
    List<myvedios> myVediosList = vediosList.map((i) => myvedios.fromJson(i)).toList();
    var categoriesList = json['myCategories'] as List;
    print(categoriesList.runtimeType);
    List<mycategories> myCategoriesList = categoriesList.map((i) => mycategories.fromJson(i)).toList();
    return Data(vedios: myVediosList, categories: myCategoriesList);
  }*/
  /*factory Data.fromMap(Map<String, dynamic> database) {
    var vediosList = database['myVedios'] as List;
    print(vediosList.runtimeType);
    List<myvedios> myVediosList = vediosList.map((i) => myvedios.fromMap(i)).toList();
    var categoriesList = database['myCategories'] as List;
    print(categoriesList.runtimeType);
    List<mycategories> myCategoriesList = categoriesList.map((i) => mycategories.fromMap(i)).toList();
    return Data(vedios: myVediosList, categories: myCategoriesList);
  }*/
}

class myvedios {
   String vedio_title;
   String vedio_id;
   int vedio_category;
   int serial;
   String vedio_description;
  //final String resource_link;
   List<resource_link> links = [];
  //final String resource_title;
  myvedios({this.vedio_title,
      this.vedio_id,
      this.vedio_category,
      this.serial,
      this.vedio_description,
      this.links
  });
      //this.resource_title

  //this.resource_link,

  /*factory myvedios.fromJson(Map<String, dynamic> Json) {
    var linksList = Json['resourceLink'] as List;
    print(linksList.runtimeType);
    List<resource_link> mylinksList = linksList.map((i) => resource_link.fromJson(i)).toList();
    return myvedios(
      vedio_id: Json['id'] as String,
      vedio_title: Json['title'] as String,
      vedio_category: Json['categoryId'] as int,
      vedio_serial: Json['serial'] as int,
      vedio_description: Json['description'] as String,
      links: mylinksList);
      //resource_link: Json['resourceLink'] as String,

      //resource_title: Json['resourceTitle'] as String,

  }*/
  /*factory myvedios.fromMap(Map<String, dynamic> database) {
    var linksList = database['resourceLink'] as List;
    print(linksList.runtimeType);
    List<resource_link> mylinksList = linksList.map((i) => resource_link.fromMap(i)).toList();
    return myvedios(
      vedio_id: database['id'] as String,
      vedio_title: database['title'] as String,
      vedio_category: database['categoryId'] as int,
      vedio_serial: database['serial'] as int,
      vedio_description: database['description'] as String,
      links: mylinksList
    );
      //resource_link: Json['resourceLink'] as String,

      //resource_title: Json['resourceTitle'] as String,

  }*/
}

class resource_link {
  String link;
  //final String link2;
  String resource_title;
  int vedio_serial;
  resource_link({this.link, this.resource_title, this.vedio_serial});

  /*factory resource_link.fromJson(Map<String, dynamic> Json) {
    return resource_link(
        link: Json['link'] as String,
        resource_title: Json['resourceTitle'] as String
    );
        //link2: Json['link2'] as String);
  }*/
  /*factory resource_link.fromMap(Map<String, dynamic> database) {
    return resource_link(
        link: database['link'] as String,
        resource_title: database['resourceTitle'] as String
    );
        //link2: Json['link2'] as String);
  }*/
}

class mycategories {
  int category_id;
  String category_title;

  mycategories({this.category_id, this.category_title});

  /*factory mycategories.fromJson(Map<String, dynamic> Json) {
    return mycategories(
        category_id: Json['categoryId'] as int,
        category_title: Json['categoryTitle'] as String);
  }*/
  /*factory mycategories.fromMap(Map<String, dynamic> database) {
    return mycategories(
        category_id: database['categoryId'] as int,
        category_title: database['categoryTitle'] as String);
  }*/
}
