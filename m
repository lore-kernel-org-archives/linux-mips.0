Received: from exsmtp01.microchip.com ([198.175.253.37]:46927 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27007521AbbLKQJlHXJuZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Dec 2015 17:09:41 +0100
Subject: Re: [PATCH 09/14] DEVICETREE: Add bindings for PIC32 usart driver
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-10-git-send-email-joshua.henderson@microchip.com>
 <20151122215622.GA32221@rob-hp-laptop>
From: Joshua Henderson <joshua.henderson@microchip.com>
Message-ID: <566AF6DE.9030803@microchip.com>
Date: Fri, 11 Dec 2015 09:16:30 -0700
MIME-Version: 1.0
In-Reply-To: <20151122215622.GA32221@rob-hp-laptop>
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
Message-ID: <20151211161630.FzmkW8fG4U3wmJ15uL8Q4LW1YNKrTb5cBIPjjjJa-3o@z>

Rob,

On 11/22/2015 02:56 PM, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 05:17:21PM -0700, Joshua Henderson wrote:
>> From: Andrei Pistirica <andrei.pistirica@microchip.com>
>>
>> Document the devicetree bindings for the USART peripheral found on
>> Microchip PIC32 class devices.
>>
>> Signed-off-by: Andrei Pistirica <andrei.pistirica@microchip.com>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> ---
>>  .../bindings/serial/microchip,pic32-usart.txt      |   29 ++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
>>
>> diff --git a/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt b/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
>> new file mode 100644
>> index 0000000..c87321c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
>> @@ -0,0 +1,29 @@
>> +* Microchip Universal Synchronous Asynchronous Receiver/Transmitter (USART)
>> +
>> +Required properties:
>> +- compatible: Should be "microchip,pic32-usart"
> 
> Again, should be more specific.
> 

Ack.  In addition, will replace all instances of USART with UART.

>> +- reg: Should contain registers location and length
>> +- interrupts: Should contain interrupt
>> +- pinctrl: Should contain pinctrl for TX/RX/RTS/CTS
>> +
>> +Optional properties:
>> +- microchip,uart-has-rtscts : Indicate the uart has hardware flow control
>> +- rts-gpios: RTS pin for USP-based UART if microchip,uart-has-rtscts
>> +- cts-gpios: CTS pin for USP-based UART if microchip,uart-has-rtscts
> 
> This appears to just be copied for Sirf UART.
> 
> Doesn't *-gpios being present imply having h/w 
> flow-control (i.e. microchip,uart-has-rtscts)?
> 
> Rob

Agreed.  microchip,uart-has-rtscts will be dropped and it turns out we don't really need the rtc-gpios property.

Josh

> 
>> +
>> +Example:
>> +	usart0: serial@1f822000 {
>> +		compatible = "microchip,pic32-usart";
>> +		reg = <0x1f822000 0x50>;
>> +		interrupts = <UART1_FAULT DEFAULT_INT_PRI IRQ_TYPE_NONE>,
>> +			     <UART1_RECEIVE_DONE DEFAULT_INT_PRI IRQ_TYPE_NONE>,
>> +			     <UART1_TRANSFER_DONE DEFAULT_INT_PRI IRQ_TYPE_NONE>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <
>> +			&pinctrl_uart1
>> +			&pinctrl_uart1_cts
>> +			&pinctrl_uart1_rts>;
>> +		microchip,uart-has-rtscts;
>> +		cts-gpios = <&pioB 15 0>;
>> +		rts-gpios = <&pioD 1 0>;
>> +	};
>> -- 
>> 1.7.9.5
>>
