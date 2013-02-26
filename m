Received: from mail-ee0-f54.google.com ([74.125.83.54]:41674 "EHLO
        mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6823907Ab3BZOzBNOskf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Feb 2013 15:55:01 +0100
Received: by mail-ee0-f54.google.com with SMTP id c41so2468669eek.41
        for <linux-mips@linux-mips.org>; Tue, 26 Feb 2013 06:54:55 -0800 (PST)
From: "Svetoslav Neykov" <svetoslav@neykov.name>
References: <1360791538-6332-1-git-send-email-svetoslav@neykov.name> <87k3pvxkn8.fsf@ashishki-desk.ger.corp.intel.com> <078801ce142f$0108dea0$031a9be0$@neykov.name> <878v6bxhbd.fsf@ashishki-desk.ger.corp.intel.com>
In-Reply-To: <878v6bxhbd.fsf@ashishki-desk.ger.corp.intel.com>
Subject: RE: [PATCH 0/5] Chipidea driver support for the AR933x platform
Date: Tue, 26 Feb 2013 16:54:50 +0200
Message-ID: <078901ce1431$3bcc4980$b364dc80$@neykov.name>
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
Message-ID: <20130226145450.M8yHQxhVn4GbGxcZzspmuTYJIiVsYtQ_dFRPvNypT1c@z>

>Great, thanks!
>Looks like this patchset will need some synchronization with Sacha's
>dr_mode/phy_mode patchset, but I presume you're aware of that.

Yes, I will base the next patch on the existing changes, thanks for bringing
that up.

Regards,
Svetoslav.
