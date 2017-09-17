1.安装介质

```
  安装介质存储在百度网盘--565380490
```
  
2.开发环境
```
2.1联想window
   username:  liguohua
   password:  1002
2.2虚拟机
   hosts: qingcheng11,qingcheng12,qigncheng13
   os:    centos7
2.3部署路径
	qingcheng11://bigdata/software
	qingcheng12://bigdata/software
	qingcheng13://bigdata/software
2.4启停脚本
   源代码：
        $PROJECT_PATH/scripts/start-bigdata-all.sh
        $PROJECT_PATH/scripts/stop-bigdata-all.sh
   集群中：
        集群启动： qingcheng11://bigdata/software/start-bigdata-all.sh
        集群停止： qingcheng11://bigdata/software/stop-bigdata-all.sh
2.5数据库
   host：     qingcheng11
   type:      mysql
   username:  root
   password:  qingcheng
   database:  qingchengkeji
2.6Hadoop信息
   master:    	    qingcheng11,qingcheng12
   slave:     	    qingcheng11,qingcheng12,qingcheng13
   testDataPath:  	/qingcheng
   testDataUrl:     http://192.168.1.11:50070/explorer.html#/qingcheng
2.7Alluxio信息
   master:    	qingcheng11,qingcheng12
   slave:     	qingcheng11,qingcheng12,qingcheng13
   testdataUrl: http://qingcheng11:19999/home
```



3.前端开发步骤
```
3.1用webstorm clone GitHub中的仓库
    https://github.com/liguohua-bigdata/qingcheng_ui_vue2_pro.git
3.2查看分支，并切换到dev分支
    git branch
    git checkout dev
3.3安装依赖
    在项目的根目录，也就是有package.json文件的目录执行如下命令
    npm install
    如果配置了阿里云的加速镜像也可以执行
    cnpm install
3.4启动项目进行开发
    npm run dev  
3.5原生部署项目
   项目编译：npm run build
   上传成果：将编译生成的dist目录上传到Nginx服务器所代理的目录即可
   部署项目：启动Nginx，如果已经启动，不必重启。
3.6Docker部署项目
    编译项目&上传成果：
           $$PROJECT_PATH/build_push.sh
    脚本部署项目：执行下列docker命令 
           $PROJECT_PATH/front_deploy_local.sh
    docker原始部署项目：执行下列docker命令        
           docker stop qingcheng_ui_vue2_pro
           docker rm -f  qingcheng_ui_vue2_pro
           docker run -it -p 8761:8761 --net host --name qingcheng_ui_vue2_pro 10.100.134.2:5000/qingcheng/qingcheng_ui_vue2_pro 

```





