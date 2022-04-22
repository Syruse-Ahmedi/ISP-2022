import Scenes
import Igis
import Foundation

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity, EntityMouseClickHandler {

    let playScene : Image
    var currentScene = 1
    var didRender = false
    var rect: Rect?

    var mousePoint = Ellipse(center:Point(x:0, y:0), radiusX:1, radiusY:1, fillMode:.clear)
    init() {
        guard let playURL =
                URL(string:"https://aroundmichigan.com/wp-content/uploads/2016/10/HauntedHouse.jpg") else{
            fatalError("Failed to create the image")
        }
        playScene = Image(sourceURL:playURL)
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
    func renderScene1(canvas:Canvas){
        if playScene.isReady{
            playScene.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0),
                                                     size:Size(width:1800, height:900)))
            canvas.render(playScene)
        }
    }
    override func setup(canvasSize:Size, canvas:Canvas){
        dispatcher.registerEntityMouseClickHandler(handler:self)
        rect = Rect(size:canvasSize)
        canvas.setup(playScene)
    }    
    override func render(canvas:Canvas){
        if let canvasSize = canvas.canvasSize, !didRender{
            // clear the canvas
            let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
            let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
            canvas.render(clearRectangle)
            
            //change of scenes
            switch (currentScene){
            case 1:
                renderScene1(canvas:canvas)
            default:
                fatalError("Unexpected Scene")
            }
            didRender = true
        }
    }
    
    
    override func teardown(){
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }
    
    func onEntityMouseClick(globalLocation:Point){
        mousePoint.center = globalLocation
        didRender = false
    }
    override func boundingRect() -> Rect{
        let bounding = Rect(topLeft:Point(x:mousePoint.center.x-mousePoint.radiusX, y:mousePoint.center.y-mousePoint.radiusY),                    size:Size(width:mousePoint.radiusX*2, height:mousePoint.radiusY*2))
        return bounding
     
    }
}


