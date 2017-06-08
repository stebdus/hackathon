#camera-webservice

## Summary: 
Here is a Python webservice called webservice.py written for this event.  Google won't help you with any information specifically about the script, but you will find lots of information about the libraries used in the script.  Proceed in steps.

### 1 - Setup the Raspberry Pi and take a photo
1. Install required prerequisites:
    * OS Package dependencies (hint: use `apt-get`): `python-pip fswebcam git` 
    * Python module dependencies (hint: use `pip`): `flask flask-restful boto3 elasticsearch`
    * On Windows: Additionally the Python module `pillow` and the [CommandCam](https://batchloaf.wordpress.com/commandcam/) photo software placed in same directory as `webservice.py`
2. Take a photo with `fswebcam` or `commandcam.exe`, transfer this to your laptop (`scp`, and maybe `winscp` are your friends), and verify the camera focus is good.  Repeat as necessary :-)

### 2- Setup the camera-webservice
1. Clone the repo from github (hint: use `git`)
1. Copy the camera-webserivce `config.json.example` to `config.json`
1. Update all parameters to meet your needs
1. For the `camera_command` parameter these might be helpful:
    * Example linux USB camera: `fswebcam -r 1280x720 --jpeg 85 --no-banner -S 20` (rasp2 is using an old USB camera. Preload the driver with LD_PRELOAD=/usr/lib/arm-linux-gnueabihf/libv4l/v4l1compat.so fswebcam test.jpg)
    * Example native raspberry camera module: `raspistill -o` (rasp3 is using the PI-Camera)
    * Example windows usb camera: `CommandCam.exe /quiet /filename`

### 3 - Run the Camera webservice
1. Start it up with `python webservice.py`.  Do you see any errors? Troubleshoot and fix them.
1. Use your browser to load `http://ip_address:8080`  Does it report that everything is ok?  If not, troubleshoot and fix them.
* To access the webservice you have to use a ssh tunnel. Here is an example with putty. after establishing the ssh connection, just open your web browser with `http://127.0.0.1:9080`
![ssh-tunnel](https://user-images.githubusercontent.com/19547781/26928554-d5ada37a-4c56-11e7-975a-7469569650fa.JPG)

### 4 - Take a photo
1. Use your browser to call the API over ssh:
 * `http://ip_address:9080/take_photo`
 *   Does it report that everything is ok?  Can you view your photo?  If not, troubleshoot and fix.
1. Use curl to call the API:
 * `curl http://ip_address:9080/take_photo`
 
 ### 5 - Check your S3 bucket
