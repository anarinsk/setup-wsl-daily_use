# setup-wsl-daily_use
Humble daily usage of wsl

## WSL Command 

WSL 단에서 쓸 수 있는 명령어들을 알아보자. 

### Install 

1. Microsoft Store에서 다운 받아 쓴다. Windows 10, 검색에 "Microsoft Store"
2. `wsl --install -d DISTRO-NAME` 명령어로 설치한다. 


### Kernel update 

```shell 
> wsl --update
```

- Windows Update 설정 > 고급옵션 > "Windows를 업데이트할 때 다른 Microsoft 제품에 대한 업데이트 받기" 
- 계정 생성, 암호 설정 등 기타 우분투 설정은 생략한다. 

### Uninstall distros 

```shell
wsl --shutdown DISTRO-NAME
wsl --unregister DISTRO-NAME
```

## Ubuntu: Quick Take-off 

### Repo change 

패키지 리포지토리를 한국 위치로 바꾼다. 여기서는 카카오로 바꾼다. 

```shell
sudo sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list # package
sudo sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list # security 
```

### Update packages 

```shell
sudo apt-get update && sudo apt-get upgrade -y
```


## Install zsh 

- 보다 쾌적한 터미널 환경을 위해서 zsh를 설치한다. 

```shell
sudo apt-get install zsh
chsh -s `which zsh`
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

- logout 후 

```shell
cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
git clone https://github.com/djui/alias-tips.git 
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- nano 에디터를 열어 아래 부분을 수정해주자. `>nano ~/.zshrc`
  - theme 교체: `agnoster`
  - 플러그인 세팅 

    ```shell
    plugins=(git alias-tips zsh-autosuggestions zsh-syntax-highlighting)
    ```

## Setup Windows Terminal 

[Setup for Windows Terminal](https://github.com/anarinsk/setup-windows_terminal/blob/main/README.md) 참고 

## Use Docker 

- [setup for docker composer](https://github.com/anarinsk/setup-docker_compose) 참고 

## gh for ubuntu 

- [설치 방법](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)
- 아마도 깃헙 로그인 기능이 제일 유용할 것 같다. 
- `> gh auth login`
  - 여러가지 선택지가 나온다. 
  - 마지막에 Token을 선택해야 한다. id/pw 로그인은 사라질 기능이다. 있어도 쓰지 말자.

## Misc

### Fix Python Symlink 

- 파이썬 심링크를 바꿔주자. zsh을 깔고나면 권고 메시지를 띄운다. 

```shell
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
```

### Other simple commands 

- 리눅스 정보 보기 `wslfetch`

## Resources 

- [Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)- 
