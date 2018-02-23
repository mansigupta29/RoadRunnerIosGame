//
//  RoadRunner.swift
//  Version 1.0
//
//  Mansi Gupta (300969816)
//  Abhinav Sharma (300975677)
//


import SpriteKit
import GameplayKit
import UIKit
import AVFoundation


let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameStartScene: SKScene {
    
    // Game Variables
    var roadSprite: Road?
    var roadRunnerSprite: RoadRunner?
    var buttonStartSprite: Button?
    var buttonInstructionSprite: Button?
    var boomStartSprite: BoomStart?

    
    override func didMove(to view: SKView) {
        
        screenWidth = frame.width
        screenHeight = frame.height
        
        // add road
        self.roadSprite = Road()
        self.addChild(self.roadSprite!)
    
        //add road runner
        self.roadRunnerSprite = RoadRunner()
        self.roadRunnerSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 600)
        self.addChild(self.roadRunnerSprite!)
        
        //add button
        self.buttonStartSprite = Button(ImageString: "Start", InitialScale: 1.0)
        self.buttonStartSprite?.name = "StartButton"
        self.buttonStartSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 260)
        self.addChild(self.buttonStartSprite!)
        
        
        //add button
        self.buttonInstructionSprite = Button(ImageString: "Instruction", InitialScale: 1.0)
        self.buttonInstructionSprite?.name = "InstructionButton"
        self.buttonInstructionSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 200)
        self.addChild(self.buttonInstructionSprite!)
        
        //add boom start
        self.boomStartSprite = BoomStart()
        self.boomStartSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 450)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
           self.addChild(self.boomStartSprite!)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            
            let node = atPoint(location)
            
            if node.name == "StartButton" {
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "GameScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
            }else  if node.name == "InstructionButton" {
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "GameInstructionScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
                
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        self.roadSprite?.Update()
       
    }
}











