import Scenes
import Igis
import Foundation

/*
 This class is responsible for rendering the background.
 */


class BackgroundBase : RenderableEntity, EntityMouseClickHandler {

    enum SceneName: CaseIterable {
        case playScreen
        case mazeRoom
        case artifactRoom1
        case artifactRoom2
        case artifactRoom3
        case artifactRoom4
        case artifactRoom5
        case artifactRoom6
        case artifactRoom7
        case artifactRoom8
        case artifactRoom9
        case artifactRoom10
                        
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
        case artifact9
        case artifact10
    }

    //all scene URL cases
    static let images: Dictionary<SceneName, Image> = {
        var images = Dictionary<SceneName, Image>()
        for url in SceneName.allCases {
            switch url {
            case .playScreen:
                images[.playScreen] = Image(sourceURL: URL(string: "https://aroundmichigan.com/wp-content/uploads/2016/10/HauntedHouse.jpg")!)
            case .mazeRoom:
                images[.mazeRoom] = Image(sourceURL: URL(string: "https://vignette.wikia.nocookie.net/hauntedmasnion/images/1/1d/FoyerDL.jpg/revision/latest?cb=20170928170851")!)
            case .artifactRoom1:
                images[.artifactRoom1] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room1.jpg")!)
            case .artifactRoom2:
                images[.artifactRoom2] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room2.jpg")!)
            case .artifactRoom3:
                images[.artifactRoom3] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room3.jpg")!)
            case .artifactRoom4:
                images[.artifactRoom4] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room4.jpg")!)
            case .artifactRoom5:
                images[.artifactRoom5] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room5.jpg")!)
            case .artifactRoom6:
                images[.artifactRoom6] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room6.jpg")!)
            case .artifactRoom7:
                images[.artifactRoom7] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room7.jpg")!)
            case .artifactRoom8:
                images[.artifactRoom8] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/Room8.jpg")!)
            case .artifactRoom9:
                images[.artifactRoom9] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room9.jpg")!)
            case .artifactRoom10:
                images[.artifactRoom10] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/room10.jpg")!)
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
                images[.artifact5] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/artifact5.png")!)
            case .artifact6:
                images[.artifact6] = Image(sourceURL: URL(string: "https://s.hdnux.com/photos/51/23/32/10827452/13/1200x0.jpg")!)
            case .artifact7:
                images[.artifact7] = Image(sourceURL: URL(string: "http://i.huffpost.com/gen/1319395/images/o-LYCURGUS-CUP-facebook.jpg")!)
            case .artifact8:
                images[.artifact8] = Image(sourceURL: URL(string: "https://i.etsystatic.com/14235498/r/il/885f6a/1154183394/il_794xN.1154183394_32at.jpg")!)
            case .artifact9:
                images[.artifact9] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/artifact9.jpg")!)
            case .artifact10:
                images[.artifact10] = Image(sourceURL: URL(string: "https://codermerlin.com/users/kevin-li/artifact10.jpg")!)
            }
        }
        return images
    }()
    
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
    let upButton = Button(rect:Rect(size:Size(width:100, height: 150)))
    let downButton = Button(rect:Rect(size:Size(width:100, height: 150)))
    let rightButton = Button(rect:Rect(size:Size(width:200, height: 130)))
    let leftButton = Button(rect:Rect(size:Size(width:200, height: 130)))

    //all artifact buttons brute forced 
    let artifact1Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact2Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact3Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact4Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact5Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact6Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact7Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact8Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact9Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    let artifact10Button = Button(rect:Rect(size:Size(width:500, height: 250)))
    
    //what artifact should show / have not been collected

    var showArt1 = true
    var showArt2 = true
    var showArt3 = true
    var showArt4 = true
    var showArt5 = true
    var showArt6 = true
    var showArt7 = true
    var showArt8 = true
    var showArt9 = true
    var showArt10 = true
    
    //amount of artifacts collected
    var Collected = 0

    //time left in the game
    var time = 6000
    var mousePoint = Ellipse(center:Point(x:9999, y:9999), radiusX:1, radiusY:1, fillMode:.clear)
    
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
        text.font = "15pt Arial"
        canvas.render(FillStyle(color:Color(.white)))
        canvas.render(text)
    }

    func renderEnd(to canvas:Canvas){
        let text = Text(location:Point(x:800, y: 400), text:"Thanks for Playing c:")
        text.font = "40pt Arial"
        canvas.render(FillStyle(color:Color(.white)))
        canvas.render(text)
    }
    func renderLabel(to canvas:Canvas){
        let text = Text(location:Point(x:1600, y: 100), text:"artifact collected: \(Collected)/10")
        canvas.render(text)
    }
    
    func renderRoomNumber(to canvas:Canvas, roomNumber:Int){
        let text = Text(location:Point(x:30, y:30), text:"\(roomNumber)")
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
        BackgroundBase.artifacts.values.forEach {
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

    func renderArrows(to canvas:Canvas, leftArrow:Bool, rightArrow:Bool, downArrow:Bool, upArrow:Bool, leftLocation:Point,
                      rightLocation:Point, upLocation:Point, downLocation:Point){
        if rightArrow{
            if rightArrows.isReady{
                rightArrows.renderMode = .destinationRect(Rect(topLeft:rightLocation, size:Size(width:250, height:120)))
                canvas.render(rightArrows)
            }
            rightButton.move(to:rightLocation)
        } 

        if leftArrow{
            if leftArrows.isReady{
                leftArrows.renderMode = .destinationRect(Rect(topLeft:leftLocation, size:Size(width:150, height:80)))
                canvas.render(leftArrows)
            }
            leftButton.move(to:leftLocation)
        }

        if upArrow{
            if upArrows.isReady{
                upArrows.renderMode = .destinationRect(Rect(topLeft:upLocation, size:Size(width:80, height:120)))
                canvas.render(upArrows)
            }
            upButton.move(to:upLocation)
        }

        if downArrow{
            if downArrows.isReady{
                downArrows.renderMode = .destinationRect(Rect(topLeft:downLocation, size:Size(width:80, height:150)))
                canvas.render(downArrows)
            }
            downButton.move(to:downLocation)
        }

    }
        
        
     
    override func render(canvas:Canvas){
        if let canvasSize = canvas.canvasSize, !didRender{
            //change of scenes
            
            switch currentScene{
                //play scene
            case 1:
                if BackgroundBase.images[SceneName.playScreen]!.isReady{
                    BackgroundBase.images[SceneName.playScreen]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.playScreen]!)
                }                
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:false, leftLocation:Point(x:100, y:795),
                             rightLocation:Point(x:780, y:680), upLocation:Point(x:9999, y:9999), downLocation:Point(x:9999, y:9999))
                
                rightScene = 5
                renderText(to:canvas, x:860, y:746, text:"Play/Enter")
                
                leftScene = 0 
                renderText(to:canvas, x:140, y:840, text:"Exit/Leave")
                
             //first row of rooms   
            case 2:

                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                rightScene = 3
                upScene = 10
                renderArrows(to:canvas, leftArrow:false, rightArrow:true, downArrow:false, upArrow:true, leftLocation:Point(x:32300, y:73470),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:10870, y:62300))
                 
                renderLabel(to:canvas) 
                renderRoomNumber(to:canvas, roomNumber:1)
            case 3:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 2
                upScene = 11
                rightScene = 4
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:10870, y:62300))
                 
                renderLabel(to:canvas)
                renderRoomNumber(to:canvas, roomNumber:2)
            case 4:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 3
                upScene = 13
                rightScene = 5
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:10870, y:62300))
                 
                renderLabel(to:canvas)
                renderRoomNumber(to:canvas, roomNumber:3)

            case 5:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 4
                upScene = 14
                rightScene = 6
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:10870, y:62300))
                 
                renderLabel(to:canvas)
                renderRoomNumber(to:canvas, roomNumber:4)

            case 6:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 5
                rightScene = 7
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:90900, y:90600), downLocation:Point(x:10870, y:62300))
                 
                renderLabel(to:canvas) 
                renderRoomNumber(to:canvas, roomNumber:5)
            case 7:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 6
                upScene = 17
                renderArrows(to:canvas, leftArrow:true, rightArrow:false, downArrow:false, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:60090), upLocation:Point(x:900, y:600), downLocation:Point(x:10870, y:62300))
                 
                renderLabel(to:canvas) 
                renderRoomNumber(to:canvas, roomNumber:6)
            case 8:
                if BackgroundBase.images[SceneName.artifactRoom2]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom2]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom2]!)
                }
                if showArt2{
                    if BackgroundBase.artifacts[artifactName.artifact2]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact2]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact2]!)
                    }
                    artifact2Button.move(to:Point(x:1400, y:500))
                }
                downScene = 18
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:39000, y:60080),
                             rightLocation:Point(x:12900, y:89600), upLocation:Point(x:99000, y:69700), downLocation:Point(x:870, y:703))
                 
                renderLabel(to:canvas)
                renderRoomNumber(to:canvas, roomNumber:8)
            case 9:
                if BackgroundBase.images[SceneName.artifactRoom2]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom2]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom2]!)
                }
                downScene = 18
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:39000, y:60080),
                             rightLocation:Point(x:12900, y:89600), upLocation:Point(x:99000, y:69700), downLocation:Point(x:870, y:703))

                renderLabel(to:canvas)
                renderRoomNumber(to:canvas, roomNumber:8)
                //second row of rooms
            case 10:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                downScene = 2
                upScene = 19
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:true, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:12900, y:89600), upLocation:Point(x:900, y:600), downLocation:Point(x:870, y:823))
                
                renderLabel(to:canvas)
                renderRoomNumber(to:canvas, roomNumber:8)
            case 11:
                if BackgroundBase.images[SceneName.artifactRoom1]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom1]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom1]!)
                }
                if showArt1{
                    if BackgroundBase.artifacts[artifactName.artifact1]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact1]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact1]!)
                    }
                    artifact1Button.move(to:Point(x:1400, y:500))
                }
                rightScene = 11
                downScene = 3
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:9)
                renderLabel(to:canvas)

            case 12:
                if BackgroundBase.images[SceneName.artifactRoom1]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom1]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom1]!)
                }
                rightScene = 12
                downScene = 3
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:12900, y:89600), upLocation:Point(x:9000, y:4900), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:9)
                renderLabel(to:canvas)

            case 13:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                upScene = 21
                rightScene = 14
                downScene = 4
                renderArrows(to:canvas, leftArrow:false, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:10)
                renderLabel(to:canvas)
                
            case 14:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                upScene = 22
                rightScene = 15
                downScene = 5
                leftScene = 13
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:11)
                renderLabel(to:canvas)
            case 15:
                if BackgroundBase.images[SceneName.artifactRoom3]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom3]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom3]!)
                }
                if showArt3{ 
                    if BackgroundBase.artifacts[artifactName.artifact3]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact3]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact3]!)
                    }
                    artifact3Button.move(to:Point(x:1400, y:500))
                }
                downScene = 14
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:12)
                renderLabel(to:canvas)
                
            case 16:
                if BackgroundBase.images[SceneName.artifactRoom3]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom3]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom3]!)
                }
                downScene = 14
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                
                renderRoomNumber(to:canvas, roomNumber:12)
                renderLabel(to:canvas)
            case 17:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                upScene = 24
                downScene = 7
                rightScene = 18
                renderArrows(to:canvas, leftArrow:false, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:30900, y:90600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:13)
                renderLabel(to:canvas)
            case 18:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                upScene = 25
                downScene = 8
                leftScene = 17
                renderArrows(to:canvas, leftArrow:true, rightArrow:false, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:19200, y:60900), upLocation:Point(x:900, y:400), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:14)
                renderLabel(to:canvas)
                //third row of scenes
            case 19:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }

                downScene = 10
                rightScene = 20
                renderArrows(to:canvas, leftArrow:false, rightArrow:true, downArrow:true, upArrow:false, leftLocation:Point(x:30089, y:69000),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:90900, y:90400), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:15)
                renderLabel(to:canvas)
            case 20:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }

                leftScene = 19
                rightScene = 21
                upScene = 28
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:59970, y:80000))
                renderRoomNumber(to:canvas, roomNumber:16)
                renderLabel(to:canvas)
            case 21:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 20
                downScene = 13
                upScene = 29
                rightScene = 22
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:17)
                renderLabel(to:canvas)
            case 22:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 21
                downScene = 14
                upScene = 30
                rightScene = 23
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:18)
                renderLabel(to:canvas)

            case 23:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 22
                upScene = 32
                rightScene = 24
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:80090))
                renderRoomNumber(to:canvas, roomNumber:19)
                renderLabel(to:canvas)
            case 24:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 23
                downScene = 17
                upScene = 33
                rightScene = 25
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:20)
                renderLabel(to:canvas)
            case 25:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 24
                downScene = 18
                upScene = 34
                renderArrows(to:canvas, leftArrow:true, rightArrow:false, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:12090, y:69000), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:21)
                renderLabel(to:canvas)
                //fourth row of rooms
            case 26:
                if BackgroundBase.images[SceneName.artifactRoom4]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom4]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom4]!)
                }
                if showArt4{ 
                    if BackgroundBase.artifacts[artifactName.artifact4]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact4]!.renderMode = .destinationRect(Rect(topLeft:Point(x:800,y:400), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact4]!)
                    }
                    artifact4Button.move(to:Point(x:800, y:400))
                }
                downScene = 28
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:22)
                renderLabel(to:canvas)

            case 27:
                if BackgroundBase.images[SceneName.artifactRoom4]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom4]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom4]!)
                }
                downScene = 28
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                
                renderRoomNumber(to:canvas, roomNumber:22)
                renderLabel(to:canvas)
                
            case 28:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 26
                downScene = 20
                upScene = 36
                rightScene = 29
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:23)
                renderLabel(to:canvas)
            case 29:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 28
                downScene = 21
                renderArrows(to:canvas, leftArrow:true, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:120089, y:90600), upLocation:Point(x:90089, y:90400), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:24)
                renderLabel(to:canvas)
            case 30:
                if BackgroundBase.images[SceneName.artifactRoom5]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom5]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom5]!)
                }
                if showArt5{ 
                    if BackgroundBase.artifacts[artifactName.artifact5]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact5]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact5]!)
                    }
                    artifact5Button.move(to:Point(x:1400, y:500))
                }
                downScene = 22
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:25)
                renderLabel(to:canvas)
            case 31:
                if BackgroundBase.images[SceneName.artifactRoom5]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom5]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom5]!)
                }
                downScene = 22
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:25)
                renderLabel(to:canvas)
            case 32:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                downScene = 23
                upScene = 40
                rightScene = 33
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:30090, y:90600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:26)
                renderLabel(to:canvas)
            case 33:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 26
                downScene = 20
                upScene = 36
                rightScene = 29
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:27)
                renderLabel(to:canvas)

            case 34:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 33
                downScene = 25
                renderArrows(to:canvas, leftArrow:true, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:120900, y:69000), upLocation:Point(x:90900, y:40900), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:28)
                renderLabel(to:canvas)
            case 35:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                upScene = 44
                rightScene = 36
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:39000, y:90600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:57090, y:80900))
                renderRoomNumber(to:canvas, roomNumber:29)
                renderLabel(to:canvas)
            case 36:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 35
                downScene = 28
                rightScene = 37
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:90090, y:40090), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:30)
                renderLabel(to:canvas)
            case 37:
                if BackgroundBase.images[SceneName.artifactRoom6]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom6]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom6]!)
                }
                if showArt6{ 
                    if BackgroundBase.artifacts[artifactName.artifact6]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact6]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact6]!)
                    }
                    artifact6Button.move(to:Point(x:1000, y:500))
                }
                downScene = 36
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:31)
                renderLabel(to:canvas)
            case 38:
                if BackgroundBase.images[SceneName.artifactRoom6]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom6]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom6]!)
                }
                downScene = 36
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:31)
                renderLabel(to:canvas)
            case 39:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                upScene = 49
                rightScene = 40
                renderArrows(to:canvas, leftArrow:false, rightArrow:true, downArrow:false, upArrow:true, leftLocation:Point(x:3900, y:60090),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:400), downLocation:Point(x:9570, y:80090))
                renderRoomNumber(to:canvas, roomNumber:32)
                renderLabel(to:canvas)
            case 40:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 39
                downScene = 32
                upScene = 50
                rightScene = 41
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:33)
                renderLabel(to:canvas)

            case 41:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 39
                downScene = 32
                renderArrows(to:canvas, leftArrow:true, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:129000, y:69000), upLocation:Point(x:90900, y:49000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:34)
                renderLabel(to:canvas)
            case 42:
                if BackgroundBase.images[SceneName.artifactRoom7]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom7]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom7]!)
                }
                if showArt7{ 
                    if BackgroundBase.artifacts[artifactName.artifact7]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact7]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact7]!)
                    }
                    artifact7Button.move(to:Point(x:1400, y:500))
                }
                downScene = 53
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:35)
                renderLabel(to:canvas)
            case 43:
                if BackgroundBase.images[SceneName.artifactRoom7]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom7]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom7]!)
                }
                downScene = 53
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:35)
                renderLabel(to:canvas)
            case 44:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                downScene = 35
                upScene = 54
                rightScene = 45
                renderArrows(to:canvas, leftArrow:false, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:30900, y:60090),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:36)
                renderLabel(to:canvas)
            case 45:
                if BackgroundBase.images[SceneName.artifactRoom8]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom8]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom8]!)
                }
                if showArt8{ 
                    if BackgroundBase.artifacts[artifactName.artifact8]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact8]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact8]!)
                    }
                    artifact8Button.move(to:Point(x:1400, y:500))
                }
                downScene = 44
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:37)
                renderLabel(to:canvas)
            case 46:
                if BackgroundBase.images[SceneName.artifactRoom8]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom8]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom8]!)
                }
                downScene = 44
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:37)
                renderLabel(to:canvas)
            case 47:
                if BackgroundBase.images[SceneName.artifactRoom9]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom9]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom9]!)
                }
                if showArt9{ 
                    if BackgroundBase.artifacts[artifactName.artifact9]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact9]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact9]!)
                    }
                    artifact9Button.move(to:Point(x:1400, y:500))
                }
                downScene = 49
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:38)
                renderLabel(to:canvas)
            case 48:
                if BackgroundBase.images[SceneName.artifactRoom9]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom9]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom9]!)
                }
                downScene = 49
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:38)
                renderLabel(to:canvas)
            case 49:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 47
                downScene = 39
                upScene = 57
                rightScene = 50
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:39)
                renderLabel(to:canvas)
            case 50:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 49
                downScene = 40
                upScene = 59
                renderArrows(to:canvas, leftArrow:true, rightArrow:false, downArrow:true, upArrow:true, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:12009, y:9600), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:40)
                renderLabel(to:canvas)
            case 51:
                if BackgroundBase.images[SceneName.artifactRoom10]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom10]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom10]!)
                }
                if showArt10{ 
                    if BackgroundBase.artifacts[artifactName.artifact10]!.isReady{
                        BackgroundBase.artifacts[artifactName.artifact10]!.renderMode = .destinationRect(Rect(topLeft:Point(x:1400,y:500), size:Size(width:200, height:170)))
                        canvas.render(BackgroundBase.artifacts[artifactName.artifact10]!)
                    }
                    artifact10Button.move(to:Point(x:1400, y:500))
                }
                downScene = 59
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:41)
                renderLabel(to:canvas)
            case 52:
                if BackgroundBase.images[SceneName.artifactRoom10]!.isReady{
                    BackgroundBase.images[SceneName.artifactRoom10]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.artifactRoom10]!)
                }
                downScene = 59
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:30099, y:89600),
                             rightLocation:Point(x:1900, y:9600), upLocation:Point(x:99009, y:40000), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:41)
                renderLabel(to:canvas)
            case 53:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                downScene = 42
                upScene = 60
                renderArrows(to:canvas, leftArrow:false, rightArrow:false, downArrow:true, upArrow:true, leftLocation:Point(x:39000, y:90600),
                             rightLocation:Point(x:1200, y:68900), upLocation:Point(x:900, y:600), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:42)
                renderLabel(to:canvas)
                // last row of rooms
            case 54:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                downScene = 44
                rightScene = 55
                renderArrows(to:canvas, leftArrow:false, rightArrow:true, downArrow:true, upArrow:false, leftLocation:Point(x:39000, y:69000),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:90900, y:6090), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:43)
                renderLabel(to:canvas)
            case 55:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 54
                rightScene = 56
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:false, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:99000, y:60900), downLocation:Point(x:59070, y:80900))
                renderRoomNumber(to:canvas, roomNumber:44)
                renderLabel(to:canvas)
                
            case 56:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 55
                downScene = 49
                rightScene = 57
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:99000, y:60900), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:45)
                renderLabel(to:canvas)
            case 57:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 56
                downScene = 49
                rightScene = 58
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:99000, y:60900), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:46)
                renderLabel(to:canvas)
                
            case 58:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 57
                downScene = 50
                rightScene = 59
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:99000, y:60900), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:47)
                renderLabel(to:canvas)
                                
            case 59:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 57
                downScene = 51
                rightScene = 60
                renderArrows(to:canvas, leftArrow:true, rightArrow:true, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:1200, y:600), upLocation:Point(x:99000, y:60900), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:48)
                renderLabel(to:canvas)
            case 60:
                if BackgroundBase.images[SceneName.mazeRoom]!.isReady{
                    BackgroundBase.images[SceneName.mazeRoom]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.mazeRoom]!)
                }
                leftScene = 59
                downScene = 53
                renderArrows(to:canvas, leftArrow:true, rightArrow:false, downArrow:true, upArrow:false, leftLocation:Point(x:300, y:600),
                             rightLocation:Point(x:129000, y:90600), upLocation:Point(x:99000, y:60900), downLocation:Point(x:570, y:800))
                renderRoomNumber(to:canvas, roomNumber:49)
                renderLabel(to:canvas)
            case 61:
                if BackgroundBase.images[SceneName.playScreen]!.isReady{
                    BackgroundBase.images[SceneName.playScreen]!.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvasSize))
                    canvas.render(BackgroundBase.images[SceneName.playScreen]!)
                }
                renderEnd(to:canvas)
            default:
                fatalError("Unexpected Scene")

            }

        }

        print(currentScene)
    }
    
    override func calculate(canvasSize:Size){
        
        //containments 
        let mouseBounding = Rect(topLeft:Point(x:mousePoint.center.x-mousePoint.radiusX, y:mousePoint.center.y-mousePoint.radiusY), size:Size(width:mousePoint.radiusX*2, height:mousePoint.radiusY*2))
                    
        let leftBounding = leftButton.boundingRect()
        let rightBounding = rightButton.boundingRect()
        let downBounding = downButton.boundingRect()
        let upBounding = upButton.boundingRect()

        //all artifact bounding rects brute forced
        let artifactBounding1 = artifact1Button.boundingRect()
        let artifactBounding2 = artifact2Button.boundingRect()
        let artifactBounding3 = artifact3Button.boundingRect()
        let artifactBounding4 = artifact4Button.boundingRect()
        let artifactBounding5 = artifact5Button.boundingRect()
        let artifactBounding6 = artifact6Button.boundingRect()
        let artifactBounding7 = artifact7Button.boundingRect()
        let artifactBounding8 = artifact8Button.boundingRect()
        let artifactBounding9 = artifact9Button.boundingRect()
        let artifactBounding10 = artifact10Button.boundingRect()
        
        let leftContainment = leftBounding.containment(target:mouseBounding)
        let rightContainment = rightBounding.containment(target:mouseBounding)
        let upContainment = upBounding.containment(target:mouseBounding)
        let downContainment = downBounding.containment(target:mouseBounding)

        // all artifact containments brute forced 
        let artifact1Containment = artifactBounding1.containment(target:mouseBounding)
        let artifact2Containment = artifactBounding2.containment(target:mouseBounding)
        let artifact3Containment = artifactBounding3.containment(target:mouseBounding)
        let artifact4Containment = artifactBounding4.containment(target:mouseBounding)
        let artifact5Containment = artifactBounding5.containment(target:mouseBounding)
        let artifact6Containment = artifactBounding6.containment(target:mouseBounding)
        let artifact7Containment = artifactBounding7.containment(target:mouseBounding)
        let artifact8Containment = artifactBounding8.containment(target:mouseBounding)
        let artifact9Containment = artifactBounding9.containment(target:mouseBounding)
        let artifact10Containment = artifactBounding10.containment(target:mouseBounding)
        
        
        let boundingSubset : ContainmentSet = [ .contact ]
        
        if boundingSubset.isSubset(of:leftContainment){
            mousePoint.center = Point(x:9999999,y:9999999)
            currentScene = leftScene
        }
        else if boundingSubset.isSubset(of:rightContainment){
            mousePoint.center = Point(x:9999999,y:9999999)
            currentScene = rightScene
        }
        else if boundingSubset.isSubset(of:upContainment){
            mousePoint.center = Point(x:9999999,y:9999999)
            currentScene = upScene
        }
        else if boundingSubset.isSubset(of:downContainment){
            mousePoint.center = Point(x:9999999,y:9999999)
            currentScene = downScene

        }
        
        else if boundingSubset.isSubset(of:artifact1Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            artifact1Button.move(to:Point(x: 45345, y:43535))
            showArt1 = false
            currentScene = 12
            Collected += 1
        }
        else if boundingSubset.isSubset(of:artifact2Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            artifact2Button.move(to:Point(x: 45345, y:43535))
            showArt2 = false
            currentScene = 9
            Collected += 1
        }
        else if boundingSubset.isSubset(of:artifact3Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            artifact3Button.move(to:Point(x: 45345, y:43535))
            showArt3 = false
            currentScene = 16
            Collected += 1
        }
        else if boundingSubset.isSubset(of:artifact4Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            showArt4 = false
            artifact4Button.move(to:Point(x:9000, y:9000))
            currentScene = 27
            Collected += 1
        }
        else if boundingSubset.isSubset(of:artifact5Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            showArt5 = false
            artifact5Button.move(to:Point(x:9000, y:9000))
            currentScene = 31
            Collected += 1
        }
        else if boundingSubset.isSubset(of:artifact6Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            showArt6 = false
            artifact6Button.move(to:Point(x:9000, y:9000))
            currentScene = 38
            Collected += 1
        }
        else if boundingSubset.isSubset(of:artifact7Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            showArt7 = false
            artifact7Button.move(to:Point(x:9000, y:9000))
            currentScene = 43
            Collected += 1
        }
        else if boundingSubset.isSubset(of:artifact8Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            showArt8 = false
            artifact8Button.move(to:Point(x:9000, y:9000))
            currentScene = 46
            Collected += 1
        }
        else if boundingSubset.isSubset(of:artifact9Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            showArt9 = false
            artifact9Button.move(to:Point(x:9000, y:9000))
            currentScene = 48
            Collected += 1
                }
        else if boundingSubset.isSubset(of:artifact10Containment){
            mousePoint.center = Point(x:9999999,y:9999999)
            showArt10 = false
            artifact10Button.move(to:Point(x:9000, y:9000))
            currentScene = 52
            Collected += 1
        }
        else if Collected == 10{
            currentScene = 61
        }
        else{
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


