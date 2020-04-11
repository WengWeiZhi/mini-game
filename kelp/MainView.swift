//
//  MainView.swift
//  kelp
//
//

import UIKit
import AVKit
import AVFoundation


class MainView: UIViewController {

    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var topReciprocalLabel: UILabel!
    @IBOutlet weak var underReciprocalLabel: UILabel!
    @IBOutlet weak var left_top_button: UIButton!
    @IBOutlet weak var left_down_button: UIButton!
    @IBOutlet weak var right_top_button: UIButton!
    @IBOutlet weak var right_down_button: UIButton!
    @IBOutlet weak var topNameLabel: UILabel!
    @IBOutlet weak var underNameLabel: UILabel!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    var timer:Timer?
    var second:Int = 3
    var userScore:Int = 0
    var aiScore:Int = 0
    var userChoose:Int?
    var prior:Int = 1
    let laba = AVSpeechSynthesizer()
    var utterance:AVSpeechUtterance?
    let MainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        stopAllButton()
        speak(withString: "\(second)")
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(self.updateTime),
                                     userInfo: nil,
                                     repeats: true)
            
        
    }
    
    @IBAction func left_top_click(_ sender: UIButton) {
        stopAllButton()
        speak(withString: "海帶芽海帶")
        let aiChoose = getRandom()
        userChoose = 1
        changeBackground(userChoose!,aiChoose)
        evaluate(userChoose!, aiChoose)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            self.changeStage()
            self.userChoose = nil
            self.startAllButton()
            self.modifyFont()
        }
    }
    
    @IBAction func left_down_click(_ sender: UIButton) {
        stopAllButton()
        speak(withString: "海帶芽海帶")
        let aiChoose = getRandom()
        userChoose = 3
        changeBackground(userChoose!,aiChoose)
        evaluate(userChoose!, aiChoose)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            self.changeStage()
            self.userChoose = nil
            self.startAllButton()
            self.modifyFont()
        }
    }
    
    @IBAction func right_top_click(_ sender: UIButton) {
        stopAllButton()
        speak(withString: "海帶芽海帶")
        let aiChoose = getRandom()
        userChoose = 2
        changeBackground(userChoose!,aiChoose)
        evaluate(userChoose!, aiChoose)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            self.changeStage()
            self.userChoose = nil
            self.startAllButton()
            self.modifyFont()
        }
    }
    
    @IBAction func right_down_click(_ sender: UIButton) {
        stopAllButton()
        speak(withString: "海帶芽海帶")
        let aiChoose = getRandom()
        userChoose = 4
        changeBackground(userChoose!,aiChoose)
        evaluate(userChoose!, aiChoose)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            self.changeStage()
            self.userChoose = nil
            self.startAllButton()
            self.modifyFont()
        }
    }
    
    
    func changeStage()
    {
        backgroundView.image = UIImage(named: "開始遊玩")
    }
    
    func getRandom() -> Int
    {
        let randomNumber = Int(arc4random_uniform(4) + 1)
        return randomNumber
    }
    
    func changeBackground(_ user:Int,_ ai:Int)
    {
        switch (ai,user)
        {
            case (1,1):
                backgroundView.image = UIImage(named: "左上左上")
            case (1,2):
                backgroundView.image = UIImage(named: "左上右上")
            case (1,3):
                backgroundView.image = UIImage(named: "左上左下")
            case (1,4):
                backgroundView.image = UIImage(named: "左上右下")
            case (2,1):
                backgroundView.image = UIImage(named: "右上左上")
            case (2,2):
                backgroundView.image = UIImage(named: "右上右上")
            case (2,3):
                backgroundView.image = UIImage(named: "右上左下")
            case (2,4):
                backgroundView.image = UIImage(named: "右上右下")
            case (3,1):
                backgroundView.image = UIImage(named: "左下左上")
            case (3,2):
                backgroundView.image = UIImage(named: "左下右上")
            case (3,3):
                backgroundView.image = UIImage(named: "左下左下")
            case (3,4):
                backgroundView.image = UIImage(named: "左下右下")
            case (4,1):
                backgroundView.image = UIImage(named: "右下左上")
            case (4,2):
                backgroundView.image = UIImage(named: "右下右上")
            case (4,3):
                backgroundView.image = UIImage(named: "右下左下")
            default:
                backgroundView.image = UIImage(named: "右下右下")
        }
    }
    
    func evaluate(_ user:Int, _ ai:Int)
    {
        if user == ai{
            if prior % 2 != 0{
                userScore += 1
                underReciprocalLabel.text = String(userScore)
                if userScore == 5{
                    speak(withString: "恭喜你贏了")
                    popAlert("恭喜你贏了", "     user \(userScore) : \(aiScore) computer")
                }
            }
            else{
                aiScore += 1
                topReciprocalLabel.text = String(aiScore)
                if aiScore == 5{
                    speak(withString: "不好意思，你輸了")
                    popAlert("不好意思，你輸了", "      user \(userScore) : \(aiScore) computer")
                }
            }
            prior = 1
        }
        else{
            prior += 1
        }
    }
    
    func stopAllButton()
    {
        right_top_button.isEnabled = false
        right_down_button.isEnabled = false
        left_down_button.isEnabled = false
        left_top_button.isEnabled = false
    }
    
    func startAllButton()
    {
        right_top_button.isEnabled = true
        right_down_button.isEnabled = true
        left_down_button.isEnabled = true
        left_top_button.isEnabled = true
    }
    
    func reset()
    {
        userScore = 0
        aiScore = 0
        topReciprocalLabel.text = "0"
        underReciprocalLabel.text = "0"
        topNameLabel.font = UIFont.systemFont(ofSize: 30)
        underNameLabel.font = UIFont.systemFont(ofSize: 30)
        prior = 1
        second = 3
    }
    
    func speak(withString text:String)
    {
        utterance = AVSpeechUtterance(string: text)
        let voices = AVSpeechSynthesisVoice.speechVoices()
        
        for voice in voices{
            if voice.language == "zh-TW"{
                utterance?.voice = voice
            }
        }
        
        utterance?.rate = 0.4
        
        
        if let okUtterance = utterance{
            laba.speak(okUtterance)
        }
    }
    
    func popAlert(_ text:String, _ message:String)
    {
        let alertController = UIAlertController(title: text, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.reset()
            self.navigationController?.pushViewController(self.MainView, animated: true)
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    func modifyFont()
    {
        if prior % 2 != 0{
            topNameLabel.font = UIFont.systemFont(ofSize: 30)
            underNameLabel.font = UIFont.systemFont(ofSize: 40)
        }
        else{
            topNameLabel.font = UIFont.systemFont(ofSize: 40)
            underNameLabel.font = UIFont.systemFont(ofSize: 30)
        }
    }
}

//計數器函數
extension MainView{
    
    @objc func updateTime()
    {
        second = second - 1
        speak(withString: "\(second)")
        topReciprocalLabel.text = String(second)
        underReciprocalLabel.text = String(second)
        if second == 0{
            stopTimer()
            changeStage()
            startAllButton()
            modifyFont()
            speak(withString: "開始")
        }
    }
    
    func stopTimer()
    {
        timer?.invalidate()
        timer = nil
    }
}
