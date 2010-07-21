Received: from mail-iw0-f177.google.com ([209.85.214.177]:56302 "EHLO
        mail-iw0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492022Ab0GUHrU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jul 2010 09:47:20 +0200
Received: by iwn40 with SMTP id 40so8111553iwn.36
        for <linux-mips@linux-mips.org>; Wed, 21 Jul 2010 00:47:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4C45762E.70909@grandegger.com>
References: <1279544125-28104-1-git-send-email-manuel.lauss@googlemail.com>
        <4C45762E.70909@grandegger.com>
Date: Wed, 21 Jul 2010 09:47:18 +0200
Message-ID: <AANLkTim3A0zcXbKFWdh=bVHzbzkBRHK3W2nyt3pz721g@mail.gmail.com>
Subject: Re: [RFC PATCH v2] au1000_eth: get ethernet address from
        platform_data
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <manuel.lauss@googlemail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Wolfgang Grandegger <wg@grandegger.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Wolfgang Grandegger <wg@denx.de>, Florian Fainelli <florian@openwrt.org>
Message-ID: <20100721074718.DeQzanbPicnJWShWxK2qnFjei35E3mZn91MDevhn4UU@z>

On Tue, Jul 20, 2010 at 12:10 PM, Wolfgang Grandegger <wg@grandegger.com> wrote:
> On 07/19/2010 02:55 PM, Manuel Lauss wrote:
>> Modify au1000_eth to receive an ethernet address from platform data,
>> or choose a random one.
>>
>> The default address is usually provided by the firmware; modify
>> platform device registration to use it if the board code has not
>> already overridden it.

> I gave the patch a try. The kernel builds and runs fine. The eth's are
> realized in the correct order and do work properly. Feel free to add my
> "Tested-by: Wolfgang Grandegger <wg@denx.de>".

Thank you, much appreciated.

Manuel
