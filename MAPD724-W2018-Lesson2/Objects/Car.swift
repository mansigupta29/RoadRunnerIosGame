//
//  RoadRunner.swift
//  Version 1.0
//
//  Mansi Gupta (300969816)
//  Abhinav Sharma (300975677)
//


import SpriteKit

class Car: GameObject {
    
    // constructor
    init() {
        super.init(imageString: "car", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds() {
        // right boundary
        if(self.position.x > screenSize.width - self.halfwidth!) {
            self.position.x = screenSize.width - self.halfwidth!
        }
        
        // left boundary
        if(self.position.x < self.halfwidth!) {
            self.position.x = self.halfwidth!
        }
    }
    
    override func Start() {
        self.zPosition = 1
    }
    
    override func Update() {
        self.CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint) {
        self.position = newPos
    }
    
}

