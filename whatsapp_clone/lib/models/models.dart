// *** PERSONS ***
import 'package:flutter/material.dart';

// *** PERSONS MODEL CLASS ***
class Person {
  bool messagestate; // eğer true ise mesajı ben gönderdim
  late String image;
  late String name;
  late String message;
  late String clock;
  Person(this.messagestate, this.name, this.message, this.clock, this.image);
}
// *** PERSONS MODEL LIST ***
List<Person> persons = [
  Person(true, "Ege", "Selamlar, Whatsapp klonlama sona erdi.", "12:45",
      "https://media.istockphoto.com/id/1451587807/tr/vekt%C3%B6r/user-profile-icon-vector-avatar-or-person-icon-profile-picture-portrait-symbol-vector.jpg?s=612x612&w=0&k=20&c=10jkKmegVjOg1XDH4ZOe1gWcFiJuPywWVLPq4Ndl6TQ="),
  Person(false, "Merve", "Neredesin?", "11:15",
      "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_1280.jpg"),
  Person(false, "Ahmet", "ahahahahahaha", "08:02",
      "https://media.istockphoto.com/id/1451587807/tr/vekt%C3%B6r/user-profile-icon-vector-avatar-or-person-icon-profile-picture-portrait-symbol-vector.jpg?s=612x612&w=0&k=20&c=10jkKmegVjOg1XDH4ZOe1gWcFiJuPywWVLPq4Ndl6TQ="),
  Person(false, "VG YAZILIM", "Halil: ne bu ", "03:12",
      "https://media.istockphoto.com/id/1424987910/tr/foto%C4%9Fraf/coworkers-with-stacked-hands-at-the-office.jpg?s=612x612&w=0&k=20&c=7L8f5w07WuUjolUWlgyvexqxZUmfwaJQ5n6jR3v16rU="),
  Person(false, "Emre", "Slm", "00:24",
      "https://media.istockphoto.com/id/1451587807/tr/vekt%C3%B6r/user-profile-icon-vector-avatar-or-person-icon-profile-picture-portrait-symbol-vector.jpg?s=612x612&w=0&k=20&c=10jkKmegVjOg1XDH4ZOe1gWcFiJuPywWVLPq4Ndl6TQ="),
  Person(true, "Selen", "Xd", "dün",
      "https://media.istockphoto.com/id/1346143621/tr/foto%C4%9Fraf/positive-young-mixed-race-woman-using-a-laptop-and-smartphone-at-home-cozy-home-interior.jpg?s=612x612&w=0&k=20&c=ZZUGwWBHd9AVW7z_Em4nXTlReSS1G0bDyxUGFo9BHyE="),
  Person(false, "Melis", "geldim", "dün",
      "https://media.istockphoto.com/id/1500285927/tr/foto%C4%9Fraf/young-woman-a-university-student-studying-online.jpg?s=612x612&w=0&k=20&c=2PU-v1QxNmL4tNDD9q-o-tWFO9EEDMfMjZZSh1e_Njw="),
  Person(false, "Selim", "Selam", "dün",
      "https://media.istockphoto.com/id/1081762006/tr/foto%C4%9Fraf/sahilde-y%C3%BCr%C3%BCmek.jpg?s=612x612&w=0&k=20&c=Hs61ZFbkV_ktweebbbT3iHmJmfTEQNRDQvHQzPypUqA="),
  Person(true, "Kenan", "Bugün de geldi", "12.05.2024",
      "https://media.istockphoto.com/id/1628885114/tr/foto%C4%9Fraf/health-worker-after-work-walking-with-electric-bike-ride.jpg?s=612x612&w=0&k=20&c=9zRjgYB_nxkhcpJgkKD1qa_VfHGoVX08IZpp1vL5cXU="),
  Person(true, "Pınar", "Artık zaman kalmadı", "09.05.2024",
      "https://media.istockphoto.com/id/1303000939/tr/foto%C4%9Fraf/cep-telefonuyla-sohbet-eden-heyecanl%C4%B1-gen%C3%A7-kad%C4%B1n.jpg?s=612x612&w=0&k=20&c=T0PF2XLH2XASNVTo115I4bt7cljrB8MakPTpmJg1ygc="),
  Person(false, "Nilsu", "Selam", "23.04.2024",
      "https://media.istockphoto.com/id/1516718151/tr/foto%C4%9Fraf/photo-of-young-satisfied-businesswoman-hair-wear-purple-shirt-direct-finger-fast-speed.jpg?s=612x612&w=0&k=20&c=59vlMzWx4Dh7v11SxmQvsBzsmLT9hURi-m3ilWSYK-8="),
  Person(true, "Aleyna", "Aktivite alanındayız", "20.04.2024",
      "https://media.istockphoto.com/id/640309804/tr/foto%C4%9Fraf/catching-up-on-social-media-over-his-morning-coffee.jpg?s=612x612&w=0&k=20&c=a1VNmOA6y4xyzAbz-6FmtvXNQ7iMxpCd625VSqPlLLQ="),
  Person(false, "Üniversite Grubu", "Asena: Etkinlik bugün mü??", "18.04.2024",
      "https://media.istockphoto.com/id/513439341/tr/foto%C4%9Fraf/portrait-of-enthusiastic-business-people-in-circle.jpg?s=612x612&w=0&k=20&c=Un3bLpVbNXrYt24QPZ5-BdibobP2oQad5Z2TGdCF4dk=")
];


// *** CHANNELS MODEL CLASS ***
class Channel {
  late String image;
  late String name;
  late String message;
  late String time;
  Channel(this.name, this.message, this.time, this.image);
}
// *** CHANNELS MODEL LIST ***
List<Channel> channels = [
  Channel(
      "Migros Türkiye",
      "Piknik & bahçe keyfi migros'ta! Baharın tad...",
      "22:21",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRPQ3eSFF-jmwLdAAvIrdHH8tBP2AltWeUJTSQGG5_iw&s"),
  Channel(
      "Ekrem İmamoğlu",
      "Roma'da imzalar atıldı. 2027'de Avrupa Oyunları İst...",
      "22:10",
      "https://pbs.twimg.com/profile_images/1558009149530800128/nIihF5ji_400x400.jpg"),
  Channel(
      "National Geographic",
      "A new study finds that Neanderthal interbreed...",
      "20:23",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyPvgOOwrGTyd7crueHCVH4aAhd-b82h5xBnuvPVDsKA&s"),
  Channel(
      "Hepsiburada",
      "Dolabının başrolü olacak olan o tişört. https:/...",
      "15:34",
      "https://yt3.googleusercontent.com/vT3ax4jiYEMdcNZacRE62UuIFsiTZkT6nHjqRZtDcu-eNksMJCe8bmYLtZFAnoDm4ay4WOICrg=s900-c-k-c0x00ffffff-no-rj"),
  Channel(
      "Fenerbahçe",
      "Fenerbahçe spor kulübü Olağan Seçimli Genel...",
      "13:45",
      "https://media.fenerbahce.org/getmedia/9822bfaa-b7f3-4964-b563-ceae217b4a91/ddd.jpg?width=1200&height=675&ext=.jpg"),
  Channel("TRT 1", "Bu ölmüş şehir yeniden dirilecek.", "13:28",
      "https://yt3.googleusercontent.com/trS1BptIbThrleOUAQ5Lz9ghblH2MzxeXdCd71HZrW4AHR6re-kmJ5ZMxXlTrIxpPwHfYEVQ=s900-c-k-c0x00ffffff-no-rj"),
  Channel("Mackolik", "Beşiktaş Emlakjet, Manisa BŞB'yi mağlup etti.", "11:15",
      "https://i.dunya.com/storage/files/images/2023/01/17/mackolik-sr2H_cover.jpg"),
  Channel(
      "ShiftDelete.Net",
      "Apple piyasa sürmek üzere olduğu yeni kulaklı...",
      "15.05.2024",
      "https://pbs.twimg.com/profile_images/1720377848282714112/1OcoEPOy_400x400.jpg")
];


// *** POSTERS MODEL CLASS ***
class Poster {
  late String image;
  late String name;
  Poster(this.image, this.name);
}
// *** POSTERS MODEL LIST ***
List<Poster> posters = [
  Poster("https://cdn-icons-png.flaticon.com/512/124/124034.png", "Whatsapp"),
  Poster(
      "https://pbs.twimg.com/profile_images/1511043794937991169/3B5fpOw8_400x400.png",
      "Google"),
  Poster(
      "https://images.ctfassets.net/y2ske730sjqp/5QQ9SVIdc1tmkqrtFnG9U1/de758bba0f65dcc1c6bc1f31f161003d/BrandAssets_Logos_02-NSymbol.jpg?w=940",
      "Netflix"),
  Poster(
      "https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png",
      "Github"),
  Poster(
      "https://logowik.com/content/uploads/images/cartoon-network-20106352.logowik.com.webp",
      "Cartoon Network"),
];


// *** SETTİNGS MODEL CLASS ***
class Setting {
  late Icon icon;
  late String title;
  late String subtitle;

  Setting({required this.icon, required this.title, required this.subtitle});
}
// *** SETTINGS MODEL LIST ***
List<Setting> settings = [
  Setting(
      icon: const Icon(Icons.key, color: Color.fromARGB(255, 121, 121, 121)),
      title: "Hesap",
      subtitle: "Güvelik bildirinleri, numara değiştirme"),
  Setting(
      icon: const Icon(Icons.lock_outline_rounded,
          color: Color.fromARGB(255, 121, 121, 121)),
      title: "Gizlilik",
      subtitle: "Kişileri engelleme, süreli mesajlar"),
  Setting(
      icon: const Icon(Icons.sentiment_very_satisfied_outlined,
          color: Color.fromARGB(255, 121, 121, 121)),
      title: "Avatar",
      subtitle: "Oluşturma, düzenleme, profil fotoğrafı"),
  Setting(
      icon: const Icon(Icons.chat_outlined,
          color: Color.fromARGB(255, 121, 121, 121)),
      title: "Sohbetler",
      subtitle: "Tema, duvar kağıtları, sohbet geçmişi"),
  Setting(
      icon: const Icon(Icons.notifications_none,
          color: Color.fromARGB(255, 121, 121, 121)),
      title: "Bildirimler",
      subtitle: "Mesaj, grup ve arama sesleri"),
  Setting(
      icon: const Icon(Icons.data_saver_off_outlined,
          color: Color.fromARGB(255, 121, 121, 121)),
      title: "Depolama ve veriler",
      subtitle: "Ağ kullanımı, otomatik indirme"),
  Setting(
      icon:
          const Icon(Icons.language, color: Color.fromARGB(255, 121, 121, 121)),
      title: "Uygulama dili",
      subtitle: "Türkçe (cihaz dili)"),
  Setting(
      icon: const Icon(Icons.help_outline,
          color: Color.fromARGB(255, 121, 121, 121)),
      title: "Yardım",
      subtitle: "GYardım merkezi, bize ulaşın, gizlilik ilkesi"),
  Setting(
      icon: const Icon(Icons.people_outline_outlined,
          color: Color.fromARGB(255, 121, 121, 121)),
      title: "Arkadaş davet edin",
      subtitle: ""),
  Setting(
      icon: const Icon(Icons.system_update_outlined,
          color: Color.fromARGB(255, 121, 121, 121)),
      title: "Uygulama güncellemeleri",
      subtitle: ""),
];


// *** CAMERA GALLERY MODEL CLASS ***
class Gallery {
  late String image;
  Gallery({required this.image});
}
// *** CAMERA GALLERY MODEL LIST ***
List<Gallery> photos = [
  Gallery(
      image:
          "https://media.istockphoto.com/id/1776248216/tr/foto%C4%9Fraf/bandirma-ship-museum-band%C4%B1rma-ferry.jpg?s=612x612&w=0&k=20&c=4tmBN2mt-h33PQ-LJq0m1Mz62d1O_afuJK8EEde5AY0="),
  Gallery(
      image:
          "https://media.istockphoto.com/id/1995779809/tr/vekt%C3%B6r/19-may-ataturk.jpg?s=612x612&w=0&k=20&c=q9Ijf7q3wQmI_SqcAopxy1fnnH27BFSF79caLI48wDA="),
  Gallery(
      image:
          "https://media.istockphoto.com/id/941320796/tr/foto%C4%9Fraf/sergi-sanat%C3%A7%C4%B1n%C4%B1n-koleksiyonu.jpg?s=2048x2048&w=is&k=20&c=1LAh0M1FyDiWNnJ8qHKOuZ9TcuWa88W55jRX8fkuXSQ="),
  Gallery(
      image:
          "https://media.istockphoto.com/id/1183183783/tr/foto%C4%9Fraf/kad%C4%B1n-sanat%C3%A7%C4%B1-soyut-ya%C4%9Fl%C4%B1boya-%C3%BCzerine-%C3%A7al%C4%B1%C5%9F%C4%B1yor-hareketli-boya-f%C4%B1r%C3%A7as%C4%B1-enerjik-olarak.jpg?s=612x612&w=0&k=20&c=wLmsKCiD6yZVJtCIp78Icy9Gjm4Efs_pO95y_v6AeOE="),
  Gallery(
      image:
          "https://media.istockphoto.com/id/1487468029/tr/foto%C4%9Fraf/empty-picturer-frame-on-wall.jpg?s=612x612&w=0&k=20&c=7bPIeWADeojL1pPcMcAx276McjQS4A8srLYJ6Src7zc="),
  Gallery(
      image:
          "https://media.istockphoto.com/id/1495954819/tr/foto%C4%9Fraf/woman-enjoying-art-in-gallery.jpg?s=612x612&w=0&k=20&c=JwST_YS4k4_5Q4_Udd9S9HA7I4ifvT2LjP0gxWEUT6w="),
  Gallery(
      image:
          "https://media.istockphoto.com/id/1337232523/tr/foto%C4%9Fraf/high-angle-view-of-a-lake-and-forest.jpg?s=612x612&w=0&k=20&c=RTewEVTp91KqHV-BlDEI8QX54h56FS-QqoEfUuX3NF4="),
  Gallery(
      image:
          "https://media.istockphoto.com/id/1488644028/tr/foto%C4%9Fraf/vr-glasses-and-engineering-man-on-tablet-for-futuristic-research-electronics-management-or.jpg?s=612x612&w=0&k=20&c=dmBI4S-bP9l8O4Ps3jlKobgqv0scHuo57WfiuQiLmVI="),
  Gallery(
      image:
          "https://media.istockphoto.com/id/1367385099/tr/foto%C4%9Fraf/hong-kong-central-district-with-city-park.jpg?s=612x612&w=0&k=20&c=sIiIVTUYdmPs4kJDxXd6XH93zAqOaEQ7EELEiqzTDC0="),
];


// *** RANDOM MESSAGE MODEL CLASS ***
class Message {
  String text;
  bool myMessage;
  bool isSelected;

  Message(
      {required this.myMessage, required this.text, this.isSelected = false});
}
// *** RANDOM MESSAGE MODEL LIST ***
List<Message> messages = [
  Message(myMessage: false, text: "Mesaj 1"),
  Message(myMessage: true, text: "Mesaj 2"),
  Message(myMessage: false, text: "Mesaj 3"),
  Message(myMessage: false, text: "Mesaj 4"),
  Message(myMessage: true, text: "Mesaj 5"),
  Message(myMessage: false, text: "Mesaj 6"),
  Message(myMessage: false, text: "Mesaj 7"),
  Message(myMessage: true, text: "Mesaj 8"),
  Message(myMessage: true, text: "Mesaj 9"),
  Message(myMessage: false, text: "Mesaj 10"),
  Message(myMessage: true, text: "Mesaj 11"),
  Message(myMessage: false, text: "Mesaj 12"),
  Message(myMessage: true, text: "Mesaj 13"),
  Message(myMessage: false, text: "Mesaj 14"),
  Message(myMessage: false, text: "Mesaj 15"),
  Message(myMessage: true, text: "Mesaj 16"),
  Message(myMessage: false, text: "Mesaj 17"),
  Message(myMessage: true, text: "Mesaj 18"),
  Message(myMessage: false, text: "Mesaj 19"),
  Message(myMessage: true, text: "Mesaj 20"),
  Message(myMessage: false, text: "Mesaj 21"),
  Message(myMessage: true, text: "Mesaj 22"),
];