Received: from mailapp01.imgtec.com ([195.59.15.196]:33901 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006649AbcDVS50gzNlx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 20:57:26 +0200
Date: Fri, 22 Apr 2016 19:57:11 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 3/4] MIPS: malta-time: Don't use PIT timer for
 cevt/csrc
In-Reply-To: <1461345557-2763-4-git-send-email-james.hogan@imgtec.com>
Message-ID: <alpine.DEB.2.00.1604221951290.21846@tp.orcam.me.uk>
References: <1461345557-2763-1-git-send-email-james.hogan@imgtec.com> <1461345557-2763-4-git-send-email-james.hogan@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160422185711.dyNqY3hubZGaxIxlqg1_KjUVP8im77ZQq1zw4BCSceg@z>

On Fri, 22 Apr 2016, James Hogan wrote:

> The PIT timer is slow, especially under virtualisation, compared with
> the r4k timer, and doesn't really provide any advantage on Malta since
> it doesn't support clock scaling (which is where the PIT has an
> advantage).

 I'm not sure I'm able to parse this correctly: are you saying that the 
i8254-compatible PIT in Malta's southbridge does not support clock scaling 
for some reason, unlike the same implementation on other platforms?  
What's the reason then, the southbridge is the same as in many x86 PCs?

> Drop the use of the PIT timer on Malta so that the r4k or GIC timer will
> be used in preference.

 Not everyone uses virtualisation, so it's a functional regression for 
them.  Can't you lower the priority for the timer instead so that it is 
not selected by default, just as it's done with other platforms providing 
a choice of timers?

  Maciej
