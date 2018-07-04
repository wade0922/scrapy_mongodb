#Db
ITEM_PIPELINES = {
    'ubuntu.pipelines.ubuntuPipeline': 10,
}

MONGODB_HOST='127.0.0.1'
MONGODB_PORT=27017
MONGODB_DBNAME='scrapy'
MONGODB_DOCNAME='news'

#Scrapy
DOWNLOAD_DELAY = 1.25
