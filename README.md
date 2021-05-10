# aws-multi-account

### 1. AWS 계정
- main : AWS 한국 중부리전 리소스, 미국 On-premise 리소스
- sub : AWS 미국 동부리전 리소스

### 2. AWS 계정간 권한 설정
- sub 계정 IAM에서 main 계정 등록
- 참조1: https://thenewstack.io/terraform-on-aws-multi-account-setup-and-other-advanced-tips/
- 참조2: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user.html

### 3. aws cli 설정파일 예제
- ~/.aws/config: main 계정 IAM에 iac_terraform 으로 등록한 예제
<pre><code>
[profile main]
region          = ap-northeast-2

[profile sub]
role_arn        = arn:aws:iam::(AWS계정ID):role/iac_terraform
source_profile  = main
region          = us-east-1
</code></pre>

- ~/.aws/credentials
<pre><code>
[main]
aws_access_key_id = (ACCESS_KEY_ID)
aws_secret_access_key = (SECRET_ACCESS_KEY)
</code></pre>

- ~/.bashrc: role_arn 환경변수를 terraform에서 참조하기 위해 사용
<pre><code>
export TF_VAR_role_arn="arn:aws:iam::(AWS계정ID):role/iac_terraform"
</code></pre>

### 4. 네트워크 구성도
![sklsi-test-20210509](https://user-images.githubusercontent.com/3445899/117610788-45905200-b19d-11eb-85a4-a7038bbb908c.png)

