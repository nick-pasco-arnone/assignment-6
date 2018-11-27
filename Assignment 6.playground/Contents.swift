// Created on November 6
// Created by Nicholas Pasco-Arnone
// Created for ICS3U
// This program can play 21

import PlaygroundSupport

import SpriteKit
import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionLabel = UILabel()
    let thirdCardButton = UIButton()
    let answerLabel = UILabel()
    let numbersLabel = UILabel()
    let card1 : Int = Int(arc4random_uniform(10) + 1)
    let card2 : Int = Int(arc4random_uniform(10) + 1)
    let cardThree : Int = Int(arc4random_uniform(10) + 1)
    var card3 = 0
    let card1Label = UILabel()
    let card2Label = UILabel()
    let playHandButton = UIButton()
    let startGameButton = UIButton()
    let hitButton = UIButton()
    //let backOne = SKSpriteNode(imageNamed:"Front.JPG")
    //let backtwo = SKSpriteNode(imageNamed:"Front.JPG")
    var cardOneImageView = UIImageView()
    var cardTwoImageView = UIImageView()
    var cardThreeImageView = UIImageView()
    var computerCardOneImageView = UIImageView()
    var computerCardTwoImageView = UIImageView()
    var computerCardThreeImageView = UIImageView()
    let selector : Int = Int(arc4random_uniform(4) + 1)
    
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionLabel.text = "these are your cards, click 'Hit' for a third"
        view.addSubview(instructionLabel)
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
        view.addSubview(card1Label)
        card1Label.translatesAutoresizingMaskIntoConstraints = false
        card1Label.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20).isActive = true
        card1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
        view.addSubview(card2Label)
        card2Label.translatesAutoresizingMaskIntoConstraints = false
        card2Label.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20).isActive = true
        card2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140).isActive = true
        
        
        thirdCardButton.setTitle("Hit", for: .normal)
        thirdCardButton.setTitleColor(.blue, for: .normal)
        thirdCardButton.titleLabel?.textAlignment = .center
        thirdCardButton.addTarget(self, action: #selector(addThirdCard), for: .touchUpInside)
        view.addSubview(thirdCardButton)
        thirdCardButton.translatesAutoresizingMaskIntoConstraints = false
        thirdCardButton.topAnchor.constraint(equalTo: card1Label.bottomAnchor, constant: 20).isActive = true
        thirdCardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        playHandButton.setTitle("play your hand", for: .normal)
        playHandButton.setTitleColor(.blue, for: .normal)
        playHandButton.titleLabel?.textAlignment = .center
        playHandButton.addTarget(self, action: #selector(playHand), for: .touchUpInside)
        view.addSubview(playHandButton)
        playHandButton.translatesAutoresizingMaskIntoConstraints = false
        playHandButton.topAnchor.constraint(equalTo: card1Label.bottomAnchor, constant: 20).isActive = true
        playHandButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 400).isActive = true
        
        hitButton.setTitle("Hit", for: .normal)
        hitButton.setTitleColor(.blue, for: .normal)
        hitButton.titleLabel?.textAlignment = .center
        hitButton.addTarget(self, action: #selector(addThirdCard), for: .touchUpInside)
        view.addSubview(hitButton)
        hitButton.translatesAutoresizingMaskIntoConstraints = false
        hitButton.topAnchor.constraint(equalTo: card1Label.bottomAnchor, constant: 60).isActive = true
        hitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 400).isActive = true
        
        answerLabel.text = nil
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: thirdCardButton.bottomAnchor, constant: 300).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        numbersLabel.text = nil
        view.addSubview(numbersLabel)
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false
        numbersLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20).isActive = true
        numbersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
        cardOneImageView.image = UIImage(named:"1__#$!@%!#__Front.JPG")
        view.addSubview(cardOneImageView)
        cardOneImageView.translatesAutoresizingMaskIntoConstraints = false
        cardOneImageView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20).isActive = true
        cardOneImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        cardTwoImageView.image = UIImage(named:"1__#$!@%!#__Front.JPG")
        view.addSubview(cardTwoImageView)
        cardTwoImageView.translatesAutoresizingMaskIntoConstraints = false
        cardTwoImageView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20).isActive = true
        cardTwoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140 ).isActive = true
        
        cardThreeImageView.image = UIImage(named:"1__#$!@%!#__Front.JPG")
        view.addSubview(cardThreeImageView)
        cardThreeImageView.translatesAutoresizingMaskIntoConstraints = false
        cardThreeImageView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20).isActive = true
        cardThreeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260 ).isActive = true
        
        computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__Front.JPG")
        view.addSubview(computerCardOneImageView)
        computerCardOneImageView.translatesAutoresizingMaskIntoConstraints = false
        computerCardOneImageView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 100).isActive = true
        computerCardOneImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 600 ).isActive = true
        
        computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__Front.JPG")
        view.addSubview(computerCardTwoImageView)
        computerCardTwoImageView.translatesAutoresizingMaskIntoConstraints = false
        computerCardTwoImageView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 100).isActive = true
        computerCardTwoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 700 ).isActive = true
        
        computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__Front.JPG")
        view.addSubview(computerCardThreeImageView)
        computerCardThreeImageView.translatesAutoresizingMaskIntoConstraints = false
        computerCardThreeImageView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 100).isActive = true
        computerCardThreeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 800 ).isActive = true
        
        
        startGameButton.setTitle("Start game", for: .normal)
        startGameButton.setTitleColor(.blue, for: .normal)
        startGameButton.titleLabel?.textAlignment = .center
        startGameButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        view.addSubview(startGameButton)
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        startGameButton.topAnchor.constraint(equalTo: instructionLabel.topAnchor, constant: 0).isActive = true
        startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 800).isActive = true
        
        
        
    }
    
    @objc func addThirdCard() {
        
        card3 = cardThree
        
        if card3 == 1 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__AH.JPG")
        }
        else if card3 == 1 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__AC.JPG")
        }
        else if card3 == 1 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__AS.JPG")
        }
        else if card3 == 1 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__AD.JPG")
        }
            
        else if card3 == 2 && selector == 3{
            cardThreeImageView.image = UIImage(named:"2__#$!@%!#__2H.JPG")
        }
        else if card3 == 2 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__2C.JPG")
        }
        else if card3 == 2 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__2S.JPG")
        }
        else if card3 == 2 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__2D.JPG")
        }
            
            
        else if card3 == 3 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__3H.JPG")
        }
        else if card3 == 3 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__3C.JPG")
        }
        else if card3 == 3 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__3S.JPG")
        }
        else if card3 == 3 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__3D.JPG")
        }
        else if card3 == 4 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__4H.JPG")
        }
        else if card3 == 4 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__4C.JPG")
        }
        else if card3 == 4 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__4S.JPG")
        }
        else if card3 == 4 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__4D.JPG")
        }
        else if card3 == 5 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__5H.JPG")
        }
        else if card3 == 5 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__5C.JPG")
        }
        else if card3 == 5 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__5S.JPG")
        }
        else if card3 == 5 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__5D.JPG")
        }
        else if card3 == 6 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__6H.JPG")
        }
        else if card3 == 6 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__6C.JPG")
        }
        else if card3 == 6 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__6S.JPG")
        }
        else if card3 == 6 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__6D.JPG")
        }
        else if card3 == 7 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__7H.JPG")
        }
        else if card3 == 7 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__7C.JPG")
        }
            
        else if card3 == 7 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__7S.JPG")
        }
            
        else if card3 == 7 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__7D.JPG")
        }
            
        else if card3 == 8 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__8H.JPG")
        }
        else if card3 == 8 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__8C.JPG")
        }
        else if card3 == 8 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__8S.JPG")
        }
        else if card3 == 8 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__8D.JPG")
        }
        else if card3 == 9 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__9H.JPG")
        }
        else if card3 == 9 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__9C.JPG")
        }
        else if card3 == 9 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__9S.JPG")
        }
        else if card3 == 9 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__9D.JPG")
        }
        else if card3 == 10 && selector == 3{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__10H.JPG")
        }
        else if card3 == 10 && selector == 4{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__10C.JPG")
        }
        else if card3 == 10 && selector == 1{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__10S.JPG")
        }
        else if card3 == 10 && selector == 2{
            cardThreeImageView.image = UIImage(named:"1__#$!@%!#__10D.JPG")
        }
    }
    
    @objc func playHand() {
        
        let computerCard1 : Int = Int(arc4random_uniform(10) + 1)
        let computerCard2 : Int = Int(arc4random_uniform(10) + 1)
        let computerCard3 : Int = Int(arc4random_uniform(10) + 1)
        
        let computerCardsLabel = UILabel()
        
        
        let userTotal = card1 + card2 + card3
        let userTotalLabel = UILabel()
        let computerTotal = computerCard1 + computerCard2 + computerCard3
        let computerTotalLabel = UILabel()
        
        
        
        if computerCard1 == 1 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__AH.JPG")
        }
        else if computerCard1 == 1 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__AC.JPG")
        }
        else if computerCard1 == 1 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__AS.JPG")
        }
        else if computerCard1 == 1 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__AD.JPG")
        }
            
        else if computerCard1 == 2 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"2__#$!@%!#__2H.JPG")
        }
        else if computerCard1 == 2 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__2C.JPG")
        }
        else if computerCard1 == 2 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__2S.JPG")
        }
        else if computerCard1 == 2 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__2D.JPG")
        }
            
        else if computerCard1 == 3 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__3H.JPG")
        }
        else if computerCard1 == 3 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__3C.JPG")
        }
        else if computerCard1 == 3 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__3S.JPG")
        }
        else if computerCard1 == 3 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__3D.JPG")
        }
        else if computerCard1 == 4 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__4H.JPG")
        }
        else if computerCard1 == 4 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__4C.JPG")
        }
        else if computerCard1 == 4 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__4S.JPG")
        }
        else if computerCard1 == 4 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__4D.JPG")
        }
        else if computerCard1 == 5 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__5H.JPG")
        }
        else if computerCard1 == 5 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__5C.JPG")
        }
        else if computerCard1 == 5 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__5S.JPG")
        }
        else if computerCard1 == 5 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__5D.JPG")
        }
        else if computerCard1 == 6 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__6H.JPG")
        }
        else if computerCard1 == 6 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__6C.JPG")
        }
        else if computerCard1 == 6 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__6S.JPG")
        }
        else if computerCard1 == 6 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__6D.JPG")
        }
        else if computerCard1 == 7 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__7H.JPG")
        }
        else if computerCard1 == 7 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__7C.JPG")
        }
            
        else if computerCard1 == 7 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__7S.JPG")
        }
            
        else if computerCard1 == 7 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__7D.JPG")
        }
            
        else if computerCard1 == 8 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__8H.JPG")
        }
        else if computerCard1 == 8 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__8C.JPG")
        }
        else if computerCard1 == 8 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__8S.JPG")
        }
        else if computerCard1 == 8 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__8D.JPG")
        }
        else if computerCard1 == 9 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__9H.JPG")
        }
        else if computerCard1 == 9 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__9C.JPG")
        }
        else if computerCard1 == 9 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__9S.JPG")
        }
        else if computerCard1 == 9 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__9D.JPG")
        }
        else if computerCard1 == 10 && selector == 4{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__10H.JPG")
        }
        else if computerCard1 == 10 && selector == 3{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__10C.JPG")
        }
        else if computerCard1 == 10 && selector == 2{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__10S.JPG")
        }
        else if computerCard1 == 10 && selector == 1{
            computerCardOneImageView.image = UIImage(named:"1__#$!@%!#__10D.JPG")
        }
        
        
        //computer card 2
        
        if computerCard2 == 1 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__AH.JPG")
        }
        else if computerCard2 == 1 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__AC.JPG")
        }
        else if computerCard2 == 1 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__AS.JPG")
        }
        else if computerCard2 == 1 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__AD.JPG")
        }
            
        else if computerCard2 == 2 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"2__#$!@%!#__2H.JPG")
        }
        else if computerCard2 == 2 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__2C.JPG")
        }
        else if computerCard2 == 2 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__2S.JPG")
        }
        else if computerCard2 == 2 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__2D.JPG")
        }
            
        else if computerCard2 == 3 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__3H.JPG")
        }
        else if computerCard2 == 3 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__3C.JPG")
        }
        else if computerCard2 == 3 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__3S.JPG")
        }
        else if computerCard2 == 3 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__3D.JPG")
        }
        else if computerCard2 == 4 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__4H.JPG")
        }
        else if computerCard2 == 4 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__4C.JPG")
        }
        else if computerCard2 == 4 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__4S.JPG")
        }
        else if computerCard2 == 4 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__4D.JPG")
        }
        else if computerCard2 == 5 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__5H.JPG")
        }
        else if computerCard2 == 5 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__5C.JPG")
        }
        else if computerCard2 == 5 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__5S.JPG")
        }
        else if computerCard2 == 5 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__5D.JPG")
        }
        else if computerCard2 == 6 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__6H.JPG")
        }
        else if computerCard2 == 6 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__6C.JPG")
        }
        else if computerCard2 == 6 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__6S.JPG")
        }
        else if computerCard2 == 6 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__6D.JPG")
        }
        else if computerCard2 == 7 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__7H.JPG")
        }
        else if computerCard2 == 7 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__7C.JPG")
        }
            
        else if computerCard2 == 7 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__7S.JPG")
        }
            
        else if computerCard2 == 7 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__7D.JPG")
        }
            
        else if computerCard2 == 8 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__8H.JPG")
        }
        else if computerCard2 == 8 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__8C.JPG")
        }
        else if computerCard2 == 8 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__8S.JPG")
        }
        else if computerCard2 == 8 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__8D.JPG")
        }
        else if computerCard2 == 9 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__9H.JPG")
        }
        else if computerCard2 == 9 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__9C.JPG")
        }
        else if computerCard2 == 9 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__9S.JPG")
        }
        else if computerCard2 == 9 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__9D.JPG")
        }
        else if computerCard2 == 10 && selector == 2{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__10H.JPG")
        }
        else if computerCard2 == 10 && selector == 3{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__10C.JPG")
        }
        else if computerCard2 == 10 && selector == 4{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__10S.JPG")
        }
        else if computerCard2 == 10 && selector == 1{
            computerCardTwoImageView.image = UIImage(named:"1__#$!@%!#__10D.JPG")
        }
        
        
        
        //computer card 3
        
        if computerCard3 == 1 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__AH.JPG")
        }
        else if computerCard3 == 1 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__AC.JPG")
        }
        else if computerCard3 == 1 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__AS.JPG")
        }
        else if computerCard3 == 1 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__AD.JPG")
        }
            
        else if computerCard3 == 2 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"2__#$!@%!#__2H.JPG")
        }
        else if computerCard3 == 2 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__2C.JPG")
        }
        else if computerCard3 == 2 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__2S.JPG")
        }
        else if computerCard3 == 2 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__2D.JPG")
        }
            
        else if computerCard3 == 3 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__3H.JPG")
        }
        else if computerCard3 == 3 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__3C.JPG")
        }
        else if computerCard3 == 3 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__3S.JPG")
        }
        else if computerCard3 == 3 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__3D.JPG")
        }
        else if computerCard3 == 4 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__4H.JPG")
        }
        else if computerCard3 == 4 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__4C.JPG")
        }
        else if computerCard3 == 4 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__4S.JPG")
        }
        else if computerCard3 == 4 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__4D.JPG")
        }
        else if computerCard3 == 5 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__5H.JPG")
        }
        else if computerCard3 == 5 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__5C.JPG")
        }
        else if computerCard3 == 5 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__5S.JPG")
        }
        else if computerCard3 == 5 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__5D.JPG")
        }
        else if computerCard3 == 6 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__6H.JPG")
        }
        else if computerCard3 == 6 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__6C.JPG")
        }
        else if computerCard3 == 6 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__6S.JPG")
        }
        else if computerCard3 == 6 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__6D.JPG")
        }
        else if computerCard3 == 7 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__7H.JPG")
        }
        else if computerCard3 == 7 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__7C.JPG")
        }
            
        else if computerCard3 == 7 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__7S.JPG")
        }
            
        else if computerCard3 == 7 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__7D.JPG")
        }
            
        else if computerCard3 == 8 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__8H.JPG")
        }
        else if computerCard3 == 8 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__8C.JPG")
        }
        else if computerCard3 == 8 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__8S.JPG")
        }
        else if computerCard3 == 8 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__8D.JPG")
        }
        else if computerCard3 == 9 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__9H.JPG")
        }
        else if computerCard3 == 9 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__9C.JPG")
        }
        else if computerCard3 == 9 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__9S.JPG")
        }
        else if computerCard3 == 9 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__9D.JPG")
        }
        else if computerCard3 == 10 && selector == 3{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__10H.JPG")
        }
        else if computerCard3 == 10 && selector == 4{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__10C.JPG")
        }
        else if computerCard3 == 10 && selector == 1{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__10S.JPG")
        }
        else if computerCard3 == 10 && selector == 2{
            computerCardThreeImageView.image = UIImage(named:"1__#$!@%!#__10D.JPG")
        }
        
        
        //who wins
        if userTotal > 21 && computerTotal > 21 {
            answerLabel.text = "Draw.   You were both over 21"
            
            computerCardsLabel.text = "The computers cards were:  \(computerCard1, computerCard2, computerCard3)"
            view.addSubview(computerCardsLabel)
            computerCardsLabel.translatesAutoresizingMaskIntoConstraints = false
            computerCardsLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20).isActive = true
            computerCardsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            computerTotalLabel.text = "The computers total was:  \(computerTotal)"
            view.addSubview(computerTotalLabel)
            computerTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            computerTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 40).isActive = true
            computerTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            userTotalLabel.text = "your total was:  \(userTotal)"
            view.addSubview(userTotalLabel)
            userTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            userTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 50).isActive = true
            userTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            
            
            
        }
            
        else if userTotal == computerTotal{
            answerLabel.text = "Draw"
            
            computerCardsLabel.text = "The computer's cards were:  \(computerCard1, computerCard2, computerCard3)"
            view.addSubview(computerCardsLabel)
            computerCardsLabel.translatesAutoresizingMaskIntoConstraints = false
            computerCardsLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20).isActive = true
            computerCardsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            computerTotalLabel.text = "The computers total was:  \(computerTotal)"
            view.addSubview(computerTotalLabel)
            computerTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            computerTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 40).isActive = true
            computerTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            userTotalLabel.text = "your total was:  \(userTotal)"
            view.addSubview(userTotalLabel)
            userTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            userTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 50).isActive = true
            userTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            
            
        }
        else if userTotal > 21 && computerTotal < 21 {
            
            answerLabel.text = "You went over 21. You lose"
            computerCardsLabel.text = "The computer's cards were:  \(computerCard1, computerCard2, computerCard3)"
            view.addSubview(computerCardsLabel)
            computerCardsLabel.translatesAutoresizingMaskIntoConstraints = false
            computerCardsLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20).isActive = true
            computerCardsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            computerTotalLabel.text = "The computers total was:  \(computerTotal)"
            view.addSubview(computerTotalLabel)
            computerTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            computerTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 40).isActive = true
            computerTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            userTotalLabel.text = "your total was:  \(userTotal)"
            view.addSubview(userTotalLabel)
            userTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            userTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 50).isActive = true
            userTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        }
        else if userTotal < 21 && computerTotal > 21 {
            
            answerLabel.text = "You win.  The computer went over 21"
            
            computerCardsLabel.text = "The computer's cards were:  \(computerCard1, computerCard2, computerCard3)"
            view.addSubview(computerCardsLabel)
            computerCardsLabel.translatesAutoresizingMaskIntoConstraints = false
            computerCardsLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20).isActive = true
            computerCardsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            computerTotalLabel.text = "The computers total was:  \(computerTotal)"
            view.addSubview(computerTotalLabel)
            computerTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            computerTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 40).isActive = true
            computerTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            userTotalLabel.text = "your total was:  \(userTotal)"
            view.addSubview(userTotalLabel)
            userTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            userTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 50).isActive = true
            userTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            
            
        }
        else if userTotal > computerTotal {
            
            answerLabel.text = "You win"
            
            computerCardsLabel.text = "The computer's cards were:  \(computerCard1, computerCard2, computerCard3)"
            view.addSubview(computerCardsLabel)
            computerCardsLabel.translatesAutoresizingMaskIntoConstraints = false
            computerCardsLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20).isActive = true
            computerCardsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            computerTotalLabel.text = "The computers total was:  \(computerTotal)"
            view.addSubview(computerTotalLabel)
            computerTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            computerTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 40).isActive = true
            computerTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            userTotalLabel.text = "your total was:  \(userTotal)"
            view.addSubview(userTotalLabel)
            userTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            userTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 50).isActive = true
            userTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            
        }
        else if userTotal < computerTotal {
            
            answerLabel.text = "You lose"
            
            computerCardsLabel.text = "The computer's cards were:  \(computerCard1, computerCard2, computerCard3)"
            view.addSubview(computerCardsLabel)
            computerCardsLabel.translatesAutoresizingMaskIntoConstraints = false
            computerCardsLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 20).isActive = true
            computerCardsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            computerTotalLabel.text = "The computers total was:  \(computerTotal)"
            view.addSubview(computerTotalLabel)
            computerTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            computerTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 40).isActive = true
            computerTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
            
            userTotalLabel.text = "your total was:  \(userTotal)"
            view.addSubview(userTotalLabel)
            userTotalLabel.translatesAutoresizingMaskIntoConstraints = false
            userTotalLabel.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 50).isActive = true
            userTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            
        }
        
        

        }
    @objc func start() {
        
        if card1 == 1 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__AH.JPG")
        }
        else if card1 == 1 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__AC.JPG")
    }
        else if card1 == 1 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__AS.JPG")
    }
        else if card1 == 1 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__AD.JPG")
        }
            
        else if card1 == 2 && selector == 1{
            cardOneImageView.image = UIImage(named:"2__#$!@%!#__2H.JPG")
    }
        else if card1 == 2 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__2C.JPG")
        }
        else if card1 == 2 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__2S.JPG")
        }
        else if card1 == 2 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__2D.JPG")
        }
        
            
        else if card1 == 3 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__3H.JPG")
        }
        else if card1 == 3 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__3C.JPG")
        }
        else if card1 == 3 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__3S.JPG")
        }
        else if card1 == 3 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__3D.JPG")
        }
        else if card1 == 4 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__4H.JPG")
        }
        else if card1 == 4 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__4C.JPG")
        }
        else if card1 == 4 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__4S.JPG")
        }
        else if card1 == 4 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__4D.JPG")
        }
        else if card1 == 5 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__5H.JPG")
        }
        else if card1 == 5 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__5C.JPG")
        }
        else if card1 == 5 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__5S.JPG")
        }
        else if card1 == 5 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__5D.JPG")
        }
        else if card1 == 6 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__6H.JPG")
        }
        else if card1 == 6 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__6C.JPG")
        }
        else if card1 == 6 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__6S.JPG")
        }
        else if card1 == 6 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__6D.JPG")
        }
        else if card1 == 7 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__7H.JPG")
        }
        else if card1 == 7 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__7C.JPG")
        }
        
        else if card1 == 7 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__7S.JPG")
        }
        
        else if card1 == 7 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__7D.JPG")
        }
        
        else if card1 == 8 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__8H.JPG")
        }
        else if card1 == 8 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__8C.JPG")
        }
        else if card1 == 8 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__8S.JPG")
        }
        else if card1 == 8 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__8D.JPG")
        }
        else if card1 == 9 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__9H.JPG")
        }
        else if card1 == 9 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__9C.JPG")
        }
        else if card1 == 9 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__9S.JPG")
        }
        else if card1 == 9 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__9D.JPG")
        }
        else if card1 == 10 && selector == 1{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__10H.JPG")
        }
        else if card1 == 10 && selector == 2{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__10C.JPG")
        }
        else if card1 == 10 && selector == 3{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__10S.JPG")
        }
        else if card1 == 10 && selector == 4{
            cardOneImageView.image = UIImage(named:"1__#$!@%!#__10D.JPG")
        }
        
        
        //card 2
        if card2 == 1 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__AH.JPG")
        }
        else if card2 == 1 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__AC.JPG")
        }
        else if card2 == 1 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__AS.JPG")
        }
        else if card2 == 1 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__AD.JPG")
        }
            
        else if card2 == 2 && selector == 2{
            cardTwoImageView.image = UIImage(named:"2__#$!@%!#__2H.JPG")
        }
        else if card2 == 2 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__2C.JPG")
        }
        else if card2 == 2 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__2S.JPG")
        }
        else if card2 == 2 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__2D.JPG")
        }
            
        else if card2 == 3 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__3H.JPG")
        }
        else if card2 == 3 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__3C.JPG")
        }
        else if card2 == 3 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__3S.JPG")
        }
        else if card2 == 3 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__3D.JPG")
        }
        else if card2 == 4 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__4H.JPG")
        }
        else if card2 == 4 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__4C.JPG")
        }
        else if card2 == 4 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__4S.JPG")
        }
        else if card2 == 4 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__4D.JPG")
        }
        else if card2 == 5 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__5H.JPG")
        }
        else if card2 == 5 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__5C.JPG")
        }
        else if card2 == 5 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__5S.JPG")
        }
        else if card2 == 5 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__5D.JPG")
        }
        else if card2 == 6 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__6H.JPG")
        }
        else if card2 == 6 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__6C.JPG")
        }
        else if card2 == 6 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__6S.JPG")
        }
        else if card2 == 6 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__6D.JPG")
        }
        else if card2 == 7 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__7H.JPG")
        }
        else if card2 == 7 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__7C.JPG")
        }
        else if card2 == 7 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__7S.JPG")
        }
        else if card2 == 7 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__7D.JPG")
        }
            
        else if card2 == 8 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__8H.JPG")
        }
        else if card2 == 8 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__8C.JPG")
        }
        else if card2 == 8 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__8S.JPG")
        }
        else if card2 == 8 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__8D.JPG")
        }
        else if card2 == 9 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__9H.JPG")
        }
        else if card2 == 9 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__9C.JPG")
        }
        else if card2 == 9 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__9S.JPG")
        }
        else if card2 == 9 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__9D.JPG")
        }
        else if card2 == 10 && selector == 2{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__10H.JPG")
        }
        else if card2 == 10 && selector == 3{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__10C.JPG")
        }
        else if card2 == 10 && selector == 4{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__10S.JPG")
        }
        else if card2 == 10 && selector == 1{
            cardTwoImageView.image = UIImage(named:"1__#$!@%!#__10D.JPG")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
