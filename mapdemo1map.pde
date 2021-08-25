import de.fhpotsdam.unfolding.*;
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

UnfoldingMap streetMap, arealMap, currentMap;
int counter=19;
float lat;
float lng;
Location location;


void setup() {
  System.setProperty("http.agent", "Gluon Mobile/1.0.3");
   frameRate(5);
    size(800, 600);
    lat=52.357995;
    lng=4.868648;
    location = new Location(lat,lng);
    streetMap = new UnfoldingMap(this,new OpenStreetMap.OpenStreetMapProvider());
    arealMap = new UnfoldingMap(this, new Microsoft.AerialProvider()); 
    MapUtils.createDefaultEventDispatcher(this, streetMap, arealMap);
    currentMap = arealMap;
    

}


void draw() {
    currentMap.draw();
    println(frameCount);
}
 
void keyPressed() {

    if (key == '1') {
      counter--;
      println(counter);
      arealMap.zoomAndPanTo(counter,location);   //<>//
        currentMap = arealMap;
        
    } else if (key == '2') {
      counter++;
      arealMap.zoomAndPanTo(counter, location);
        currentMap = arealMap;     
    } else if (key == 'q') {
      arealMap.panLeft();
        currentMap = arealMap;     
    } else if (key == 'w') {
      arealMap.panRight();
        currentMap = arealMap;     
    }
}
