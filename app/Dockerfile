FROM django

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get install -y \
		gcc \
		gettext \
		mysql-client libmysqlclient-dev \
		postgresql-client libpq-dev \
		sqlite3 \
		apt-transport-https \
		unzip \
		wget

RUN echo "deb https://packages.elastic.co/beats/apt stable main" | tee -a /etc/apt/sources.list.d/beats.list
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN apt-get update && apt-get install -y filebeat

RUN wget https://github.com/rtancman/eventex/archive/master.zip && unzip master.zip
RUN cp eventex-master/contrib/env-sample eventex-master/.env
RUN pip install -r eventex-master/requirements.txt

WORKDIR /usr/src/app/eventex-master

RUN update-rc.d filebeat defaults 95 10
RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]