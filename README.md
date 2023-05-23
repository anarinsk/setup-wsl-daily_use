# setup-wsl-daily_use
Humble daily usage of wsl

## WSL Command 

WSL 단에서 쓸 수 있는 명령어들을 알아보자. 

https://learn.microsoft.com/ko-kr/windows/wsl/basic-commands

### Install 

#### Microsoft Store

- Microsoft Store에서 다운 받아 쓴다. Windows 10, 검색에 "Microsoft Store"
- 스토어에서 Ubuntu를 검색하면 설치 가능한 배포이 뜬다. 
- 컨셉은 Windows에 Ubuntu 설치 앱을 깔아 두고 이를 실행하면 새 Distro가 설치되는 개념이다. 

#### With Terminal 

- Store를 쓰기 싫거나 쓸 수 없을 때 
- Terminal에서 쓰는 게 멋지니까! 

```shell=
> wsl -l -o
> wsl --list --online
```

- 설치 가능한 Distro를 확인한다. 

```shell=
> wsl --install -d <DISTRO-NAME> 
> wsl --install -d Ubuntu
```

- 이게 대단히 신비한 무엇은 아니다. MS Store에서 해당 배포판을 설치하는 것과 동일한 일을 수행한다. 
- 윈도에서 확인하면 Ubuntu 앱이 깔린 것을 알 수 있다. 

### List 

```shell=
> wsl --list --all 
> wsl -l 
```

### Kernel update 

```shell=
> wsl --update
```

- Windows Update 설정 > 고급옵션 > "Windows를 업데이트할 때 다른 Microsoft 제품에 대한 업데이트 받기" 
- 계정 생성, 암호 설정 등 기타 우분투 설정은 생략한다. 

### Uninstall distros 

```shell=
> wsl --shutdown <DISTRO-NAME>
> wsl --unregister <DISTRO-NAME>
```

- 원도 터미널에서 프로필을 지우고 싶다면 설정에서 지우면 된다. 마지막에 전체 저장하는 것을 잊지 말도록 하자.  

### Set default Distros 

```shell=
> wsl --setdefault <DISTRO-NAME>
```

## Ubuntu: Quick Take-off 

### Repo change 

패키지 리포지토리를 한국 위치로 바꾼다. 여기서는 카카오로 바꾼다. 

```shell=
> sudo sed -i 's|archive.ubuntu.com|mirror.kakao.com|g' /etc/apt/sources.list &&
sudo sed -i 's|security.ubuntu.com|mirror.kakao.com|g' /etc/apt/sources.list
```

### Update packages 

```shell=
> sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y 
#or
> sudo apt-get update && sudo apt-get full-upgrade -y
```

- 가끔 업데이트가 실패할 때가 있다. 
  + 카카오의 우분투 서버가 죽었거나 
  + 아니면 윈도 머신의 시간이 동기화 되어 있지 않은 경우가 있다. 
  + 후자의 경우 시간에서 우클릭 "날짜 및 시간조정"을 클릭해 동기화 해주고, 리부팅하면 해결 

## Snap 지우기 

https://mail.bada-ie.com/board/view/?page=1&uid=4115&category_code=jvYw%7C%7CTbxg%7C%7C&code=all&key=&keyfield=

- Ubuntu의 불필요한 요소 
- WSL2에서는 GUI 앱 실행에서 문제를 일으킨다. 
- WSL2의 디폴트 상태에서는 systemd를 쓰지 않아서 문제가 되지 않는다. 
  + genie를 활성화한 상태에서 문제가 되고, 지우는 것 역시 이 상태에서 지워야 한다. 

```shell=
> snap list
> sudo snap remove <package-names>
```

- `snap remove`에서 패키지 지우는 순서를 따져야 할 수 있다. 

```shell=
> sudo umount /snap/core/xxxx
> sudo apt purge snapd
```

- 해당 디렉토리가 없다면 위 명령어는 실행하지 않아도 된다. 

```shell=
> rm -rf ~/snap
> sudo rm -rf /snap
> sudo rm -rf /var/snap
> sudo rm -rf /var/lib/snapd
```


## Install zsh & powerlevel10k

https://gist.github.com/cristian-aldea/c8f91187de922303fa10c6e5fd85e324

```shell=
# update packages
> sudo apt update

# install required packages
> sudo apt install zsh git curl -y

# verify zsh installation
> zsh --version

# Set the default shell to zsh
> sudo chsh -s $(which zsh) $(whoami)

# Install oh-my-zsh: https://ohmyz.sh
> sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k: https://github.com/romkatv/powerlevel10k
> git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

```

- zsh의 테마를 변경해야 한다. 

```shell=
# zsh 설정 열기 
> nano ~/.zshrc
# ZSH_THEME="robbyrussell" -> ZSH_THEME="powerlevel10k/powerlevel10k"
```

- 셸을 다시 시작하면 powerklevel10k 설정이 뜬다. 
    - configure 프로세스를 다시 진행하고 싶다면, `p10k configure` 
    - `~/.p10k.zsh`를 직접 수정해도 된다. 

### ~~zsh 꾸미기~~

- 왠만하면 p10k 써라... 이하 무시하자. 

```shell
cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
sudo git clone https://github.com/djui/alias-tips.git
sudo git clone https://github.com/zsh-users/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions 
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- nano 에디터를 열어 아래 부분을 수정해주자. `>nano ~/.zshrc`
  - theme 교체: `agnoster`
  - 플러그인 세팅 

    ```shell
    plugins=(git alias-tips zsh-autosuggestions zsh-syntax-highlighting)
    ```

- native ubuntu에서는 화살표가 제대로 표시되지 않는다. [여기](http://programmingskills.net/archives/115)를 참고하자. 

## Setup Windows Terminal 

[Setup for Windows Terminal](https://github.com/anarinsk/setup-windows_terminal/blob/main/README.md) 참고 

## Use Docker 

- [setup for docker composer](https://github.com/anarinsk/setup-docker_compose) 참고 

## gh for ubuntu 

- [설치 방법](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)
- 아마도 깃헙 로그인 기능이 제일 유용할 것 같다. 
- `> gh auth login`
  - 여러가지 선택지가 나온다. 
    - 순리대로 택한다. `github.com` > `https` > `token`
    - 마지막에 반드시 Token을 선택해야 한다. id/pw 로그인은 사라질 기능이다. 있어도 쓰지 말자.
    - 토큰 관리를 알아서 잘 하시기를... 
## Misc

### Fix Python Symlink 

- 파이썬 심링크를 바꿔주자. zsh을 깔고나면 권고 메시지를 띄운다. 

```shell
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
```

### Other simple commands 

- 리눅스 정보 보기 `wslfetch`
- 아스키 아쿠아리움 https://askubuntu.com/questions/927441/how-do-i-install-asciiquarium/

### How to use GUI app for Ubuntu 

https://github.com/microsoft/wslg

- 한글이 안 나올 때는 아래 명령어로 한글 폰트를 설치하자. 

```shell
apt-get install fonts-nanum fonts-nanum-coding fonts-nanum-extra
```

## Resources 

- [Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
