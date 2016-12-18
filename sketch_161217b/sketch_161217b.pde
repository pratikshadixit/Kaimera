float yoff = 0.0;        // 2nd dimension of perlin noise
PImage male;  // Declare a variable of type PImage
PImage female;
PFont f;
//float theta;
int x = 79;
int y  = 70;

String placeOfBirth = "Place of Birth: ";
String age = "Age: ";
String gender = "Gender: ";

ArrayList<ProfileInfo> profiles = new ArrayList<ProfileInfo>(); 

int recordCount;
int num = 3; // Display this many entries on each screen.
int startingEntry = 0;  // Display from this entry number

void setup() {
  
  String path = sketchPath()+"\\data";
  
  profiles = GetProfiles(path);
  
  recordCount= profiles.size();
  
  size(1000, 700);
  
  male = loadImage("male.png");
  female = loadImage("female.png");
  
  f = createFont("Georgia",20,true);
  textAlign(CENTER);
  
  //smooth();
  // Create the font
  //textFont(createFont("SourceCodePro-Regular.ttf", 36));
}

void draw() {
    waves();
    for(int i=0; i < num; i =i+3)
    {
      int thisEntry = startingEntry + i;
       if (thisEntry < recordCount) {
        drawProfile(profiles,thisEntry,i);
       }
    }  
  recursiveDraw();
}

void recursiveDraw()
{
  startingEntry += num; 
  if (startingEntry > profiles.size()) {
        startingEntry = 0;
    }
    delay(2000);
     redraw();
}

void drawProfile(ArrayList<ProfileInfo> profileList, int counter,int positionMultiplyer)
{
          positionMultiplyer = 1;
      
          image(profileList.get(0+counter).gender.equals("M") ? male : female,20,20, x, y); //<>//
    
          textFont(f);
          fill(225);
          text(profileList.get(0).musicArtists.get(0),100,200);
          text(profileList.get(0).musicArtists.get(1),150,250);
          text(profileList.get(0).musicArtists.get(2),100,300);
  
          textSize(20);
          text(placeOfBirth, 100, 110*positionMultiplyer-5);
          textSize(30);
          text(profileList.get(0+counter).placeofbirth, 200, 112);
          textSize(20);
          text(age, 143, 60*positionMultiplyer-5);
          textSize(30);
          text (profileList.get(0+counter).age, 183, 62*positionMultiplyer-5);
          
          if(profileList.size()>(2+counter))
          {
            image(profileList.get(1+counter).gender.equals("M") ? male : female, 360, 20, x, (y-4));
            textSize(20);
            text(placeOfBirth, 448, 110*positionMultiplyer-5);
            textSize(30);
            text (profileList.get(1+counter).placeofbirth, 551, 112*positionMultiplyer-5);
            textSize(20);
            text(age, 486, 60*positionMultiplyer-5);
            textSize(30);
            text (profileList.get(1+counter).age, 531, 62*positionMultiplyer-5);
            
             textFont(f);
            fill(225);
            text(profileList.get(1).musicArtists.get(0),448,200);
            text(profileList.get(1).musicArtists.get(1),493,250);
            text(profileList.get(1).musicArtists.get(2),448,300);
          }
          
          if(profileList.size()>(2+counter))
          {
            image(profileList.get(2+counter).gender.equals("M") ? male : female,725,20, x, y);  
  
            textSize(20);
            text(placeOfBirth, 800, 110*positionMultiplyer-5);
            textSize(30);
            text (profileList.get(2+counter).placeofbirth, 900, 112*positionMultiplyer-5);
            textSize(20);
            text(age, 845, 60*positionMultiplyer-5);
            textSize(30);
            text (profileList.get(2+counter).age, 885, 62*positionMultiplyer-5);
          
            textFont(f);
            fill(225);
            text(profileList.get(2).musicArtists.get(0),800,200*positionMultiplyer-5);
            text(profileList.get(2).musicArtists.get(1),850,250*positionMultiplyer-5);
            text(profileList.get(2).musicArtists.get(2),800,300*positionMultiplyer-5);          
          }
}

void waves()
{
  background(0);
   
  fill(30,144,255);
  
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 7) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 3, 1, 200,402); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.87;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  }