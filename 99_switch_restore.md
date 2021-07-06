[toc]

## Experimental alternatives for git checkout

> https://github.blog/2019-08-16-highlights-from-git-2-23/
>
> git 2.23 부터 `git checkout`을 대안하기 위해 신규 명령어 `switch`와 `restore`를 도입 
>
> **기존 `checkout` 의 많은 책임을 깔끔하게 분리하여 각각 명확하게 구분 하기 위함**

- `checkout`
  - Switch branches or restore
- `switch`
  - Switch branches
- `restore`
  - Restore working tree files



### 명령어 비교



**브랜치 생성 및 이동**

```bash
# 기존
$ git checkout -b 브랜치명

# 신규
$ git switch -c 브랜치명

# 예시1
$ git switch -c feature/login
Switched to a new branch 'feature/login'
```



**단순 브랜치 이동**

```bash
# 기존
$ git checkout 브랜치명

# 신규
$ git switch 브랜치명

# 예시2
$ git switch feature/login
```



**Unstaged 상태의 변경(modified) 파일을 복구**

```bash
# 기존
$ git checkout -- README.md # --와 파일 사이에 공백!

# 신규
$ git restore README.md

# 예시3
$ git init
$ touch a.txt
$ git add .
$ git commit -m "Initial commit"
# a.txt 파일 수정

$ git restore a.txt # a.txt에 무언가를 적기 전 상태로 돌아감
```



---



### 결론

> "checkout이 switch, restore의 기능을 모두 수행 할 수 있지만 각자 더 명확한 목적에 맞게 사용하자"

`switch`

- switch is created for the **single purpose of changing branches**, and when you do that, **you do want to be at the HEAD of that branch**.



`checkout`

- checkout is a more general operation which brings your working copy in line with any given state in the history (= like commit)

