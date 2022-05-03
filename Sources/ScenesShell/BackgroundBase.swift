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
        case artifactRoom
        case exitHall
        case randomRoom
        case rightEntrance
    }

    enum artifactName: CaseIterable {
        case artifact1
        case artifact2
        case artifact3
        case artifact4
        case artifact5
        case artifact6
        case artifact7
        case artifact8
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
            case .artifactRoom:
                images[.artifactRoom] = Image(sourceURL: URL(string: "https://i.pinimg.com/originals/d0/e2/29/d0e2292416ce014419dfa9a49b780a60.jpg")!)
            case .exitHall:
                images[.artifactRoom] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/pexels-tookapic-74467.jpg")!)
            case .randomRoom:
                images[.randomRoom] = Image(sourceURL: URL(string: "https://tse3.mm.bing.net/th?id=OIP.U4cZ-f34ad7jlwDon2Kf5gHaE7&pid=Api&P=0&w=272&h=181")!)
            case .rightEntrance:
                images[.rightEntrance] = Image(sourceURL: URL(string: "https://tse3.mm.bing.net/th?id=OIP.l1i_KVRPdSNpddPFS_Dq6QHaE7&pid=Api&P=0&w=245&h=163")!)
            }
        }
    
        return images
    }()

    static let artifacts: Dictionary<artifactName, Image> = {
        var images = Dictionary<artifactName, Image>()
        for url in artifactName.allCases {
            switch url {
            case .artifact1:
                images[.artifact1] = Image(sourceURL: URL(string: "https://www.ancient-origins.net/sites/default/files/field/image/Bronze-Artifacts-Found.jpg")!)
            case .artifact2:
                images[.artifact2] = Image(sourceURL: URL(string: "https://newsinstact.com/wp-content/uploads/2019/10/1-ancient-artifact-unexplained.jpg")!)
            case .artifact3:
                images[.artifact3] = Image(sourceURL: URL(string: "http://www.realclearlife.com/wp-content/uploads/2016/10/Christies-Lot-9_Toledo_Egyptian-Bronze-Cat_1200-e1476219936260.jpg")!)
            case .artifact4:
                images[.artifact4] = Image(sourceURL: URL(string: "http://www.antiquesartifacts.com/uploads/1/0/0/5/10050294/s939208995761138403_p242_i6_w624.jpeg")!)
            case .artifact5:
                images[.artifact5] = Image(sourceURL: URL(string: "https://i.ytimg.com/vi/CWcnCxu-eyw/maxresdefault.jpg")!)
            case .artifact6:
                images[.artifact6] = Image(sourceURL: URL(string: "https://s.hdnux.com/photos/51/23/32/10827452/13/1200x0.jpg")!)
            case .artifact7:
                images[.artifact7] = Image(sourceURL: URL(string: "http://i.huffpost.com/gen/1319395/images/o-LYCURGUS-CUP-facebook.jpg")!)
            case .artifact8:
                images[.artifact8] = Image(sourceURL: URL(string: "https://i.etsystatic.com/14235498/r/il/885f6a/1154183394/il_794xN.1154183394_32at.jpg")!)
            }
        }
        return images
    }()
    
    var currentSceneName = SceneName.outdoorHouse
    let artifactImage = artifactName.artifact1
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
    let artifactButton = Button(rect:Rect(size:Size(width:500, height: 250)))
    
    //amount of artifacts collected
    var Collected = 0

    //time left in the game
    var time = 6000
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

    func renderLabel(to canvas:Canvas){
        let text = Text(location:Point(x:1600, y: 100), text:"artifact collected: \(Collected)")
        canvas.render(text)
    }

    func renderTime(to canvas:Canvas, time:Int){
        let text = Text(location:Point(x:1600, y: 50), text:"time left: \(time)")
        canvas.render(text)
    }
    
    override func setup(canvasSize:Size, canvas:Canvas){
        canvas.setup(rightArrows)
        canvas.setup(leftArrows)
        canvas.setup(upArrows)
        canvas.setup(downArrows)

        // Set up all images
        BackgroundBase.images.values.forEach {
            canvas.setup($0)
        }
        dispatcher.registerEntityMouseClickHandler(handler:self)
        rect = Rect(size:canvasSize)
    }
    
    
    override func teardown(){
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }
    
    func onEntityMouseClick(globalLocation:Point){
        mousePoint.center = globalLocation
        didRender = false
    }

    func renderArrows(canvas:Canvas, leftArrow:Bool, rightArrow:Bool, downArrow:Bool, upArrow:Bool, leftLocation:Point,
                      rightLocation:Point, upLocation:Point, downLocation:Point){
        if rightArrow{
            if rightArrows.isReady{
                rightArrows.renderMode = .destinationRect(Rect(topLeft:rightLocation, size:Size(width:300, height:130)))
                canvas.render(rightArrows)
                rightButton.move(to:rightLocation)
            }
        }
        if leftArrow{
            if leftArrows.isReady{
                leftArrows.renderMode = .destinationRect(Rect(topLeft:leftLocation, size:Size(width:200, height:130)))
                canvas.render(leftArrows)
                leftButton.move(to:leftLocation)
            }
        }
        if upArrow{
            if upArrows.isReady{
                upArrows.renderMode = .destinationRect(Rect(topLeft:upLocation, size:Size(width:130, height:200)))
                canvas.render(upArrows)
                leftButton.move(to:upLocation)
            }
        }
        if downArrow{
            if downArrows.isReady{
                downArrows.renderMode = .destinationRect(Rect(topLeft:downLocation, size:Size(width:130, height:200)))
                canvas.render(downArrows)
                leftButton.move(to:downLocation)
            }
        }
    }
    override func render(canvas:Canvas){
        if let canvasSize = canvas.canvasSize, !didRender{
            //change of scenes
            let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
            let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
            canvas.render(clearRectangle)
            

            
            switch (currentScene){
            case 1:
                if BackgroundBase.images[currentSceneName]!.isReady{
                    BackgroundBase.images[currentSceneName]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[currentSceneName]!)
                }
                renderArrows(canvas:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:false, leftLocation:Point(x:100, y:770),
                             rightLocation:Point(x:780, y:670), upLocation:Point(x:0, y:0), downLocation:Point(x:0, y:0))
                
                rightScene = 2
                renderText(to:canvas, x:860, y:746, text:"Play/Enter")
                
                leftScene = 0 
                renderText(to:canvas, x:140, y:840, text:"Exit/Leave")
                
                
            case 2:
                currentSceneName = SceneName.entrance
                canvas.render(BackgroundBase.images[currentSceneName]!)
                rightScene = 8
                upScene = 3
                
                renderLabel(to:canvas)
                
            case 3:
                currentSceneName = SceneName.basementEntrance
                renderArrows(canvas:canvas, leftArrow:false, rightArrow:false, downArrow:false, upArrow:false, leftLocation:Point(x:100, y:770),
                             rightLocation:Point(x:780, y:670), upLocation:Point(x:900, y:100), downLocation:Point(x:0, y:0))
                
            case 4:
                currentSceneName = SceneName.basementHall
            case 5:
                currentSceneName = SceneName.artifactRoom
                
            case 6:
                currentSceneName = SceneName.exitHall
            case 7:  
                currentSceneName = SceneName.randomRoom
            case 8:
                currentSceneName = SceneName.rightEntrance 
            default:
                fatalError("Unexpected Scene")
                
            }
        }
        
    }
    
    
    override func calculate(canvasSize:Size){ 
        if currentScene > 1{
            time -= 1
        }
        //containments 
        let mouseBounding = Rect(topLeft:Point(x:mousePoint.center.x-mousePoint.radiusX, y:mousePoint.center.y-mousePoint.radiusY), size:Size(width:mousePoint.radiusX*2, height:mousePoint.radiusY*2))
        
        let leftBounding = leftButton.boundingRect()
        let rightBounding = rightButton.boundingRect()
        let downBounding = downButton.boundingRect()
        let upBounding = upButton.boundingRect()
        let artifactBounding = artifactButton.boundingRect()
        
        let leftContainment = leftBounding.containment(target:mouseBounding)
        let rightContainment = rightBounding.containment(target:mouseBounding)
        let upContainment = upBounding.containment(target:mouseBounding)
        let downContainment = downBounding.containment(target:mouseBounding)
        let artifactContainment = artifactBounding.containment(target:mouseBounding)
        
        let boundingSubset : ContainmentSet = [ .contact]

        if boundingSubset.isSubset(of:leftContainment){
            currentScene = leftScene
            mousePoint.center = Point(x:0,y:0)
        }
        if boundingSubset.isSubset(of:rightContainment){
            currentScene = rightScene
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
        if boundingSubset.isSubset(of:artifactContainment){
            currentScene += 0
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


