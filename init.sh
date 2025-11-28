#!/bin/bash

# 실행 중인 이 스크립트의 절대 경로를 저장 (자기 자신 실행 방지용)
THIS_SCRIPT=$(readlink -f "$0")

echo "📂 Searching for .sh files recursively..."

# find 명령어로 현재 위치(.)부터 하위의 모든 .sh 파일 탐색
# sort를 추가하여 파일명 순서대로 실행되도록 함 (필요 없으면 제거 가능)
find . -type f -name "*.sh" | sort | while read script; do
    
    # 찾은 파일의 절대 경로 구하기
    SCRIPT_PATH=$(readlink -f "$script")

    # 자기 자신이 아닐 경우에만 실행
    if [ "$SCRIPT_PATH" != "$THIS_SCRIPT" ]; then
        echo "--------------------------------"
        echo "🚀 Executing: $script"
        
        # 스크립트 실행 (에러 발생 시에도 계속 진행하려면 그냥 bash "$script")
        bash "$script"
        
        echo "✅ Finished: $script"
    fi
done

echo "--------------------------------"

sudo kubectl apply -f ./00_deploy/
