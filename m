Received: from mail-pd0-f180.google.com ([209.85.192.180]:33445 "EHLO
        mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27009051AbbFZNyrhLCAa convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 26 Jun 2015 15:54:47 +0200
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Subject: Re: [PATCH 1/4] MIPS: BMIPS: bcm7346: add nodes for NAND
From: Jaedon Shin <jaedon.shin@gmail.com>
In-Reply-To: <558CC050.6040101@gmail.com>
Date: Fri, 26 Jun 2015 22:54:35 +0900
Content-Transfer-Encoding: 8BIT
Message-ID: <D85A0C84-46BA-4F77-9A90-DE21EBED1887@gmail.com>
References: <cover.1435124524.git.jaedon.shin@gmail.com> <1544bf6110b43fbaa8dbb3b06a18e08ae87b386d.1435124524.git.jaedon.shin@gmail.com> <558B05B7.8010401@gmail.com> <EFAFA0BE-CC2F-4342-9C89-DED8EC6CF377@gmail.com> <558CC050.6040101@gmail.com>
Return-Path: <jaedon.shin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, computersforpeace@gmail.com
Message-ID: <20150626135435.FA71VeggDn7dM0sxFayHApS9YfduFqN6R36HrMJEnjg@z>


> On Jun 26, 2015, at 12:00 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
> Le 06/25/15 01:52, Jaedon Shin a écrit :
>> 
>>> On Jun 25, 2015, at 4:32 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>> 
>>> +Brian,
>>> 
>>> On 23/06/15 23:08, Jaedon Shin wrote:
>>>> Add NAND device nodes to BMIPS based BCM7346 platform.
>>>> 
>>>> Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
>>>> ---
>>> 
>>> [snip]
>>> 
>>>> +
>>>> +&nand0 {
>>>> +	status = "okay";
>>>> +
>>>> +	nandcs@1 {
>>>> +		compatible = "brcm,nandcs";
>>>> +		reg = <1>;
>>>> +		nand-ecc-step-size = <512>;
>>>> +		nand-ecc-strength = <8>;
>>>> +		nand-on-flash-bbt;
>>>> +
>>>> +		#size-cells = <2>;
>>>> +		#address-cells = <2>;
>>>> +
>>>> +		flash1.rootfs0@0 {
>>>> +			reg = <0x0 0x0 0x0 0x80000000>;
>>>> +		};
>>>> +
>>>> +		flash1.rootfs1@80000000 {
>>>> +			reg = <0x0 0x80000000 0x0 0x80000000>;
>>>> +		};
>>>> +	};
>>>> +};
>>> 
>>> Should we create something like brcmnand-cs1-512-8 to reduce the amount
>>> of duplication between DTS files?
>>> -- 
>>> Florian
>> 
>> I Think that is not duplication.
>> 
>> I have no reference boards, but this node is maybe explaining for hardware
>> description of the BCM97346DBSMB reference board. The nodes are changed by
>> EBI CS and ECC capabilities of NAND flash. I used brcmnand-cs2-512-4 and
>> brcmnand-cs1-512-4 for others.
> 

The *others* means BCM7346 based set-top box of manufacturer. they are not
bcm973XX{dbsmb,svmb} boards.

> Then I am confused, your 4 patches add identical NAND flash chip
> properties for 7346, 7358, 7360 and 7362: CS#1, 512 bytes of ECC step
> size and 8 bits of ECC strength, am I missing something?
> -- 
> Florian

The mips based reference boards have postfix of DBSMB, SVMB, SFF and others.
they have different properties of DDR, #CS, SPI-NOR, NOR, NAND. if we write
the DT of bcm97346sff.dts, therefore it has different fields.

Then I expected that mips 40nm based SVMB type reference boards have the same
properties. but, I don't have confidence. AISE I have no reference boards
unfortunately. if you can contact with people who have reference board, would
tell me information of #CS and NAND. 
