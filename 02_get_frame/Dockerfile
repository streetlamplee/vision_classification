# 1. 파이썬 3.9 슬림 버전(가벼운 리눅스)을 베이스로 사용
FROM python:3.9-slim

# 2. 작업 폴더 설정
WORKDIR /app

# 3. 내 코드를 컨테이너 안으로 복사
COPY videocap.py .

# 4. 컨테이너가 켜질 때 실행할 명령어 (python main.py를 실행할 때 버퍼링 없이 즉시 출력하도록 -u 옵션 사용)
CMD ["python", "-u", "videocap.py", "10"]