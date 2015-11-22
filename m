Received: from exsmtp03.microchip.com ([198.175.253.49]:54814 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011429AbbKVQXLZIL71 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 22 Nov 2015 17:23:11 +0100
Subject: Re: [PATCH 06/14] MIPS: Add support for PIC32MZDA platform
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-7-git-send-email-joshua.henderson@microchip.com>
 <20151121123753.58eb6e80@tock>
From: Joshua Henderson <joshua.henderson@microchip.com>
Message-ID: <5651ED63.9090101@microchip.com>
Date: Sun, 22 Nov 2015 09:29:23 -0700
MIME-Version: 1.0
In-Reply-To: <20151121123753.58eb6e80@tock>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Joshua.Henderson@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alban <albeu@free.fr>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20151122162923.AdBpTd5NZpETx5Yo-gcJ5gyS53jsNqVeJilin9m8UuA@z>

On 11/21/2015 04:37 AM, Alban wrote:
> On Fri, 20 Nov 2015 17:17:18 -0700
> Joshua Henderson <joshua.henderson@microchip.com> wrote:
> 
>> This adds support for the Microchip PIC32 MIPS microcontroller with
>> the specific variant PIC32MZDA. PIC32MZDA is based on the MIPS m14KEc
>> core and boots using device tree.
>>
>> This includes an early pin setup and early clock setup needed prior to
>> device tree being initialized. In additon, an interface is provided to
>> synchronize access to registers shared across several peripherals.
>>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>>
>> [...]
>>
>> diff --git a/arch/mips/include/asm/mach-pic32/gpio.h
>> b/arch/mips/include/asm/mach-pic32/gpio.h new file mode 100644
> 
> Custom GPIO header are not used anymore, this file can be dropped.
> 
Ack.  Will drop.

Josh
