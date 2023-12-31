### Language:  
> ***zh_CN***  
> [en](README/en.md)  

***
# MCSManager Services for Windows
一款为了 Windows 能便捷地设置自启动 MCSManager 而生的工具。  

[使用 MIT 许可证。](https://mit-license.org/)  

已测试有效的操作系统：  
> Windows 10 专业版 (x64)  
> Windows 10 LTSC 2019 (x64)  

仓库：  
> Gitee: <https://gitee.com/bddjr/mcsmanager-services-for-windows>  
> Github: <https://github.com/bddjr/mcsmanager-services-for-windows>  

警告：
> 该脚本与[官方文档](https://docs.mcsmanager.com/#/zh-cn/tutorial/to_windows_service)的命名不一致，因此不互通。  
> （我在某个网友的提示下才知道7个月前官方文档已经有了）  

***
## 开始使用
### 1. 将 MCSManager 发行版下载并解压到C盘（解压到其它地方也不是不行）  

发行版地址  
> 境内： <https://gitee.com/mcsmanager/MCSManager/releases>  
> 境外： <https://github.com/MCSManager/MCSManager/releases>  

效果如下图  

![1](README/1.jpg)  

### 2. 将该仓库的所有源码下载为zip并解压  

下载地址  
> 境内： <https://gitee.com/bddjr/mcsmanager-services-for-windows/repository/archive/main2.zip>  
> 境外： <https://github.com/bddjr/mcsmanager-services-for-windows/archive/refs/heads/main2.zip>  

然后解压到包含`web`文件夹与`daemon`文件夹的位置，效果如下图  

![2](README/2.jpg)  

### 3. 进入这个文件夹
![3](README/3.jpg)  

***
## 创建服务
双击运行 `services-create.bat` ，成功完成后效果如下图。  

![create](README/create.jpg)  

如果你想查找这些服务，可以按键盘上的 `win`+`R` ，输入 `services.msc` 然后按键盘上的 `Enter` 打开“服务”，找到 `MCSManager-` 开头的服务。  

![create-2](README/create-2.jpg)  

这些服务将以SYSTEM权限运行。如果需要以其它账号权限运行，请手动修改它们。  

***
## 立即启动服务
双击运行 `services-start.bat`  

![start](README/start.jpg)  

***
## 立即停止服务
双击运行 `services-stop.bat`  

![stop](README/stop.jpg)  

***
## 立即停止并删除服务
双击运行 `services-remove.bat`  

![remove](README/remove.jpg)  
