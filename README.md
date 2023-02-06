<!--
 * @Author: 王娟娟 wangjuanjuan@xiaomi.com
 * @Date: 2023-02-06 14:13:26
 * @LastEditors: 王娟娟 wangjuanjuan@xiaomi.com
 * @LastEditTime: 2023-02-06 14:47:48
 * @FilePath: /docker/README.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->

虚拟机 - 操作系统类型 启动耗时，占用内存大
linux 容器 - 对进程进行隔离， 启动快，占用空间小

Docker - 对 linux 容器的封装
image 应用程序及其依赖，都打包在 image 文件，
image 文件生成的 container 实例，就是容器文件,容器一旦生成，会同时存在两个文件：image 文件和容器文件

    一个image 可以同时生成多个运行的container，（可以在container里进行额外的扩展）
    一个container也可以生成多个image（但这些image里面的内容都是一样的，所以没必要生成多个）

常见命令行：

1. 列出所有 image: docker image ls
2. 列出所有 container ID: docker ps -a
3. 删除 image: docker image rm [imageName]
4. 删除 container: docker rm [containerID]
5. 拉取远程仓库 image
   docker image pull 仓库地址/名字:tag
6. 根据 image 创建并运行 container
   docker run -it --platform linux/amd64 micr.cloud.mioffice.cn/miui-sec-fe-public/nvm-node:17.9.1s
7. 运行已有 container: docker exec -it [containerID] /bin/bash
8. 根据 container 生成 image : docker commit [containerID][imagename]
9. 推送 docker push
10. Ctrl + d （或者输入 exit）退出容器

Dockerfile 文件 - docker 根据该文件生成 image 文件
RUN 命令在 image 文件的构建阶段执行，执行结果都会打包进入 image 文件；CMD 命令则是在容器启动后执行。另外，一个 Dockerfile 可以包含多个 RUN 命令，但是只能有一个 CMD 命令。

<!-- 根据dockerfile 生成image -->
<!-- -t参数用来指定 image 文件的名字，后面还可以用冒号指定标签。如果不指定，默认的标签就是latest。最后的那个点表示 Dockerfile 文件所在的路径，上例是当前路径，所以是一个点。 -->

docker image build -t docker-demo .

<!-- 根据image 生成container -->
<!-- -p参数：容器的 3000 端口映射到本机的 8000 端口。
-it参数：容器的 Shell 映射到当前的 Shell，然后你在本机窗口输入的命令，就会传入容器。
koa-demo:0.0.1：image 文件的名字（如果有标签，还需要提供标签，默认是 latest 标签）。
/bin/bash：容器启动以后，内部第一个执行的命令。这里是启动 Bash，保证用户可以使用 Shell。
指定了CMD命令以后，docker container run命令就不能附加命令了（比如前面的/bin/bash），否则它会覆盖CMD命令。 -->

docker container run -p 8000:3000 -it docker-demo /bin/bash
