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
  
  <img width="272" alt="Screen Shot 2022-12-11 at 10 13 50 PM" src="https://user-images.githubusercontent.com/71032586/206953108-d3aafce9-8226-4c96-a640-d205dacdf9e8.png">
<img width="267" alt="Screen Shot 2022-12-11 at 10 13 56 PM" src="https://user-images.githubusercontent.com/71032586/206953110-1d1cde82-3b89-4513-a6a7-21057bd86493.png">
<img width="264" alt="Screen Shot 2022-12-11 at 10 14 05 PM" src="https://user-images.githubusercontent.com/71032586/206953111-ed3bf3b7-88d6-45ed-bf0b-0edf0e995441.png">
<img width="266" alt="Screen Shot 2022-12-11 at 10 14 12 PM" src="https://user-images.githubusercontent.com/71032586/206953114-9ae73f6a-b3ac-43d3-89ff-c6b43d457370.png">
<img width="258" alt="Screen Shot 2022-12-11 at 10 14 18 PM" src="https://user-images.githubusercontent.com/71032586/206953116-7370b752-b587-4364-93a7-636f672aeb09.png">
<img width="265" alt="Screen Shot 2022-12-11 at 10 14 24 PM" src="https://user-images.githubusercontent.com/71032586/206953117-a817d5c4-20dc-4a11-8f5a-2103c8e52bdf.png">



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


