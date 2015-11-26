Received: from exsmtp01.microchip.com ([198.175.253.37]:22503 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27006508AbbKZFQmEf6rc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Nov 2015 06:16:42 +0100
Subject: Re: [PATCH 12/14] DEVICETREE: Add bindings for PIC32 SDHC host
 controller
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-13-git-send-email-joshua.henderson@microchip.com>
 <20151122215737.GA5285@rob-hp-laptop>
From: Joshua Henderson <joshua.henderson@microchip.com>
Message-ID: <565695B0.8090704@microchip.com>
Date: Wed, 25 Nov 2015 22:16:32 -0700
MIME-Version: 1.0
In-Reply-To: <20151122215737.GA5285@rob-hp-laptop>
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
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Message-ID: <20151126051632.KPML5mCh9j04heMlLJDH31Zh9Pq1wF-AtSMD0gCIROs@z>

Hi Rob,

On 11/22/2015 2:57 PM, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 05:17:24PM -0700, Joshua Henderson wrote:
>> From: Andrei Pistirica <andrei.pistirica@microchip.com>
>>
>> Document the devicetree bindings for the SDHC peripheral found on
>> Microchip PIC32 class devices.
>>
>> Signed-off-by: Andrei Pistirica <andrei.pistirica@microchip.com>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> ---
>>  .../devicetree/bindings/mmc/sdhci-pic32.txt        |   24 ++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt b/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
>> new file mode 100644
>> index 0000000..f16388c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-pic32.txt
>> @@ -0,0 +1,24 @@
>> +* Microchip PIC32 SDHCI Controller
>> +
>> +This file documents differences between the core properties in mmc.txt
>> +and the properties used by the sdhci-pic32 driver.
>> +
>> +Required properties:
>> +- compatible: Should be "microchip,pic32-sdhci"
>> +- reg: Should contain registers location and length
>> +- interrupts: Should contain interrupt
>> +- pinctrl: Should contain pinctrl for data and command lines
>> +
>> +Optional properties:
>> +- no-1-8-v: 1.8V voltage selection not supported
> 
> There's a standard property for this one.
> 

Correct.  This is indeed a standard property that should not be here.  There is currently discussion to avoid using this property anyway.

>> +- piomode: disable DMA support
> 
> Proably this one too IIRC.
> 

We will be dropping this.  There are other ways to accomplish the same thing outside of DT.

Josh
