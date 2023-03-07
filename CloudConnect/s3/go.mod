module github.com/recasta/integrations/CloudConnect/s3

go 1.15

require (
	github.com/aws/aws-sdk-go v1.36.12
	github.com/recasta/integrations/CloudConnect/csvprocessor v0.0.0
	golang.org/x/text v0.3.8 // indirect
)

replace github.com/recasta/integrations/CloudConnect/csvprocessor => ../csvprocessor
