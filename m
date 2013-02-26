Received: from mail-ee0-f45.google.com ([74.125.83.45]:38138 "EHLO
        mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6820301Ab3BZOjEGzGsZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Feb 2013 15:39:04 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so2344820eek.4
        for <linux-mips@linux-mips.org>; Tue, 26 Feb 2013 06:38:58 -0800 (PST)
From: "Svetoslav Neykov" <svetoslav@neykov.name>
References: <1360791538-6332-1-git-send-email-svetoslav@neykov.name> <87k3pvxkn8.fsf@ashishki-desk.ger.corp.intel.com>
In-Reply-To: <87k3pvxkn8.fsf@ashishki-desk.ger.corp.intel.com>
Subject: RE: [PATCH 0/5] Chipidea driver support for the AR933x platform
Date: Tue, 26 Feb 2013 16:38:53 +0200
Message-ID: <078801ce142f$0108dea0$031a9be0$@neykov.name>
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
Message-ID: <20130226143853.RVCZ1EuLKh1J8dV52c0ov1xIrqx-at6bAUh4cekaFag@z>

Hi Alex,
I am working on the incorporating all received comments - thanks to all for
taking their time to comment.
Apologies for not replying to the received mails, didn't want to spam with
OK replies to each separately.

Regards,
Svetoslav.


-----Original Message-----
From: Alexander Shishkin [mailto:alexander.shishkin@linux.intel.com] 
Sent: Tuesday, February 26, 2013 3:36 PM
To: Svetoslav Neykov; Ralf Baechle; Greg Kroah-Hartman; Gabor Juhos; John
Crispin; Alan Stern; Luis R. Rodriguez
Cc: linux-mips@linux-mips.org; linux-usb@vger.kernel.org; Svetoslav Neykov
Subject: Re: [PATCH 0/5] Chipidea driver support for the AR933x platform

Svetoslav Neykov <svetoslav@neykov.name> writes:

> Add support for the usb controller in AR933x platform.
> The processor is big-endian so all multi-byte values of the usb 
> descriptors must be converted explicitly. Another difference is that
> the controller supports both host and device modes but not OTG.
> The patches are tested on WR703n router running OpenWRT trunk.

Svetoslav, are you working on these or do you have time to address the
issues raised in review?

Thanks,
--
Alex
