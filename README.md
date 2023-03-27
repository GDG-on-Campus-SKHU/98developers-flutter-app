# What is ZIKIZA?
- This phrase in Korean has two meanings:
  - ***Let's protect the earth by practicing challenges related to the environment as individuals.***
  - ***Let's complete the challenge that we have participated in.***
- There are various and complex problems at play, so it is almost impossible for an individual to protect the environment alone.

- So, what happens when one or two individuals come together to form a majority?
- A challenge that is carried out by a majority makes it possible for others to monitor individuals. 
- Although you cannot see the progress of others, you can confirm the number of participants who continue to engage, which provides clear motivation.
- To ensure proper participation, the data of the participants is verified by actual inspectors. Users who continuously engage in improper participation can be subject to sanctions.

## Mobile
<p align="center">
  <img width="195" alt="ZIKIZA-Home" src="https://user-images.githubusercontent.com/26790710/227774317-9fad6d54-6bf5-4b56-a1fb-7833383286e9.png" />
  <img width="195" alt="ZIKIZA-Challenges" src="https://user-images.githubusercontent.com/26790710/227775005-2497884e-7fce-422c-925a-38e114877774.png" />
  <img width="195" alt="ZIKIZA-Explore" src="https://user-images.githubusercontent.com/26790710/227848330-5615fcd5-0642-40fc-96e1-61ea4cca9544.png">  
  <img width="195" alt="ZIKIZA-Submission" src="https://user-images.githubusercontent.com/26790710/227882074-b7dc35a8-3dc1-47e6-b176-c1327d471c0c.png" />
  <img width="195" alt="ZIKIZA-TakePhoto" src="https://user-images.githubusercontent.com/26790710/227882130-b178e979-2fe3-41d9-9694-2f2fb3c84d23.png" />
</p>

#### 1. Widget styling using Google Material Design 3
#### 2. Enhanced visual appeal through the application of dynamic colors
#### 3. Find available environmental challenges and register by paying the fees.
#### 4. Once the challenge starts, users take and submit certification photos at designated intervals during a set period of time.
#### 5. When the challenge begins, users need to take photos to confirm that they have completed the challenge at certain times throughout a specific period. These photos must then be submitted for verification.


## Web
> [Github](https://github.com/GDSC-SKHU/98developers-web)

## Server
> [Github](https://github.com/GDSC-SKHU/98developers-backend)

#### 1. Google Firebase
- Firebase to easily perform the Google login authentication process.

<img width="350" src="https://user-images.githubusercontent.com/26790710/227830407-9ae81496-e7df-4f8e-9b97-5f17c4f6914d.png" />

> *figure 1* [Using firebase cloud messaging in Springboot applications](https://www.baeldung.com/spring-fcm)

- User Authenticate / Authorize using Firebase

  <img width="350" src="https://user-images.githubusercontent.com/26790710/227884400-323ef69f-8a57-4ae7-96df-121829e29b73.png" />
</p>

> *figure 2* [Create a Private Key in the Firebase Project Service Account](https://firework-ham.tistory.com/111)
- It can be easily developed in a short development period, and login processing is easy on the web and app, so I used it.
- In addition, in order to save it to DB, you can receive the user's IDToken when you respond to the api, analyze it through the Firebase key, and save it.

<br />

### 2. Google Geocoding

- This allows recycling stores or community locations to be stored as latitude and longitude and displayed as Google Map markers.

<p align="center"> 
<img width="550" src="https://user-images.githubusercontent.com/26790710/227831391-5db82a45-337c-4f4d-880b-0cf5f4a8b8cb.png" />
</p>

- Utilizing a structure that returns latitude and longitude when given an address input.
- Save the corresponding data to the project database to create a Google Maps marker.


### 3. Google Cloud Storage
- To successfully store challenge verification photos on the server, we use Google Cloud Storage.

  <img width="250" src="https://user-images.githubusercontent.com/26790710/227833036-8f341d20-46ee-4eb8-b14c-3a540e6beabf.png" />

> *figure 4* [Ggoogle Cloud Storage bucket structure](https://firework-ham.tistory.com/111)
- Google Cloud Storage is a service that stores objects in Google Cloud. At this point, the object refers to any form of file and stores the object in a container called a bucket.

  <img width="250" src="https://user-images.githubusercontent.com/26790710/227883960-58b7c3cc-3d9e-4794-b396-280cecb3c3c6.png" />

> *figure 5* [Create a bucket](https://cloud.google.com/storage/docs/discover-object-storage-console)
- All buckets are connected to a project and can also be set up to allow the desired user to access the data in storage through project permissions.


### 4. Entity Relationship Diagram
<img width="300" src="https://user-images.githubusercontent.com/26790710/227912604-f8fcf316-f006-4236-9bae-25378942ce7e.png" /> 


## Contributors
- Yujin Kim | [Gmail](mailto:yujinkim1.dev@gmail.com) | [Github]()
- Hyunbok Lee | [Gmail](mailto:l.hn.bk0905@gmail.com) | [Github]()
- Jinwoo Lee | [Gmail](mailto:doglife222@gmail.com) | [Github]()
- Hyunryeol Park | [Gmail](mailto:devpark435@gmail.com) | [Github]()
