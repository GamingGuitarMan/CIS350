# CIS 350 - Intro to Software Engineering  
---
## Stock it - A reminder app so you never run out of food again  
## Made by:  

### Alex Young | G01702562  
### Nathan Jorgensen | G02343367  
### Mohamed Abdirahman | G0164385 
 

---
# 1. Abstract
One issue all of us have as a team and many others face, is getting distracted as our lives get ever more complex and busy. When commuting, or in passing time, people generally worry about what to do next, and what is coming up. It is not uncommon for me to wake up, only to realize I had run out of cereal the day before, and have to go without breakfast. Prehaps after getting home from a long day, I realize that I needed to pick up milk in order to cook the meal that was planned. I either have to sacrifice the precious and limited time I have to get the required groceries, or sacrifice nutrition. That is where the idea of our mobile app "Stock it," comes into play. Our app will notify the user when they are on their way home that they are running low on their favorite grocery items, so that they do not forget to pick it up from the store. When you buy your item, simply scan the receipt, and the app will automatically add your items into your virtual pantry. Based on the size and user input, the app will then notify you when you are low, and the process will continue without ever having to interupt your daily life for forgetten items.
  
  
--- 
# 2. Introduction 
 In our app, it will load a blank screen with a menu where the user can select add item. The user is able to store their items and the expected shelf life for that item. The user can then edit or remove that item, and add additional items. A user can also select a date and time in which they want to go grocery shopping, and when the time a user has set arrives, a notification is then sent to the phone so the user does not forget to shop, or any items they need when they shop. The shelf life of the items also lets the user know what they have currently, but will be out of by the time the next shopping trip comes around. Overall, the app is a great way for a user to keep track of and oragnize their shopping items to save time and effort on making lists and remembering they need to shop.
 
---
# 3. Design 
The user-interface in our app is made from flutter which is coded in Dart. For testing our app, we are using an android emulator made from Android Studio, and then run from Visual Studio Code. Our database and server is Firestore in Firebase. For our documentation, we are using Markdown. Finally, Use Case Diagrams and Sequence Diagrams are created in Lucid Chart.

## 3.1 Stack Design  

The stack of our app implements a serverless software architecture by using Firebase. This is an easy and hassle-free way to set up a server and database that handles the back end logic. This then connected to our front-end user interface, developed using Flutter and coded in the language of Dart. Flutter handles much of the logic we need for the user, and connects seemlessly with Firebase so we don't have to worry about service maintainence or database management. 
                                     
   ![image](https://user-images.githubusercontent.com/50177364/206883157-1cf902d1-4f83-4ff4-9fa2-48d471b545b3.png)

## 3.2 Class Diagram  
UML

![image](https://user-images.githubusercontent.com/50177364/206908209-5f3691f3-ab1c-42f1-801f-1038ca14fbe5.png)

## 3.3 Use Case Diagram  

![image](https://user-images.githubusercontent.com/50177364/206883888-3c3db1c3-1398-439b-9380-1e65f1f04a53.png)

## 3.4 Sequence Diagram  
Add

![image](https://user-images.githubusercontent.com/50177364/206885544-8871c05d-c9da-43f5-88cf-94adab2fc86b.png)

Update

![image](https://user-images.githubusercontent.com/50177364/206885630-3e507502-284f-44bc-9f86-f6a3aaf1ebd1.png)

Remove

![image](https://user-images.githubusercontent.com/50177364/206885707-64cc61ee-d336-4b10-a721-277e4bd9cc51.png)

Set Restock Date

![image](https://user-images.githubusercontent.com/50177364/206885860-199bbd9e-fe8a-4d80-918c-e04057f2cc30.png)

# 4. User Interface  
  <img width="208" alt="Screen Shot 2022-10-04 at 9 25 56 PM" src="https://user-images.githubusercontent.com/71032586/193959633-1687c495-bf04-4959-bf56-7c91fdcc0ba7.png"> 
  Login Screen
  <img width="208" alt="Screen Shot 2022-10-05 at 9 28 52 AM" src="https://user-images.githubusercontent.com/71032586/194072316-d7d4eb34-995a-4426-996b-a469fa123c17.png"> 
  Inventory Screen
<img width="205" alt="Screen Shot 2022-10-05 at 9 29 28 AM" src="https://user-images.githubusercontent.com/71032586/194072414-57250f36-cffc-45e7-8cc7-3a44f05ca825.png"> 
Add Item Screen


--
# 5. Risk analysis and Retrospective:

1. What were the risks, what were the problems, how did you deal with them during the
project.

 We encountered several challenges while developing our app, including difficulties with communication between our platforms and with the android emulator. We were able to resolve these issues by checking our terminal and making sure the path for flutter was pointing to the correct Android SDK.

Another challenge we faced was the lack of a display screen, which made it difficult to build on our progress and fix errors. To overcome this, we focused on creating a solid foundation and then adding new features and functionality.

One risk we considered was the database updates for added or deleted items. Initially, we only planned to include an "add item" feature, but realized that it would not be useful without a corresponding "remove/delete" button. This added complexity to our app, but we believed it was necessary for a complete user experience.

Finally, testing our app with flutter and Github proved to be a challenge, as the two tools did not always work well together. Despite these obstacles, we were able to overcome them and deliver a functional app."



2. What was done and what could have been done better.

  One potential improvement for the test would be to also include a test for the case where the "saveUpdateItem" function is used to update an existing item in the collection. This could be done by adding an initial item to the collection, calling the "saveUpdateItem" function with the updated values, and then verifying that the item in the collection was indeed updated with the new values.

Additionally, it would be a good idea to include a "setUp" function to clear the "items" collection before each test is run, to ensure that the tests are independent and do not interfere with each other. This could be done by calling the clear() method on the "collectionReference" object before each test.


