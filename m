Received: from mailapp01.imgtec.com ([195.59.15.196]:8059 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025160AbcDVPsYoSLxy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 17:48:24 +0200
Date: Fri, 22 Apr 2016 16:48:17 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: Re: [PATCH 2/2] genirq: Add error code reporting to
 irq_{reserve,destroy}_ipi
Message-ID: <20160422154816.GA10886@mredfearn-linux>
References: <1461338809-10590-1-git-send-email-matt.redfearn@imgtec.com>
 <1461338809-10590-2-git-send-email-matt.redfearn@imgtec.com>
 <alpine.DEB.2.11.1604221735250.3941@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1604221735250.3941@nanos>
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: lisa.parratt@imgtec.com, jason@lakedaemon.net, ralf@linux-mips.org, linux-kernel@vger.kernel.org, jiang.liu@linux.intel.com, marc.zyngier@arm.com, linux-mips@linux-mips.org, Qais Yousef <qsyousef@gmail.com>
Message-ID: <20160422154817.zNNY8phWAj4bp58lhmtYmWRUcekEv349prdMfAGllr8@z>

On Fri, Apr 22, 2016 at 05:35:46PM +0200, Thomas Gleixner wrote:
> On Fri, 22 Apr 2016, Matt Redfearn wrote:
> 
> > Make these functions return appropriate error codes when something goes
> > wrong.
> 
> And the reason for this change is?

Hi Thomas,

Mainly for irq_destroy_ipi, where the first patch in the set makes
it possible for the request to fail. But in general with both of these
functions it is possible for them to silently fail without giving the
caller any idication if inapropriate arguments are passed.

Thanks,
Matt
