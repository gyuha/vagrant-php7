# Vagrantfile for PHP7.2

![vagrantfile](https://www.datocms-assets.com/2885/1506457090-blog-vagrant-list.svg)

## 설치 소프트웨어

- Ubuntu 18.04
- PHP 7.2
- Node.js 10
- nginx
- mysql 5.7
- 그외 기타 유틸...



## 작업 공간 만들기

> ./workspace

이 폴더의 `workspace/site/public`가 nginx와 연결이 되어 있다.

```bash
> vagrant ssh
$ cd workspace
$ lumen new site
```

이런 식으로 하면 기본 작업 공간에 만들어 진다.

하지만 사이트 소스가 있을 경우에는 workspace의 site를 소스코드로 넣어 주면 된다.



# Base 

- https://app.vagrantup.com/ubuntu/boxes/bionic64



## Vagrantfile 다운로드

> https://www.vagrantup.com/downloads.html



```bash
$ vagrant plugin install vagrant-winnfsd
$ vagrant plugin update
```


## Port forwarded

| port | forward | description |
| ---- | ------- | ----------- |
| 22   | 220     | ssh         |
| 80   | 800     | http        |
| 3306 | 33060   | mysql       |


## 명령어

### 시작하기

이제 아래와 같이 `vagrant up`한다. 

```
$ vagrant up
```



### 쉘 접속하기

`vagrant up`으로 생성된 가상머신(게스트머신)으로 접속하기 위해서 아래와 같이 명령을 실행한다. 

```
$ vagrant ssh
```



### 종료하기

```
$ vagrant halt
```



### 가상머신 삭제하기

```
$ vagrant destroy
```



### 업데이트

`setup.sh`을 변경한 경우에는  아래와 같이 명령을 실행한다. 

```
$ vagrant provision
```

`Vagrantfile`을 변경한 경우에는 아래와 같이 명령을 실행한다. 

```
$ vagrant reload
```





## 주의사항

- mysql의 경우 기본 포트(3306)으로 바로 붙으면 안 붙는다. 외부 접속시에는 포트포워딩으로 해서 붙어 줘야 한다.



## Vagrant Cheat Sheet

![cheat sheet](https://2rwky424s9rd179jmbzqsca1-wpengine.netdna-ssl.com/wp-content/uploads/2017/12/vagrant.png)



## 참고

- [Getting Started with Vagrant on Windows](https://www.sitepoint.com/getting-started-vagrant-windows/)
- [Vagrant : 쉘 스크립트로 프로비저닝하기](https://rorlab.org/rblogs/237)
- [Vagrant - Provisioning](https://thomasventurini.com/articles/vagrant-provisioning)
- [라라벨 홈스테드](https://laravel.kr/docs/5.7/homestead)