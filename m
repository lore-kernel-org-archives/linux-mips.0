Received: from Smtp1.Lantiq.com ([195.219.66.200]:19199 "EHLO smtp1.lantiq.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903548Ab2E2NFU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 May 2012 15:05:20 +0200
From: "Langer Thomas (LQDE CPE AE SW)" <thomas.langer@lantiq.com>
Subject: RE: [PATCH V5 16/17] SPI: MIPS: lantiq: add FALCON spi driver
Date: Tue, 29 May 2012 13:05:18 +0000
Message-ID: <593AEF6C47F46446852B067021A273D6049FCE@MUCSE039.lantiq.com>
References: <1337521579-1597-1-git-send-email-blogic@openwrt.org>
 <20120525233845.BD93C3E0BD2@localhost> <4FC0DEEC.8050204@openwrt.org>
In-Reply-To: <4FC0DEEC.8050204@openwrt.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: John Crispin <blogic@openwrt.org>, Grant Likely <grant.likely@secretlab.ca>
Cc: Ralf Baechle <ralf@linux-mips.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "spi-devel-general@lists.sourceforge.net" <spi-devel-general@lists.sourceforge.net>
Message-ID: <20120529130518.Jf-DAIqVefYxAGi2kwsc52t5mm5w9v9dKXjhyU8JHB4@z>

Hello Grant, hello John,

John Crispin wrote on 2012-05-26:
> 
>> What exactly does this mean?  How does it not support any other type
>> of SPI peripheral?  SPI is a really simple protocol, so what is it
>> about this hardware that prevents it being used with other SPI
>> hardware?
>> 
>> I see a big state machine that appears to interpret the messages and
>> pretend to be an SPI slave instead of telling linux about the real
>> device.  /me wonders if it should this instead be a block device
>> driver?
>> 
> Thomas will need to comment on this part
> 
The hardware is an "EBU" (External Bus Unit) for different type of memories 
and flashes (NOR, NAND and serial).
One of the features of this EBU is the "execute in place" for serial flashes.
This shows that there is some logic in the hardware for automatic reading,
all other actions must be done using a specific cmd register.

Even if there are some restrictions from the hardware state machine,
the goal was to use the standard driver for serial flash devices (m25p80).
Otherwise, with a dedicated block device driver, we would have to duplicate
much of this code and had to maintain an own list of supported flash chips.

I hope this reason is good enough for getting this driver accepted.

Best Regards,
Thomas
