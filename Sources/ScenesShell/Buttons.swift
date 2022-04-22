//only arrows
import Scenes
import Igis

class Button: RenderableEntity{

    var button: Rectangle
    
    init(rect:Rect){

        button = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name:"Background")
    }

    func move(to point:Point){
        button.rect.topLeft = point
    }

    override func render(canvas:Canvas){
        let strokeStyle = StrokeStyle(color:Color(.white))
        let fillStyle = FillStyle(color:Color(.black))
        let lineWidth = LineWidth(width:3)
        canvas.render(strokeStyle, fillStyle, lineWidth, button)
    }
    override func boundingRect() -> Rect{
        return button.rect
    }
} 
