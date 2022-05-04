//only arrows
import Scenes
import Igis

class Button: RenderableEntity{

    var button: Rectangle

    
    init(rect:Rect){

        button = Rectangle(rect:rect, fillMode:.clear)
        super.init(name:"Background")
    }

    func move(to point:Point){
        button.rect.topLeft = point
    }

    override func render(canvas:Canvas){
        canvas.render(button)
    }

    override func boundingRect() -> Rect{
        return button.rect
    }
} 
