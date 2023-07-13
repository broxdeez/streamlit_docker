FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y python3.10 python3-pip

EXPOSE 8501

WORKDIR /streamlit-docker

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .

CMD ["streamlit", "run", "app.py"]

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN mkdir -p /root/.streamlit
RUN bash -c 'echo -e "\
[general]\n\
email = \"\"\n\
" > /root/.streamlit/credentials.toml'

RUN bash -c 'echo -e "\
[server]\n\
enableCORS = false\n\
" > /root/.streamlit/config.toml'
