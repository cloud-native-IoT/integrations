module github.com/recasta/integrations/SAPHana

go 1.15

replace (
	github.com/recasta/integrations/pkg => ../pkg
	github.com/recasta/integrations/redisstream => ../redisstream
)

require (
	github.com/recasta/integrations/redisstream v0.0.0
	github.com/SAP/go-hdb v0.102.6
	github.com/gomodule/redigo v1.8.3
)
