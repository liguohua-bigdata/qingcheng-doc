一、搭建docker私有仓库
    1.安装并启动docker
        yum -y install docker.io

    2.下载registry镜像
        docker pull registry

    3.服务端使用http协议
        vim /etc/sysconfig/docker
        添加内容如下：
        other_args="--selinux-enabled --insecure-registry qingcheng11:5000"
        
        ADD_REGISTRY='--add-registry qingcheng11:5000'
        INSECURE_REGISTRY='--insecure-registry qingcheng11:5000'
    4.docker常用命令
        service docker restart
        service docker start

    5.启动registry镜像
        docker run -d -p 5000:5000  --restart=always  -v /opt/registry:/tmp/registry  registry

        参数说明：
        -v /opt/registry:/tmp/registry :默认情况下，会将仓库存放于容器内的/tmp/registry目录下，指定本地目录挂载到容器
        此容器要用 docker stop 进行停止
    6.测试仓库运行地址
        浏览地址： http://192.168.1.11:5000/v2/_catalog
        效果示例： {"repositories":[]}

二、测试私有仓库
    1.本地使用http
        在mac中通过docker-tools来设置如下参数
        {
            "insecure-registries": [
                "qingcheng11:5000"
            ]
        }
    2.本地下载
        docker pull busybox

    3.本地tag
        docker tag busybox qingcheng11:5000/busybox

    4.本地查看image
        docker images

    5.上传到私有仓库
        docker push qingcheng11:5000/busybox

    6.验证上传成功
        浏览地址： http://qingcheng11:5000/v2/_catalog
        效果样例： {"repositories":["busybox"]}

三、可能出现的错误
    1.错误提示
        http: server gave HTTP response to HTTPS client
    2.错误原因
        docker repository默认使用https协议进行通信，一般情况下我们用http协议可以满足要求。
        所以只要在server和client任何一方导致的协议不一致都会出现类似的问题。
    3.解决方法
        server端使用http协议
        client端使用http协议
        
        
        
        