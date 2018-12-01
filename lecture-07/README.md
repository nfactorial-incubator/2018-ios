## July 3 - Lecture 7 - Multithreading, Networking, Persistence

#### Lecture overview:

- Multithreading (GCD, concurrent/serial queues, qos, deadlocks)
- Networking (URLSession/Alamofire)
- Persistence (UserDefaults, File System, Keychain, CoreData, Realm)
- Cocoa Pods overview

### Homework - Suretgram

#### Requirements:
- Implement functionality that is shown on gif
- Tap on cancel button and then re-enter insgram username

#### Extras:
- Use collectionview 
- Improve UI
- Get other information about post (description, date ...)
- Check if user has closed account 
- Play video

#### How to use API?:

1. Make GET request to the following url, where instead of <username> you write user's nickname
```
https://apinsta.herokuapp.com/u/<username>
https://apinsta.herokuapp.com/u/aidarbob
```

2. Install [JSON Formatter](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en) to your Chrome browser
3. Use JSON Formatter to find appropriate field for img
4. Setup [Cocoa Pods](https://guides.cocoapods.org/using/getting-started.html) for your project
5. Use [Alamofire](https://github.com/Alamofire/Alamofire) for requests, and [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) for serialization, [Kingfisher](https://github.com/onevcat/Kingfisher) for setting images

Your `Podfile` should look something like this:

```
source 'https://github.com/CocoaPods/Specs.git'

platform: ios, '9.0'

use_frameworks!

target 'Suretgram' do
pod 'Alamofire', '~> 4.7'
pod 'SwiftyJSON', '~> 4.1'
pod 'Kingfisher', '~> 4.8'

end
```

#### Screenshots:

![Suretgram](https://raw.githubusercontent.com/n17r-resources/ios/master/lecture-07/Screenshots/demonstration.gif)
