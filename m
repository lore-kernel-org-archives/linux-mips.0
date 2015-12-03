Received: from exsmtp03.microchip.com ([198.175.253.49]:17883 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27013142AbbLCRbTcXjNo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Dec 2015 18:31:19 +0100
Subject: Re: [PATCH 03/14] DEVICETREE: Add PIC32 clock binding documentation
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-4-git-send-email-joshua.henderson@microchip.com>
 <20151122213110.GA16187@rob-hp-laptop> <56569A77.8010800@microchip.com>
 <20151130214344.GA13253@rob-hp-laptop>
From: Joshua Henderson <joshua.henderson@microchip.com>
Message-ID: <56607DF5.1080804@microchip.com>
Date: Thu, 3 Dec 2015 10:37:57 -0700
MIME-Version: 1.0
In-Reply-To: <20151130214344.GA13253@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Purna Chandra Mandal <purna.mandal@microchip.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Message-ID: <20151203173757.XNApohC62dr83As_Pm1tVhRJF3sCuZ_ux4F7W8GCE50@z>

Rob,

On 11/30/2015 02:43 PM, Rob Herring wrote:
> On Wed, Nov 25, 2015 at 10:36:55PM -0700, Joshua Henderson wrote:
>> Hi Rob,
>>
>> On 11/22/2015 2:31 PM, Rob Herring wrote:
>>> On Fri, Nov 20, 2015 at 05:17:15PM -0700, Joshua Henderson wrote:
>>>> From: Purna Chandra Mandal <purna.mandal@microchip.com>
>>>>
>>>> Document the devicetree bindings for the clock driver found on Microchip
>>>> PIC32 class devices.
>>>>
>>>> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
>>>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>>>> ---
>>>>  .../devicetree/bindings/clock/microchip,pic32.txt  |  263 ++++++++++++++++++++
>>>>  1 file changed, 263 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/microchip,pic32.txt b/Documentation/devicetree/bindings/clock/microchip,pic32.txt
>>>> new file mode 100644
>>>> index 0000000..4cef72d
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/microchip,pic32.txt
>>>> @@ -0,0 +1,263 @@
>>>> +Binding for a Clock hardware block found on
>>>> +certain Microchip PIC32 MCU devices.
>>>> +
>>>> +Microchip SoC clocks-node consists of few oscillators, PLL, multiplexer
>>>> +and few divider nodes.
>>>
>>> [...]
>>>
>>>> +Required properties:
>>>> +- compatible : should have "microchip,pic32-clk".
> 
> BTW, this should list out the actual compatible strings.

Ack.  These are also being changed to microchip,pic32mzda-* due to other feedback.

> 
>>> There is some discussion about this upstream with "critical-clocks" 
>>> binding. Can you use and wait for that?
>>>
>>
>> The way this is going, we might not have to wait. :)  Is there a patch available yet to try it out?  
> 
> Yes, googling "Lee Jones critical-clocks" should find it.

The change for this on our side is in the queue should the stars align on timing.

[...]

> 
> Rob
> 

Thanks,
Josh
