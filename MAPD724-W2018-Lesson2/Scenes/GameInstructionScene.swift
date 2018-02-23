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




class GameInstructionScene: SKScene {
    
    // Game Variables
    var roadSprite: Road?
    var roadRunnerSprite: RoadRunner?
    var buttonStartSprite: Button?
 

    
    override func didMove(to view: SKView) {
    
        // add road
        self.roadSprite = Road()
        self.addChild(self.roadSprite!)
    
        //add road runner
        self.roadRunnerSprite = RoadRunner()
        self.roadRunnerSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 600)
        self.addChild(self.roadRunnerSprite!)
        
        //add button
        self.buttonStartSprite = Button(ImageString: "inst1", InitialScale: 1.0)
        self.buttonStartSprite?.name = "inst1"
        self.buttonStartSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 450)
        self.addChild(self.buttonStartSprite!)
        
        //add button
        self.buttonStartSprite = Button(ImageString: "inst2", InitialScale: 1.0)
        self.buttonStartSprite?.name = "inst2"
        self.buttonStartSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 400)
        self.addChild(self.buttonStartSprite!)
        
        //add button
        self.buttonStartSprite = Button(ImageString: "inst3", InitialScale: 1.0)
        self.buttonStartSprite?.name = "inst3"
        self.buttonStartSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 350)
        self.addChild(self.buttonStartSprite!)
        
        
        
        //add button
        self.buttonStartSprite = Button(ImageString: "Start", InitialScale: 1.0)
        self.buttonStartSprite?.name = "StartButton"
        self.buttonStartSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 260)
        self.addChild(self.buttonStartSprite!)
      
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











