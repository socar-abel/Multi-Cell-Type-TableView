# Multi Cell Type TableView

![multiCellType](https://user-images.githubusercontent.com/61315014/179416864-558b443c-5e10-4b54-9570-86328eae32cc.gif)  
  
백엔드에서 여러가지 형태의 table cell 데이터가 내려올 때, 어떻게 common 한 코드를 작성할 수 있을지 고민해봤습니다.  
  
Server Driven UI 로 활용되는 것을 목표로 합니다.  
  
이미 약속한 뷰타입 내에서, 백엔드 json 데이터의 변경만으로도 UI 를 변경할 수 있도록 합니다.   


- 셀 종류 -> 텍스트 한 줄 : OneLineCell / 텍스트 두 줄 : TwoLineCell / 이미지 : OneImageCell
- OneLineCell, TwoLineCell, OneImageCell 들이 CommonCell 프로토콜을 채택
- CommonCellFactory 에서 CommonCell 을 생성
- CustomDataSource 의 delegate 메서드에서 CommonCellFactory 사용
- CustomTableView 가 CustomDataSource 를 dataSource 로 채택  
  
  
블로그 포스팅 : https://velog.io/@heyksw/Server-Driven-UI-Multi-Cell-Type-Custom-Table-View  
