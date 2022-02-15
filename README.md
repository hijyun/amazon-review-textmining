# amazon-review-textmining
2020년 1월 동덕여대 텍스트마이닝 활용 공모전 코드 저장소

<br>

## 프로젝트 소개
* 아마존 에어프라이어 제품 리뷰를 크롤링 후 텍스트 마이닝
* 미국시장 내 솜솜 에어프라이어(가상의 제품) 프로모션 전략을 기획

<br>

**프로젝트 기간**
: 2019.12~2019.12
 
<br>
<br>
 

## 데이터 수집
소비자의 구매 의향을 좀 더 자세히 살펴보기 위해 아마존 최다 판매 제품인 코소리 에어프라이어의 리뷰를 3,966개 수집

 
<br>
<br>
 

## 시장 동향
<img width="434" alt="시장동향" src="https://user-images.githubusercontent.com/54613024/146327261-efd13d33-c73d-4d9b-8cd4-3df07c58e7da.png">
글로벌 시장조사기관 euromonitor의 보고서에 따르면 2018년 미국 소형 조리가전 수입시장의 한국 점유율은 4.56%의 비중으로 전체 수입국 중 4위입니다. 미국 소비자의 약 31%가 향후 1년 안에 에어프라이어 구매 의향이 있다고 답했으며, 미국 시장 내에서 소비자의 수요가 매년 증가하는 것을 볼 수 있습니다. 

 
<br>
<br>
 

## 타겟 소비자 분석
### 워드 클라우드
<img width="435" alt="빈도표" src="https://user-images.githubusercontent.com/54613024/146328652-340fb631-e92f-414f-8a15-6a3b23cd23b4.png">

<img width="399" alt="워드클라우드" src="https://user-images.githubusercontent.com/54613024/146328702-ba49aede-5808-482a-9be8-13bb3c72a287.png">

텍스트를 정제한 전체 리뷰의 단어 빈도를 살펴보면, cook, easy, time,food, clean 단어의 빈도가 높은 것을 확인할 수 있습니다. 
 
<br>
<br>
 

### LDA
<img width="608" alt="lda" src="https://user-images.githubusercontent.com/54613024/146328890-f399861f-c3b0-40b7-9197-966d6021e4d7.png">

토픽 모델링 분석으로 이 특징들을 구체화 시켜보면, cook easy에서 실용성을, time minutes에서 효율성을, easy product clean에서 편의성으로 토픽을 정의할 수 있습니다.
이에 따라 이번 프로모션은 실용성, 효율성, 편의성 이렇게 세 가지를 중점으로 기획했습니다.
이 3가지 키워드에 맞춰, 실용주의, 경험주의적 성향을 지닌 밀레니얼&Z세대를 타겟 소비자로 설정하였습니다. 
![target](https://user-images.githubusercontent.com/54613024/146329507-6078f695-c6ea-443e-94c2-df0e0cf06cc7.png)
 
<br>
<br>
 

## 감성 분석
<img width="671" alt="senti" src="https://user-images.githubusercontent.com/54613024/146329645-6a2dc7c5-c596-4957-ae0c-e5865fbd2be0.png">
구체적인 프로모션 전략을 세우기에 앞서, 방향성을 잡기위해, 전체평점에 대한 감성분석을 해보았는데요, 전체적인 그래프를 보았을 때 별점이 높을수록 감성지수도 높은 것을 확인해 볼 수 있습니다.

<img width="868" alt="bi-gram" src="https://user-images.githubusercontent.com/54613024/146329789-a609103c-ce59-44b3-acb1-7cb5389db2c7.png">
따라서, 긍정과 부정적인 면을 자세히 알기 위해, 평점 2점이하와 평점 4점이상으로 리뷰를 나누었고, 각각 바이그램분석을 해보았습니다. 먼저 2점 이하의 리뷰에서는 주로 타는 플라스틱 냄새에 대한 불만을, 4점 이상의 리뷰에서는 요리법과 관련된 리뷰가 가장 많았습니다. 두 그래프 공통적으로 코소리가 air fryer 구매자들에게 제공하는 레시피북에 대한 의견이 언급되었습니다. 에어프라이어 조리법은 기존 컨벡션 오븐과 다르기 때문에 레시피를 제공하는 것이 소비자들에게 도움이 되고, 그것이 리뷰에 큰 영향을 미친것으로 보입니다.

<img width="841" alt="detail-review" src="https://user-images.githubusercontent.com/54613024/146329924-a8683532-e996-4549-aa49-fce2a6e58283.png">
세부적으로 recipe book이 등장하는 리뷰 중 감성지수가 높은 리뷰와 낮은 리뷰를 뽑아보았습니다.
위의 리뷰는 recipe book의 조리법을 통해 맛있게 요리를 할 수 있었던 것에 대한 만족감이 드러납니다. 아래 리뷰는 기존 레시피 북 조리법에 대한 불만을 나타낸 것입니다. 
이전 슬라이드와 종합했을 때  코소리보다 실용적인 레시피북을 제공하고 활용하는 프로모션 전략을 세울 수 있었습니다.
 
<br>
<br>
 

## 바이그램 연결망 분석
<img width="871" alt="network" src="https://user-images.githubusercontent.com/54613024/146330075-4658d65e-a9a8-4b78-b26c-de7ca0db9f0a.png">
이런 레시피에 대한 관심은 바이그램 연결망에서도 확인할 수 있습니다.연결망에 요리명과 재료명들이 촘촘하게 연결되어 있는 것이 보이실 텐데요,
여기서 “chicken wings”,”pork chop”같은 요리명들은 앞의 평점 4점이상 리뷰 빈도 분석에서도 언급된 요리명들 입니다. 이를 통해 냉동식품과 즉석식품에 관련된 간단한 조리법에 대한 수요가 높다는 것을 추론 할 수 있고, 또한 사람들이 많이 조리한 요리 종류를 파악하여 추후 레시피북에 활용 할 수 있을 것으로 보입니다.
 
<br>
<br>
 


## 프로모션 전략
![market](https://user-images.githubusercontent.com/54613024/146330678-7dde34b7-ed11-42b0-8d5b-b2613aae4a2c.png)
첫번째 전략은 체험마케팅으로 Publix와 협력하여 시식코너와 레시피를 제공하는 것입니다. 
Publix는 작은 주방을 두고, 직접 개발한 레시피로 시식 코너를 운영하고 있습니다. 소비자가 실제로 에어프라이어로 요리하는 과정을 보고, 맛 봄으로써 에어프라이어의 성능을 직접 체감하는 것은 큰 광고효과를 낼 수 있습니다. 또한 Publix는 자체 개발한 레시피를 배포하는데 여기에 솜솜 에어프라이어 레시피를 제공하면 소비자는 배포된 레시피를 보고 더 다양하게 활용할 수 있어 구매장벽을 낮출 수 있습니다. 

![motomarket](https://user-images.githubusercontent.com/54613024/146330746-78f4a0d1-5f16-4b69-9978-bbd9a5523902.png)
두번째 전략은 주유소 내 편의점에 에어프라이어와 레시피북을 비치하는 것 입니다. 타겟 소비층의  경험과 체험을 중시하는 특성과 미국 편의점의 약 80%가 주유소에 있다는 통계를 고려한 전략입니다. 
주유소 내 편의점에 에어프라이어를 놓아 자주 접할 기회를 제공하면 저희 브랜드에 대한 친숙함을 심어 줄 수 있고, 이는 브랜드의 호감도 상승으로 이어질 것입니다.여기에 텍스트 마이닝을 했을 때 높은 빈도로 추출된 요리들은 냉동 식품들이었습니다. 이에 따라 편의점에서도 간단히 만들어 먹을 수 있는 음식들로 레시피 북을 구성할 예정입니다.

![youtube](https://user-images.githubusercontent.com/54613024/146330276-ab65d27c-bbe1-40af-bfda-a6d068fbc602.png)

마지막 전략은 유튜브 광고 입니다. 이 전략은 밀레 z세대가 사진·영상 위주의 소셜미디어를 선호한다는 점을 겨냥한 전략입니다.
인기 셰프인 고든램지가 직접 에어프라이기로 간단한 조리 과정을 보여주고, 솔직하게 맛에 대한 평가를 방송하는 것으로 소비자의 호기심과 구매욕구를 자극할 수 있을 것입니다.
