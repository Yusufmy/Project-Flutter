class Profile {
  final String username;
  final String displayName;
  final String urlPic;
  final String phone;
  final String addres;

  Profile({
    required this.username,
    required this.displayName,
    required this.urlPic,
    required this.phone,
    required this.addres,
  });

  Map<String, dynamic> jsonProfile = {
    "username": "admin",
    "display_name": "Super admin",
    "url_pic":
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Falamendah.org%2F2014%2F08%2F14%2Fdaftar-dan-gambar-burung-langka-sumatera%2F&psig=AOvVaw1tHPPyl0JniVq-SIC43wHN&ust=1670229377448000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCOCT19HH3_sCFQAAAAAdAAAAABAD",
  };
}
