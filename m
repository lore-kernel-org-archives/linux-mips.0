Received: from mail-wg0-f49.google.com ([74.125.82.49]:63262 "EHLO
        mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6823043Ab3DDIXwdQ-Ic (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 4 Apr 2013 10:23:52 +0200
Received: by mail-wg0-f49.google.com with SMTP id e11so2500224wgh.16
        for <linux-mips@linux-mips.org>; Thu, 04 Apr 2013 01:23:47 -0700 (PDT)
From: "Svetoslav Neykov" <svetoslav@neykov.name>
References: <1365026686-4131-1-git-send-email-svetoslav@neykov.name> <87zjxeentl.fsf@ashishki-desk.ger.corp.intel.com>
In-Reply-To: <87zjxeentl.fsf@ashishki-desk.ger.corp.intel.com>
Subject: RE: [PATCH v3 0/1] Chipidea driver support for the AR933x platform
Date: Thu, 4 Apr 2013 11:23:39 +0300
Message-ID: <0b0301ce310d$b739afb0$25ad0f10$@neykov.name>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: bg
Return-Path: <svetoslav@neykov.name>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: 'Alexander Shishkin' <alexander.shishkin@linux.intel.com>, linux-mips@linux-mips.org, linux-usb@vger.kernel.org
Cc: 'Ralf Baechle' <ralf@linux-mips.org>, 'Gabor Juhos' <juhosg@openwrt.org>, 'John Crispin' <blogic@openwrt.org>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Alan Stern' <stern@rowland.harvard.edu>, "'Luis R. Rodriguez'" <mcgrof@qca.qualcomm.com>
Message-ID: <20130404082339.WF1FS2-FDwhm8517dye0Bq9KubvmnRju1mHJcR9YlnY@z>

From: Alexander Shishkin [mailto:alexander.shishkin@linux.intel.com] 
>Svetoslav Neykov <svetoslav@neykov.name> writes:
>
>> Add support for the usb controller in AR933x platform.
>> The controller supports both host or device mode (defined at startup) 
>> but not OTG. 
>> The patches are tested on WR703n router running OpenWRT in device mode.
>
>You forgot to mention the dependencies, dr_mode in usb core and dr_mode
>in ci13xxx_platform_data, which are not there yet.

Yes, you are right, I forgot to state it explicitly.

Thanks,
Svetoslav.
