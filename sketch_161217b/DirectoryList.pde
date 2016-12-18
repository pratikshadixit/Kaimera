/**
 * Listing files in directories and subdirectories
 * by Daniel Shiffman.  
 * 
 * This example has three functions:<br />
 * 1) List the names of files in a directory<br />
 * 2) List the names along with metadata (size, lastModified)<br /> 
 *    of files in a directory<br />
 * 3) List the names along with metadata (size, lastModified)<br />
 *    of files in a directory and all subdirectories (using recursion) 
 */

import java.util.Date;

void setup1() {

  // Using just the path of this sketch to demonstrate,
  // but you can list any directory you like.
  String path = sketchPath()+"\\data";

  println("Listing all filenames in a directory: "+path);
  
  ArrayList<ProfileInfo> profileDetails = GetProfiles(path);
  for(int i=0; i < profileDetails.size(); i++)
  {  println("-----------------------------");
     println("Name: "+profileDetails.get(i).name);
     println("Age: "+profileDetails.get(i).age);
     println("Gender: "+profileDetails.get(i).age);
     println("Place of birth: "+profileDetails.get(i).placeofbirth);
     println("Date of Birth: "+profileDetails.get(i).dob);
     
     println("Music Artists :\n");
     for(int j=0; j < profileDetails.get(i).musicArtists.size(); j++)
         println((j+1)+":"+profileDetails.get(i).musicArtists.get(j));
     println("Most visited sites :\n");
     for(int j=0; j < profileDetails.get(i).mostVisitedSites.size(); j++)
         println((j+1)+":"+profileDetails.get(i).mostVisitedSites.get(j));
      println("Messages :\n");
     for(int j=0; j < profileDetails.get(i).messages.size(); j++)
         println((j+1)+":"+profileDetails.get(i).messages.get(j));
         
     println("-----------------------------");
  }
  noLoop();
}

void draw1() {
}


//---------------------------------------------------------------------------------------------------
//Fetch all profiles
ArrayList<ProfileInfo> GetProfiles(String path)
{
  ArrayList<ProfileInfo> profiles  = new ArrayList<ProfileInfo>();
  
  println("\nListing info about all files in a directory: ");
  File[] files = listFiles(path);
  
  for (int i = 0; i < files.length; i++) {
    File f = files[i];
    println("Name: " + f.getName());
    println("Is directory: " + f.isDirectory());
    
    if(!f.isDirectory())
    {
      profiles.add(GetProfileFromFile(f));
    }
  }
  
  return profiles;
}


//Read single profile from file
ProfileInfo GetProfileFromFile(File f)
{
      String[] fileData  = loadStrings(f);
      ProfileInfo profile = new ProfileInfo();
      
      profile.name = fetchValueByKey(fileData,"Name");
      profile.gender = fetchValueByKey(fileData,"Gender");
      profile.age = fetchValueByKey(fileData,"Age");
      profile.placeofbirth = fetchValueByKey(fileData,"PlaceOfBirth");
      profile.dob = fetchValueByKey(fileData,"DOB");      

      profile.musicArtists = fetchValuesByKey(fileData,"MusicArtist");      
      profile.mostVisitedSites = fetchValuesByKey(fileData,"Site");
      profile.messages = fetchValuesByKey(fileData,"texts:  body");
      
      return profile;
}

// parse all lines in the file to get customer profile info by key 

String fetchValueByKey(String[] lines, String keyToSearch)
{
  keyToSearch+=":";
  for (int i = 0; i < lines.length; i++) {
    //check line contain any required data
    
    if(lines[i].contains(keyToSearch))
    {
      String value = lines[i].split(keyToSearch)[1].trim(); 
      return value;
    }
  }
  return "";
}

ArrayList<String> fetchValuesByKey(String[] lines, String keyToSearch)
{
  keyToSearch+=":";
    ArrayList<String> values = new ArrayList<String>(); 
    for (int i = 0; i < lines.length; i++) {
    //check line contain any required data
    
    if(lines[i].contains(keyToSearch))
    {
      values.add(lines[i].split(keyToSearch)[1].trim());
    }
  }
  return values;
}//---------------------------------------------------------------------------------------------

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

// This function returns all the files in a directory as an array of File objects
// This is useful if you want more info about the file
File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}

// Function to get a list of all files in a directory and all subdirectories
ArrayList<File> listFilesRecursive(String dir) {
  ArrayList<File> fileList = new ArrayList<File>(); 
  recurseDir(fileList, dir);
  return fileList;
}

// Recursive function to traverse subdirectories
void recurseDir(ArrayList<File> a, String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    // If you want to include directories in the list
    a.add(file);  
    File[] subfiles = file.listFiles();
    for (int i = 0; i < subfiles.length; i++) {
      // Call this function on all files in this directory
      recurseDir(a, subfiles[i].getAbsolutePath());
    }
  } else {
    a.add(file);
  }
}