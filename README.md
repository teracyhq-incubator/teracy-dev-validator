# teracy-dev-validator

teracy-dev validator extension provides utility for other extensions to validate its yaml values

## How to use

## Configure `workspace/teracy-dev-entry/config_default.yaml` with the following similar content:

- Use specific version:

```yaml
teracy-dev:
  extensions:
    - _id: "entry-validator"
      path:
        extension: teracy-dev-validator
      location:
        git:
          remote:
            origin: https://github.com/teracyhq-incubator/teracy-dev-validator.git
          branch: v0.1.0
      require_version: ">= 0.1.0"
      enabled: true
```

- Use the latest stable version (auto update):

```yaml
teracy-dev:
  extensions:
    - _id: "entry-validator"
      path:
        extension: teracy-dev-validator
      location:
        git:
          remote:
            origin: https://github.com/teracyhq-incubator/teracy-dev-validator.git
          branch: master
      require_version: ">= 0.1.0"
      enabled: true
```

- Use the latest develop version (auto update):

```yaml
teracy-dev:
  extensions:
    - _id: "entry-validator"
      path:
        extension: teracy-dev-validator
      location:
        git:
          remote:
            origin: https://github.com/teracyhq-incubator/teracy-dev-validator.git
          branch: develop
      require_version: ">= 0.1.0-SNAPSHOT"
      enabled: true
```

### Use the validator API

- Create your validator which extends the `TeracyDevValidator::Validator` class

- Register your validator with the `TeracyDevValidator.register_validator()` APIs


## How to develop

You should configure the forked git repo into the `workspace` directory by adding the following
similar content into `workspace/teracy-dev-entry/config_override.yaml`:


```yaml
teracy-dev:
  extensions:
    - _id: "entry-validator" # must match the _id configured from the config_default.yaml file
      path:
        lookup: workspace # use workspace directory to lookup for this extension
      location:
        git:
          remote:
            origin: git@github.com:hoatle/teracy-dev-validator.git # your forked repo
          branch: develop
      require_version: ">= 0.1.0-SNAPSHOT"
```

## License

MIT
