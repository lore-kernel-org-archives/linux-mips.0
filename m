Received: from mail-ee0-f43.google.com ([74.125.83.43]:64683 "EHLO
        mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6827486Ab3C1Va1I1fZt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Mar 2013 22:30:27 +0100
Received: by mail-ee0-f43.google.com with SMTP id e50so1160883eek.2
        for <linux-mips@linux-mips.org>; Thu, 28 Mar 2013 14:30:21 -0700 (PDT)
From: "Svetoslav Neykov" <svetoslav@neykov.name>
References: <1362176257-2328-1-git-send-email-svetoslav@neykov.name> <1362176257-2328-2-git-send-email-svetoslav@neykov.name> <878v57kh4v.fsf@ashishki-desk.ger.corp.intel.com> <20130328141253.GA5079@pengutronix.de>
In-Reply-To: <20130328141253.GA5079@pengutronix.de>
Subject: RE: [PATCH v2 1/2] usb: chipidea: big-endian support
Date: Thu, 28 Mar 2013 23:30:15 +0200
Message-ID: <023101ce2bfb$712ea0f0$538be2d0$@neykov.name>
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
To: 'Michael Grzeschik' <mgr@pengutronix.de>, 'Alexander Shishkin' <alexander.shishkin@linux.intel.com>
Cc: 'Ralf Baechle' <ralf@linux-mips.org>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Gabor Juhos' <juhosg@openwrt.org>, 'John Crispin' <blogic@openwrt.org>, 'Alan Stern' <stern@rowland.harvard.edu>, "'Luis R. Rodriguez'" <mcgrof@qca.qualcomm.com>, linux-mips@linux-mips.org, linux-usb@vger.kernel.org
Message-ID: <20130328213015.0R2fmH2kO3xymkCb4-SuBtjt7ecroktrQYFlClWf3Ds@z>

Hi Michael,

On Thu, March 28, 2013 4:13 PM Michael Grzeschik wrote: 
>On Thu, Mar 28, 2013 at 11:28:32AM +0200, Alexander Shishkin wrote:
>> Svetoslav Neykov <svetoslav@neykov.name> writes:
>> 
>> > Convert between big-endian and little-endian format when accessing the
usb controller structures which are little-endian by specification.
>> > Fix cases where the little-endian memory layout is taken for granted.
>> > The patch doesn't have any effect on the already supported
>> > little-endian architectures.
>> 
>> Applied to my branch of things that are aiming at v3.10. Next time
>> please make sure that it applies cleanly.
>
>I am currently rebasing my fix/cleanup/feature patches against your
>ci-for-greg and realised that this patch missed to fix debug.c with
>cpu_le_32 action. Is someone volunteering to cook a patch?

I will gladly make the changes, but after having a look at it I didn't spot
any candidates. The DMA buffers are printed either as addresses in memory or
as raw data which doesn't make sense to be cpu_le_32'ed. If Alexander hasn't
already made the changes could you point me to the lines in question.

Thanks,
Svetoslav.
