FROM tiangolo/uwsgi-nginx-flask:python3.7

COPY . /app

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN export GCLOUD_PROJECT=$DEVSHELL_PROJECT_ID

RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

RUN chmod u+x prepare_web_environment.sh

RUN ./prepare_web_environment.sh

EXPOSE 80
