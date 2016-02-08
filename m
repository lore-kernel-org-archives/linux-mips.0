Received: from exsmtp03.microchip.com ([198.175.253.49]:26221 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27008245AbcBHFHelMOj6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 8 Feb 2016 06:07:34 +0100
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for the PIC32 SPI
 peripheral
References: <1454366701-10847-1-git-send-email-joshua.henderson@microchip.com>
 <56B08EEB.3050808@cogentembedded.com> <56B42E4C.8040201@microchip.com>
 <56B4A457.7050807@cogentembedded.com>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Message-ID: <56B8223D.2030705@microchip.com>
Date: Mon, 8 Feb 2016 10:36:05 +0530
MIME-Version: 1.0
In-Reply-To: <56B4A457.7050807@cogentembedded.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Purna.Mandal@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Joshua Henderson <joshua.henderson@microchip.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Message-ID: <20160208050605.HYVZEkqnZHbwt596YR2kWeLke7gT4o12MqQfZFyZ17Y@z>

On 02/05/2016 07:02 PM, Sergei Shtylyov wrote:

> Hello.
> On 2/5/2016 8:08 AM, Purna Chandra Mandal wrote:
>>>> From: Purna Chandra Mandal <purna.mandal@microchip.com>
>>>> Document the devicetree bindings for the SPI peripheral found
>>>> on Microchip PIC32 class devices.
>>>> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
>>>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>>>> ---
>>>>    .../bindings/spi/microchip,spi-pic32.txt           |   44 ++++++++++++++++++++
>>>>    1 file changed, 44 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt 
>>>> b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>>>> new file mode 100644
>>>> index 0000000..a555618
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>>>> @@ -0,0 +1,44 @@
>>>> +* Microchip PIC32 SPI device
> [...]
>>>> +Example:
>>>> +
>>>> +    spi1:spi@0x1f821000 {
>>> Please insert spaces after colon.
>> ack
>>
> And please drop "0x" from the <unit-address> part of the name.

ack.

> MBR, Sergei
