<div align="center">

<img src="https://raw.githubusercontent.com/so1s/.github/main/static/logo.png" alt="So1s Logo" width="50%" />

# So1s Helm Chart

Kubernetes, Helm 기반 Application 배포 패키지

[프로젝트 소개 페이지로 돌아가기](https://github.com/so1s)

</div>

## 사용 방법

이 레포는 Public Template으로 제공됩니다. 보일러플레이트로 사용하시려면 상단의 `Use This Template` 버튼을 눌러주세요!

Template의 형태로 복제하신 뒤, 포크된 레포에서 Sealed-Secrets와 연관된 Secrets를 정의하시고 깃에 반영하셔야 합니다. 


## 주요 기능

- Batteries included Helm Chart 구성
- Argo CD App of Apps 패턴을 통한 부트스트래핑 지원
- API 서버 / 백오피스 대시보드 구성
- Postgres와 Local Storage Provisioner를 통한 클러스터 내 백엔드 DB 구성
- GPU Operator 구성을 통한 Node GPU Discovery 기능 제공
- Grafana 기반 빌링 대시보드 제공
- Grafana 기반 SLI / SLO 대시보드 제공
- Grafana 기반 API / 인퍼런스 서버 메트릭 대시보드 제공
- Grafana 기반 Kubernetes CPU / Memory / GPU 모니터링 대시보드 제공
- DCGM Exporter를 기반으로 한 Prometheus GPU Metrics 기능 제공
- Promtheus Custom Metrics를 기반으로 한 HPA Rules 구성 기능 제공
- Bin Packing 알고리즘을 통한 Kubernetes Scheduler Plugin 구현, GPU 스케줄링 효율 개선
- External DNS를 통한 Ingress - Route 53 DNS 연동
- Wildcard DNS 기반 Ingress 구성, Istio Service Mesh를 사용한 Zero downtime 서브도메인 라우팅 & ELB 비용 절약
- EFK Stack을 활용한 로깅 수집, 대시보드 지원
- Fluent Bit를 활용한 메모리 효율적인 로깅 메트릭 수집 지원
- Kiali를 통한 실시간 트래픽 Tracing 대시보드 지원
- Sealed-Secrets를 활용한 Secret 비대칭 암호화 및 GitOps 기반 관리 지원

## 사용 기술

- Kubernetes
- Helm
- Argo CD
- Prometheus / Grafana
- External DNS
- Istio / Kiali
- NVIDIA GPU Operator / DCGM Exporter
- ElasticSearch / Fluent Bit / Kibana
- Sealed-Secrets
