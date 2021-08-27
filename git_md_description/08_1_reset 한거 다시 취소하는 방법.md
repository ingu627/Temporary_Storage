## reset 한거 다시 취소하는 방법 

[reset 링크](https://88240.tistory.com/284)



```bash
git reflog
```

: 이런식으로 이전까지했던 작업들 reflog를 확인해 몇번째 HEAD로 이동할지 확인한다.



![image-20210827134353635](C:\Users\poeun\AppData\Roaming\Typora\typora-user-images\image-20210827134353635.png)



만약 HEAD@{7}로 이동할꺼라면 

```bash
git reset --hard HEAD@{7}
```





