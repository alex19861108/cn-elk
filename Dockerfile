FROM sebp/elk:latest
MAINTAINER liuwei.bj@ccbft.com

# RUN /opt/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.5.2/elasticsearch-analysis-ik-7.5.2.zip
# RUN /opt/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v7.5.2/elasticsearch-analysis-pinyin-7.5.2.zip

COPY ./plugins/elasticsearch-analysis-ik-7.5.2.zip /tmp/elasticsearch-analysis-ik-7.5.2.zip
COPY ./plugins/elasticsearch-analysis-pinyin-7.5.2.zip /tmp/elasticsearch-analysis-pinyin-7.5.2.zip
RUN /opt/elasticsearch/bin/elasticsearch-plugin install --batch file:///tmp/elasticsearch-analysis-ik-7.5.2.zip \
    && /opt/elasticsearch/bin/elasticsearch-plugin install --batch file:///tmp/elasticsearch-analysis-pinyin-7.5.2.zip \
    && rm /tmp/elasticsearch-analysis-ik-7.5.2.zip && rm /tmp/elasticsearch-analysis-pinyin-7.5.2.zip
CMD [ "/usr/local/bin/start.sh" ]