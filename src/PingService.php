<?php

/**
 * PHP Service Bus (publish-subscribe pattern implementation) demo
 * Supports Saga pattern and Event Sourcing
 *
 * @author  Maksim Masiukevich <desperado@minsk-info.ru>
 * @license MIT
 * @license https://opensource.org/licenses/MIT
 */

declare(strict_types = 1);

namespace App;

use Amp\Promise;
use Desperado\ServiceBus\Application\KernelContext;
use Desperado\ServiceBus\Services\Annotations\CommandHandler;
use Desperado\ServiceBus\Services\Annotations\EventListener;

/**
 *
 */
final class PingService
{
    /**
     * @CommandHandler()
     *
     * @param Ping          $command
     * @param KernelContext $context
     *
     * @return Promise
     */
    public function handle(Ping $command, KernelContext $context): Promise
    {
        return $context->delivery(new Pong());
    }

    /**
     * @EventListener()
     *
     * @param Pong          $event
     * @param KernelContext $context
     *
     * @return void
     */
    public function whenPong(Pong $event, KernelContext $context): void
    {
        $context->logContextMessage('Pong message received');
    }
}
