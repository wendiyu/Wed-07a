

// Created on: 24-Oct-2018
// Created by: Wendi Yu
// Created for: ICS3U
// This program is a SpriteKit template move to the next scene with sound

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class SplashScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let splashSceneBackground = SKSpriteNode(imageNamed: "IMG_8599.JPG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3.0)
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        splashSceneBackground.position = CGPoint(x: (frame.size.width / 2) , y: (frame.size.height / 2))
        splashSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        splashSceneBackground.name = "splash Scene Background"
        self.addChild(splashSceneBackground)
        splashSceneBackground.setScale(0.25)
        
        splashSceneBackground.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view!.presentScene(mainMenuScene)
        }
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        let mainMenuScene = MainMenuScene(size: self.size)
        self.view!.presentScene(mainMenuScene)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let ship = SKSpriteNode(imageNamed: "IMG_8607.PNG")
    let startButton = SKSpriteNode(imageNamed: "start.png")
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        ship.position = CGPoint(x: (frame.size.width / 2) , y: 100)
        ship.name = "spaceship"
        self.addChild(ship)
        ship.setScale(0.65)
        
        startButton.position = CGPoint(x: (frame.size.width / 2) , y: (frame.size.height / 2))
        startButton.name = "start button"
        self.addChild(startButton)
        startButton.setScale(0.65)
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the start button is touched, it move to the main game
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "start button" {
                let mainGameScene = MainGameScene(size: self.size)
                self.view!.presentScene(mainGameScene)
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}
class MainGameScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let ship = SKSpriteNode(imageNamed: "IMG_8607.PNG")
    let leftButton = SKSpriteNode(imageNamed: "leftButton.png")
    let rightButton = SKSpriteNode(imageNamed: "rightButton.png")
    let fireButton = SKSpriteNode(imageNamed: "redButton.png")
    
    var leftButtonPress = false
    var rightButtonPress = false
    var fireButtonPress = false
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        ship.position = CGPoint(x: (frame.size.width / 2) , y: 100)
        ship.name = "spaceship"
        self.addChild(ship)
        ship.setScale(0.65)
        
        leftButton.position = CGPoint(x:100, y: 100)
        leftButton.name = "left button"
        leftButton.alpha = 0.5
        self.addChild(leftButton)
        leftButton.setScale(0.75)
        
        rightButton.position = CGPoint(x:300, y: 100)
        rightButton.name = "right button"
        rightButton.alpha = 0.5
        self.addChild(rightButton)
        rightButton.setScale(0.75)
        
        fireButton.position = CGPoint(x:(frame.size.width - 100), y: 100)
        fireButton.name = "fire button"
        fireButton.alpha = 0.5
        self.addChild(fireButton)
        fireButton.setScale(0.75)
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //this function automatically runs 60x a second 
        
        if rightButtonPress == true && ship.position.x <= (frame.size.width){
            // move ship to right 
            var moveShipRight = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
            ship.run(moveShipRight)
        }
        else if leftButtonPress == true && ship.position.x >= 0 {
            // move ship to left 
            var moveShipLeft = SKAction.moveBy(x: -10, y: 0, duration: 0.1)
            ship.run(moveShipLeft)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the screen touched, it moves to main menu 
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "right button" {
                rightButtonPress = true
            }
            else if touchedNodeName == "left button" {
                leftButtonPress = true
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "right button" {
                rightButtonPress = false
            }
            else if touchedNodeName == "left button" {
                leftButtonPress = false
            }
            else if touchedNodeName == "fire button" {
                let aMissile = SKSpriteNode(imageNamed: "missile.png")
                aMissile.position = CGPoint(x:ship.position.x, y: 100)
                aMissile.name = "a missile"
                self.addChild(aMissile)
                let fireMissile = SKAction.moveTo(y:frame.size.height + 100 , duration: 2)
                aMissile.run(fireMissile)
                aMissile.run(SKAction.playSoundFileNamed("laser1.wav", waitForCompletion: false))
                
            }
        }
        
    }
}
// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
