
import SpriteKit
//
//  RoadRunner.swift
//  Version 1.0
//
//  Mansi Gupta (300969816)
//  Abhinav Sharma (300975677)
//

class Road: GameObject {
    // constructor
    init() {
        // initialize the object with an image
        super.init(imageString: "Road", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 0
        self.anchorPoint = CGPoint.zero
        self.dy = 25.0
    }
    
    override func Reset() {
        self.position = CGPoint.zero
    }
    
    override func CheckBounds() {
        if(self.position.y < -780) {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
    
    
}

