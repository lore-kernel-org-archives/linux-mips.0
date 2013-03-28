Received: from mail-ee0-f54.google.com ([74.125.83.54]:42644 "EHLO
        mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6834891Ab3C1WXtq90bf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Mar 2013 23:23:49 +0100
Received: by mail-ee0-f54.google.com with SMTP id e51so8459eek.41
        for <linux-mips@linux-mips.org>; Thu, 28 Mar 2013 15:23:43 -0700 (PDT)
From: "Svetoslav Neykov" <svetoslav@neykov.name>
References: <1362176257-2328-1-git-send-email-svetoslav@neykov.name> <1362176257-2328-3-git-send-email-svetoslav@neykov.name> <87r4izivgp.fsf@ashishki-desk.ger.corp.intel.com>
In-Reply-To: <87r4izivgp.fsf@ashishki-desk.ger.corp.intel.com>
Subject: RE: [PATCH v2 2/2] usb: chipidea: AR933x platform support for the chipidea driver
Date: Fri, 29 Mar 2013 00:23:37 +0200
Message-ID: <023b01ce2c02$e5faf8f0$b1f0ead0$@neykov.name>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: bg
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
To: 'Alexander Shishkin' <alexander.shishkin@linux.intel.com>, 'Ralf Baechle' <ralf@linux-mips.org>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Gabor Juhos' <juhosg@openwrt.org>, 'John Crispin' <blogic@openwrt.org>, 'Alan Stern' <stern@rowland.harvard.edu>, "'Luis R. Rodriguez'" <mcgrof@qca.qualcomm.com>
Cc: linux-mips@linux-mips.org, linux-usb@vger.kernel.org
Message-ID: <20130328222337.g6TYRrTeECWbfE-72wMydLpTLwjXZQpPh66hx75zQEE@z>

Alexander Shishkin wrote:
>No need to initialize it like this, it should save a few bytes in
>.data.
Ok.

>Why can't you just use ci13xxx_platform_data?
>It looks like you don't need a glue driver is drivers/usb/chipidea at
>all, you can register ci_hdrc right from the ath79/dev-usb.c

You are right. I will register ci_hdrc in ath79/dev-usb.c.

Regards.
Svetoslav.
