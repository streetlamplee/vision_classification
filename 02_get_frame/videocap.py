import cv2
import subprocess
import time
import os

#init
video_dev = sys.argv[1]

#camera init
#현재 scrcpy 프로그램으로 안드로이드 핸드폰 카메라 프레임을 수신
subprocess.call(["/bin/bash",
                "sudo modprobe v4l2loopback video_nr=10 card_label='scrcpyCam' exclusive_caps=1"])

cap = cv2.VideoCapture(int(video_dev))
while True:
    ret, frame = cap.read()

    if not ret:
        break

    cv2.imshow('',frame)
    if cv2.waitKey(1) and 0xff == ord('q'):
        break
    time.sleep(1)
        
cv2.destroyAllWindows()

