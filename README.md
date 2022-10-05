# CIS 350 - Intro to Software Engineering  
---
## Stock it - A reminder app so you never run out of food again  
## Made by:  

### Alex Young | G01702562  
### Nathan Jorgensen | G02343367  
### Mohamed Abdirahman | G0164385 
 

---
# 1. Abstract  
One issue all of us have as a team and many others face, is getting distracted as our lives get ever more complex and busy. When commuting, or in passing time, people generally worry about what to do next, and what is coming up. It is not uncommon for me to wake up, only to realize I had run out of cereal the day before, and have to go without breakfast. Prehaps after getting home from a long day, I realize that I needed to pick up milk in order to cook the meal that was planned. I either have to sacrifice the precious and limited time I have to get the required groceries, or sacrifice nutrition. That is where the idea of our mobile app "Stock it," comes into play. Our app will notify the user when they are on their way home that they are running low on their favorite grocery items, so that they do not forget to pick it up from the store. When you buy your item, simply scan the reciept, and the app will automatically add your items into your virtual pantry. Based on the size and user input, the app will then notify you when you are low, and the process will continue without ever having to interupt your daily life for forgetten items.
  
  
--- 
# 2. Introduction  
In our app, it will start by asking the user to make an account and setup a profile. This profile will save and store the items in there account which is unique to them. Then the user can scan in an item's barcode to add it to their inventory, it will also ask for quantity and how often the eat and or drink the item. With all this information, it will notify them when they are low and whic local grocery stores have it in stock.
  
    
---
# 3. Design  
The overall design for our app uses all free platforms for all aspects of our development stack. With this we can ensure the most risk-free development process possible. 


## 3.1 Stack Design  

The stack of our app starts with MongoDB as our database. The free version using the AWS platform from Amazon is a hassle-free way to set up a database quickly and efficiently. This then connected to our front-end user interface, developed using Flutter. We chose Flutter due to it's relative simplicity in the code, and it's ability to be used for iOS and Android alike. Reaching the widest audience is in our best interest if we want to help the most amount of people, and have our app be as widely known as possible. Not only this, but we did not want to exclude any particular subset of people that have a mobile phone.  

## 3.2 Class Diagram  
<img width="628" alt="Screen Shot 2022-10-04 at 9 47 19 PM" src="https://user-images.githubusercontent.com/71032586/193961838-81cd0e8b-0770-4e68-a27a-1f8efa9095fc.png">

![BackEnd UML](https://user-images.githubusercontent.com/50177364/193965701-6af769eb-9310-4c40-ac8c-1791e0752937.PNG)

## 3.3 Use Case Diagram  


![UseCaseDiagram-1](https://user-images.githubusercontent.com/77644964/194074271-d9d35b2e-fe64-4594-bee2-02b41624d304.png)


## 3.4 Sequence Diagram  
Login

![Login Sequence](https://user-images.githubusercontent.com/50177364/193960858-e047f429-1a94-4f40-b10c-75538f09a9c9.PNG)

Edit

![Sequence Edit](https://user-images.githubusercontent.com/50177364/193960825-3b29974e-14f5-4eb6-aa0a-e37338f6fed1.PNG)

Manually Add

![CIS350-Project-SequenceDiagram-ManuallyAddUseCase-1](https://user-images.githubusercontent.com/77644964/194074221-446a8504-bd93-4316-bb1b-5491e309c3c3.png)

Remove

![CIS350-Project-SequenceDiagram-RemoveUseCase-1](https://user-images.githubusercontent.com/77644964/194074245-846d8e59-5858-43ad-a1f0-ea8bc475b3e9.png)

Scan Use

![CIS350-Project-SequenceDiagram-ScanUseCase-1](https://user-images.githubusercontent.com/77644964/194074259-c3f65c07-8186-45bc-8f92-4a46101a88bc.png)



# 4. User Interface  
  <img width="208" alt="Screen Shot 2022-10-04 at 9 25 56 PM" src="https://user-images.githubusercontent.com/71032586/193959633-1687c495-bf04-4959-bf56-7c91fdcc0ba7.png"> 
  Login Screen
  <img width="208" alt="Screen Shot 2022-10-05 at 9 28 52 AM" src="https://user-images.githubusercontent.com/71032586/194072316-d7d4eb34-995a-4426-996b-a469fa123c17.png"> 
  Inventory Screen
<img width="205" alt="Screen Shot 2022-10-05 at 9 29 28 AM" src="https://user-images.githubusercontent.com/71032586/194072414-57250f36-cffc-45e7-8cc7-3a44f05ca825.png"> 
Add Item Screen

