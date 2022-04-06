## What is it?
This component is part of the [PHP Service Bus](https://github.com/php-service-bus/service-bus)

The basic skeleton of the application, which includes Publish\Subscribe pattern implementation with RabbitMQ transport

## Usage

```bash
composer create-project php-service-bus/skeleton my-project
cd my-project
make start && make consumer-logs
```
After launching containers, execute

```bash
make ping && make consumer-logs
```
## Contributing
Contributions are welcome! Please read [CONTRIBUTING](CONTRIBUTING.md) for details.

## Communication Channels
You can find help and discussion in the following places:
* [Telegram chat (RU)](https://t.me/php_service_bus)
* Create issue [https://github.com/php-service-bus/service-bus/issues](https://github.com/php-service-bus/service-bus/issues)

## License

The MIT License (MIT). Please see [LICENSE](LICENSE.md) for more information.
