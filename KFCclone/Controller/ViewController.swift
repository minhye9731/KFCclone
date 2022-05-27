//
//  ViewController.swift
//  KFCclone
//
//  Created by 강민혜 on 5/23/22.
//

//import SnapKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    // 현재페이지 체크 변수 (자동 스크롤시 필요)
    var nowPage: Int = 0
    
    // 데이터 배열
    let dataArray: Array<UIImage> = [UIImage(named: "adimage1.jpeg")!, UIImage(named: "adimage2.jpeg")!, UIImage(named: "adimage3.jpeg")!, UIImage(named: "adimage4.jpeg")!, UIImage(named: "adimage5.jpeg")!, UIImage(named: "adimage6.jpeg")!, UIImage(named: "adimage7.jpeg")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollectionView.delegate = self // 델리게이트와 데이터소스를 누가 처리할지 작성
        bannerCollectionView.dataSource = self
        
        bannerTimer() // 광고배너 자동스크롤
        
        showPopup() // 앱 접근권한 요청 팝업 (위치/카메라/사진)
        requestNotificationPermission() // 푸시 알림 권한 요청
    }
    
    // MARK: - 앱 접근권한 팝업
    func showPopup() {
        let appAccesStoryBoard = storyboard?.instantiateViewController(identifier: "AppAccessPopupViewController") as! AppAccessPopupViewController
        
        self.addChild(appAccesStoryBoard)
        appAccesStoryBoard.view.frame = self.view.frame
        self.view.addSubview(appAccesStoryBoard.view)
        appAccesStoryBoard.didMove(toParent: self)
    }
    
    // MARK: - 푸시 알림 권한 요청
    func requestNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
            if didAllow {
                print("Push: 권한 허용")
            } else {
                print("Push: 권한 거부")
            }
        })
    }
    
    // MARK: - 자동스크롤 배너 메서드
    // 2초마다 실행되는 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    // 배너를 움직이도록 하는 메서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == dataArray.count-1 {
        // 맨 처음 페이지로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    

}

// MARK: - 자동스크롤 컬렉션뷰 설정
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imgView.image = dataArray[indexPath.row]
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width  , height:  bannerCollectionView.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}














