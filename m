Received: from mailapp01.imgtec.com ([195.59.15.196]:34246 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991977AbcJYKslVUCF5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 25 Oct 2016 12:48:41 +0200
Date: Tue, 25 Oct 2016 11:48:27 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 2/2] MIPS: malta: Fixup reboot
In-Reply-To: <20161014091732.27536-2-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.00.1610251148010.31859@tp.orcam.me.uk>
References: <e50cd48c-e0c4-9bfc-b265-383a33eac569@roeck-us.net> <20161014091732.27536-1-paul.burton@imgtec.com> <20161014091732.27536-2-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161025104827.8cnzv-tUYG3hNzdoj1CWraIv3Hh0Jqi25Zyo47Azycw@z>

On Fri, 14 Oct 2016, Paul Burton wrote:

> Commit 10b6ea0959de ("MIPS: Malta: Use syscon-reboot driver to reboot")
> converted the Malta board to use the generic syscon-reboot driver to
> handle reboots, but incorrectly used the value 0x4d rather than 0x42 as
> the magic to write to the reboot register.
> 
> I also incorrectly believed that syscon/regmap would default to native
> endianness, but this isn't the case. Force this by specifying with a
> native-endian property in the devicetree.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Fixes: 10b6ea0959de ("MIPS: Malta: Use syscon-reboot driver to reboot")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> ---

Tested-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej
