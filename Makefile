.DEFAULT_GOAL := help

help:  ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

distribute:  ## Generating distribution archives
	python setup.py sdist bdist_wheel

upload:  ## Uploading the distribution archives
	twine upload --repository-url https://upload.pypi.org/legacy/ dist/*
