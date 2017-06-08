# hackathon - St. Pölten


# Your challenge
1. Turn a Raspberry PI into a camera
2. Create a web service, that takes a photo, puts it in a S3 object storage and saves metadata in Elasticsearch
3. Create a containerised web app, that shows available cameras and can call your web service

![alt text](https://cloud.githubusercontent.com/assets/917241/20307810/701dfb10-ab41-11e6-9a54-3658da774bd0.png)


Software in this repo includes two services:

* **camera-webservice**: Web service that exposes a RESTful API to use a local webcam to take a photo, upload it to an S3 target, and posts metadata to ElasticSearch.  The service is written in Python and configured using a json formatted conf file. This service can be deployed on a raspberry pi or your laptop.

* **webapp**: Web app that queries ElasticSearch for available cameras and existing photos and displays them. Also allows taking new photos by calling the RESTful API of the camera-webservice.  This app is written in Ruby and includes a Dockerfile for containerized use.


# Access to compute environment
![hackerthon_rasp1](https://cloud.githubusercontent.com/assets/19547781/26785468/d460cf66-4a02-11e7-9513-3bf331af2a0d.png)
* Domain name for raspberry access: See whiteboard (use ssh)
* User: pi
* Passwd: letMe!n

# Access the S3 storage environment
* Domain name for S3 access: See whiteboard

#### User: group1
* Access Key ID: OVM1VCC08WJ79OYJP2ET
* Secret Access Key: cbcBxPBJPDp/o14hewnvtEgu0LSUPxho+iUiQgTD
 
#### User: group2
* Access Key ID: 25Q9R91DFY5SCBWSFMM7
* Secret Access Key: C9B19B++T/oFpsbBIVniVeMTy6XmVPXFf4lFA1Di
 
#### User: group3
* Access Key ID: UGZWGFLJV5KEWH85DZPC
* Secret Access Key: xH3TgDBTpP9UKmP5i4wSPnDF71LpPVylVrDQZWol
 
#### User: group4
* Access Key ID: 255S3GEQKOXYY8SIZJFU
* Secret Access Key: UM7rgzUaCJyo4+hvpUXARtNeFDWF4RE3fBusKcGR
 
#### User: group5
* Access Key ID: H424JOIIRN71V06ZRSN4
* Secret Access Key: q2GGMAzeA/sgknPgtjqyC7aDyB3Sb+CpJljtuopW


## Getting help
* Google and YouTube are your best friends. If you have a question, are getting an error message, or need to learn something, then google first
* If you then get stuck, ask your teammates
* If you are still stuck, ask Stefan for help

## Hacking steps

As with any tech challenge proceed in steps and verify all is well (including your knowledge) before continuing. 

### Setup your infrastructure

1. Build your Raspberry Pi and access it via SSH.  What linux does it run?  Is your internet access working?  Use `curl` to read `http://www.google.com`
1. Setup your S3 bucket on the StorageGrid Webscale system (see credentials on whiteboard):
 * Install a S3 browser tool like "*S3 browser*" for Windows or "*CyberDuck*" for Mac 
 * Create a bucket for your Pi using the credentials supplied; pick a bucket name that is unique for your team
 * Use your S3 client to put stuff in the bucket and get it out
 * Try to access the stuff in the bucket from your web browser.  What URL would you use?  Do you get access denied?  Then set the [bucket_policy.json](bucket_policy.json) to allow anonymous `read` and `list` anonymous access to objects and try again.
 * Note: CyberDuck won't allow you to set Bucket Policies, so you will have to do this another way. Ask Stefan if you can't google it :-) (Hint: s3cmd or aws cli)

### Setup the camera-webservice on the Raspberry Pi
1. Find the steps here: [camera-webservice/](camera-webservice/)

### Setup the webapp on your laptop
1.  Find the steps here: [webapp/](webapp/)

> Can you take photos from your camera using the webapp and see the results?  Yes, Success!

## Do more!
The repository has a file called [OtherHackerIdeas.md](OtherHackerIdeas.md). Attack one of those idea or come up with your own.
