//
//  Cloud.swift
//  MAPD724-W2018-Lesson2
//
//  Created by Tom Tsiliopoulos on 2018-02-05.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit
import GameplayKit

class Cloud: GameObject {
    // constructor
    init() {
        // initialize the object with an image
        super.init(imageString: "cloud", initialScale: 0.6)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 3
        self.Reset()
        self.dy = 5.0
    }
    
    override func Reset() {
        self.position.y = 700 + self.height!;
        let randomX:Int = (randomSource?.nextInt(upperBound: Int(screenWidth! - self.width!)))! + Int(self.halfwidth!)
        self.position.x = CGFloat(randomX)
        self.dy = CGFloat(((randomSource?.nextUniform())! * 5.0) + 5.0)
        self.dx = CGFloat(((randomSource?.nextUniform())! * -4.0) + 2.0)
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
    
}
