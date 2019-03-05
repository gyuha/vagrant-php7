# playpot-vagrant
![vagrantfile](https://www.datocms-assets.com/2885/1506457090-blog-vagrant-list.svg)

개발용 가상이미지 설정 파일..

## 필요 프로그램

- VirtualBOX : https://www.virtualbox.org/wiki/Downloads
- Vagrant : https://www.vagrantup.com/downloads.html



# Base 

- https://app.vagrantup.com/ubuntu/boxes/bionic64



## Vagrantfile 다운로드

> https://www.vagrantup.com/downloads.html



```cmd
> vagrant plugin install vagrant-winnfsd
> vagrant plugin update
```


## Port forwarded

`config.yaml` 참고


## 명령어

### 시작하기

이제 아래와 같이 `vagrant up`한다. 

```cmd
> vagrant up
```



### 쉘 접속하기

`vagrant up`으로 생성된 가상머신(게스트머신)으로 접속하기 위해서 아래와 같이 명령을 실행한다. 

```cmd
> vagrant ssh
```



### 종료하기

```cmd
> vagrant halt
```



### 가상머신 삭제하기

```cmd
> vagrant destroy
```



### 업데이트

`setup.sh`을 변경한 경우에는  아래와 같이 명령을 실행한다. 

```cmd
> vagrant provision
```

`Vagrantfile`을 변경한 경우에는 아래와 같이 명령을 실행한다. 

```cmd
> vagrant reload
```



### IP 확인하기

```cmd
> vagrant ssh
...... 부팅
$ ifconfig
```



## Vagrant Cheat Sheet

![cheat sheet](https://2rwky424s9rd179jmbzqsca1-wpengine.netdna-ssl.com/wp-content/uploads/2017/12/vagrant.png)



## 참고

- [Getting Started with Vagrant on Windows](https://www.sitepoint.com/getting-started-vagrant-windows/)
- [Vagrant : 쉘 스크립트로 프로비저닝하기](https://rorlab.org/rblogs/237)
- [Vagrant - Provisioning](https://thomasventurini.com/articles/vagrant-provisioning)
- [라라벨 홈스테드](https://laravel.kr/docs/5.7/homestead)