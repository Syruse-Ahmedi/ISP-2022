import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let MaxScenes = 50
    var CurrentScene = 0
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
      func renderArrows(to canvas: Canvas, direction:String){
          if direction == Left{
          }
      }
      
}
