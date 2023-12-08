class Model{
  int chapter_number=0;
  String chapter_summary="";
  String chapter_summary_hindi='';
  int id=0;
  String image='';
  String image_name='';
  String name='';
  String name_meaning='';
  String name_translation='';
  String name_transliterated='';
  int verses_count=0;
  int? verseNumber;
  String? text;
  String? title;

  Model({
   required this.chapter_number,
    this.text,
    this.title,
    this.verseNumber,
   required this.chapter_summary,
   required this.chapter_summary_hindi,
   required this.id,
   required this.image,
   required this.image_name,
   required this.name,
   required this.name_meaning,
   required this.name_translation,
   required this.name_transliterated,
   required this.verses_count
});
  Model.fromJson(Map<String,dynamic>json){
    chapter_number=json['chapter_number'] ;
    chapter_summary=json['chapter_summary'];
    chapter_summary_hindi=json['chapter_summary_hindi'];
    id=json['id'];
    image=json['image'];
    text = json['text'];
    title = json['title'];
    verseNumber = json['verse_number'];
    image_name=json['image_name'];
    name=json['name'];
    name_meaning=json['name_meaning'];
    name_translation=json['name_translation'];
    name_transliterated=json['name_transliterated'];
    verses_count=json['verses_count'];
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic>data=<String,dynamic>{};
    data['chapter_number']=chapter_number;
    data['chapter_summary']=chapter_summary;
    data['chapter_summary_hindi']=chapter_summary_hindi;
    data['id']=id;
    data['text'] = this.text;
    data['title'] = this.title;
    data['verse_number'] = this.verseNumber;
    data['image']=image;
    data['image_name']=image_name;
    data['name']=name;
    data['name_meaning']=name_meaning;
    data['name_translation']=name_translation;
    data['name_transliterated']=name_transliterated;
    data['verses_count']=verses_count;
    return data;
  }
  @override
  String toString(){
    return '{'
        'chapter_number: $chapter_number,'
        'chapter_summary:$chapter_summary,'
        'chapter_summary_hindi:$chapter_summary_hindi,'
        'id:$id,'
        'image:$image,'
        'text:$text,'
        'title:$title,'
        'verse_number:$verseNumber,'
        'image_name:$image_name,'
        'name:$name,'
        'name_meaning:$name_meaning,'
        'name_translation:$name_translation,'
        'name_transliterated:$name_transliterated,'
        'verses_count:$verses_count}';
  }
  static List<Model>parseList(List value){
    List<Model> listdata=value.map((e) => Model.fromJson(e)).toList();
    return listdata;
  }
}