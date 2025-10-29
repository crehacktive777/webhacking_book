# 소문난 명강의: 크리핵티브의 한 권으로 끝내는 웹 해킹 바이블

## 톰캣 8 버전 다운로드
* 공식 홈페이지에서 8버전을 받을 수 없으므로, 8버전으로 설치하고 싶은 구독자분들은 아래의 링크를 통해 다운로드를 하시면 됩니다.
* 아파치 아카이브에 존재하는 설치파일이기 때문에 걱정하지 않으셔도 됩니다.
* 실습 시 톰캣 버전이 중요하지 않습니다. 다른 버전으로 설치하신 독자분은 그대로 진행하시면 됩니다.

[[다운로드]](https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.81/bin/apache-tomcat-8.5.81-windows-x64.zip)

## 실습 과정 가이드
**아래의 다운로드 링크를 통해 PDF 참조하여 소스코드 및 쿼리 세팅 과정을 진행하시면 됩니다.**

[[다운로드]](https://github.com/crehacktive777/webhacking_book/raw/refs/heads/main/%5B%EB%B6%80%EB%A1%9D%5D%20%EA%B0%80%EC%83%81%20%ED%99%98%EA%B2%BD%20%EA%B5%AC%EC%B6%95_%ED%81%AC%EB%A6%AC%ED%95%B5%ED%8B%B0%EB%B8%8C%EC%9D%98%20%ED%95%9C%20%EA%B6%8C%EC%9C%BC%EB%A1%9C%20%EB%81%9D%EB%82%B4%EB%8A%94%20%EC%9B%B9%20%ED%95%B4%ED%82%B9%20%EB%B0%94%EC%9D%B4%EB%B8%94.pdf)

## 실습 파일 구성 및 설명
* 총 4개의 디렉터리 구성
* insecure_board - 모든 취약점별 실습
* upload_example - 파일 업로드 취약점 실습
* url_example - URL 접근 제한 미흡 취약점 실습
* xss_example - XSS 취약점 실습

## 실습 파일 설치
1. 우측 상단 "Code" 초록색 버튼 클릭
2. "Download ZIP" 버튼 클릭 후 파일 다운로드 및 압축 해제
3. 압축 해제 된 4개의 디렉터리를, 톰캣 웹 디렉터리 "톰캣설치경로/webapps/ROOT"로 이동
4. insecure_board/common.jsp 파일을 열어서 MySQL 계정 정보 입력
5. MySQL 접속 후 insecure_board/query.txt 파일을 열어서 복사 후 MySQL 커맨드에 붙여 넣기

## 업데이트 공지
* 2024년 10월 28일 - 최초 업로드
* 2025년 10월 29일 - 톰캣 다운로드 정보
