import Scenes
import Igis
import Foundation

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity, EntityMouseClickHandler {

    let playScene : Image
    let arrows : Image
    
    var currentScene = 1
    var didRender = false
    var rect: Rect?
    
    let upButton = Button(rect:Rect(size:Size(width:50, height: 100)))
    let downButton = Button(rect:Rect(size:Size(width:50, height: 100)))
    let rightButton = Button(rect:Rect(size:Size(width:100, height: 50)))
    let leftButton = Button(rect:Rect(size:Size(width:100, height: 50)))
    
    var mousePoint = Ellipse(center:Point(x:0, y:0), radiusX:1, radiusY:1, fillMode:.clear)
    
    init() {
        guard let playURL =
                URL(string:"https://aroundmichigan.com/wp-content/uploads/2016/10/HauntedHouse.jpg") else{
            fatalError("Failed to create the image")
        }
        playScene = Image(sourceURL:playURL)

        guard let arrowsURL =
                URL(string:"https://codermerlin.com/users/kevin-li/th%20(1).png") else{
            fatalError("failed to create the image")
        }
        arrows = Image(sourceURL:arrowsURL)
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
    }

    func renderText(to canvas:Canvas, text:String){
        let text = Text(location:Point(x:887, y:746), text:"\(text)")
        text.font = "25pt Arial"
        canvas.render(FillStyle(color:Color(.white)))
        canvas.render(text)
    }
    func onEntityMouseClick(globalLocation:Point){
        mousePoint.center = globalLocation
        didRender = false
    }

    override func setup(canvasSize:Size, canvas:Canvas){
        dispatcher.registerEntityMouseClickHandler(handler:self)

        rect = Rect(size:canvasSize)
        canvas.setup(playScene)
        canvas.setup(arrows)
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
                if playScene.isReady{
                    playScene.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0),
                                                                 size:canvasSize))
                    canvas.render(playScene)
                }
                
                if arrows.isReady{
                    arrows.renderMode = .destinationRect(Rect(topLeft:Point(x:800, y:670),
                                                              size:Size(width:250, height:130)))
                    canvas.render(arrows)
                }
                renderText(to:canvas, text:"Play")
                rightButton.move(to:Point(x:800, y:400))
            default:
                fatalError("Unexpected Scene")
            }
     
        }
    }
    
    override func calculate(canvasSize:Size){
        let mouseBounding = Rect(topLeft:Point(x:mousePoint.center.x-mousePoint.radiusX, y:mousePoint.center.y-mousePoint.radiusY), size:Size(width:mousePoint.radiusX*2, height:mousePoint.radiusY*2))
    }
    
    override func teardown(){
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }
    
//    override func boundingRect() -> Rect{

  //      return bounding
//    }

}


