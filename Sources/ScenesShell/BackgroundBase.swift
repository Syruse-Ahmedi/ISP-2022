import Scenes
import Igis
import Foundation

/*
 This class is responsible for rendering the background.
 */


class BackgroundBase : RenderableEntity, EntityMouseClickHandler {

    enum SceneName: CaseIterable {
        case outdoorHouse
        case entrance
        case basementEntrance
        case basementHall
    }

    //all scene URL cases
    static let images: Dictionary<SceneName, Image> = {
        var images = Dictionary<SceneName, Image>()
        for url in SceneName.allCases {
            switch url {
            case .outdoorHouse:
                images[.outdoorHouse] = Image(sourceURL: URL(string: "https://aroundmichigan.com/wp-content/uploads/2016/10/HauntedHouse.jpg")!)
            case .entrance:
                images[.entrance] = Image(sourceURL: URL(string: "https://vignette.wikia.nocookie.net/hauntedmasnion/images/1/1d/FoyerDL.jpg/revision/latest?cb=20170928170851")!)
            case .basementEntrance:
                images[.basementEntrance] = Image(sourceURL: URL(string: "https://i.pinimg.com/originals/29/4e/99/294e99c8bfea443b39105a7c7bcdcfa5.png")!)
            case .basementHall:
                images[.basementHall] = Image(sourceURL: URL(string: "https://live.staticflickr.com/2354/2474409363_fe79e3f1dd_h.jpg")!)
                                                     
            }
        }
        return images
    }()
    
    var currentSceneName = SceneName.outdoorHouse

    //arrow buttons
    let rightArrows : Image
    let leftArrows : Image
    let downArrows : Image
    let upArrows : Image

    //what scene each button changes to
    var upScene = 1
    var downScene = 1
    var leftScene = 1
    var rightScene = 1
    
    //current scene on display
    var currentScene = 1
    var didRender = false
    var rect: Rect?

    //size of the button use for interactions
    let upButton = Button(rect:Rect(size:Size(width:50, height: 100)))
    let downButton = Button(rect:Rect(size:Size(width:50, height: 100)))
    let rightButton = Button(rect:Rect(size:Size(width:250, height: 130)))
    let leftButton = Button(rect:Rect(size:Size(width:250, height: 130)))

    var mousePoint = Ellipse(center:Point(x:0, y:0), radiusX:1, radiusY:1, fillMode:.clear)
    
    init() {
        
        guard let leftArrowsURL =
                URL(string:"https://codermerlin.com/users/kevin-li/leftArrow.png") else{
            fatalError("failed to create the image")
        }
        leftArrows = Image(sourceURL:leftArrowsURL)
        
        guard let rightArrowsURL =
                URL(string:"https://codermerlin.com/users/kevin-li/th%20(1).png") else{
            fatalError("failed to create the image")
        }
        rightArrows = Image(sourceURL:rightArrowsURL)
        
        guard let upArrowsURL =
                URL(string:"https://codermerlin.com/users/kevin-li/upArrow.png") else{
            fatalError("failed to create the image")
        }
        upArrows = Image(sourceURL:upArrowsURL)
        
        guard let downArrowsURL =
                URL(string:"https://codermerlin.com/users/kevin-li/downArrow.png") else{
            fatalError("failed to create the image")
        }
        downArrows = Image(sourceURL:downArrowsURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    func renderText(to canvas:Canvas, x:Int, y:Int, text:String){
        let text = Text(location:Point(x:x, y:y), text:"\(text)")
        text.font = "20pt Arial"
        canvas.render(FillStyle(color:Color(.white)))
        canvas.render(text)
    }

    override func setup(canvasSize:Size, canvas:Canvas){
        canvas.setup(rightArrows)
        canvas.setup(leftArrows)
        canvas.setup(upArrows)
        canvas.setup(downArrows)

        // Set up all images
        canvas.setup(BackgroundBase.images[currentSceneName]!)
        dispatcher.registerEntityMouseClickHandler(handler:self)
        rect = Rect(size:canvasSize)
    }
    
    override func teardown(){
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }
    
    func onEntityMouseClick(globalLocation:Point){
        mousePoint.center = globalLocation
        print(globalLocation)
    }
    
    
    override func render(canvas:Canvas){
        if let canvasSize = canvas.canvasSize, !didRender{
            
             //change of scenes
             switch currentScene{
             case 1:
                 if BackgroundBase.images[currentSceneName]!.isReady{
                     BackgroundBase.images[currentSceneName]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                     canvas.render(BackgroundBase.images[currentSceneName]!)
                 }
                 if rightArrows.isReady{
                     rightArrows.renderMode = .destinationRect(Rect(topLeft:Point(x:780, y:670),
                                                                    size:Size(width:300, height:130)))
                     canvas.render(rightArrows)
                     rightButton.move(to:Point(x:780, y:670))
                     rightScene = 2
                 }
                 if leftArrows.isReady{
                     leftArrows.renderMode = .destinationRect(Rect(topLeft:Point(x:100, y:770),
                                                                  size:Size(width:200, height:130)))
                     canvas.render(leftArrows)
                     leftButton.move(to:Point(x:100, y:770))
                     leftScene = 0
                 }
                 
                 renderText(to:canvas, x:860, y:746, text:"Play/Enter")
                 renderText(to:canvas, x:140, y:840, text:"Exit/Leave")
                 
             case 2:
                 currentSceneName = SceneName.entrance
                 print(currentSceneName)
                 if BackgroundBase.images[currentSceneName]!.isReady{
                     BackgroundBase.images[currentSceneName]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                     canvas.render(BackgroundBase.images[currentSceneName]!)
                 }
             default:
                 fatalError("Unexpected Scene")
             }
             
        }
    }
    
    override func calculate(canvasSize:Size){
        //containments 
        let mouseBounding = Rect(topLeft:Point(x:mousePoint.center.x-mousePoint.radiusX, y:mousePoint.center.y-mousePoint.radiusY), size:Size(width:mousePoint.radiusX*2, height:mousePoint.radiusY*2))

        let leftBounding = leftButton.boundingRect()
        let rightBounding = rightButton.boundingRect()
        let downBounding = downButton.boundingRect()
        let upBounding = upButton.boundingRect()

        let leftContainment = leftBounding.containment(target:mouseBounding)
        let rightContainment = rightBounding.containment(target:mouseBounding)
        let upContainment = upBounding.containment(target:mouseBounding)
        let downContainment = downBounding.containment(target:mouseBounding)

        let boundingSubset : ContainmentSet = [ .contact]

        if boundingSubset.isSubset(of:leftContainment){
            currentScene = leftScene
            mousePoint.center = Point(x:0,y:0)

        }
        if boundingSubset.isSubset(of:rightContainment){
            currentScene = rightScene
            print(currentScene)
            mousePoint.center = Point(x:0,y:0)
        }
        if boundingSubset.isSubset(of:upContainment){
            currentScene = upScene
            mousePoint.center = Point(x:0,y:0)

        }
        if boundingSubset.isSubset(of:downContainment){
            currentScene = downScene
            mousePoint.center = Point(x:0,y:0)

        }
    }
    
    override func boundingRect() -> Rect{
        if let rect = rect{
            return rect
        }
        else{
            return Rect()
        }
    }
}


