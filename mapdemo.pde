import de.fhpotsdam.unfolding.*; //<>//
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.Microsoft;
import de.fhpotsdam.unfolding.providers.Google;
import de.fhpotsdam.unfolding.providers.OpenStreetMap;

UnfoldingMap currentMap;
UnfoldingMap map1, map2, map3, map4, map5;
UnfoldingMap map, lmap;
int c1, c2, c3, c4, c5;
AbstractMapProvider p1, p2;

Location loneLoc, nUKLoc, mDLoc, nLoc, bFLoc;

void setup() {
  System.setProperty("http.agent", "Gluon Mobile/1.0.3");
  frameRate(5);
  c1 = 19;
  c2 = 19;
  c3 = 19;
  c4 = 19;
  c5 = 19;
  size(800, 600);

  p1 = new OpenStreetMap.OpenStreetMapProvider();
  p2 = new Microsoft.AerialProvider();

  map = new UnfoldingMap(this, new OpenStreetMap.OpenStreetMapProvider());

  //map1 = new UnfoldingMap(this, new Microsoft.AerialProvider());
  map1 = new UnfoldingMap(this, p1);
  map2 = new UnfoldingMap(this, new Microsoft.AerialProvider());

  map3 = new UnfoldingMap(this, new Microsoft.AerialProvider());
  map4 = new UnfoldingMap(this, new Microsoft.AerialProvider());
  map5 = new UnfoldingMap(this, new Microsoft.AerialProvider());

  MapUtils.createDefaultEventDispatcher(this, map1, map2, map3, map4, map5);
  currentMap = map;
}

void draw() {
  //currentMap.zoomOut();
  currentMap.draw();
  println(frameCount);
}

void keyPressed() {

  
  Location loneLoc = new Location(54.966667, -1.6);
  Location nUKLoc = new Location(54.966667, -1.6);
  Location mDLoc = new Location(48.137154, 11.576);
  Location nLoc = new Location(54.966667, -1.6);
  Location bFLoc = new Location(43.48012, -1.5555);

  //Location nUKLoc = new Location(54.966667,-1.6);
  //map1.zoomAndPanTo(counter,nUKLoc);


  if (key == '1') {
    c1--;
    map1.zoomAndPanTo(c1, nUKLoc);  
    currentMap = map1;
  }
  if (key == 'q') {
    c1++;
    map1.zoomAndPanTo(c1, nUKLoc);  
    currentMap = map1;
  } 
  if (key == '2') {
    c2--;
    map2.zoomAndPanTo(c2, loneLoc);
    currentMap = map2;
  } 
  if (key == 'w') {
    c2++;
    map2.zoomAndPanTo(c2, loneLoc);
    currentMap = map2;
  } 
  if (key == '3') {
    c3--;
    map3.zoomAndPanTo(c3, mDLoc);
    currentMap = map3;
  } 
  if (key == 'e') {
    c3++;
    map3.zoomAndPanTo(c3, mDLoc);
    currentMap = map3;
  } 
  if (key == '4') {
    c4--;
    map4.zoomAndPanTo(c4, nLoc);
    currentMap = map4;
  }
  if (key == 'r') {
    c4++;
    map4.zoomAndPanTo(c4, nLoc);
    currentMap = map4;
  }
  if (key == '5') {
    c5--;
    map5.zoomAndPanTo(c5, bFLoc);
    currentMap = map5;
  }
  if (key == '5') {
    c5++;
    map5.zoomAndPanTo(c5, bFLoc);
    currentMap = map5;
  }
}
