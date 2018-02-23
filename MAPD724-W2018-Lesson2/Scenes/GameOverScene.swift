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

class GameOverScene: SKScene {
    
    // Game Variables
    var roadSprite: Road?
    var roadRunnerSprite: RoadRunner?
    var gameOverLabel: Label?
    var pressAnyKeyLabel: Label?
    var buttonStartSprite: Button?
    var gameOverSprite: GameOver?
    var highScoreLabel: Label?
    var scoreLabel: Label?
    

    
    override func didMove(to view: SKView) {
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
        
        
        //add game over
        self.gameOverSprite = GameOver()
        self.gameOverSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 450)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.addChild(self.gameOverSprite!)
        }
        
        // add score label
        scoreLabel = Label(labelString: "Score: 99999", position: CGPoint(x:screenWidth! * 0.5 , y: 200), fontSize: 30.0, fontName: "barbatri", fontColor: SKColor.yellow, isCentered: true)
        self.addChild(scoreLabel!)
        
        // add score label
        highScoreLabel = Label(labelString: "High Score: 99999", position: CGPoint(x:screenWidth! * 0.5 , y: 160), fontSize: 30.0, fontName: "barbatri", fontColor: SKColor.yellow, isCentered: true)
        self.addChild(highScoreLabel!)
        
        scoreLabel?.text = "Score: \(ScoreManager.Score)"
        highScoreLabel?.text = "High Score: \(ScoreManager.HighScore)"
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
            }
        }    }
    
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











