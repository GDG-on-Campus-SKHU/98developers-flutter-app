# What is ZIKIZA?
- This phrase in Korean has two meanings:
  - ***Let's protect the earth by practicing challenges related to the environment as individuals.***
  - ***Let's complete the challenge that we have participated in.***
- There are various and complex problems at play, so it is almost impossible for an individual to protect the environment alone.

- So, what happens when one or two individuals come together to form a majority?
- A challenge that is carried out by a majority makes it possible for others to monitor individuals. 
- Although you cannot see the progress of others, you can confirm the number of participants who continue to engage, which provides clear motivation.
- To ensure proper participation, the data of the participants is verified by actual inspectors. Users who continuously engage in improper participation can be subject to sanctions.

## Mobile(Google User)
<p align="left">
 <img width="195" alt="Clay-Home" src="https://user-images.githubusercontent.com/26790710/228124787-38ae5381-cfa2-4125-a4b5-ca51cc3eaf24.png">
 <img width="195" alt="Clay-Challenges" src="https://user-images.githubusercontent.com/26790710/228124794-76f4fc26-c3a5-4d89-a462-6c3c0e15b2e1.png">
 <img width="195" alt="Clay-Explore" src="https://user-images.githubusercontent.com/26790710/228127158-a8f1ef4e-4680-4c21-a8b0-ebe805cf473a.png">
 <img width="195" alt="Clay-Profile" src="https://user-images.githubusercontent.com/26790710/228129369-a2629f3c-cb37-48d7-a8ff-debd83f81500.png">
</p>

 > *figure 1: The initial screen that appears when logging in with a Google account*,
 > *figure 2: Navigated to the challenges screen*,
 > *figure 3: Navigated to the explore screen*,
 > *figure 4: Navigated to the explore screen*

<p align="left">
  <img width="195" alt="Clay-Enroll" src="https://user-images.githubusercontent.com/26790710/228129206-40a9f96f-438e-4f4d-ae42-5e09b6288496.png">
  <img width="195" alt="Clay-Purchase" src="https://user-images.githubusercontent.com/26790710/228126844-1bbe2f7e-3880-4c54-9bff-26c2f23dbc3c.png">
  <img width="195" alt="Clay-TakeShot" src="https://user-images.githubusercontent.com/26790710/228128022-d2427d5a-750e-406e-aef1-4b8bce6da0c8.png">
<img width="195" alt="Clay-Submission" src="https://user-images.githubusercontent.com/26790710/228128059-974d40ad-80bc-426f-8e43-e3c4e9701ca1.png">
</p>

> *figure 5: enroll button is join the user this challenge*,
> *figure 6: Navigated to payment screen*,
> *figure 7: Take shot*,
> *figure 8: Submission*

#### 1. On the Home screen, you can submit photos for challenges you are participating in and view the details of challenges currently in progress.
#### 2. Enhanced visual appeal through the application of dynamic colors
#### 3. Find available environmental challenges and register by paying the fees.
#### 4. Once the challenge starts, users take and submit certification photos at designated intervals during a set period of time.
#### 5. When the challenge begins, users need to take photos to confirm that they have completed the challenge at certain times throughout a specific period. These photos must then be submitted for verification.


## Web(Adminstrator)
> [Github](https://github.com/GDSC-SKHU/98developers-web)

## Server
> [Github](https://github.com/GDSC-SKHU/98developers-backend)

#### 1. Google Firebase
- Firebase to easily perform the Google login authentication process.

<img width="350" src="https://user-images.githubusercontent.com/26790710/227830407-9ae81496-e7df-4f8e-9b97-5f17c4f6914d.png" />

> *figure 1: [Using firebase cloud messaging in Springboot applications](https://www.baeldung.com/spring-fcm)*

- User Authenticate / Authorize using Firebase

  <img width="350" src="https://user-images.githubusercontent.com/26790710/227884400-323ef69f-8a57-4ae7-96df-121829e29b73.png" />
</p>

> *figure 2: [Create a Private Key in the Firebase Project Service Account](https://firework-ham.tistory.com/111)*
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

> *figure 4: [Google Cloud Storage bucket structure](https://firework-ham.tistory.com/111)*
- Google Cloud Storage is a service that stores objects in Google Cloud. At this point, the object refers to any form of file and stores the object in a container called a bucket.

  <img width="250" src="https://user-images.githubusercontent.com/26790710/227883960-58b7c3cc-3d9e-4794-b396-280cecb3c3c6.png" />

> *figure 5: [Create a bucket](https://cloud.google.com/storage/docs/discover-object-storage-console)*
- All buckets are connected to a project and can also be set up to allow the desired user to access the data in storage through project permissions.


### 4. Entity Relationship Diagram
<img width="300" src="https://user-images.githubusercontent.com/26790710/227912604-f8fcf316-f006-4236-9bae-25378942ce7e.png" /> 

---
## Members
|![yujinkim1](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/26790710?v=4&h=150&w=150&fit=cover&mask=circle&maxage=10d)|![devPark435](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/112539563?v=4&h=150&w=150&fit=cover&mask=circle)|![LEEHYUNBOK](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/34876989?v=4&h=150&w=150&fit=cover&mask=circle)|![yeeZinu](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/33426203?v=4&h=150&w=150&fit=cover&mask=circle)|
|:---:|:---:|:---:|:---:|
|[Yujin Kim](https://github.com/yujinkim1)|[Hyunryeol Park](https://github.com/devPark435)|[Hyunbok Lee](https://github.com/LEEHYUNBOK)|[Jinwoo Lee](https://github.com/yeeZinu)|
|[Gmail](mailto:yujinkim1.dev@gmail.com)|[Gmail](mailto:devpark435@gmail.com)|[Gmail](mailto:l.hn.bk0905@gmail.com)|[Gmail](mailto:doglife222@gmail.com)|
