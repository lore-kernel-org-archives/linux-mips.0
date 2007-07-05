Received: from mx.mips.com ([63.167.95.198]:35465 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20023048AbXGEQYA (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 5 Jul 2007 17:24:00 +0100
Message-ID: <01dc01c7bf20$e03f6c20$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20070705144641.GA20210@linux-mips.org>
Subject: Re: dead(?) MIPS config stuff
Date: Thu, 5 Jul 2007 18:23:45 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <20070705162345.85sz2n2Xk6WSMGGfvd_obuhYizD-l4PeJBha7T08HXo@z>

> ========== SMTC_IDLE_HOOK_DEBUG ==========
> arch/mips/kernel/smtc.c:146:#ifdef CONFIG_SMTC_IDLE_HOOK_DEBUG
> arch/mips/kernel/smtc.c:181:#endif /* CONFIG_SMTC_IDLE_HOOK_DEBUG */
> arch/mips/kernel/smtc.c:399:#ifdef CONFIG_SMTC_IDLE_HOOK_DEBUG
> arch/mips/kernel/smtc.c:402:#endif /* CONFIG_SMTC_IDLE_HOOK_DEBUG */
> arch/mips/kernel/smtc.c:614:#ifdef CONFIG_SMTC_IDLE_HOOK_DEBUG
> arch/mips/kernel/smtc.c:828:#ifdef CONFIG_SMTC_IDLE_HOOK_DEBUG
> arch/mips/kernel/smtc.c:830:#endif /* CONFIG_SMTC_IDLE_HOOK_DEBUG */
> arch/mips/kernel/smtc.c:1055:#ifdef CONFIG_SMTC_IDLE_HOOK_DEBUG
> arch/mips/kernel/smtc.c:1148:#endif /* CONFIG_SMTC_IDLE_HOOK_DEBUG */
> arch/mips/kernel/process.c:54:#ifdef CONFIG_SMTC_IDLE_HOOK_DEBUG
> arch/mips/Kconfig.debug:40:config CONFIG_SMTC_IDLE_HOOK_DEBUG

It's cruft, but it's cruft that does have some utility when porting SMTC to a new
platform, as it helps identify interrupt management bugs.  It needs to be eliminated
or replaced with a revision of the interface between architecture and platform 
support for SMTC, toward which I've made some small progress recently, 
but I'd prefer not to see it disappear before reinforcements arrive.

            Regards,

            Kevin K.
