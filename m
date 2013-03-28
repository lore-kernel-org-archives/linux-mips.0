Received: from mail-ea0-f178.google.com ([209.85.215.178]:63908 "EHLO
        mail-ea0-f178.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6834890Ab3C1WZNor3fE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Mar 2013 23:25:13 +0100
Received: by mail-ea0-f178.google.com with SMTP id o10so9326eaj.23
        for <linux-mips@linux-mips.org>; Thu, 28 Mar 2013 15:25:08 -0700 (PDT)
From: "Svetoslav Neykov" <svetoslav@neykov.name>
References: <1362176257-2328-1-git-send-email-svetoslav@neykov.name> <1362176257-2328-2-git-send-email-svetoslav@neykov.name> <878v57kh4v.fsf@ashishki-desk.ger.corp.intel.com>
In-Reply-To: <878v57kh4v.fsf@ashishki-desk.ger.corp.intel.com>
Subject: RE: [PATCH v2 1/2] usb: chipidea: big-endian support
Date: Fri, 29 Mar 2013 00:25:02 +0200
Message-ID: <023c01ce2c03$1886e220$4994a660$@neykov.name>
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
Message-ID: <20130328222502.PhxNvF42aTR_EZafTtThcVX3AoaN3K1FB4jI0_QyMuY@z>

Alexander Shishkin wrote:
> Svetoslav Neykov <svetoslav@neykov.name> writes:
>
>> Convert between big-endian and little-endian format when accessing the
usb controller structures which are little-endian by specification.
>> Fix cases where the little-endian memory layout is taken for granted.
>> The patch doesn't have any effect on the already supported
>> little-endian architectures.
>
>Applied to my branch of things that are aiming at v3.10. Next time
>please make sure that it applies cleanly.

I am a bit confused about the workflow and which repository to base my work
on. Should I use github/virtuoso/linux-ci for my future patches? Or
linux-next?

Regards,
Svetoslav.
