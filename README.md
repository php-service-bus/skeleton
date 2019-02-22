## What is it?
This component is part of the [PHP Service Bus](https://github.com/php-service-bus/service-bus)

The basic skeleton of the application, which includes Publish\Subscribe pattern implementation with RabbitMQ transport

## Usage

```bash
composer create-project php-service-bus/skeleton my-project
cd my-project
docker-compose up --build
```
After launching containers, execute

```bash
tools/ping
```
## Documentation
Documentation can be found in the [documentation](https://github.com/php-service-bus/documentation) repository

* [Installation](https://github.com/php-service-bus/documentation/blob/master/pages/installation.md)
* [Basic information](https://github.com/php-service-bus/documentation/blob/master/pages/basic_information.md)
* [Available modules](https://github.com/php-service-bus/documentation/blob/master/pages/available_modules.md)
  * [Components](https://github.com/php-service-bus/documentation/blob/master/pages/available_modules.md#components)
  * [Sagas](https://github.com/php-service-bus/documentation/blob/master/pages/modules/sagas.md)
  * [Event Sourcing](https://github.com/php-service-bus/documentation/blob/master/pages/modules/event_sourcing.md)
  * [Scheduler](https://github.com/php-service-bus/documentation/blob/master/pages/modules/scheduler.md)
  * [Transport](https://github.com/php-service-bus/documentation/blob/master/pages/available_modules.md#transport)
  * [Database](https://github.com/php-service-bus/documentation/blob/master/pages/available_modules.md#database)
* [Available packages](https://github.com/php-service-bus/documentation/blob/master/pages/available_packages.md)
  * [Http-client](https://github.com/php-service-bus/documentation/blob/master/pages/packages/http_client.md)
  * [Cache](https://github.com/php-service-bus/documentation/blob/master/pages/packages/cache.md)

## Support
* [Telegram chat (RU)](https://t.me/php_service_bus)
* Create issue [https://github.com/php-service-bus/service-bus/issues](https://github.com/php-service-bus/service-bus/issues)

## Contacts
* [`dev@async-php.com`](mailto:dev@async-php.com)

## Security

If you discover any security related issues, please email [`dev@async-php.com`](mailto:dev@async-php.com) instead of using the issue tracker.

## License

The MIT License (MIT). Please see [LICENSE](LICENSE) for more information.
