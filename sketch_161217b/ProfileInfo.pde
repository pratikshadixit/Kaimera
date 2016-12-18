class ProfileInfo {
  String name;
  String gender;
  String placeofbirth;
  String age;
  String dob;
  ArrayList<String> musicArtists;
  ArrayList<String> mostVisitedSites;
  ArrayList<String> messages;
public ProfileInfo()
{}

public ProfileInfo(String name, String gender, String placeofbirth, String age, String dob,
                    ArrayList<String> musicArtists, ArrayList<String> mostVisitedSites, ArrayList<String>  messages) {
    this.name = name;
    this.gender =  gender;
    this.placeofbirth = placeofbirth;
    this.age = age;
    this.dob = dob;
    this.musicArtists = musicArtists;
    this.mostVisitedSites = mostVisitedSites;
    this.messages = messages;
  }
}