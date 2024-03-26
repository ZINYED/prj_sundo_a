# 한강 수자원 관리 종합 플랫폼
![sundo_main](https://github.com/ZINYED/prj_sundo_a/assets/118190422/40c208a9-f193-430a-b4f1-4e44b3df0707)

### [✔ 전체 PPT](https://github.com/ZINYED/prj_sundo_a/files/14535816/sundo_a.pdf)

# 📖 프로젝트 소개 및 개요
- 한강 유역의 수자원 관리를 위한 종합 플랫폼
    - 수문 정보 관리, 수자원 시설물 관리, 물 사용 관리 등 수자원과 관련된 다양한 정보를 통합해 관리하는 GIS 기반의 시스템입니다.
    - 효율적인 한강 수자원 관리 솔루션을 마련하고 관련 기관 간 수자원 관리 효율성 확보를 목적으로 하였습니다.

&nbsp;
# 💻 시스템 프로세스
![sundo_process](https://github.com/ZINYED/prj_sundo_a/assets/118190422/0c2bc1ec-8189-426b-9303-02430af2ff23)

&nbsp;
# 🕛 프로젝트 기간
2023.12.04 ~ 2024.01.04

&nbsp;
# 🛠 개발환경 및 사용 기술
![sundo_use](https://github.com/ZINYED/prj_sundo_a/assets/118190422/189bb8ff-b9c7-4fac-939c-73f7ad55ebdb)

&nbsp;
# 🙌🏻 프로젝트 팀원 및 역할
|이름|역할|
|---|---|
|👑 팀장 이광현|실시간 수문 정보 관리 시스템 - 지도 구현, 수자원 시설물 관리 게시판|
|👑 팀원 강준우|수자원 시설물 관리 시스템 - 점검 결과 작성, 점검 이력 조회|
|👑 팀원 이진희|수자원 시설물 관리 시스템 - 고장 / 조치 결과 보고|
|👑 팀원 조미혜|관리자 시스템 - 사용자 관리, 운영 관리, 시스템 관리|
|👑 팀원 황인정|실시간 수문 정보 관리 시스템 - 관측소 관리 게시판, 관측소 정보 통계|

&nbsp;
# 📍 ERD
![sundo_erd](https://github.com/ZINYED/prj_sundo_a/assets/118190422/01f7b87f-ba25-4ab6-9184-b1ae2314be7b)

&nbsp;
# ✨ 나의 구현 기능
## 🏞 수자원 시설물 관리 시스템 - 고장 보고서
### 💧 고장 보고서
![error_list](https://github.com/ZINYED/prj_sundo_a/assets/118190422/85f1fa94-4939-43af-98da-8fac3057de0c)
- 고장 보고서, 조치 결과 보고서 탭 클릭 시 선택한 탭에 해당하는 목록으로 페이지가 전환됩니다.
- 검색 전에는 전체 보고서 목록이 조회되며, 시설물 종류, 작성자, 등록일자 등의 검색조건 입력 후 검색 시 검색 결과에 해당하는 보고서만 조회 가능합니다.
- ‘고장 보고서 작성' 버튼 클릭 시 새 고장 보고서 작성 가능하며, 각 고장 보고서의 '열기' 버튼 클릭 시 해당 고장 보고서의 상세 페이지로 이동합니다.

&nbsp;
### 💧 고장 보고서 작성
![error_write](https://github.com/ZINYED/prj_sundo_a/assets/118190422/dab943c0-8990-4694-9ae6-24bea40b1a99)
Ajax를 사용하여 시설물 종류(facility_category) 선택 시  
해당 시설물 종류에 해당하는 시설물 코드(facility_code)만 보여지도록 했으며,  
시설물 코드 선택 시 해당 시설물 코드에 대한 알람 중 alarm_flag가 등록되지 않은 알람만 조회되도록 했습니다.

&nbsp;
### 💧 고장 보고서 수정
![error_update](https://github.com/ZINYED/prj_sundo_a/assets/118190422/eeddbd0f-d8d1-4ffe-850f-a35d0964344b)
고장 보고서 수정 시 ALARM(알람) Table에서 BREAK_REPORT(고장보고) Table의 doc_no와  
ALARM Table의 break_report_no의 값이 같은 데이터를 모두 가져오고,  
해당 시설물(faclilty_code)에 해당하는 알람 중 alarm_flag가 없는 데이터를 모두 가져옵니다.

이후 alarm_flag를 비교하여 alarm_flag 값이 있는 알람 데이터는 체크된 상태,  
alarm_flag 값이 없는 알람 데이터는 체크되지 않은 상태로 보여지도록 했습니다.

&nbsp;
### 💧 고장 보고서 등록 / 수정 / 삭제 프로세스
![error_process](https://github.com/ZINYED/prj_sundo_a/assets/118190422/ed3f6f09-cbf6-4baa-978f-920eb0ebebc2)
고장 보고서는 **BREAK_REPORT**(고장보고), **ALARM**(알람), **WATER_RESOURCES**(수자원) Table과 연관되어 있습니다.

BREAK_REPORT Table에 Insert 시, **글 번호(doc_no)**는 **시퀀스**를 사용하여 등록되도록 했으며,  
이 때 생성된 doc_no는 ALARM Table에 체크된 알람 Update 시 **break_report_no**로 들어갑니다.  
또한, **체크된 알람**은 **alarm_flag 값**을 **Y**로 가지게 됩니다.

고장 보고서를 수정하면서 체크되어 있던 알람의 **체크를 해제**하거나, **고장 보고서를 삭제**할 경우,  
ALARM Table에서 **break_report_no**와 **alamr_flag**의 값을 모두 **null**로 변경합니다.

&nbsp;
## 🏞 수자원 시설물 관리 시스템 - 조치 결과 보고서
### 💧 조치 결과 보고서 작성
![action_write](https://github.com/ZINYED/prj_sundo_a/assets/118190422/d8713a3b-9b4f-4bcc-87b8-32d3e14bb07a)
Ajax를 사용하여 시설물 종류(facility_category) 선택 시, 해당 시설물 종류에 해당하는 시설물 코드(facility_code)만 선택이 가능하도록 했습니다.

시설물 코드 선택 후 '고장보고서 보기' 버튼을 클릭하면 BREAK_REPORT Table에서 동일한 facility_code가 입력된 모든 고장 보고서 데이터를 가져와 목록으로 보여줍니다.

위 목록에서 '열기' 버튼 클릭 시 상세 내용을 확인할 수 있어 등록된 고장 보고서를 확인하고 해당 고장 내역에 맞는 조치 결과 보고서 작성이 가능하도록 구현했습니다.




