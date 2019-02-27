# Vagrantfile for PHP7.2

![vagrantfile](https://www.datocms-assets.com/2885/1506457090-blog-vagrant-list.svg){:width="100px"}

## Vagrantfile 다운로드

> https://www.vagrantup.com/downloads.html





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



## 참고

- [Getting Started with Vagrant on Windows](https://www.sitepoint.com/getting-started-vagrant-windows/)
- [Vagrant : 쉘 스크립트로 프로비저닝하기](https://rorlab.org/rblogs/237)