<?php

declare(strict_types=1);

namespace App;

class FirstUseCase
{
    public function returnFirstText(): string
    {
        return 'first';
    }

    public function returnTrueBoolValue(): bool
    {
        return true;
    }
}
