
#docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -e ES_MIN_MEM=128m  -e ES_MAX_MEM=1024m -it --name elk sebp/elk

docker run --ulimit nofile=65536:65536 \
    -p 5601:5601 \
    -p 9200:9200 \
    -p 9300:9300 \
    -p 5044:5044 \
    -e ES_MIN_MEM=128m \
    -e ES_MAX_MEM=1024m \
    -d --restart=always \
    -v /etc/logstash:/etc/logstash \
    -v /etc/localtime:/etc/localtime \
    --name elk ccb/elk
