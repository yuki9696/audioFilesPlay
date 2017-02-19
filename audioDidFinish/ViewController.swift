
import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1?.delegate = self
        player2?.delegate = self
        player3?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let music1 = Bundle.main.bundleURL.appendingPathComponent("music1.mp3")
    let music2 = Bundle.main.bundleURL.appendingPathComponent("music2.mp3")
    let music3 = Bundle.main.bundleURL.appendingPathComponent("music3.mp3")
    let music4 = Bundle.main.bundleURL.appendingPathComponent("music3.mp3")

    
    
    let url1 = Bundle.main.bundleURL.appendingPathComponent("music1.mp3")
    let url2 = Bundle.main.bundleURL.appendingPathComponent("music2.mp3")
    let url3 = Bundle.main.bundleURL.appendingPathComponent("music3.mp3")
    let url4 = Bundle.main.bundleURL.appendingPathComponent("music3.mp3")

    
    
    
    @IBOutlet weak var yourButton1: customButton!
    @IBOutlet weak var yourButton2: customButton!
    @IBOutlet weak var yourButton3: customButton!
    
    
    fileprivate var player1:AVAudioPlayer?
    fileprivate var player2:AVAudioPlayer?
    fileprivate var player3:AVAudioPlayer?

    
    
    @IBAction func pushButton1(sender: UIButton) {
        audioPlayer1(url: url1)
    }
    
    @IBAction func pushButton2(sender: UIButton) {
        audioPlayer2(url: url2)
    }
    
    @IBAction func pushButton3(_ sender: UIButton) {
        audioPlayer3(url: url1, url2: url2)
    }
    

    

    
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            if (player === player1) {
                yourButton1.isSelected = false
            } else if (player === player2) {
                yourButton2.isSelected = false
            } else if (player === player3) {
                yourButton3.isSelected = false
                player1!.play()
                yourButton1.isSelected = true
            }
        }
    
    
    
    
    
    func audioPlayer1(url: URL) {
        do {
            try player1 = AVAudioPlayer(contentsOf:url)
            player1!.play()
            yourButton1.isSelected = true
            player1!.delegate = self
        } catch {
            print(error)
        }
    }
    
    func audioPlayer2(url: URL) {
        do {
            try player2 = AVAudioPlayer(contentsOf:url)
            player2!.play()
            yourButton2.isSelected = true
            player2!.delegate = self
            
        } catch {
            print(error)
        }
    }
    func audioPlayer3(url: URL, url2: URL) {
        do {
            try player3 = AVAudioPlayer(contentsOf:url3)
            try player1 = AVAudioPlayer(contentsOf: url1)
            player3!.play()
            yourButton3.isSelected = true
            player3!.delegate = self
            player1!.delegate = self
        } catch {
            print(error)
        }
    }


}

/////////////works well///////////////////


//
//    @IBAction func pushButton3(_ sender: UIButton) {
//        audioPlayer3(url: url1, url2: url2)
//    }
//    
//    
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        if (player === player1) {
//            yourButton1.isSelected = false
//        } else if (player === player2) {
//            yourButton2.isSelected = false
//        } else if (player === player3) {
//            yourButton3.isSelected = false
//            player1!.play()
//            yourButton1.isSelected = true
//        }
//    }
//    
//    
//
//    func audioPlayer3(url: URL, url2: URL) {
//        do {
//            try player3 = AVAudioPlayer(contentsOf:url3)
//            try player1 = AVAudioPlayer(contentsOf: url1)
//            player3!.play()
//            yourButton3.isSelected = true
//            player3!.delegate = self
//            player1!.delegate = self
//        } catch {
//            print(error)
//        }
//    }
//}
