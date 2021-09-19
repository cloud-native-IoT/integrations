module github.com/recasta/integrations/Elastic

go 1.15

replace (
	github.com/recasta/integrations/pkg => ../pkg
	github.com/recasta/integrations/redisstream => ../redisstream
)

require (
	github.com/recasta/integrations/redisstream v0.0.0
	github.com/elastic/go-elasticsearch/v7 v7.0.0
	github.com/gomodule/redigo v1.8.3
)
