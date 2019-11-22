//
//  QnaViewController.swift
//  Qna
//
//  Created by ChiuWanNuo on 2019/11/18.
//  Copyright © 2019 ChiuWanNuo. All rights reserved.
//

import UIKit

class QnaViewController: UIViewController {
    
    var rightAnswer = ""
    var index = 0
    var score = 0
    
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        index = 0
        score = 0
        questionNumber.text = "QUESTION: " + String(index + 1)
        scoreLabel.text = "SCORE: " + String(score)
        qnas.shuffle()
        playGame()
        //隱藏PLAY AGAIN
        playAgain.isHidden = true
        //顯示選項
        for buttonImage in buttonImage {
            buttonImage.isHidden = false
        }
        for button in optionButton{
            button.isHidden = false
        }
    }
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var optionButton: [UIButton]!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet var buttonImage: [UIImageView]!
    
    
    var qnas = [Qna(question: "請問哪個不是牆內兵團的名稱？", option: ["調查兵團", "駐紮兵團", "騎兵團"], answer: "騎兵團"),
                   Qna(question: "請問巨人的弱點？", option: ["眼睛", "後頸", "左腳踝"], answer: "後頸"),
                   Qna(question: "繼承九大巨人的人壽命只有幾年？", option: ["十八年", "十三年", "二十五年"], answer: "十三年"),
                   Qna(question: "牆內的人民被王操縱了什麼？", option: ["金錢", "生命", "記憶"], answer: "記憶"),
                   Qna(question: "牆內之王與始祖巨人簽了什麼條約",  option: ["不戰之約", "馬關條約", "休戰協議"],answer: "不戰之約"),
                   Qna(question: "漢吉發明對付盔甲巨人的新武器名稱為何？", option: ["雷槍", "千鳥", "立體移動裝置"], answer: "雷槍"),
                   Qna(question: "艾倫是第幾期的訓練兵", option: ["十四", "一零四", "一一四"], answer: "一零四"),
                   Qna(question: "下列哪個不是保護牆內人類三道牆的名稱",  option: ["瑪利亞", "羅蘭", "席納"],answer: "羅蘭"),
                   Qna(question: "艾爾文團長為了救回艾倫在混戰中失去了哪個部位？", option: ["左手", "右腳", "右手"], answer: "右手"),
                   Qna(question: "牆內人類種族的名稱為何？", option: ["艾爾迪亞", "馬萊", "雷貝利歐"], answer: "艾爾迪亞"),
                   Qna(question: "下列何者不是艾倫擁有的巨人之力", option: ["始祖巨人", "車力巨人", "進擊的巨人"], answer: "車力巨人"),
                   Qna(question: "牆內人類種族的名稱為何？", option: ["艾爾迪亞", "馬萊", "雷貝利歐"], answer: "艾爾迪亞"),
                   Qna(question: "下列何者不是漢吉抓來做實驗的巨人名字", option: ["索尼", "賓", "約翰"], answer: "約翰"),]
    

    
    
    @IBAction func optionButton(_ sender: UIButton) {
        
        index += 1
        if sender.currentTitle == rightAnswer{
            score += 10
            scoreLabel.text = "SCORE: " + String(score)
        }
        
        if index == 10 {
            let alertController = UIAlertController(
                title: "GAME IS OVER",
                message: "SCORE:\(score)分",
                preferredStyle: .alert)
            
            let okButton = UIAlertAction(
                title: "CONFIRM", style: .default, handler: {(action: UIAlertAction!) -> Void in})
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
            
            playAgain.isHidden = false
            
            for buttonImage in buttonImage {
                buttonImage.isHidden = true
            }
            for button in optionButton{
                button.isHidden = true
            }
            
            
        }else{
            questionNumber.text = "Question: " + String(index+1)
            playGame()
        }
        
    }
    

    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        playAgain.isHidden = true
        qnas.shuffle()
        playGame()

    }
    
    func playGame(){
        questionLabel.text = qnas[index].question
        rightAnswer = qnas[index].answer
        qnas[index].option.shuffle()
        for i in 0...2{
            optionButton[i].setTitle(qnas[index].option[i], for: .normal)
        }

    }
    
       
   
}
