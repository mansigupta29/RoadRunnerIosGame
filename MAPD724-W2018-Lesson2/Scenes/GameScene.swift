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


class GameScene: SKScene{
    
    // Game Variables
    var roadSprite: Road?
    var carSprite: Car?
    var policeCarSprite: PoliceCar?
    var enemySprite: Enemy?
    var enemySprite1: Enemy1?
    var scoreLabel: Label?
    var highScoreLabel: Label?
    var value: Bool?
     var value1: Bool?
     var value2: Bool?
    var value3: Bool?
     var bulletSprite: Bullet?
    var coinSprite: Coin?
    
    
    
    
    override func didMove(to view: SKView) {
      ScoreManager.Score = 0
       
        
        // add road
        self.roadSprite = Road()
        self.addChild(self.roadSprite!)
        
        // add police car
        self.policeCarSprite = PoliceCar()
        self.addChild(self.policeCarSprite!)
        
        // add car
        self.carSprite = Car()
        self.carSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 50)
        self.addChild(self.carSprite!)
        
        // add enemy
        self.enemySprite = Enemy()
        self.addChild(self.enemySprite!)
        
        // add another enemy
        self.enemySprite1 = Enemy1()
        self.addChild(self.enemySprite1!)
        
        // add coin
        self.coinSprite = Coin()
        self.addChild(self.coinSprite!)
        
        // add score label
        scoreLabel = Label(labelString: "Score: 99999", position: CGPoint(x: frame.width * 0.45, y: frame.height - 20.0), fontSize: 30.0, fontName: "barbatri", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(scoreLabel!)
        
        
        // play background engine sound
        let engineSound = SKAudioNode(fileNamed: "car+speed+01.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        // preload sounds
        do {
            let sounds:[String] = ["Car-crash-sound-effect","coin-drop-4"]
            for sound in sounds {
                let path:String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        } catch {

        }
    
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    func touchUp(atPoint pos : CGPoint) {
       self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
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
        self.policeCarSprite?.Update()
        self.carSprite?.Update()
        self.enemySprite?.Update()
        self.enemySprite1?.Update()
        self.coinSprite?.Update()
        
        CollisionManager.CheckEnemiesCollision(object1: enemySprite!, object2: policeCarSprite!)
         CollisionManager.CheckEnemiesCollision(object1: policeCarSprite!, object2: enemySprite1!)
        CollisionManager.CheckEnemiesCollision(object1: enemySprite!, object2: enemySprite1!)
        
        
         self.value = CollisionManager.CheckCollision(scene: self, object1: carSprite!, object2: policeCarSprite!)
        if(value == true){
            policeCarSprite?.StopMovement()
           
            self.isPaused = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if let view = self.view {
                    if let scene = SKScene(fileNamed: "GameOverScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
            }
            
        }
        
        self.value3 = CollisionManager.CheckCollision(scene: self, object1: carSprite!, object2: coinSprite!)
        if(value3 == true){
    
           ScoreManager.Score += 100
            coinSprite?.removeFromParent()
            
            // add coin
            self.coinSprite = Coin()
            self.addChild(self.coinSprite!)
            
        }
        
        
        self.value1 = CollisionManager.CheckCollision(scene: self, object1: carSprite!, object2: enemySprite!)
        if(value1 == true){
            enemySprite?.StopMovement()
            
            self.isPaused = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if let view = self.view {
                    if let scene = SKScene(fileNamed: "GameOverScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
            }
        }
        
        self.value2 = CollisionManager.CheckCollision(scene: self, object1: carSprite!, object2: enemySprite1!)
        if(value2 == true){
            enemySprite1?.StopMovement()
            
            self.isPaused = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if let view = self.view {
                    if let scene = SKScene(fileNamed: "GameOverScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
            }
        }
        if(ScoreManager.HighScore < ScoreManager.Score){
              ScoreManager.HighScore = ScoreManager.Score
        }
      
           
            scoreLabel?.text = "Score: \(ScoreManager.Score)"
    
       
        
    }
}











