//
//  RoadRunner.swift
//  Version 1.0
//
//  Mansi Gupta (300969816)
//  Abhinav Sharma (300975677)
//


import SpriteKit
import GameplayKit

class Enemy: GameObject {
    var boomSprite: Boom?
    // constructor
    init() {
        // initialize the object with an image
        super.init(imageString: "Enemy", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 2
        self.Reset()
        self.dy = 30.0
    }
    
    override func Reset() {
        self.position.y = 700 + self.height!;
        let randomX:Int = (randomSource?.nextInt(upperBound: Int(screenWidth! - self.width!)))! + Int(self.halfwidth!)
        self.position.x = CGFloat(randomX)
    }
    
    override func CheckBounds() {
        if(self.position.y < (0 - self.height!)) {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
    
    override func StopMovement() {
        self.position.y = self.dy! + self.height!
        self.boomSprite = Boom()
        self.addChild(self.boomSprite!)
        
    }
}


