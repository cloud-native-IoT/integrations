module github.com/recasta/integrations/CloudConnect/blob

go 1.15

require (
	github.com/Azure/azure-storage-blob-go v0.12.0
	github.com/recasta/integrations/CloudConnect/csvprocessor v0.0.0
)

replace github.com/recasta/integrations/CloudConnect/csvprocessor => ../csvprocessor
