# 원격 저장소(Remote repository)

## 기본 설정

1. 내 로컬 컴퓨터의 폴더를 git이 관리하도록 설정한다.

   ```bash
   # git으로 초기화
   $ git init
   Initialized empty Git repository in C:/Users/campusseven05/Desktop/TIL/.git/
   
   # add & commit 
   $ git status
   On branch master
   
   No commits yet
   
   Untracked files:
     (use "git add <file>..." to include in what will be committed)
           00_git_intro.md
           01_remote_push.md
           02_pull_clone.md
           99_markdown_syntax.md
           md-images/
           "\354\213\244\354\212\265/"
   
   nothing added to commit but untracked files present (use "git add" to track)
   
   $ git add .
   $ git status
   On branch master
   
   No commits yet
   
   Changes to be committed:
     (use "git rm --cached <file>..." to unstage)
           new file:   00_git_intro.md
           new file:   01_remote_push.md
           new file:   02_pull_clone.md
           new file:   99_markdown_syntax.md
           new file:   md-images/cute.jpg
           new file:   md-images/image-20210705144804835.png
           new file:   md-images/image-20210705150947301.png
           new file:   md-images/image-20210705153111460.png
           new file:   "\354\213\244\354\212\265/\354\213\244\354\212\265.md"
   
   $ git commit -m "Initial commit"
   [master (root-commit) 83eef09] Initial commit
    9 files changed, 336 insertions(+)
    create mode 100644 00_git_intro.md
    create mode 100644 01_remote_push.md
    create mode 100644 02_pull_clone.md
    create mode 100644 99_markdown_syntax.md
    create mode 100644 md-images/cute.jpg
    create mode 100644 md-images/image-20210705144804835.png
    create mode 100644 md-images/image-20210705150947301.png
    create mode 100644 md-images/image-20210705153111460.png
    create mode 100644 "\354\213\244\354\212\265/\354\213\244\354\212\265.md"
   ```

2. Github Repository 생성

   ![image-20210705162411659](md-images/image-20210705162411659.png)



## 원격 저장소 등록 & 업로드 명령어

### 원격 저장소 추가

- 최초 1회만 설정하면 됨

```bash
# 원격 저장소 추가
# git아 원격 저장소 좀 등록해줘(add) origin이라는 이름(별명)으로 원격 저장소URL을
$ git remote add origin 원격저장소URL

# 예시
$ git remote add origin https://github.com/edujustin-hphk/TIL.git

# 등록된 원격 저장소 확인
$ git remote -v
origin  https://github.com/edujustin-hphk/TIL.git (fetch)
origin  https://github.com/edujustin-hphk/TIL.git (push)

# 원격 저장소가 잘못 등록되어 삭제해야 하는 경우
$ git remote rm origin
$ git remote -v
```





### 원격 저장소에 나의 소스 코드 업로드

- add, commit 이후에 원격 저장소에 나의 로컬 버전 기록을 업로드 하고 싶으면 push 진행

- 2.23 버전의 로그인 이슈 

  - 아래 명령어를 입력하고 다시 push 작업 진행

  ```bash
  $ git config --global credential.git.github.com.provider generic
  ```

  - 혹은 vscode에 git bash를 연결해서 push하면 문제 해결 가능



```bash
$ git push -u origin master # 첫 git push를 하면 아래와 같이 인증을 요구하는 화면이 나옴
Select an authentication method for 'https://github.com/':
  1. Web browser (default)  
  2. Personal access token  
option (enter for default):  # 바로 enter를 눌러서 진행

# 조금 기다린 뒤에 github 사이트로 들어가서 새로고침하면 로컬 저장소에 있는 모든 내역이 업로드 된 것을 확인할 수 있음

# 이후에는 add & commit을 진행하고 push를 하면 새로운 버전을 원격 저장소(github)에 업로드 할 수 있다.
$ git push origin master
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 8 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 221.80 KiB | 22.18 MiB/s, done.
Total 6 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/edujustin-hphk/TIL.git
   83eef09..ed10a36  master -> master
```

```bash
# 기본 루틴
$ git add .
$ git commit -m "커밋 메시지"
$ git push origin master # git아 버전 이력을 push 해줘 어디로?! origin(우리가 붙인 별명)으로 master 브랜치를!
```



![image-20210705165108737](md-images/image-20210705165108737.png)

