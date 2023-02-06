# 继承镜像
FROM node:8.4

#  将当前目录下所有文件（除了.dockerignore排除路径）都拷贝进image文件的/app目录
COPY . ./app

#  指定工作路径
WORKDIR /app

# 在/app目录下，运行npm install命令安装依赖。注意，安装后所有的依赖，都将打包进入 image 文件。
RUN npm install

# 将容器 3000 端口暴露出来， 允许外部连接这个端口。
EXPOSE 3000
