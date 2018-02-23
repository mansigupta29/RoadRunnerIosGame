//
//  RoadRunner.swift
//  Version 1.0
//
//  Mansi Gupta (300969816)
//  Abhinav Sharma (300975677)
//


import SpriteKit

class Bullet: GameObject {
    // Constructor
    init(){
        super.init(imageString: "Bullet", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds() {
        
    }
    
    override func Start() {
        self.zPosition = 2
    }
    
    override func Update() {
        
    }
    
    func TouchMove(newPos: CGPoint){
        self.position = newPos
    }
}

