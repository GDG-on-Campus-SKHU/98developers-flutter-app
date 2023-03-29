# What is ZIKIZA?

<img width="1000" alt="Goals" src="https://user-images.githubusercontent.com/26790710/228222572-7ca7d558-f39a-45c0-a3a2-6eade01174b6.png">

## Motivation

We are living in an increasingly polluted environment. The fact that the flowering season is a month earlier in spring indicates a lot to us. If the Earth does not become healthier, there will be no place for people to stay. That's why we have decided to provide solutions to protect the environment and address climate change.
We believed that individual efforts alone would have limited impact on environmental action. Moreover, we thought that without reasonable conditions, personal commitments to environmental protection would gradually weaken over time. That's why we decided to provide a challenge service to ensure that multiple environmental measures can be sustained continuously.

- ZIKIZA(지키자) phrase in Korean has two meanings:
  - ***Protect** the earth by practicing challenges related to the environment as individuals.*
  - ***Complete** the challenge that we have participated in.*

- So, what happens when one or two individuals come together to form a majority?

- Although you cannot see the progress of others, you can confirm the number of participants who continue to engage, which provides clear 
motivation.

- To ensure proper participation, the data of the participants is verified by actual inspectors. Users who continuously engage in improper participation can be subject to sanctions.

## Mobile(Google User)
<p align="left">
 <img width="195" alt="Clay-Home" src="https://user-images.githubusercontent.com/26790710/228124787-38ae5381-cfa2-4125-a4b5-ca51cc3eaf24.png">
<img width="195" alt="Clay-Challenges" src="https://user-images.githubusercontent.com/26790710/228132199-f6a672c4-4520-4aa4-9d18-c0031b84f05c.png">
 <img width="195" alt="Clay-Explore" src="https://user-images.githubusercontent.com/26790710/228127158-a8f1ef4e-4680-4c21-a8b0-ebe805cf473a.png">
 <img width="195" alt="Clay-Profile" src="https://user-images.githubusercontent.com/26790710/228129369-a2629f3c-cb37-48d7-a8ff-debd83f81500.png">
</p>

 > *figure 1: The initial screen that appears when logging in with a Google account*,
 > *figure 2: Navigated to the challenges screen*,
 > *figure 3: Navigated to the explore screen*,
 > *figure 4: Navigated to the explore screen*
 
- On the Home screen, you can submit photos for challenges you are participating in and view the details of challenges currently in progress.

<p align="left">
   <img width="195" alt="Clay-Enroll" src="https://user-images.githubusercontent.com/26790710/228132038-4a6a82c6-41e9-44b3-8c76-faaca4daf0dd.png">
<img width="195" alt="Clay-Purchase" src="https://user-images.githubusercontent.com/26790710/228132263-dc1f40fa-d787-4eb6-86ac-13f93a6f406a.png">
  <img width="195" alt="Clay-TakeShot" src="https://user-images.githubusercontent.com/26790710/228128022-d2427d5a-750e-406e-aef1-4b8bce6da0c8.png">
<img width="195" alt="Clay-Submission" src="https://user-images.githubusercontent.com/26790710/228128059-974d40ad-80bc-426f-8e43-e3c4e9701ca1.png">
</p>

> *figure 5: enroll button is join the user this challenge*,
> *figure 6: Navigated to payment screen*,
> *figure 7: Take shot*,
> *figure 8: Submission*

- Find available environmental challenges and register by paying the fees.
- Once the challenge starts, users take and submit certification photos at designated intervals during a set period of time.
- When the challenge begins, users need to take photos to confirm that they have completed the challenge at certain times throughout a specific period. These photos must then be submitted for verification.


## Web(Adminstrator)
> [Click here for more details](https://github.com/GDSC-SKHU/98developers-web)

## Server

### 1. Entity Relationship Diagram
<img width="450" src="https://user-images.githubusercontent.com/26790710/227912604-f8fcf316-f006-4236-9bae-25378942ce7e.png" />

> *figure 1: This illustrates the relational diagram of the our database.*

### 2. Google Firebase

<img width="350" src="https://user-images.githubusercontent.com/26790710/227830407-9ae81496-e7df-4f8e-9b97-5f17c4f6914d.png" />

> *figure 2: [Using firebase cloud messaging in Springboot applications](https://www.baeldung.com/spring-fcm)*

- We used Firebase for authentication / authorization handling.
- Firebase to easily perform the Google sign in process.

  <img width="350" src="https://user-images.githubusercontent.com/26790710/227884400-323ef69f-8a57-4ae7-96df-121829e29b73.png" />
</p>

> *figure 3: [Create a private key in the Firebase project service account](https://firework-ham.tistory.com/111)*

- It can be easily developed in a short development period, and login processing is easy on the web and app, so I used it.
- In addition, in order to save it to DB, you can receive the user's IDToken when you respond to the api, analyze it through the Firebase key, and save it.

<br />

### 3. Google Geocoding

<img width="550" src="https://user-images.githubusercontent.com/26790710/227831391-5db82a45-337c-4f4d-880b-0cf5f4a8b8cb.png" />

> *figure 4: [Geocoding API process](https://firework-ham.tistory.com/111)*

- This allows recycling stores or community locations to be stored as latitude and longitude and displayed as Google Map markers.
- Utilizing a structure that returns latitude and longitude when given an address input.
- Save the corresponding data to the project database to create a Google Maps marker.


### 4. Google Cloud Storage

<img width="350" src="https://user-images.githubusercontent.com/26790710/227833036-8f341d20-46ee-4eb8-b14c-3a540e6beabf.png" />

> *figure 5: [Google Cloud Storage bucket structure](https://firework-ham.tistory.com/111)*

- To successfully store challenge verification photos on the server, we use Google Cloud Storage.
- Google Cloud Storage is a service that stores objects in Google Cloud. At this point, the object refers to any form of file and stores the object in a container called a bucket.

<img width="350" src="https://user-images.githubusercontent.com/26790710/227883960-58b7c3cc-3d9e-4794-b396-280cecb3c3c6.png" />

> *figure 6: [Create a bucket](https://cloud.google.com/storage/docs/discover-object-storage-console)*
- All buckets are connected to a project and can also be set up to allow the desired user to access the data in storage through project permissions.

[> Click here for more details](https://github.com/GDSC-SKHU/98developers-backend)

---
## Members
|![yujinkim1](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/26790710?v=4&h=150&w=150&fit=cover&mask=circle)|![devPark435](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/112539563?v=4&h=150&w=150&fit=cover&mask=circle)|![LEEHYUNBOK](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/34876989?v=4&h=150&w=150&fit=cover&mask=circle)|![yeeZinu](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/33426203?v=4&h=150&w=150&fit=cover&mask=circle)|
|:---:|:---:|:---:|:---:|
|[Yujin Kim](https://github.com/yujinkim1)|[Hyunryeol Park](https://github.com/devPark435)|[Hyunbok Lee](https://github.com/LEEHYUNBOK)|[Jinwoo Lee](https://github.com/yeeZinu)|
|[Gmail](mailto:yujinkim1.dev@gmail.com)|[Gmail](mailto:devpark435@gmail.com)|[Gmail](mailto:l.hn.bk0905@gmail.com)|[Gmail](mailto:doglife222@gmail.com)|
