
import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.PixelPusher;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

TestObserver testObserver;
DeviceRegistry registry;

IntList controllerFullList = new IntList();
IntList controllerActivationList = new IntList();
int intStartupTime = 0;
int intStartupDelayMillis = 2000;


void setupController()
{
  controllerFullList = new IntList();
  intStartupTime = millis() + intStartupDelayMillis;
  
  registry = new DeviceRegistry();
  registry.setAntiLog(true);
  registry.setAutoThrottle(true);
  //registry.setExtraDelay(1000);
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
}


void updateController()
{
  try
  {
    if (testObserver.hasStrips && millis() >= intStartupTime)
    {
      Map<String, PixelPusher> controllerMap = registry.getPusherMap();
      
      for (Map.Entry ppMappedController : controllerMap.entrySet()) {
        PixelPusher ppController = (PixelPusher) ppMappedController.getValue();
        List<Strip> strips = ppController.getStrips();
        int intControllerNo = ppController.getControllerOrdinal();
        int stripNo = 0;
        for(Strip strip : strips) {
          color stripColor = cBlack;
          if(controllerActivationList.hasValue(intControllerNo))
          {
            stripColor = aryColors[stripNo];
          }
          
          for (int stripx = 0; stripx < strip.getLength(); stripx++) {
            strip.setPixel(stripColor, stripx);
          }
         
          stripNo++;
        }
      }
      
      registry.startPushing();
    }
  }
  catch (Exception ex)
  {
  }
}

class TestObserver implements Observer {
  public boolean hasStrips = false;
  
  public void update(Observable registry, Object updatedDevice) {
    try
    {
      PixelPusher pusher = (PixelPusher)updatedDevice;
      int intControllerNo = pusher.getControllerOrdinal();
      if(!controllerFullList.hasValue(intControllerNo))
      {
        controllerFullList.append(intControllerNo);
        checkboxController.addItem("Controller " + intControllerNo, intControllerNo).activate(checkboxController.getItems().size() - 1);
        controllerActivationList.append(intControllerNo);
        this.hasStrips = true;
      }
    }
    catch (Exception regException)
    {
      setupController();
    }
  }
};
