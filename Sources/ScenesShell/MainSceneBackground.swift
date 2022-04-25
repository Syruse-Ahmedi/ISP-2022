import Scenes
import Igis
import Foundation

  /*
     This class is responsible for rendering the background.
   */


class MainSceneBackground : BackgroundBase {
    
    init() {
        super.init(playURL: URL(string:"https://aroundmichigan.com/wp-content/uploads/2016/10/HauntedHouse.jpg"),
                   shouldShowUpDownButton: true, shouldShowLeftRightButton: true)
    }

}


