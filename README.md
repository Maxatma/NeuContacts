# NeuContacts
Demo Contacts application made  in neumorphism style

Done for the test task. The original task you can find in Contacts.pdf file in the current repository. 
(to run it, update pods at first)

![create](https://user-images.githubusercontent.com/7135226/77712951-c925c880-7007-11ea-80e1-54737ee06149.png)
![details](https://user-images.githubusercontent.com/7135226/77712960-ccb94f80-7007-11ea-8c4f-06a01d7d6fb5.png)
![contacts list](https://user-images.githubusercontent.com/7135226/77712963-cd51e600-7007-11ea-8662-0bb67dce6b4f.png)



Technologies used:

 - Language: Swift 4.2
 - Main Architectural pattern: MVVM + Router 
 - Dependency manager: CocoaPods 
 - Database: Realm
 - UI: Storyboard, xib, Autolayout, UIStackView, CALayer
 - Reactive Programming: ReactiveKit+Bond
 - Object JSON Mapping: ObjectMapper
 - Other libraries: IQKeyboardManager (handling keyboard appearance issues) 


Functionality description: 
- You can create contact, saving it to the database.
- You can view contact and delete it.
- There are some contacts every session initially loaded from the JSON file stored. 

