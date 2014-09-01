Received: from mail-ie0-f179.google.com ([209.85.223.179]:47406 "EHLO
        mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007766AbaIAJYq2jF9f (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 1 Sep 2014 11:24:46 +0200
Received: by mail-ie0-f179.google.com with SMTP id tr6so5637839ieb.24
        for <linux-mips@linux-mips.org>; Mon, 01 Sep 2014 02:24:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53FCFCF0.2010704@hauke-m.de>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de>
        <1408915485-8078-5-git-send-email-hauke@hauke-m.de>
        <8344390.rjnOcYBCET@wuerfel>
        <53FCFCF0.2010704@hauke-m.de>
Date: Mon, 1 Sep 2014 11:24:40 +0200
Message-ID: <CACna6rzx4uc3V=pxK-B-TvDov9A4sMSs=TDP+7=XpdqfTOFoHw@mail.gmail.com>
Subject: Re: [RFC 3/7] bcm47xx-sprom: add Broadcom sprom parser driver
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <zajec5@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, devicetree@vger.kernel.org, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20140901092440.nrUOmSqo8Fyn3a-09MWNIkFk6mLRNw_L4lGIbAoaVs0@z>

On 26 August 2014 23:32, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> On 08/25/2014 09:52 AM, Arnd Bergmann wrote:
>> On Sunday 24 August 2014 23:24:41 Hauke Mehrtens wrote:
>>>  drivers/misc/Kconfig                               |  14 +
>>>  drivers/misc/Makefile                              |   1 +
>>>  drivers/misc/bcm47xx-sprom.c                       | 690 +++++++++++++++++++++
>>
>> On a similar note, putting the driver into drivers/misc seems
>> suboptimal: misc drivers should by definition be something that
>> is for some odd hardware with no external dependencies on it,
>> whereas your driver seems to be used by multiple other drivers.
>>
>> Would it make sense to put it into drivers/bcma when that is the
>> only bus it is used on?
>
> As Jonas already said this code should be used for the bcm53xx ARM code
> and the bcm47xx MIPS code and it is needed for drivers/bcma/ and
> drivers/ssb/ (ssb only for old mips devices). Do you have any better
> idea than putting this to drivers/misc/ ? For the mips SoC we need the
> code very early and will not use the driver interface but probably
> directly call the function name.

Ping? Does anyone have any better idea?

Both: nvram and sprom drivers will be used by bcm47xx (mips) and
bcm53xx (arm). They can't be put in drivers/bcma, as they are used by
drivers/ssb as well.
