# SQL 기반 이커머스 데이터 정제 및 표준화 프로젝트

## 프로젝트 개요
CSV 형태의 이커머스 이벤트 데이터를 MySQL Workbench에 적재한 뒤, SQL을 활용하여 데이터 조회, 정제, 표준화, 검수 과정을 수행한 프로젝트입니다.  
분석 이전 단계에서 필요한 데이터 품질 점검과 정제 흐름을 구현하는 데 초점을 두었습니다.

## 사용 환경
- MySQL Workbench
- MySQL
- CSV 데이터

## 수행 내용
- 원본 CSV 데이터를 `cosmetics_raw` 테이블에 적재
- 원본 데이터의 행 수, 컬럼 구조, 주요 값 분포 확인
- 결측치 및 데이터 품질 점검 수행
- `event_time` 날짜형 변환
- `event_type`, `brand` 문자열 표준화
- 빈 문자열을 `NULL`로 처리
- 품질이 낮은 `category_code`는 정제 테이블에서 제외
- 정제 완료 테이블 `cosmetics_clean` 생성
- 정제 후 validation 쿼리를 통해 결과 검수

## 결측치 처리 기준
핵심 컬럼인 `event_time`, `event_type`, `product_id`, `category_id`, `price`, `user_id`는 우선 결측 여부를 점검하였고, 주요 결측은 없는 것을 확인했습니다.  
보조 정보 성격의 `brand`, `user_session`은 빈 문자열을 `NULL`로 표준화하여 유지했습니다.  
`category_code`는 결측이 많고 동일 `category_id` 내 값의 일관성이 낮아 정제 테이블에서는 제외했습니다.

## 프로젝트 의의
이 프로젝트를 통해 SQL을 활용한 데이터 조회, 정제, 표준화, 검수 과정을 직접 수행했습니다.  
원본 테이블과 정제 테이블을 분리하여 관리함으로써, 데이터 품질 점검과 재현 가능한 전처리 흐름을 구성했습니다.
