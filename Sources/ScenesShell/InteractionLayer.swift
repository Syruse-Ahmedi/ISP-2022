import Scenes
import Igis
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer {
    
    let upButton = Button(rect:Rect(size:Size(width:100, height: 200)))
    let downButton = Button(rect:Rect(size:Size(width:100, height: 200)))
    let rightButton = Button(rect:Rect(size:Size(width:200, height: 100)))
    let leftButton = Button(rect:Rect(size:Size(width:200, height: 100)))

    init() {
          // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")
        
        // We insert our RenderableEntities in the constructor
       insert(entity: upButton, at: .front)
        insert(entity: downButton, at: .front)
        insert(entity: rightButton, at: .front)
        insert(entity: leftButton, at: .front)
        
    }

    override func preSetup(canvasSize:Size, canvas:Canvas){
        upButton.move(to:Point(x:9999, y:9999))
        downButton.move(to:Point(x:9999, y:9999))
        rightButton.move(to:Point(x:9999, y:9999))
        leftButton.move(to:Point(x:9999, y:9999))
        
    }

    
}
