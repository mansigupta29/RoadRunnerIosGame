//
//  RoadRunner.swift
//  Version 1.0
//
//  Mansi Gupta (300969816)
//  Abhinav Sharma (300975677)
//

import CoreGraphics
import SpriteKit

class CollisionManager {

    init() {
        
    }
    
    public static func CheckEnemiesCollision(object1: GameObject, object2: GameObject) {
        if(object1.frame.intersects(object2.frame)) {
            
            object2.position.x += object2.width!
            
        }
     
    }
    
    public static func CheckCollision(scene: SKScene, object1: GameObject, object2: GameObject) -> Bool {
        if(object1.frame.intersects(object2.frame)) {
            
            if(!object2.isColliding!) {
                if(object2.name == "Police Car") {
                   scene.run(SKAction.playSoundFileNamed("Car-crash-sound-effect", waitForCompletion: true))
                
                    
                }
                
                if(object2.name == "Enemy") {
                    scene.run(SKAction.playSoundFileNamed("Car-crash-sound-effect", waitForCompletion: true))
                   
                  
                }
                
                if(object2.name == "Enemy1") {
                    scene.run(SKAction.playSoundFileNamed("Car-crash-sound-effect", waitForCompletion: true))
                   
                    
                }
                
                if(object2.name == "Coin") {
                    scene.run(SKAction.playSoundFileNamed("coin-drop-4", waitForCompletion: false))
                    
                    
                }
                
                object2.isColliding = true
                  return true
            }
            
        }
        else {
            object2.isColliding = false
              return false
            
            
        }
        return false
    }

}
