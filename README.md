# bilibili-down
用于下载哔哩哔哩上的视频的脚本。<br>
fork 自 [Neutralization/bilibili-down](https://github.com/Neutralization/bilibili-down)。

> [!CAUTION]
> 此脚本仅供学习，请勿滥用，后果自负。

> [!CAUTION]
> 此脚本目前只在 Arch Linux x86 上测试过，其他设备请谨慎使用。

## 修改或添加的功能
- 汉化。
- 支持 BV 号。
- 检测依赖的软件是否安装。
- 优化输出。

## 依赖

### Linux
- [aria2](https://aria2.github.io/)
- [awk](http://www.gnu.org/software/gawk/gawk.html)
- [curl](https://curl.haxx.se/)
- [ffmpeg](https://www.ffmpeg.org/)
- [jq](https://stedolan.github.io/jq/)
- [sed](https://www.gnu.org/software/sed/)

### Windows
- [Cygwin](https://www.cygwin.com/)
- [MinGW](http://www.mingw.org/)
- [WSL/WSL2](https://docs.microsoft.com/en-us/windows/wsl/about)
- 选择其中一个，然后再在其中安装上面提到的依赖。

## 功能
- 下载最高画质的视频 (*需要 ```cookies```*).
- 支持了 AV 号与 BV 号。

## 安装
1. 脚本安装或卸载 (目前只在 Arch Linux x86 上测试过)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/silvaire-qwq/bilibili-down/refs/heads/master/install.sh)"
```

2. 您也可以将 bilidown 的文件下载，然后赋予运行权限：
```shell
chmod +x bilidown
```

## 使用方法
```shell
# 脚本安装
bilidown av号
bilidown bv号

# 手动安装
./bilidown av号
./bilidown bv号
```

- 只允许您 (VIP) 查看的视频
1. 打开 `http://www.bilibili.com` 并登录。
2. 在浏览器中按下 <kbd>F12</kbd> 打开开发选项。
3. 选择 `Network` 或者网络。
4. 按下 <kbd>F5</kbd> 刷新页面。
5. 选择第一行，找到名为 ```cookies``` 的项的值并复制。
6. 找到文件中名为 `cookies` 的变量，并将 ```cookies``` 的值中与下方名字相同的值按照下方格式填入 ```~/.config/bilidown```

```shell
DedeUserID=****; DedeUserID__ckMd5=****; SESSDATA=****; bili_jct=****
```
