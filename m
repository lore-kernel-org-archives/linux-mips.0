Received: from mail-we0-f171.google.com ([74.125.82.171]:50936 "EHLO
        mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011712AbbASTAJM0-n1 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 19 Jan 2015 20:00:09 +0100
Received: by mail-we0-f171.google.com with SMTP id u56so33094065wes.2
        for <linux-mips@linux-mips.org>; Mon, 19 Jan 2015 11:00:04 -0800 (PST)
Subject: Re: [PATCH] i2c: drop ancient protection against sysfs refcounting issues
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <1421693756-12917-1-git-send-email-wsa@the-dreams.de>
Date: Mon, 19 Jan 2015 20:59:59 +0200
Content-Transfer-Encoding: 8BIT
Message-ID: <FDF8BE77-015A-41AD-A5FA-8FFB40AFDAE2@konsulko.com>
References: <1421693756-12917-1-git-send-email-wsa@the-dreams.de>
Return-Path: <pantelis.antoniou@konsulko.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jean Delvare <jdelvare@suse.de>, Julia Lawall <julia.lawall@lip6.fr>
Message-ID: <20150119185959.V4WDDNS63gTNxMFVyFX0FoHg4A_cH7Fut3nQeGQxMvM@z>

Hi Wolfram,

> On Jan 19, 2015, at 20:55 , Wolfram Sang <wsa@the-dreams.de> wrote:
> 
> Back in the days, sysfs seemed to have refcounting issues and subsystems
> needed a completion to be safe. This is not the case anymore, so I2C can
> get rid of this code. There is noone else besides I2C doing something
> like this currently (checked with the attached coccinelle script which
> checks if a release function exists and if it contains a completion).
> 
> I have been digging through the history of linux.git and
> linux-history.git and found that e.g. w1 used to have such a mechanism
> and also simply removed it later.
> 
> Some more info from Greg Kroah-Hartman:
> "Having that call "wait" for the other release call to happen is really
> old, as Jean points out, from 2003.  We have "fixed" sysfs since then to
> detach the files from the devices easier, we used to have some nasy
> reference count issues in that area."
> 
> And some testing from Jean Delvare which matches my results:
> "However I just tested unloading an i2c bus driver while its adapter's
> new_device attribute was opened and rmmod returned immediately. So it
> doesn't look like accessing sysfs attributes actually takes a reference
> to the underlying i2c_adapter."
> 
> Let's get rid of this code before really nobody knows/understands
> anymore what this was for and if it has a subtle use.
> 

Hehe, rather obliquely tested by me too :)

Please save the reference counter hackers sanity and merge this :)

> Reported-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jean Delvare <jdelvare@suse.de>
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> —
> 
Regards

— Pantelis
