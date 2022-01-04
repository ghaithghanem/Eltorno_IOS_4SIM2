
# Eltorno_IOS_4SIM2


##architecture mvvm
```python
-View Controller
-View Model
-Model
```
##Pod Install
```python
 -pod 'GoogleSignIn'
 -pod 'Alamofire'
 -pod 'DLRadioButton', '~> 1.4'
 -pod 'SwiftyJSON', '~> 4.0'
 -pod 'DropDown'
 -pod 'AlamofireImage', '~> 4.1'
 -pod 'Braintree', '~> 4.22.0'
 -pod 'GoogleMaps'
 -pod 'SendBirdUIKit' 
 -pod 'AppCenter'
```
##API
```python
 -GoogleSignIn
 -PayPal
 -MAP
 -FACEID
 -FingerPrint
 -QRCODE
```
##URLSession
```python
 The URLSession class and related classes provide an API for downloading data from and uploading data to endpoints indicated by URLs.
 UserAPI:
 -extension Data {}
 -extension UIImageView {}
 -struct Media {}
 -func generateBoundary() -> String {}
 -func DataBody(user:User, media: [Media]?, boundary: String) -> Data {}
 -func Signup()
 ![signup](https://i.postimg.cc/5tmNRRmw/signup.png)
 -func login()
 ![login](https://i.postimg.cc/xdQ1g2Lf/log.png)
 -func UpdateProfil()
 -func deleteProfil()
 -func forgotPassword()
 -func resetPass()
```
##Alamofire 
```python
 -tableView:
  ![table](https://i.postimg.cc/vBHHFtPC/tab1.png)
 -AF.request("http://localhost:3000/api/team/create/random/"+UserDefaults.standard.string(forKey: "_id")!, method: .post)
 ![table](https://i.postimg.cc/rwxpSm0Z/alamo1.png)
 -collectionView:
 -AF.request("http://localhost:3000/api/tournoi/create/random/"+UserDefaults.standard.string(forKey: "_id")!, method: .post)
```
