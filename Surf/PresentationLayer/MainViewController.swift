//
//  ViewController.swift
//  Surf
//
//  Created by Егор  Хлямов on 01.08.2023.
//

import UIKit

class MainViewController:  UIViewController {
    
    private let service: Singletone
    private let mainView: MainView
    
    let singletone = Singletone.shared
    init(mainView: MainView, service: Singletone) {
        self.mainView = mainView
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.didLoad()


    }
    override func loadView() {
        view = mainView
    }
    func EditDidTap(){
        singletone.isEditing.toggle()
        print(singletone.isEditing)
        mainView.reloadData()
        if singletone.isEditing{
            mainView.editButton.setImage(UIImage(named: "succes"), for: .normal)
        }
        else{
            mainView.editButton.setImage(UIImage(named: "pencil"), for: .normal)
        }
        //let height = topBarView.bounds.height + 110 + skillsStack.bounds.height + avatarView.bounds.height + nameLabel.bounds.height + cityLabel.bounds.height
    }
    func deleteSkill(indexPath:IndexPath){
        singletone.skills.remove(at: indexPath.row)
        mainView.reloadData()
    }
//    @objc func deleteItem(){
//        mainView.skillsStack.removeAllSubviews()
//            mainView.skillsCollection.removeFromSuperview()
//        
//        
//        mainView.scrollView.addSubview(mainView.skillsStack)
//        //let height = topBarView.bounds.height + 110 + skillsStack.bounds.height + avatarView.bounds.height + nameLabel.bounds.height + cityLabel.bounds.height
//        //scrollView.contentSize = CGSize(width: view.bounds.width, height: height  )
//    }
}


extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Обязательные методы UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Верните количество элементов в вашем UICollectionView
        let count = singletone.skills.count
        if singletone.isEditing{
            return count + 1
        }
        else{
            return count
        }
    }
    func getSkillCell(collectionView:UICollectionView,indexPath:IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SkillCell.reuseIdentifier,
            for: indexPath) as? SkillCell else{return UICollectionViewCell()}

        let skill = singletone.getSkills()[indexPath.row]
        cell.configure(model:skill,isEditing: singletone.isEditing,maxWidth: view.frame.width - 40)
        cell.onDeleteTapped = {[weak self] in
            guard let self = self else {return}
            self.deleteSkill(indexPath:indexPath)
        }
        return cell
    }
    
        func getAddCell(collectionView:UICollectionView,indexPath:IndexPath)-> UICollectionViewCell{
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AddCell.reuseIdentifier,
                for: indexPath) as? AddCell else{return UICollectionViewCell()}
            
            cell.onAddTapped = {[weak self] in
                self?.addSkill()
            }
            return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if singletone.isEditing, indexPath.row == singletone.skills.count{
            return getAddCell(collectionView: mainView.skillsCollection, indexPath: indexPath)
        }
        else{
            return getSkillCell(collectionView: mainView.skillsCollection, indexPath: indexPath)
        }
            
            
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if singletone.isEditing{
            if indexPath.row == singletone.getSkills().count - 1{
                addSkill()
            }
            else{
                singletone.skills.remove(at: indexPath.row)
            }
           // print(mainView.skillsStack.bounds.height)
            //deleteItem()
        }
        
        
    }
    func addSkill(){
        let alert = UIAlertController(title: "Add Folder", message: "Enter a name", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { [weak alert] (_) in
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            guard let textField = alert?.textFields![0] else {return}
            if textField.text != ""{
                self.singletone.skills.append(textField.text ?? "New Skill")
                self.mainView.reloadData()
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


extension UIView {
    func removeAllSubviews() {
        for subview in subviews {
            subview.removeAllSubviews()
            subview.removeFromSuperview()
        }
    }
}
