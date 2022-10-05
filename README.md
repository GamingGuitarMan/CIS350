# CIS 350 - Intro to Software Engineering  
---
## Stock it - A reminder app so you never run out of food again  
## Made by:  

### Alex Young | G01702562  
### Nathan Jorgensen | G02343367  
### Mohamed Abdirahman | G0164385 
 

---
# 1. Abstract  
One issue all of us in the team, and many others face, is getting distracted as our lives get ever more complex and busy. When commuting, or in passing time, people generally worry about what to do next, and what is coming up. It is not uncommon for me to wake up, only to realize I had run out of ceral the day before, and have to go without breakfast. Or perhaps getting home after a long day, only to realize I needed to pick up milk in order to cook the meal that was planned. I either have to sacrifice the precious and limited time I have to get the required groceries, or sacrifice nutrition. That is where the idea of our mobile app "Stock it," comes into play. Our app will notify the user when they are on their way home that they are running low on their favorite grocery items, so that they do not forget to pick it up from the store. When you buy your item, simply scan the reciept, and the app will automatically add your items into your virtual pantry. Based on the size and user input, the app will then notify you when you are low, and the process will continue without ever having to interupt your daily life for forgetten items.
  
  
--- 
# 2. Introduction  
In our app, it will start by asking the user to make an account and setup a profile. This profile will save and store the items in there account which will be unique to them and only them. Then the user can scan in an item's barcode to add it to their inventory, it will also ask for qunatity and how often the eat and or drink the item. With all this information it will notify them when they are low and whic local grocery stores have it in stock.
  
    
---
# 3. Design  
  The overall design for our app uses all free platforms for all aspects of our development stack. With this we can ensure the most risk-free development process possible. 

  
## 3.1 Stack Design  

  The stack of our app starts with MongoDB as our database. The free version using the AWS platform from Amazon is a hassle-free way to set up a database quickly and efficiently. We then connected that to our server, ************** . This then connected to our front-end user interface, developed using Flutter. We chose Flutter due to it's relative simplicity in the code, and it's ability to be used for iOS and Android alike. Reaching the widest audience is in our best interest if we want to help the most amount of people, and have our app be as widely known as possible. Not only this, but we did not want to exclude any particular subset of people that have a mobile phone.  

## 3.2 Class Diagram  
<img width="628" alt="Screen Shot 2022-10-04 at 9 47 19 PM" src="https://user-images.githubusercontent.com/71032586/193961838-81cd0e8b-0770-4e68-a27a-1f8efa9095fc.png">

![BackEnd UML](https://user-images.githubusercontent.com/50177364/193965701-6af769eb-9310-4c40-ac8c-1791e0752937.PNG)

## 3.3 Sequence Diagram  

Login
![Login Sequence](https://user-images.githubusercontent.com/50177364/193960858-e047f429-1a94-4f40-b10c-75538f09a9c9.PNG)

Edit
![Sequence Edit](https://user-images.githubusercontent.com/50177364/193960825-3b29974e-14f5-4eb6-aa0a-e37338f6fed1.PNG)

## 3.4 Use Case Diagram  
<img width="628" alt="Screen Shot 2022-10-04 at 9 47 19 PM" src="https://user-images.githubusercontent.com/71032586/193961838-81cd0e8b-0770-4e68-a27a-1f8efa9095fc.png">

Login
![Login Use-Case](https://user-images.githubusercontent.com/50177364/193960771-6f350f50-1d8d-4a73-9c45-28a996d24132.PNG)

Edit
![Use-Case Edit](https://user-images.githubusercontent.com/50177364/193960787-bc9abc02-6170-4e58-ab04-bf76a91961ec.PNG)

![Use Case Diagram](UseCaseDiagram.pdf)
___
<img src="UseCaseDiagram.pdf" alt="Use Case Diagram" width="200"/>
___  

![Use Case Diagram](https://github.com/GamingGuitarMan/CIS350/blob/main/UseCaseDiagram.pdf "Use Case Diagram")

# 4. User Interface  
  <img width="208" alt="Screen Shot 2022-10-04 at 9 25 56 PM" src="https://user-images.githubusercontent.com/71032586/193959633-1687c495-bf04-4959-bf56-7c91fdcc0ba7.png">

