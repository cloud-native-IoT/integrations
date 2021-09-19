module github.com/recasta/integrations/CloudConnect/cloudstorage

go 1.15

require (
	cloud.google.com/go/storage v1.12.0
	github.com/recasta/integrations/CloudConnect/csvprocessor v0.0.0
)

replace github.com/recasta/integrations/CloudConnect/csvprocessor => ../csvprocessor
