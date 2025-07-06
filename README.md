# Ark Dedicated Server (Dockerized)

이 저장소는 Ark: Survival Evolved 전용 서버를 Docker로 손쉽게 실행할 수 있도록 구성되어 있습니다.

## 프로젝트 구조

```
custom_ark/
├── ARK/                # ARK 서버 데이터 및 바이너리 (볼륨 마운트)
├── conf/               # 서버 및 arkmanager 설정 파일
│   ├── main.cfg
│   ├── .arkmanager.cfg
│   ├── GameUserSettings.ini.back
│   └── Gamey.ini.back
├── Dockerfile          # 커스텀 빌드용 Dockerfile
├── docker-compose.yaml # 서비스 정의 및 볼륨/포트 매핑
├── init.sh             # 컨테이너 시작 스크립트
└── .gitignore
```

## 빠른 시작

1. **이미지 빌드**
   ```bash
   docker build -t custom-ark-server ./custom_ark
   ```

2. **서버 실행**
   ```bash
   cd custom_ark
   docker-compose up -d
   ```

3. **접속**
   - 서버는 기본적으로 다음 포트로 오픈됩니다:
     - 7777/udp, 7778/udp, 27015/udp, 27020/tcp

## 주요 파일 설명

- `docker-compose.yaml`: ARK 서버 컨테이너 정의, 볼륨 및 포트 매핑, 환경 변수(SKIP_UPDATE, INSTALL_MODS) 지원
- `Dockerfile`: steamcmd 기반 이미지, arkmanager 설치 및 `init.sh` 실행
- `init.sh`: ARK 서버 설치/업데이트/모드설치/실행 자동화
- `conf/`: arkmanager 및 서버 설정 파일(마운트됨)
- `ARK/`: 서버 데이터 및 바이너리(외부 볼륨, 데이터 유지)

## 환경 변수

- `SKIP_UPDATE` (true/false): 컨테이너 시작 시 서버 업데이트 여부
- `INSTALL_MODS` (true/false): 모드 자동 설치 여부

## 참고

- 서버 설정은 `conf/` 내 파일을 수정하여 반영할 수 있습니다.
- 서버 데이터(`ARK/`)는 컨테이너 외부에 유지됩니다. 