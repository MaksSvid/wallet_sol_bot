# установка базового образа - https://docs.docker.com/engine/reference/builder/#from
# https://medium.com/swlh/alpine-slim-stretch-buster-jessie-bullseye-bookworm-what-are-the-differences-in-docker-62171ed4531d
FROM python:3.12 AS base

LABEL maintainer="Max Svid < telegram ---> https://t.me/mak_sjr > "
# по умолчанию все операции выполняются с правами рута. Это не хорошая практика.
# подробнее - тут https://habr.com/ru/post/448480/
# следующие шесть строк необходимы для создания пользователя, не являющегося рутом
# подробнее про ARG ENV - https://vsupalov.com/docker-arg-env-variable-gui
ARG UID=1000
ARG GID=1000
ENV UID=${UID}
ENV GID=${GID}

RUN useradd -m -u $UID docker_user
# здесь мы создаем пользователя с именем docker_user, который не является рутом, и его UID за
# по умолчанию будет 1000 (ранее здесь было ARG UID=1000 ENV UID=${UID}), он может быть
# заменен при старте контейнера передачей переменной или в файле docker-compose.yaml
# или как аргумент команды docker

USER docker_user

WORKDIR /home/docker_user/app

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

CMD ["python3", "-m", "bot.main"]
