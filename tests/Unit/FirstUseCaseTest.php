<?php

declare(strict_types=1);

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;
use App\FirstUseCase;

class FirstUseCaseTest extends TestCase
{
    public function testIfReturnsCorrectString()
    {
        $useCase = new FirstUseCase();
        
        $this->assertSame('first', $useCase->returnFirstText());
    }

    public function testIfReturnsCorrectTrueValeu()
    {
        $useCase = new FirstUseCase();
        
        $this->assertTrue($useCase->returnTrueBoolValue());
    }
}