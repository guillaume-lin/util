# 使用官方 Elixir Docker 镜像作为基础镜像
FROM elixir:1.17.3-otp-25

# 设置工作目录
WORKDIR /app

# 将应用的依赖项复制到容器中
COPY mix.exs mix.lock ./

# 安装应用的依赖项
RUN mix deps.get

# 将应用的其余源代码复制到容器中
COPY . .

ENV MIX_ENV=prod
ENV PHX_SERVER=true

# 编译应用的资产（如果需要）
RUN mix assets.deploy

# 构建应用的发布版本
RUN mix release

# 暴露端口
EXPOSE 4000

# 运行 Phoenix 服务器
CMD ["_build/prod/rel/vistor_management/bin/vistor_management", "start"]

# docker build -t visitor .
# docker run -it -p 4001:4001  --env-file env-file visitor
# docker run --env VAR_NAME=VALUE -d visitor
