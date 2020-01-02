<?php

/**
 * PHP Service Bus (publish-subscribe pattern implementation) demo
 * Supports Saga pattern and Event Sourcing.
 *
 * @author  Maksim Masiukevich <desperado@minsk-info.ru>
 * @license MIT
 * @license https://opensource.org/licenses/MIT
 */

declare(strict_types = 1);

namespace App;

use Amp\Promise;
use ServiceBus\Common\Context\ServiceBusContext;
use ServiceBus\Services\Annotations\CommandHandler;
use ServiceBus\Services\Annotations\EventListener;

/**
 *
 */
final class PingService
{
    /**
     * @CommandHandler()
     */
    public function handle(Ping $command, ServiceBusContext $context): Promise
    {
        return $context->delivery(new Pong());
    }

    /**
     * @EventListener(description="Pong message received")
     */
    public function whenPong(Pong $event, ServiceBusContext $context): void
    {

    }
}
